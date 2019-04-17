From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 09:20:55 +0200
Subject: [Buildroot] [git commit] configs/andes_ae3xx: new defconfig
Message-ID: <20190417074345.0D65B7F9A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bf75e18646babf5cd0f3294a7cea7f3d3a474c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Andes 32-bit defconfig for AE3XX platform.

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
Signed-off-by: Greentime Hu <greentime@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
[Thomas:
 - fix commit title to match the defconfig name
 - use the external toolchain package]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 board/andes/ae3xx/ae3xx.fragment                   |  1 +
 .../0001-nds32-Fix-boot-messages-garbled.patch     | 28 +++++++++++++
 board/andes/readme.txt                             | 49 ++++++++++++++++++++++
 configs/andes_ae3xx_defconfig                      | 10 +++++
 5 files changed, 90 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1dae65ed0a..dae860969c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1669,6 +1669,8 @@ F:	package/tcf-agent/
 
 N:	Nylon Chen <nylon7@andestech.com>
 F:	arch/Config.in.nds32
+F:	board/andes
+F:	configs/andes_ae3xx_defconfig
 F:	toolchain/toolchain-external/toolchain-external-andes-nds32/
 
 N:	Olaf Rempel <razzor@kopf-tisch.de>
diff --git a/board/andes/ae3xx/ae3xx.fragment b/board/andes/ae3xx/ae3xx.fragment
new file mode 100644
index 0000000000..3b13d10740
--- /dev/null
+++ b/board/andes/ae3xx/ae3xx.fragment
@@ -0,0 +1 @@
+CONFIG_NDS32_BUILTIN_DTB="ae3xx"
diff --git a/board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch b/board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
new file mode 100644
index 0000000000..adb60937bd
--- /dev/null
+++ b/board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
@@ -0,0 +1,28 @@
+From 90d52d180dcc5d1300dc352ca709eb6453894143 Mon Sep 17 00:00:00 2001
+From: Nylon Chen <nylon7@andestech.com>
+Date: Wed, 28 Nov 2018 16:26:46 +0800
+Subject: [PATCH] nds32: Fix boot messages garbled
+
+In order to display uart correctly we have to pass the correct setting of uart to kernel by bootarg.
+This patch will provide such settings to set the correct uart baud rate.
+
+Signed-off-by: Nylon Chen <nylon7@andestech.com>
+---
+ arch/nds32/boot/dts/ae3xx.dts | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/nds32/boot/dts/ae3xx.dts b/arch/nds32/boot/dts/ae3xx.dts
+index bb39749a6673..aefe2090926a 100644
+--- a/arch/nds32/boot/dts/ae3xx.dts
++++ b/arch/nds32/boot/dts/ae3xx.dts
+@@ -6,6 +6,7 @@
+ 	interrupt-parent = <&intc>;
+ 
+ 	chosen {
++		bootargs = "memblock=debug earlycon console=ttyS0,38400n8 debug loglevel=7";
+ 		stdout-path = &serial0;
+ 	};
+ 
+-- 
+2.18.0
+
diff --git a/board/andes/readme.txt b/board/andes/readme.txt
new file mode 100644
index 0000000000..0f95c65549
--- /dev/null
+++ b/board/andes/readme.txt
@@ -0,0 +1,49 @@
+Intro
+=====
+
+Andestech(nds32) AE3XX Platform
+
+The AE3XX prototype demonstrates the AE3XX example platform on the FPGA. 
+It is composed of one Andestech(nds32) processor and AE3XX.
+
+How to build it
+===============
+
+Configure Buildroot
+-------------------
+
+The andes_ae3xx_defconfig configuration is a sample configuration with
+all that is required to bring the FPGA Development Board:
+
+  $ make andes_ae3xx_defconfig
+
+Build everything
+----------------
+Note: you will need to have access to the network, since Buildroot will
+download the packages' sources.
+
+  $ make
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+output/images/
+    +-- vmlinux
+    +-- rootfs.cpio
+    +-- rootfs.tar
+
+How to run it
+=============
+
+Run
+---
+
+  Setup the Console with the rate 38400/8-N-1.
+
+  $ cd output/images
+  $ ../host/bin/nds32le-linux-gdb vmlinux
+  $ target remote [your host]
+  $ lo
+  $ c 
diff --git a/configs/andes_ae3xx_defconfig b/configs/andes_ae3xx_defconfig
new file mode 100644
index 0000000000..52634caa50
--- /dev/null
+++ b/configs/andes_ae3xx_defconfig
@@ -0,0 +1,10 @@
+BR2_nds32=y
+BR2_GLOBAL_PATCH_DIR="board/andes/patches/"
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae3xx/ae3xx.fragment"
+BR2_TARGET_ROOTFS_INITRAMFS=y
