From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Tue, 9 Oct 2012 17:53:27 +0200
Subject: [Buildroot] [PATCH v2] fb-test-app: new package
Message-ID: <1349798007-22053-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Test suite for Linux framebuffer.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 package/Config.in                  |  1 +
 package/fb-test-app/Config.in      |  6 ++++++
 package/fb-test-app/fb-test-app.mk | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 package/fb-test-app/Config.in
 create mode 100644 package/fb-test-app/fb-test-app.mk

diff --git a/package/Config.in b/package/Config.in
index 50b7631..a1ca25d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -117,6 +117,7 @@ source "package/fbset/Config.in"
 endif
 source "package/fbterm/Config.in"
 source "package/fbv/Config.in"
+source "package/fb-test-app/Config.in"
 source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
diff --git a/package/fb-test-app/Config.in b/package/fb-test-app/Config.in
new file mode 100644
index 0000000..23b5568
--- /dev/null
+++ b/package/fb-test-app/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_FB_TEST_APP
+	bool "fb-test-app"
+	help
+	  Test suite for Linux framebuffer.
+
+	  https://github.com/prpplague/fb-test-app
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
new file mode 100644
index 0000000..9ea932a
--- /dev/null
+++ b/package/fb-test-app/fb-test-app.mk
@@ -0,0 +1,34 @@
+#############################################################
+#
+# fb-test-app
+#
+#############################################################
+
+FB_TEST_APP_VERSION = v1.0.0
+FB_TEST_APP_SITE = http://github.com/prpplague/fb-test-app/tarball/$(FB_TEST_APP_VERSION)
+FB_TEST_APP_LICENSE = GPLv2
+FB_TEST_APP_LICENSE_FILE = COPYING
+
+define FB_TEST_APP_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+define FB_TEST_APP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/perf $(TARGET_DIR)/usr/bin/fb-test-perf
+	$(INSTALL) -D -m 0755 $(@D)/rect $(TARGET_DIR)/usr/bin/fb-test-rect
+	$(INSTALL) -D -m 0755 $(@D)/fb-test $(TARGET_DIR)/usr/bin/fb-test
+	$(INSTALL) -D -m 0755 $(@D)/offset $(TARGET_DIR)/usr/bin/fb-test-offset
+endef
+
+define FB_TEST_APP_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/fb-test-perf
+	rm -f $(TARGET_DIR)/usr/bin/fb-test-rect
+	rm -f $(TARGET_DIR)/usr/bin/fb-test
+	rm -f $(TARGET_DIR)/usr/bin/fb-test-offset
+endef
+
+define FB_TEST_APP_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.7.11.3
