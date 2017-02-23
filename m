From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Feb 2017 22:29:23 +0100
Subject: [Buildroot] [PATCH 2/2] package/sdl: fix .pc file
In-Reply-To: <cover.1487885342.git.yann.morin.1998@free.fr>
References: <cover.1487885342.git.yann.morin.1998@free.fr>
Message-ID: <3817238a2bff47662b0f46d309fd2d12b31da877.1487885342.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When DirectFB is enabled, SDL is linked with it, and states so by adding
the necessary libs to its Libs.Private section in sdl.pc. In doing so
this way, SDL misses a critical library from DirectFB: those in
 DirectFB'sown Libs.Private field, which recently got expanded with
-lstdc++

And indeed, the correct way to depend on anothe library that provides a
.pc file is to list it in the Requires field.

Add a post-staging install hook that does so.

We leave the Libs.Private field untouched, beause filtering out the libs
from DirectFB is not trivial. It also does not impact the build: the
libs would be listed twice, which although incorrect in theory, is not a
problem in practice.

Step 2 at fixing:
    http://autobuild.buildroot.org/results/3d3/3d3036d40ddad71d872d910aae7a24975706d2e9/
    http://autobuild.buildroot.org/results/d1c/d1c35a6003396942b584f2f2a5e8bf4ac2fbe370/
    http://autobuild.buildroot.org/results/d45/d4504871bd47930e8363032d380cdfcc5bb8aee7/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl/sdl.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 38b4b97..9d8aa5d 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -33,6 +33,11 @@ ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
 SDL_DEPENDENCIES += directfb
 SDL_CONF_OPTS += --enable-video-directfb=yes
 SDL_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
+define SDL_FIX_PC
+	$(SED) 's/^\(Requires:.*\)$$/\1 directfb/' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/sdl.pc
+endef
+SDL_POST_INSTALL_STAGING_HOOKS += SDL_FIX_PC
 else
 SDL_CONF_OPTS += --enable-video-directfb=no
 endif
-- 
2.7.4
