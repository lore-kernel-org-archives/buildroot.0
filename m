From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:19 +0200
Subject: [Buildroot] [PATCH 039/100] lbreakout2: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-40-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.9.4
