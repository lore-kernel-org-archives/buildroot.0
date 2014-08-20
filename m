From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 20 Aug 2014 13:25:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/lbreakout2: fix linking with intl
Message-ID: <1408533921-22392-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lbreakout2 doen't build with (e)glibc toolchain when gettext package is selected.

With (e)glibc libintl is provided by the libc whereas with uClibc it's provided by gettext.

Linking with intl is only needed if the toolchain needs gettext and locale is set.

Fixes:
http://autobuild.buildroot.net/results/a77/a77dd3e18cc4a5e8300ab33eb532cc03d0156f7f/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/lbreakout2/lbreakout2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lbreakout2/lbreakout2.mk b/package/lbreakout2/lbreakout2.mk
index 8f4e27d..6087ca6 100644
--- a/package/lbreakout2/lbreakout2.mk
+++ b/package/lbreakout2/lbreakout2.mk
@@ -14,7 +14,7 @@ LBREAKOUT2_DEPENDENCIES = sdl libpng
 LBREAKOUT2_CONF_ENV = \
 	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config"
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 LBREAKOUT2_DEPENDENCIES += gettext
 LBREAKOUT2_CONF_ENV += LIBS=-lintl
 endif
-- 
1.9.3
