From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 16:32:20 +0200
Subject: [Buildroot] [git commit] Improve support of OpenGL for BeagleBone
	Black
Message-ID: <20140608143237.889769CF1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0686dcf7a99746f236e6ebb5a9db7841f86bf5ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make ti-gfx working on BeagleBone Black by adding an ugly necessary
patch to the kernel wich fix:
pvrsrvkm: Unknown symbol v7_dma_map_area
pvrsrvkm: Unknown symbol v7_dma_flush_range

Add drivers to the default kernel config used in beaglebone_defconfig
to enable the framebuffer.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/beaglebone/linux-3.12.config                 |   11 ++++++-
 ...cache-flush-management-symbols-when-MULTI.patch |   34 ++++++++++++++++++++
 configs/beaglebone_defconfig                       |    1 +
 3 files changed, 45 insertions(+), 1 deletions(-)

diff --git a/board/beaglebone/linux-3.12.config b/board/beaglebone/linux-3.12.config
index d2d80e9..0be5722 100644
--- a/board/beaglebone/linux-3.12.config
+++ b/board/beaglebone/linux-3.12.config
@@ -122,7 +122,6 @@ CONFIG_SMSC_PHY=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_SERIO_LIBPS2=y
-CONFIG_VT_HW_CONSOLE_BINDING=y
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
@@ -163,6 +162,16 @@ CONFIG_REGULATOR_TPS65023=y
 CONFIG_REGULATOR_TPS6507X=y
 CONFIG_REGULATOR_TPS65217=y
 CONFIG_REGULATOR_TIAVSCLASS0=y
+CONFIG_FB=y
+CONFIG_FIRMWARE_EDID=y
+CONFIG_FB_DA8XX=y
+CONFIG_FB_DA8XX_TDA998X=y
+CONFIG_OMAP2_DSS=y
+CONFIG_OMAP2_DSS_SDI=y
+CONFIG_OMAP2_DSS_DSI=y
+CONFIG_FB_OMAP2=y
+CONFIG_DISPLAY_CONNECTOR_HDMI=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_MON=y
diff --git a/board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch b/board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch
new file mode 100644
index 0000000..1ca1e70
--- /dev/null
+++ b/board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch
@@ -0,0 +1,34 @@
+From 29885f2f3d700341d322274db6ad085e601c0994 Mon Sep 17 00:00:00 2001
+From: Pantelis Antoniou <panto@antoniou-consulting.com>
+Date: Fri, 4 Jan 2013 00:32:33 +0200
+Subject: [PATCH 3/3] arm: Export cache flush management symbols when
+ !MULTI_CACHE
+
+When compiling a kernel without CONFIG_MULTI_CACHE enabled the
+dma access functions end up not being exported. Fix it.
+
+Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
+---
+ arch/arm/kernel/setup.c |    9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
+index da1d1aa..dcb678c 100644
+--- a/arch/arm/kernel/setup.c
++++ b/arch/arm/kernel/setup.c
+@@ -923,3 +923,12 @@ const struct seq_operations cpuinfo_op = {
+ 	.stop	= c_stop,
+ 	.show	= c_show
+ };
++
++/* export the cache management functions */
++#ifndef MULTI_CACHE
++
++EXPORT_SYMBOL(__glue(_CACHE,_dma_map_area));
++EXPORT_SYMBOL(__glue(_CACHE,_dma_unmap_area));
++EXPORT_SYMBOL(__glue(_CACHE,_dma_flush_range));
++
++#endif
+-- 
+1.7.10.4
+
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 3181c66..f825fa9 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -33,6 +33,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7f280334068b7c875ade51f8f3921ab311f0c824"
+BR2_LINUX_KERNEL_PATCH="board/beaglebone/patches/linux/"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.12.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
