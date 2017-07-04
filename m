From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:45 +0200
Subject: [Buildroot] [git commit] ltris: use the new gettext logic
Message-ID: <20170704233517.39AE881EC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb3de26fe459a1452af173b07d98430cd90a4130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltris/Config.in | 1 -
 package/ltris/ltris.mk  | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/ltris/Config.in b/package/ltris/Config.in
index bf73489..7d9dc04 100644
--- a/package/ltris/Config.in
+++ b/package/ltris/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LTRIS
 	bool "LTris"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_SDL
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  LTris is a tetris clone, using SDL. It optionally requires
 	  SDL_mixer for audio support. A display with minimum 640x480
diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index 8f12ab1..fb0d4c3 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -9,7 +9,8 @@ LTRIS_VERSION = 1.0.19
 LTRIS_LICENSE = GPL-2.0+
 LTRIS_LICENSE_FILES = COPYING
 
-LTRIS_DEPENDENCIES = sdl
+LTRIS_DEPENDENCIES = sdl $(TARGET_NLS_DEPENDENCIES)
+LTRIS_LIBS = $(TARGET_NLS_LIBS)
 
 LTRIS_CONF_ENV = \
 	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
@@ -25,9 +26,4 @@ else
 LTRIS_CONF_OPTS += --disable-sound
 endif
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-LTRIS_DEPENDENCIES += gettext
-LTRIS_LIBS += -lintl
-endif
-
 $(eval $(autotools-package))
