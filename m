From: Viacheslav Volkov <sv99@inbox.ru>
Date: Tue, 27 Oct 2015 14:05:04 +0300
Subject: [Buildroot] [PATCH 1/1] rfkill: new package
Message-ID: <1445943904-1089-1-git-send-email-sv99@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add rfkill utility.

Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
---
 package/Config.in          |  1 +
 package/rfkill/Config.in   |  6 ++++++
 package/rfkill/rfkill.hash |  2 ++
 package/rfkill/rfkill.mk   | 26 ++++++++++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/rfkill/Config.in
 create mode 100644 package/rfkill/rfkill.hash
 create mode 100644 package/rfkill/rfkill.mk

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..9933514 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -403,6 +403,7 @@ endif
 	source "package/pps-tools/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/read-edid/Config.in"
+	source "package/rfkill/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rtl8188eu/Config.in"
diff --git a/package/rfkill/Config.in b/package/rfkill/Config.in
new file mode 100644
index 0000000..e627a99
--- /dev/null
+++ b/package/rfkill/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_RFKILL
+	bool "rfkill"
+	help
+	  rfkill
+
+	  https://www.kernel.org/pub/software/network/rfkill/
diff --git a/package/rfkill/rfkill.hash b/package/rfkill/rfkill.hash
new file mode 100644
index 0000000..34b35d7
--- /dev/null
+++ b/package/rfkill/rfkill.hash
@@ -0,0 +1,2 @@
+# from https://www.kernel.org/pub/software/network/rfkill/sha256sums.asc:
+sha256	83532027f919f5a3cc185c821a69f16d0efcf7c91aaf6bdc2a0c83fb6bacf2b0  rfkill-0.5.tar.gz
diff --git a/package/rfkill/rfkill.mk b/package/rfkill/rfkill.mk
new file mode 100644
index 0000000..7e8cdf5
--- /dev/null
+++ b/package/rfkill/rfkill.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# rfkill
+#
+#############################################################
+
+RFKILL_VERSION = 0.5
+# RFKILL_SOURCE = rfkill-$(RFKILL_VERSION).tar.gz
+RFKILL_SITE = https://www.kernel.org/pub/software/network/rfkill
+
+define RFKILL_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
+		V=1 VERSION_SUFFIX="-br"
+endef
+
+define RFKILL_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/bin
+	cp -a $(@D)/rfkill $(TARGET_DIR)/usr/bin/rfkill
+endef
+
+define RFKILL_CLEAN_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/rfkill
+endef
+
+
+$(eval $(generic-package))
-- 
2.6.1
