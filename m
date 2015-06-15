From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 15 Jun 2015 21:53:34 +0200
Subject: [Buildroot] [PATCH] eudev: add enable/disable hwdb option
Message-ID: <1434398014-3621-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option enables/disables hardware database installation. This
option is enabled by default in order to preserve old behavior.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/eudev/Config.in | 6 ++++++
 package/eudev/eudev.mk  | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 6d4139f..76df409 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -27,6 +27,12 @@ config BR2_PACKAGE_EUDEV_RULES_GEN
 	help
 	  Enable persistent rules generator
 
+config BR2_PACKAGE_EUDEV_ENABLE_HWDB
+	bool "enable hwdb installation"
+	default y
+	help
+	  Enables hardware database installation to /etc/udev/hwdb.d
+
 endif
 
 comment "eudev needs eudev /dev management"
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 101d510..a97154c 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -31,6 +31,12 @@ ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPTS += --enable-rule_generator
 endif
 
+ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
+EUDEV_CONF_OPTS += --enable-hwdb
+else
+EUDEV_CONF_OPTS += --disable-hwdb
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 EUDEV_CONF_OPTS += --enable-gudev
 EUDEV_DEPENDENCIES += libglib2
-- 
2.1.4
