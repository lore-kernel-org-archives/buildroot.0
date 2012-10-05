From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Fri, 5 Oct 2012 15:31:39 +0200
Subject: [Buildroot] [PATCH] fb-test-app: new package
Message-ID: <1349443899-23353-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

---
 package/Config.in                  |  1 +
 package/fb-test-app/Config.in      |  4 ++++
 package/fb-test-app/fb-test-app.mk | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
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
index 0000000..6b682ce
--- /dev/null
+++ b/package/fb-test-app/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_FB_TEST_APP
+	bool "fb-test-app"
+	help
+	  Test suite for Linux framebuffer.
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
new file mode 100644
index 0000000..ce31f05
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
+FB_TEST_APP_SITE = git://github.com/prpplague/fb-test-app.git
+FB_TEST_APP_LICENSE = GPLv2
+FB_TEST_APP_LICENSE_FILE = COPYING
+
+define FB_TEST_APP_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+define FB_TEST_APP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/perf $(TARGET_DIR)/usr/bin/perf
+	$(INSTALL) -D -m 0755 $(@D)/rect $(TARGET_DIR)/usr/bin/rect
+	$(INSTALL) -D -m 0755 $(@D)/fb-test $(TARGET_DIR)/usr/bin/fb-test
+	$(INSTALL) -D -m 0755 $(@D)/offset $(TARGET_DIR)/usr/bin/offset
+endef
+
+define FB_TEST_APP_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/perf
+	rm -f $(TARGET_DIR)/usr/bin/rect
+	rm -f $(TARGET_DIR)/usr/bin/fb-test
+	rm -f $(TARGET_DIR)/usr/bin/offset
+endef
+
+define FB_TEST_APP_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.7.11.3
