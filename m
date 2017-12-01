From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 23:08:13 +0100
Subject: [Buildroot] [git commit] rtl8723bu: new package
Message-ID: <20171201220104.B49AE8144C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80d22997334b0ad76f488913e1159b922804c579
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add RTL8723BU package to compile the Realtek RTL8723BU Wifi driver.

Signed-off-by: Myl??ne Josserand <mylene.josserand@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/rtl8723bu/Config.in      | 10 ++++++++++
 package/rtl8723bu/rtl8723bu.hash |  2 ++
 package/rtl8723bu/rtl8723bu.mk   | 20 ++++++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0f5847e..27b22f4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1209,6 +1209,9 @@ N:	Mike Harmony <mike.harmony@snapav.com>
 F:	board/sinovoip/m2-plus/
 F:	configs/bananapi_m2_plus_defconfig
 
+N:	Myl??ne Josserand <mylene.josserand@free-electrons.com>
+F:	package/rtl8723bu/
+
 N:	Nathan Lynch <ntl@pobox.com>
 F:	package/chrony/
 
diff --git a/package/Config.in b/package/Config.in
index 877cbf2..aa111e4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -484,6 +484,7 @@ endmenu
 	source "package/rs485conf/Config.in"
 	source "package/rtl8188eu/Config.in"
 	source "package/rtl8723bs/Config.in"
+	source "package/rtl8723bu/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
diff --git a/package/rtl8723bu/Config.in b/package/rtl8723bu/Config.in
new file mode 100644
index 0000000..266a794
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
index 0000000..ef4edda
--- /dev/null
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 da04cffc306d9738abdc67d234b8948db6ca97ed77760c68d99d18817839a513 rtl8723bu-b922079a090dcaad58179d478442ff97f18521c9.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
new file mode 100644
index 0000000..942b13b
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
