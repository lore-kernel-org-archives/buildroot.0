From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 23:42:51 +0200
Subject: [Buildroot] [git commit] configs/csky_gx6605s: bump kernel to 5.0
 and use buildroot toolchain
Message-ID: <20190802214229.E812E81589@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e359e26e355fbb1f8a078b20e735ec97f6e07d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The most important change is to use the toolchain compiled by
buildroot itself. We also bump kernel to 5.0 with kernel.org.

Gx6605s' PHYS_OFFSET if 0x10000000 and we make qemu and gx6605s the
same to ease maintaince. This PHYS_OFFSET is also OK for 610 qemu.

In this patch we add gx6605s.dts in board/csky, because linux-5.0
doesn't contain gx6605s.dts in its tree.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/csky/gx6605s/gx6605s.dts                     | 155 +++++++++++++++++++++
 ...-cmdline-for-serial-console-and-rootfs-on.patch |  25 ----
 board/qemu/csky/linux-ck610.config.fragment        |   1 +
 configs/csky_gx6605s_defconfig                     |  29 ++--
 4 files changed, 171 insertions(+), 39 deletions(-)

diff --git a/board/csky/gx6605s/gx6605s.dts b/board/csky/gx6605s/gx6605s.dts
new file mode 100644
index 0000000000..e4d46f59a0
--- /dev/null
+++ b/board/csky/gx6605s/gx6605s.dts
@@ -0,0 +1,155 @@
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "C-SKY gx6605s";
+	compatible = "csky,gx6605s";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory {
+		device_type = "memory";
+		reg = <0x10000000 0x04000000>;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges;
+
+		dummy_apb: apb-clock {
+			compatible = "fixed-clock";
+			clock-frequency = <27000000>;
+			clock-output-names = "dummy_apb";
+			#clock-cells = <0>;
+		};
+
+		intc: interrupt-controller at 500000 {
+			compatible = "csky,gx6605s-intc";
+			reg = <0x00500000 0x400>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		timer at 20a000 {
+			compatible = "csky,gx6605s-timer";
+			reg = <0x0020a000 0x400>;
+			clocks = <&dummy_apb>;
+			interrupts = <10>;
+			interrupt-parent = <&intc>;
+		};
+
+		ehci-hcd at 900000 {
+			compatible = "generic-ehci";
+			reg = <0x00900000 0x400>;
+			interrupt-parent = <&intc>;
+			interrupts = <59>;
+		};
+
+		ohci-hcd0 at a00000 {
+			compatible = "generic-ohci";
+			reg = <0x00a00000 0x400>;
+			interrupt-parent = <&intc>;
+			interrupts = <58>;
+		};
+
+		ohci-hcd1 at b00000 {
+			compatible = "generic-ohci";
+			reg = <0x00b00000 0x400>;
+			interrupt-parent = <&intc>;
+			interrupts = <57>;
+		};
+
+		serial at 403000 {
+			compatible = "ns16550a";
+			reg = <0x00403000 0x400>;
+			interrupt-parent = <&intc>;
+			interrupts = <15>;
+			clock-frequency = <29491200>;
+			baud = <115200>;
+			reg-shift = <2>;
+			reg-io-width = <1>;
+		};
+
+		gpio0: gpio at 305000 {
+			compatible = "wd,mbl-gpio";
+			reg-names = "dirout", "dat", "set", "clr";
+			reg = <0x305000 4>, <0x305004 4>, <0x305008 4>, <0x30500c 4>;
+			bgpio-base = <0>;
+			#gpio-cells = <2>;
+			gpio-controller;
+		};
+
+		gpio_buttons {
+			compatible = "gpio-keys-polled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			poll-interval = <100>;
+			autorepeat;
+
+			button0 {
+				label = "button8";
+				linux,code = <KEY_LEFT>;
+				gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
+			};
+
+			button1 {
+				label = "button6";
+				linux,code = <KEY_RIGHT>;
+				gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
+			};
+
+			button2 {
+				label = "button5";
+				linux,code = <KEY_UP>;
+				gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
+			};
+
+			button3 {
+				label = "button9";
+				linux,code = <KEY_DOWN>;
+				gpios = <&gpio0 9 GPIO_ACTIVE_LOW>;
+			};
+
+			button4 {
+				label = "button7";
+				linux,code = <KEY_ENTER>;
+				gpios = <&gpio0 7 GPIO_ACTIVE_LOW>;
+			};
+		};
+
+		gpio_leds {
+			compatible = "gpio-leds";
+
+			led0 {
+				label = "led10";
+				gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
+				linux,default-trigger = "heartbeat";
+			};
+
+			led1 {
+				label = "led11";
+				gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+				linux,default-trigger = "timer";
+			};
+
+			led2 {
+				label = "led12";
+				gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+				linux,default-trigger = "default-on";
+			};
+
+			led3 {
+				label = "led13";
+				gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
+				linux,default-trigger = "default-on";
+			};
+		};
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200 init=/sbin/init root=/dev/sda2 rw rootwait";
+	};
+};
diff --git a/board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch b/board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch
deleted file mode 100644
index 1da1a75400..0000000000
--- a/board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 7e3f2c482bc16537a093e87a27f0d465804a88e4 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <juju@cotds.org>
-Date: Tue, 11 Dec 2018 23:04:46 +0100
-Subject: [PATCH] csky: update cmdline for serial console and rootfs on sda1
-
-Signed-off-by: Julien Olivain <juju@cotds.org>
----
- arch/csky/boot/dts/gx6605s.dts | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/csky/boot/dts/gx6605s.dts b/arch/csky/boot/dts/gx6605s.dts
-index ce56106af967..f5d60b21e6f9 100644
---- a/arch/csky/boot/dts/gx6605s.dts
-+++ b/arch/csky/boot/dts/gx6605s.dts
-@@ -155,6 +155,6 @@
- 	};
- 
- 	chosen {
--		bootargs = "console=tty0 init=/sbin/init root=/dev/sda2 rw rootwait";
-+		bootargs = "console=ttyS0,115200 init=/sbin/init root=/dev/sda1 rw rootwait";
- 	};
- };
--- 
-2.19.2
-
diff --git a/board/qemu/csky/linux-ck610.config.fragment b/board/qemu/csky/linux-ck610.config.fragment
index d80d0ee882..b690c7d6ec 100644
--- a/board/qemu/csky/linux-ck610.config.fragment
+++ b/board/qemu/csky/linux-ck610.config.fragment
@@ -1,5 +1,6 @@
 CONFIG_COMPILE_TEST=y
 CONFIG_CPU_CK610=y
 CONFIG_CPU_PM_WAIT=y
+CONFIG_RAM_BASE=0x10000000
 CONFIG_CSKY_APB_INTC=y
 CONFIG_GX6605S_TIMER=y
diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
index d0a2aadc6d..f1f9579dca 100644
--- a/configs/csky_gx6605s_defconfig
+++ b/configs/csky_gx6605s_defconfig
@@ -1,18 +1,19 @@
+# Architecture
 BR2_csky=y
-BR2_GLOBAL_PATCH_DIR="board/csky/gx6605s/patches"
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.56-20180128.tar.gz"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
-BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
-BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
+BR2_ck610=y
+
+# System
+BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Linux headers same as kernel, a 5.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+
+# Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/c-sky/linux-4.9.y/archive/6064a9bdf48cefbccc4f6472dd04251f0dec1931.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="gx66xx"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="gx6605s"
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/csky/gx6605s/gx6605s.dts"
