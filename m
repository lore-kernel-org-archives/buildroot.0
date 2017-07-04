From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:26 +0200
Subject: [Buildroot] [git commit] lbreakout2: use the new gettext logic
Message-ID: <20170704233515.B138E81917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c10979723a07a26fd3be2a481105723b145b2e7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lbreakout2/Config.in     |  1 -
 package/lbreakout2/lbreakout2.mk | 10 +++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/lbreakout2/Config.in b/package/lbreakout2/Config.in
index 221c9e2..6788aca 100644
--- a/package/lbreakout2/Config.in
+++ b/package/lbreakout2/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LBREAKOUT2
 	bool "LBreakout2"
 	select BR2_PACKAGE_SDL
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  LBreakout2 is the successor to LBreakout, a breakout-style arcade
 	  game in the manner of Arkanoid. Requires SDL, libpng, and
diff --git a/package/lbreakout2/lbreakout2.mk b/package/lbreakout2/lbreakout2.mk
index 017d562..274c534 100644
--- a/package/lbreakout2/lbreakout2.mk
+++ b/package/lbreakout2/lbreakout2.mk
@@ -10,15 +10,11 @@ LBREAKOUT2_SITE = http://downloads.sourceforge.net/lgames/lbreakout2/$(LBREAKOUT
 LBREAKOUT2_LICENSE = GPL-2.0+
 LBREAKOUT2_LICENSE_FILES = COPYING
 
-LBREAKOUT2_DEPENDENCIES = sdl libpng
+LBREAKOUT2_DEPENDENCIES = sdl libpng $(TARGET_NLS_DEPENDENCIES)
 
 LBREAKOUT2_CONF_ENV = \
-	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config"
-
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-LBREAKOUT2_DEPENDENCIES += gettext
-LBREAKOUT2_CONF_ENV += LIBS=-lintl
-endif
+	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
+	LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LBREAKOUT2_AUDIO),y)
 LBREAKOUT2_DEPENDENCIES += sdl_mixer
