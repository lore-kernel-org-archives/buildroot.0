From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Feb 2013 22:30:42 +0100
Subject: [Buildroot] [git commit] busybox: support millisecond watchdog
	periods
Message-ID: <20130219112835.B19A09AB89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34945ebbd00c19f534d7d11d62bd03da2b3c4425
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BusyBox watchdog application supports reset periods specified in
milliseconds. The Buildroot package will only allow an integer reset period,
which prevents the use of the required "ms" suffix. Change the watchdog period
configuration item to a string, to allow the use of the "ms" suffix.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
