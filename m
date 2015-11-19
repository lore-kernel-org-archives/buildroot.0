From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 19 Nov 2015 22:30:33 +0100
Subject: [Buildroot] [PATCH v2] sdl: overwrite libpth autodetection
Message-ID: <1447968633-10830-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sdl libpth autodetection gets confused in case a host
version is present. Overwrite libpth autodection for the
target build dependent on BR2_PACKAGE_LIBPTHSEM and
BR2_PACKAGE_LIBPTHSEM_COMPAT and use pth-config from
staging directory.

Fixes [1]:

checking for pthreads... no
checking for pth-config... /usr/bin/pth-config
checking pth... yes
[...]
./src/SDL.c:33:17: fatal error: pth.h: No such file or directory
 #include <pth.h>

[1] http://autobuild.buildroot.net/results/733/73330e51b3c099d179004db0b9522ac13358b8f7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add SDL_DEPENDENCIES += libpthsem (suggested by Baruch Siach)
  - fix libpth enable logic, needs BR2_PACKAGE_LIBPTHSEM and BR2_PACKAGE_LIBPTHSEM_COMPAT
  - overwrite ac_cv_path_PTH_CONFIG to use the right pth-config from
    staging dir
---
 package/sdl/sdl.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 78eb4dd..e976905 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -58,6 +58,15 @@ ifneq ($(BR2_USE_MMU),y)
 SDL_CONF_OPTS += --enable-dga=no
 endif
 
+# overwrite autodection (prevents confusion with host libpth version)
+ifeq ($(BR2_PACKAGE_LIBPTHSEM)$(BR2_PACKAGE_LIBPTHSEM_COMPAT),yy)
+SDL_CONF_OPTS += --enable-pth
+SDL_CONF_ENV += ac_cv_path_PTH_CONFIG=$(STAGING_DIR)/usr/bin/pth-config
+SDL_DEPENDENCIES += libpthsem
+else
+SDL_CONF_OPTS += --disable-pth
+endif
+
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 SDL_DEPENDENCIES += tslib
 endif
-- 
2.1.4
