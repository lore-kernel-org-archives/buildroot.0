From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>
Date: Mon, 27 Nov 2017 10:01:19 +0100
Subject: [Buildroot] [PATCH v2] rtl8723bu: new package
Message-ID: <20171127090119.32215-1-mylene.josserand@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add RTL8723BU package to compile the Realtek RTL8723BU Wifi driver.

Signed-off-by: Myl?ne Josserand <mylene.josserand@free-electrons.com>

---
Changes since v1:
	- Added myself into DEVELOPERS file
	- Removed the loop to install the firmware (not necessary)
	- Updated the installation to remove the hook and use standard
	INSTALL_TARGET_CMDS
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/rtl8723bu/Config.in      | 10 ++++++++++
 package/rtl8723bu/rtl8723bu.hash |  2 ++
 package/rtl8723bu/rtl8723bu.mk   | 20 ++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/rtl8723bu/Config.in
 create mode 100644 package/rtl8723bu/rtl8723bu.hash
 create mode 100644 package/rtl8723bu/rtl8723bu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7621f969a0..d3d243e111 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1191,6 +1191,9 @@ N:	Mike Harmony <mike.harmony@snapav.com>
 F:	board/sinovoip/m2-plus/
 F:	configs/bananapi_m2_plus_defconfig
 
+N:	Myl?ne Josserand <mylene.josserand@free-electrons.com>
+F:	package/rtl8723bu/
+
 N:	Nathan Lynch <ntl@pobox.com>
 F:	package/chrony/
 
diff --git a/package/Config.in b/package/Config.in
index fe5ccc434e..9d5a031e50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -482,6 +482,7 @@ endmenu
 	source "package/rs485conf/Config.in"
 	source "package/rtl8188eu/Config.in"
 	source "package/rtl8723bs/Config.in"
+	source "package/rtl8723bu/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
diff --git a/package/rtl8723bu/Config.in b/package/rtl8723bu/Config.in
new file mode 100644
index 0000000000..266a794a7d
--- /dev/null
+++ b/package/rtl8723bu/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RTL8723BU
+	bool "rtl8723bu"
+	depends on BR2_LINUX_KERNEL
+	help
+	  rtl8723bu wifi driver
+
+	  https://github.com/lwfinger/rtl8723bu
+
+comment "rtl8723bu needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
new file mode 100644
index 0000000000..ef4eddaa63
--- /dev/null
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 da04cffc306d9738abdc67d234b8948db6ca97ed77760c68d99d18817839a513 rtl8723bu-b922079a090dcaad58179d478442ff97f18521c9.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
new file mode 100644
index 0000000000..942b13bbf6
--- /dev/null
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# rtl8723bu
+#
+################################################################################
+
+RTL8723BU_VERSION = b922079a090dcaad58179d478442ff97f18521c9
+RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
+RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
+
+RTL8723BU_MODULE_MAKE_OPTS = \
+	KVER=$(LINUX_VERSION_PROBED) \
+	KSRC=$(LINUX_DIR)
+
+define RTL8723BU_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin $(TARGET_DIR)/lib/firmware/rtlwifi/rtl8723b_fw.bin
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.11.0
