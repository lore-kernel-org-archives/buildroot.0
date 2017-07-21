From: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Date: Fri, 21 Jul 2017 21:45:20 +0700
Subject: [Buildroot] [PATCH 1/1] brcm-patchram-plus: new package
Message-ID: <20170721144520.14683-1-alexey.roslyakov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many of Broadcom BCM43XX WiFi/Bluetooth combo chips have pretty tricky initialization.
Broadcom patchram utility has been released to address the issue.

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/brcm-patchram-plus/Config.in               |  6 ++++++
 package/brcm-patchram-plus/brcm-patchram-plus.hash |  2 ++
 package/brcm-patchram-plus/brcm-patchram-plus.mk   | 20 ++++++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/brcm-patchram-plus/Config.in
 create mode 100644 package/brcm-patchram-plus/brcm-patchram-plus.hash
 create mode 100644 package/brcm-patchram-plus/brcm-patchram-plus.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7b7c5ab4e6..45466591da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -73,6 +73,9 @@ N:	Alexandre Esse <alexandre.esse.dev@gmail.com>
 F:	package/kvazaar/
 F:	package/v4l2loopback/
 
+N:	Alexey Roslyakov <alexey.roslyakov@gmail.com>
+F:	package/brcm-patchram-plus
+
 N:	Alistair Francis <alistair.francis@xilinx.com>
 F:	package/xen/
 
diff --git a/package/Config.in b/package/Config.in
index 7bb9471670..254bb540be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -372,6 +372,7 @@ endmenu
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
 	source "package/biosdevname/Config.in"
+	source "package/brcm-patchram-plus/Config.in"
 	source "package/cbootimage/Config.in"
 	source "package/cc-tool/Config.in"
 	source "package/cdrkit/Config.in"
diff --git a/package/brcm-patchram-plus/Config.in b/package/brcm-patchram-plus/Config.in
new file mode 100644
index 0000000000..f7df21d2b2
--- /dev/null
+++ b/package/brcm-patchram-plus/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_BRCM_PATCHRAM_PLUS
+	bool "brcm-patchram-plus"
+	help
+		Utility's to configure and test Broadcom Bluetooth chips on Linux.
+
+		https://code.google.com/archive/p/broadcom-bluetooth/
diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.hash b/package/brcm-patchram-plus/brcm-patchram-plus.hash
new file mode 100644
index 0000000000..2ecb1d72bc
--- /dev/null
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.hash
@@ -0,0 +1,2 @@
+locally computed hash
+sha256	b80ea97f6ab96b68a54c7ae855c43544dcdfee501b4741de8fdfebe1c322ba53 brcm-patchram-plus_0.1.1.tar.gz
diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.mk b/package/brcm-patchram-plus/brcm-patchram-plus.mk
new file mode 100644
index 0000000000..903910db71
--- /dev/null
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# brcm_patchram_plus tool
+#
+################################################################################
+
+BRCM_PATCHRAM_PLUS_VERSION = 0.1.1
+BRCM_PATCHRAM_PLUS_SOURCE = brcm-patchram-plus_$(BRCM_PATCHRAM_PLUS_VERSION).tar.gz
+BRCM_PATCHRAM_PLUS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
+BRCM_PATCHRAM_PLUS_LICENSE = Apache-2.0
+
+define BRCM_PATCHRAM_PLUS_BUILD_CMDS
+	$(TARGET_CC) -o $(@D)/brcm_patchram_plus $(@D)/brcm_patchram_plus.c
+endef
+
+define BRCM_PATCHRAM_PLUS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/brcm_patchram_plus $(TARGET_DIR)/usr/bin/brcm_patchram_plus
+endef
+
+$(eval $(generic-package))
-- 
2.13.0
