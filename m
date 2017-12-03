From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  3 Dec 2017 21:18:16 +0300
Subject: [Buildroot] [PATCH v3 2/4] binaries-marvell: new package
In-Reply-To: <20171203181818.10087-1-geomatsi@gmail.com>
References: <20171203181818.10087-1-geomatsi@gmail.com>
Message-ID: <20171203181818.10087-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some systems, including Marvell Armada 7k/8k SoCs, have a separate
System Control Processor (SCP) for power management, clocks, reset
and system control. ATF Boot Loader stage 2 (BL2) loads optional
SCP_BL2 image into a platform-specific region of secure memory.

This package adds SCP_BL2 firmware for Marvell Armada 7040 and 8040 SoCs.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS                                  |  1 +
 boot/Config.in                              |  1 +
 boot/binaries-marvell/Config.in             | 29 +++++++++++++++++++++++++++++
 boot/binaries-marvell/binaries-marvell.hash |  2 ++
 boot/binaries-marvell/binaries-marvell.mk   | 19 +++++++++++++++++++
 5 files changed, 52 insertions(+)
 create mode 100644 boot/binaries-marvell/Config.in
 create mode 100644 boot/binaries-marvell/binaries-marvell.hash
 create mode 100644 boot/binaries-marvell/binaries-marvell.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d223be9643..840159fc2b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1508,6 +1508,7 @@ F:	package/lua-resty-http/
 F:	package/mpir/
 
 N:	Sergey Matyukevich <geomatsi@gmail.com>
+F:	boot/binaries-marvell/
 F:	boot/mv-ddr-marvell/
 F:	package/armbian-firmware/
 F:	package/xr819-xradio/
diff --git a/boot/Config.in b/boot/Config.in
index 3950c49524..3687c41a2c 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -6,6 +6,7 @@ source "boot/at91bootstrap3/Config.in"
 source "boot/at91dataflashboot/Config.in"
 source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
+source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/grub2/Config.in"
 source "boot/gummiboot/Config.in"
diff --git a/boot/binaries-marvell/Config.in b/boot/binaries-marvell/Config.in
new file mode 100644
index 0000000000..0a0717cd26
--- /dev/null
+++ b/boot/binaries-marvell/Config.in
@@ -0,0 +1,29 @@
+config BR2_TARGET_BINARIES_MARVELL
+	bool "Marvell Armada SCP_BL2 image for ATF"
+	depends on BR2_aarch64
+	help
+	  Some systems, including Marvell Armada SoC, have a separate
+	  System Control Processor (SCP) for power management, clocks,
+	  reset and system control. ATF Boot Loader stage 2 (BL2) loads
+	  optional SCP_BL2 image into a platform-specific region
+	  of secure memory.
+
+if BR2_TARGET_BINARIES_MARVELL
+
+choice
+	prompt "Marvell Armada platform"
+
+config BR2_TARGET_BINARIES_MARVELL_7040
+	bool "7040"
+
+config BR2_TARGET_BINARIES_MARVELL_8040
+	bool "8040"
+
+endchoice
+
+config BR2_TARGET_BINARIES_MARVELL_IMAGE
+	string
+	default "mrvl_scp_bl2_8040.img" if BR2_TARGET_BINARIES_MARVELL_8040
+	default "mrvl_scp_bl2_7040.img" if BR2_TARGET_BINARIES_MARVELL_7040
+
+endif
diff --git a/boot/binaries-marvell/binaries-marvell.hash b/boot/binaries-marvell/binaries-marvell.hash
new file mode 100644
index 0000000000..401584dacd
--- /dev/null
+++ b/boot/binaries-marvell/binaries-marvell.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 22a201542d8f93cf88623065db5f3377822b59cbfdf98a8e60cdee629273d3a0 binaries-marvell-0dabe23b956420b0928d337d635f0cd5646c33d0.tar.gz
diff --git a/boot/binaries-marvell/binaries-marvell.mk b/boot/binaries-marvell/binaries-marvell.mk
new file mode 100644
index 0000000000..7bb5071aed
--- /dev/null
+++ b/boot/binaries-marvell/binaries-marvell.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# Marvell Armada SCP_BL2 firmware images
+#
+################################################################################
+
+BINARIES_MARVELL_VERSION = 0dabe23b956420b0928d337d635f0cd5646c33d0
+BINARIES_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,binaries-marvell,$(BINARIES_MARVELL_VERSION))
+BINARIES_MARVELL_LICENSE = PROPRIETARY
+BINARIES_MARVELL_REDISTRIBUTE = NO
+
+BINARIES_MARVELL_IMAGE = $(call qstrip,$(BR2_TARGET_BINARIES_MARVELL_IMAGE))
+BINARIES_MARVELL_INSTALL_IMAGES  = YES
+
+define BINARIES_MARVELL_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/$(BINARIES_MARVELL_IMAGE) $(BINARIES_DIR)/scp-fw.bin
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
