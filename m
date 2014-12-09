From: Thierry Bultel <tbultel@free.fr>
Date: Tue,  9 Dec 2014 16:26:59 +0100
Subject: [Buildroot] [PATCH 1/1] screen: add support for 256 colors
Message-ID: <1418138819-19772-1-git-send-email-tbultel@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thierry Bultel <tbultel@free.fr>
---
 package/screen/Config.in | 7 +++++++
 package/screen/screen.mk | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/screen/Config.in b/package/screen/Config.in
index b5876e8..bae4be3 100644
--- a/package/screen/Config.in
+++ b/package/screen/Config.in
@@ -11,3 +11,10 @@ config BR2_PACKAGE_SCREEN
 	  and support for multiple character sets).
 
 	  http://www.gnu.org/software/screen/
+
+if BR2_PACKAGE_SCREEN
+config BR2_PACKAGE_SCREEN_COLORS256
+	bool "screen 256 colors"
+	help
+	  enable support for 256 colors
+endif
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 827e776..8056c31 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -14,8 +14,14 @@ SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
 SCREEN_MAKE = $(MAKE1)
 SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
+ifeq ($(BR2_PACKAGE_SCREEN_COLORS256),y)
+SCREEN_CONF_OPTS += --enable-colors256
+endif
+
 define SCREEN_INSTALL_SCREENRC
-	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
+	if [ ! -f $(TARGET_DIR)/etc/screenrc ]; then \
+		$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc; \
+	fi
 endef
 
 SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
-- 
1.9.1
