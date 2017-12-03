From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  3 Dec 2017 21:18:15 +0300
Subject: [Buildroot] [PATCH v3 1/4] mv-ddr-marvell: new package
In-Reply-To: <20171203181818.10087-1-geomatsi@gmail.com>
References: <20171203181818.10087-1-geomatsi@gmail.com>
Message-ID: <20171203181818.10087-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds Marvell Armada SoC DDR training algorithms.
This code is not built separately, it is needed as dependency
to build ATF firmware for Marvell Armada SoCs.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS                              |  3 ++-
 boot/Config.in                          |  1 +
 boot/mv-ddr-marvell/Config.in           |  7 +++++++
 boot/mv-ddr-marvell/mv-ddr-marvell.hash |  2 ++
 boot/mv-ddr-marvell/mv-ddr-marvell.mk   | 18 ++++++++++++++++++
 5 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 boot/mv-ddr-marvell/Config.in
 create mode 100644 boot/mv-ddr-marvell/mv-ddr-marvell.hash
 create mode 100644 boot/mv-ddr-marvell/mv-ddr-marvell.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d96884b7fb..d223be9643 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1508,8 +1508,9 @@ F:	package/lua-resty-http/
 F:	package/mpir/
 
 N:	Sergey Matyukevich <geomatsi@gmail.com>
-F:	package/xr819-xradio/
+F:	boot/mv-ddr-marvell/
 F:	package/armbian-firmware/
+F:	package/xr819-xradio/
 F:	board/orangepi/orangepi-zero
 F:	board/orangepi/orangepi-one
 F:	board/linksprite/pcduino
diff --git a/boot/Config.in b/boot/Config.in
index 2f46c8546e..3950c49524 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -10,6 +10,7 @@ source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/grub2/Config.in"
 source "boot/gummiboot/Config.in"
 source "boot/lpc32xxcdl/Config.in"
+source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/syslinux/Config.in"
diff --git a/boot/mv-ddr-marvell/Config.in b/boot/mv-ddr-marvell/Config.in
new file mode 100644
index 0000000000..d5c28af97a
--- /dev/null
+++ b/boot/mv-ddr-marvell/Config.in
@@ -0,0 +1,7 @@
+config BR2_TARGET_MV_DDR_MARVELL
+	bool "Marvell DDR training code for ATF"
+	depends on BR2_aarch64
+	help
+	  Marvell keeps algorithms for DDR training in a separate repository.
+	  This code is not built separately, it is needed as dependency
+	  to build ATF firmware for Marvell Armada 7040 and 8040 SoCs.
diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.hash b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
new file mode 100644
index 0000000000..b96d4d2bc8
--- /dev/null
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 d413546367ffa3b5f4373a777b9efeb32dcc74d6106897c248935ecb79afc454 mv-ddr-marvell-656440a9690f3d07be9e3d2c39d7cf56fd96eb7b.tar.gz
diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.mk b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
new file mode 100644
index 0000000000..e33065c24e
--- /dev/null
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# Marvell Armada DDR training code
+#
+################################################################################
+
+MV_DDR_MARVELL_VERSION = 656440a9690f3d07be9e3d2c39d7cf56fd96eb7b
+MV_DDR_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,mv-ddr-marvell,$(MV_DDR_MARVELL_VERSION))
+MV_DDR_MARVELL_LICENSE = GPL-2.0+, GPL-2.1 with FreeRTOS exception, BSD, Marvell Commercial
+MV_DDR_MARVELL_LICENSE_FILES = ddr3_init.c
+
+define MV_DDR_MARVELL_SRC_SYMLINK
+	ln -s $(BUILD_DIR)/mv-ddr-marvell-$(MV_DDR_MARVELL_VERSION) $(BUILD_DIR)/mv-ddr-marvell
+endef
+
+MV_DDR_MARVELL_POST_EXTRACT_HOOKS += MV_DDR_MARVELL_SRC_SYMLINK
+
+$(eval $(generic-package))
-- 
2.11.0
