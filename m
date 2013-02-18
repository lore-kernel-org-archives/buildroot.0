From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 18 Feb 2013 10:38:31 +0000
Subject: [Buildroot] [PATCH] busybox: support millisecond watchdog periods
Message-ID: <1361183911-2672-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The BusyBox watchdog application supports reset periods specified in
milliseconds. The Buildroot package will only allow an integer reset period,
which prevents the use of the required "ms" suffix. Change the watchdog period
configuration item to a string, to allow the use of the "ms" suffix.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/busybox/Config.in  |    4 +++-
 package/busybox/busybox.mk |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 2890c49..4d9899d 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -64,12 +64,14 @@ config BR2_PACKAGE_BUSYBOX_WATCHDOG
 if BR2_PACKAGE_BUSYBOX_WATCHDOG
 
 config BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD
-	int "Delay between reset"
+	string "Delay between reset"
 	default "5"
 	help
 	  Select the number of seconds between each
 	  reset of the watchdog (default 5)
 
+	  Use ms suffix to specify milliseconds (e.g. 500ms)
+
 endif
 
 endif
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 599e145..900896f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -168,7 +168,7 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 	[ -f $(TARGET_DIR)/etc/init.d/S15watchdog ] || \
 		install -D -m 0755 package/busybox/S15watchdog \
 			$(TARGET_DIR)/etc/init.d/S15watchdog && \
-		sed -i s/PERIOD/$(BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD)/ \
+		sed -i s/PERIOD/$(call qstrip,$(BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD))/ \
 			$(TARGET_DIR)/etc/init.d/S15watchdog
 endef
 endif
-- 
1.7.10.4
