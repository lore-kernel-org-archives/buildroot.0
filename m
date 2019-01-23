From: Nylon Chen <nylon7@andestech.com>
Date: Wed, 23 Jan 2019 20:39:46 +0800
Subject: [Buildroot] [PATCH v2 2/3] configs/andes_nds32_ae3xx: new defconfig
In-Reply-To: <20190123123947.5084-1-nylon7@andestech.com>
References: <20190123123947.5084-1-nylon7@andestech.com>
Message-ID: <20190123123947.5084-3-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Andes 32-bit defconfig for AE3XX platform.

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
Signed-off-by: Greentime Hu <greentime@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
---
 DEVELOPERS                                    |  2 ++
 board/andes/ae3xx/ae3xx.fragment              |  1 +
 ...0001-nds32-Fix-boot-messages-garbled.patch | 28 +++++++++++++++++++
 configs/andes_ae3xx_defconfig                 | 14 ++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 board/andes/ae3xx/ae3xx.fragment
 create mode 100644 board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
 create mode 100644 configs/andes_ae3xx_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 1846748e01..2f53e01b72 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2303,3 +2303,5 @@ F:	arch/Config.in.nds32
 F:	package/binutils
 F:	package/gcc
 F:	package/linux-headers
+F:	board/andes
+F:	configs/andes_ae3xx_defconfig
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
diff --git a/configs/andes_ae3xx_defconfig b/configs/andes_ae3xx_defconfig
new file mode 100644
index 0000000000..d5c196d76b
--- /dev/null
+++ b/configs/andes_ae3xx_defconfig
@@ -0,0 +1,14 @@
+BR2_nds32=y
+BR2_GLOBAL_PATCH_DIR="board/andes/patches/"
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="nds32le-linux"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_17=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.17.tar.xz"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae3xx/ae3xx.fragment"
+BR2_TARGET_ROOTFS_INITRAMFS=y
-- 
2.18.0
