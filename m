From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 22:52:42 +0100
Subject: [Buildroot] [git commit] sdl: overwrite libpth autodetection
Message-ID: <20151119220554.6D80E81EEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=508bb46bade489ca9eeff6e681548e7ba97f4330
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sdl libpth autodetection gets confused in case a host
version is present. Overwrite libpth autodection for the
target build dependent on BR2_PACKAGE_LIBPTHSEM_COMPAT and
use pth-config from staging directory.

Fixes [1]:

checking for pthreads... no
checking for pth-config... /usr/bin/pth-config
checking pth... yes
[...]
./src/SDL.c:33:17: fatal error: pth.h: No such file or directory
 #include <pth.h>

[1] http://autobuild.buildroot.net/results/733/73330e51b3c099d179004db0b9522ac13358b8f7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl/sdl.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 78eb4dd..cc1ad06 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -58,6 +58,15 @@ ifneq ($(BR2_USE_MMU),y)
 SDL_CONF_OPTS += --enable-dga=no
 endif
 
+# overwrite autodection (prevents confusion with host libpth version)
+ifeq ($(BR2_PACKAGE_LIBPTHSEM_COMPAT),y)
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
