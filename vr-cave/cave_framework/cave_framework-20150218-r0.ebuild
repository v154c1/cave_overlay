# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit git-r3 cmake-utils

DESCRIPTION="cave frmework for cave"
HOMEPAGE=""
#SRC_URI="${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE="+vrml +sdl +assimp"
#S=${WORKDIR}
DEPEND=">=vr-libs/cavelib-3.2
	 media-libs/glew
	 media-gfx/imagemagick
	media-gfx/assimp
	dev-libs/boost
	sdl? ( media-libs/libsdl )"


RESTRICT=""
EGIT_REPO_URI="anon@git.iim.cz:cave_framework"
EGIT_BRANCH="optix"

src_configure() {
        local mycmakeargs=(
		$(cmake-utils_use_enable assimp LOADER_ASSIMP)
		$(cmake-utils_use_enable vrml  LOADER_VRML)
		$(cmake-utils_use_enable sdl FW_SDL)
		-DENABLE_FW_CAVELIB=ON

        )
        cmake-utils_src_configure
}
