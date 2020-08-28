From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 23:42:08 +0200
Subject: [Buildroot] [git commit branch/next] configs/roseapplepi: switch to
 mainline 5.7.19 kernel
Message-ID: <20200828213450.1E9C681595@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cd065438020582011f393bd71308717b07c5a71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Mainline Linux now has basic s500/roseapplepi support, so switch to that to
get rid of the dependency on gcc7.  Add two patches for the dts / fix that
didn't make it for kernel 5.7.

The mainline kernel does not yet have support for the mmc interface, so
change to initramfs for now.  Patches for mmc support have been posted
recently, so this can be reverted once they show up in a stable kernel:

https://lore.kernel.org/lkml/cover.1593124368.git.cristian.ciocaltea at gmail.com/

The owl serial port is called ttyOWLn in mainline, so adjust the bootargs to
match.  Also drop the unneeded execute permission on uEnv.txt.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/roseapplepi/genimage.cfg                     |  10 +-
 board/roseapplepi/linux.config                     |  45 +++
 .../0001-arm-dts-owl-s500-Fix-incorrect-PPI.patch  |  52 +++
 .../patches/linux/0001-unbreak-xhci-trace.patch    |  31 --
 .../0002-arm-dts-owl-s500-add-RoseapplePi.patch    |  89 +++++
 .../linux/0002-kernel-add-support-for-gcc-5.patch  |  99 ------
 ...LLVMLinux-use-static-inline-in-ARM-ftrace.patch |  54 ---
 .../linux/0004-Fix-compile-errors-with-gcc5.patch  | 121 -------
 ...c-integrate-the-various-compiler-gcc-345-.patch | 363 ---------------------
 board/roseapplepi/uEnv.txt                         |   2 +-
 configs/roseapplepi_defconfig                      |  20 +-
 11 files changed, 198 insertions(+), 688 deletions(-)

diff --git a/board/roseapplepi/genimage.cfg b/board/roseapplepi/genimage.cfg
index 4d40e65bba..f4a353e823 100644
--- a/board/roseapplepi/genimage.cfg
+++ b/board/roseapplepi/genimage.cfg
@@ -7,10 +7,10 @@ image boot.vfat {
 		     "uImage"
 		}
 		file kernel.dtb {
-		     image = "actduino_bubble_gum_sdboot_linux.dtb"
+		     image = "owl-s500-roseapplepi.dtb"
 		}
 	}
-	size = 10M
+	size = 128M
 }
 
 image sdcard.img {
@@ -34,10 +34,4 @@ image sdcard.img {
 		bootable = "true"
 		image = "boot.vfat"
 	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		size = 512M
-	}
 }
diff --git a/board/roseapplepi/linux.config b/board/roseapplepi/linux.config
new file mode 100644
index 0000000000..aea48b7730
--- /dev/null
+++ b/board/roseapplepi/linux.config
@@ -0,0 +1,45 @@
+# CONFIG_SWAP is not set
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+# CONFIG_CPU_ISOLATION is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_RSEQ is not set
+CONFIG_EMBEDDED=y
+# CONFIG_SLUB_DEBUG is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_ARCH_ACTIONS=y
+CONFIG_SMP=y
+CONFIG_ARM_PSCI=y
+CONFIG_HIGHMEM=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+# CONFIG_SUSPEND is not set
+# CONFIG_STACKPROTECTOR is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+# CONFIG_COREDUMP is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+# CONFIG_ETHTOOL_NETLINK is not set
+# CONFIG_VT is not set
+CONFIG_SERIAL_OWL=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HID is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+# CONFIG_MISC_FILESYSTEMS is not set
+# CONFIG_NETWORK_FILESYSTEMS is not set
+# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_FTRACE is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
diff --git a/board/roseapplepi/patches/linux/0001-arm-dts-owl-s500-Fix-incorrect-PPI.patch b/board/roseapplepi/patches/linux/0001-arm-dts-owl-s500-Fix-incorrect-PPI.patch
new file mode 100644
index 0000000000..615be675ae
--- /dev/null
+++ b/board/roseapplepi/patches/linux/0001-arm-dts-owl-s500-Fix-incorrect-PPI.patch
@@ -0,0 +1,52 @@
+From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
+Subject: [PATCH 1/4] arm: dts: owl-s500: Fix incorrect PPI interrupt specifiers
+To:     Rob Herring <robh+dt@kernel.org>,
+        Andreas F??rber <afaerber@suse.de>,
+        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+Cc:     devicetree at vger.kernel.org, linux-arm-kernel at lists.infradead.org,
+        linux-kernel at vger.kernel.org
+Date: Mon, 15 Jun 2020 03:19:08 +0300 (10 weeks, 3 days, 20 hours ago)
+X-Mailer: git-send-email 2.27.0
+
+The PPI interrupts for cortex-a9 were incorrectly specified, fix them.
+
+Fixes: fdfe7f4f9d85 ("ARM: dts: Add Actions Semi S500 and LeMaker Guitar")
+Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ arch/arm/boot/dts/owl-s500.dtsi | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/boot/dts/owl-s500.dtsi b/arch/arm/boot/dts/owl-s500.dtsi
+index 5ceb6cc4451d..1dbe4e8b38ac 100644
+--- a/arch/arm/boot/dts/owl-s500.dtsi
++++ b/arch/arm/boot/dts/owl-s500.dtsi
+@@ -84,21 +84,21 @@ scu: scu at b0020000 {
+ 		global_timer: timer at b0020200 {
+ 			compatible = "arm,cortex-a9-global-timer";
+ 			reg = <0xb0020200 0x100>;
+-			interrupts = <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
++			interrupts = <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
+ 			status = "disabled";
+ 		};
+ 
+ 		twd_timer: timer at b0020600 {
+ 			compatible = "arm,cortex-a9-twd-timer";
+ 			reg = <0xb0020600 0x20>;
+-			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
++			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
+ 			status = "disabled";
+ 		};
+ 
+ 		twd_wdt: wdt at b0020620 {
+ 			compatible = "arm,cortex-a9-twd-wdt";
+ 			reg = <0xb0020620 0xe0>;
+-			interrupts = <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
++			interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
+ 			status = "disabled";
+ 		};
+ 
+-- 
+2.27.0
+
+
diff --git a/board/roseapplepi/patches/linux/0001-unbreak-xhci-trace.patch b/board/roseapplepi/patches/linux/0001-unbreak-xhci-trace.patch
deleted file mode 100644
index 79e8c800d2..0000000000
--- a/board/roseapplepi/patches/linux/0001-unbreak-xhci-trace.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-[PATCH] unbreak xhci-trace compilation
-
-When commit 84a99f6fc5d4 (xhci: add traces for debug messages in
-xhci_address_device) was backported to the owl tree as part of commit
-5b2ea66f15396 (usb: add owl usb driver), the specific CFLAGS needed for
-xhci-trace.c were missed, causing build breakage:
-
-  CC      drivers/usb/host/xhci-trace.o
-In file included from drivers/usb/host/xhci-trace.h:151:0,
-                 from drivers/usb/host/xhci-trace.c:15:
-include/trace/define_trace.h:79:43: fatal error: ./xhci-trace.h: No such file or directory
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- drivers/usb/host/Makefile |    3 +++
- 1 file changed, 3 insertions(+)
-
-Index: linux-59dbf6a4998e967eb9c6bdcc9b506c0d96acb26b/drivers/usb/host/Makefile
-===================================================================
---- linux-59dbf6a4998e967eb9c6bdcc9b506c0d96acb26b.orig/drivers/usb/host/Makefile
-+++ linux-59dbf6a4998e967eb9c6bdcc9b506c0d96acb26b/drivers/usb/host/Makefile
-@@ -4,6 +4,9 @@
- 
- ccflags-$(CONFIG_USB_DEBUG) := -DDEBUG
- 
-+# tell define_trace.h where to find the xhci trace header
-+CFLAGS_xhci-trace.o := -I$(src)
-+
- isp1760-y := isp1760-hcd.o isp1760-if.o
- 
- fhci-y := fhci-hcd.o fhci-hub.o fhci-q.o
diff --git a/board/roseapplepi/patches/linux/0002-arm-dts-owl-s500-add-RoseapplePi.patch b/board/roseapplepi/patches/linux/0002-arm-dts-owl-s500-add-RoseapplePi.patch
new file mode 100644
index 0000000000..87a6ee245f
--- /dev/null
+++ b/board/roseapplepi/patches/linux/0002-arm-dts-owl-s500-add-RoseapplePi.patch
@@ -0,0 +1,89 @@
+From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
+Subject: [PATCH 4/4] arm: dts: owl-s500: Add RoseapplePi
+To:     Rob Herring <robh+dt@kernel.org>,
+        Andreas F??rber <afaerber@suse.de>,
+        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+Cc:     devicetree at vger.kernel.org, linux-kernel at vger.kernel.org,
+        linux-arm-kernel at lists.infradead.org
+Date: Mon, 15 Jun 2020 03:19:11 +0300 (10 weeks, 3 days, 20 hours ago)
+X-Mailer: git-send-email 2.27.0
+
+Add a Device Tree for the RoseapplePi SBC.
+
+Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ arch/arm/boot/dts/Makefile                 |  1 +
+ arch/arm/boot/dts/owl-s500-roseapplepi.dts | 47 ++++++++++++++++++++++
+ 2 files changed, 48 insertions(+)
+ create mode 100644 arch/arm/boot/dts/owl-s500-roseapplepi.dts
+
+diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
+index e8dd99201397..d0712e7275da 100644
+--- a/arch/arm/boot/dts/Makefile
++++ b/arch/arm/boot/dts/Makefile
+@@ -856,6 +856,7 @@ dtb-$(CONFIG_ARCH_ORION5X) += \
+ dtb-$(CONFIG_ARCH_ACTIONS) += \
+ 	owl-s500-cubieboard6.dtb \
+ 	owl-s500-guitar-bb-rev-b.dtb \
++	owl-s500-roseapplepi.dtb \
+ 	owl-s500-sparky.dtb
+ dtb-$(CONFIG_ARCH_PRIMA2) += \
+ 	prima2-evb.dtb
+diff --git a/arch/arm/boot/dts/owl-s500-roseapplepi.dts b/arch/arm/boot/dts/owl-s500-roseapplepi.dts
+new file mode 100644
+index 000000000000..c61fbaa3821e
+--- /dev/null
++++ b/arch/arm/boot/dts/owl-s500-roseapplepi.dts
+@@ -0,0 +1,47 @@
++// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
++/*
++ * Roseapple Pi
++ *
++ * Copyright (c) 2020 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
++ */
++
++/dts-v1/;
++
++#include "owl-s500.dtsi"
++
++/ {
++	compatible = "roseapplepi,roseapplepi", "actions,s500";
++	model = "Roseapple Pi";
++
++	aliases {
++		serial2 = &uart2;
++	};
++
++	chosen {
++		stdout-path = "serial2:115200n8";
++	};
++
++	memory at 0 {
++		device_type = "memory";
++		reg = <0x0 0x80000000>; /* 2GB */
++	};
++
++	uart2_clk: uart2-clk {
++		compatible = "fixed-clock";
++		clock-frequency = <921600>;
++		#clock-cells = <0>;
++	};
++};
++
++&twd_timer {
++	status = "okay";
++};
++
++&timer {
++	clocks = <&hosc>;
++};
++
++&uart2 {
++	status = "okay";
++	clocks = <&uart2_clk>;
++};
+-- 
+2.27.0
+
+
diff --git a/board/roseapplepi/patches/linux/0002-kernel-add-support-for-gcc-5.patch b/board/roseapplepi/patches/linux/0002-kernel-add-support-for-gcc-5.patch
deleted file mode 100644
index 8d3c703e3a..0000000000
--- a/board/roseapplepi/patches/linux/0002-kernel-add-support-for-gcc-5.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 96b4fb75d15be65edc5494579e4a944534042f99 Mon Sep 17 00:00:00 2001
-From: Sasha Levin <sasha.levin@oracle.com>
-Date: Mon, 13 Oct 2014 15:51:05 -0700
-Subject: [PATCH] kernel: add support for gcc 5
-
-We're missing include/linux/compiler-gcc5.h which is required now
-because gcc branched off to v5 in trunk.
-
-Just copy the relevant bits out of include/linux/compiler-gcc4.h,
-no new code is added as of now.
-
-This fixes a build error when using gcc 5.
-
-Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
-Cc: <stable@vger.kernel.org>
-Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
-Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
-(cherry picked from commit 71458cfc782eafe4b27656e078d379a34e472adf)
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- include/linux/compiler-gcc5.h | 66 +++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 66 insertions(+)
- create mode 100644 include/linux/compiler-gcc5.h
-
-diff --git a/include/linux/compiler-gcc5.h b/include/linux/compiler-gcc5.h
-new file mode 100644
-index 0000000..cdd1cc2
---- /dev/null
-+++ b/include/linux/compiler-gcc5.h
-@@ -0,0 +1,66 @@
-+#ifndef __LINUX_COMPILER_H
-+#error "Please don't include <linux/compiler-gcc5.h> directly, include <linux/compiler.h> instead."
-+#endif
-+
-+#define __used				__attribute__((__used__))
-+#define __must_check			__attribute__((warn_unused_result))
-+#define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
-+
-+/* Mark functions as cold. gcc will assume any path leading to a call
-+   to them will be unlikely.  This means a lot of manual unlikely()s
-+   are unnecessary now for any paths leading to the usual suspects
-+   like BUG(), printk(), panic() etc. [but let's keep them for now for
-+   older compilers]
-+
-+   Early snapshots of gcc 4.3 don't support this and we can't detect this
-+   in the preprocessor, but we can live with this because they're unreleased.
-+   Maketime probing would be overkill here.
-+
-+   gcc also has a __attribute__((__hot__)) to move hot functions into
-+   a special section, but I don't see any sense in this right now in
-+   the kernel context */
-+#define __cold			__attribute__((__cold__))
-+
-+#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
-+
-+#ifndef __CHECKER__
-+# define __compiletime_warning(message) __attribute__((warning(message)))
-+# define __compiletime_error(message) __attribute__((error(message)))
-+#endif /* __CHECKER__ */
-+
-+/*
-+ * Mark a position in code as unreachable.  This can be used to
-+ * suppress control flow warnings after asm blocks that transfer
-+ * control elsewhere.
-+ *
-+ * Early snapshots of gcc 4.5 don't support this and we can't detect
-+ * this in the preprocessor, but we can live with this because they're
-+ * unreleased.  Really, we need to have autoconf for the kernel.
-+ */
-+#define unreachable() __builtin_unreachable()
-+
-+/* Mark a function definition as prohibited from being cloned. */
-+#define __noclone	__attribute__((__noclone__))
-+
-+/*
-+ * Tell the optimizer that something else uses this function or variable.
-+ */
-+#define __visible __attribute__((externally_visible))
-+
-+/*
-+ * GCC 'asm goto' miscompiles certain code sequences:
-+ *
-+ *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
-+ *
-+ * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
-+ * Fixed in GCC 4.8.2 and later versions.
-+ *
-+ * (asm goto is automatically volatile - the naming reflects this.)
-+ */
-+#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
-+
-+#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
-+#define __HAVE_BUILTIN_BSWAP32__
-+#define __HAVE_BUILTIN_BSWAP64__
-+#define __HAVE_BUILTIN_BSWAP16__
-+#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
--- 
-2.10.2
-
diff --git a/board/roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch b/board/roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
deleted file mode 100644
index da38f26679..0000000000
--- a/board/roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 8ac9a3f6dbf00d861134bea3f2c930defed6311a Mon Sep 17 00:00:00 2001
-From: Behan Webster <behanw@converseincode.com>
-Date: Wed, 24 Sep 2014 01:06:46 +0100
-Subject: [PATCH] ARM: 8158/1: LLVMLinux: use static inline in ARM ftrace.h
-
-With compilers which follow the C99 standard (like modern versions of gcc and
-clang), "extern inline" does the wrong thing (emits code for an externally
-linkable version of the inline function). In this case using static inline
-and removing the NULL version of return_address in return_address.c does
-the right thing.
-
-Signed-off-by: Behan Webster <behanw@converseincode.com>
-Reviewed-by: Mark Charlebois <charlebm@gmail.com>
-Acked-by: Steven Rostedt <rostedt@goodmis.org>
-Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
-(cherry picked from commit aeea3592a13bf12861943e44fc48f1f270941f8d)
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- arch/arm/include/asm/ftrace.h    | 2 +-
- arch/arm/kernel/return_address.c | 5 -----
- 2 files changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/arch/arm/include/asm/ftrace.h b/arch/arm/include/asm/ftrace.h
-index f89515a..2bb8cac 100644
---- a/arch/arm/include/asm/ftrace.h
-+++ b/arch/arm/include/asm/ftrace.h
-@@ -45,7 +45,7 @@ void *return_address(unsigned int);
- 
- #else
- 
--extern inline void *return_address(unsigned int level)
-+static inline void *return_address(unsigned int level)
- {
- 	return NULL;
- }
-diff --git a/arch/arm/kernel/return_address.c b/arch/arm/kernel/return_address.c
-index 2f8f523..a3b587f 100755
---- a/arch/arm/kernel/return_address.c
-+++ b/arch/arm/kernel/return_address.c
-@@ -63,11 +63,6 @@ void *return_address(unsigned int level)
- //#warning "TODO: return_address should use unwind tables"
- //#endif
- 
--void *return_address(unsigned int level)
--{
--	return NULL;
--}
--
- #endif /* if defined(CONFIG_FRAME_POINTER) && !defined(CONFIG_ARM_UNWIND) / else */
- 
- EXPORT_SYMBOL_GPL(return_address);
--- 
-2.10.2
-
diff --git a/board/roseapplepi/patches/linux/0004-Fix-compile-errors-with-gcc5.patch b/board/roseapplepi/patches/linux/0004-Fix-compile-errors-with-gcc5.patch
deleted file mode 100644
index d76e2851b5..0000000000
--- a/board/roseapplepi/patches/linux/0004-Fix-compile-errors-with-gcc5.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From ef34609395c72a1e777ef9c3fb6ce60aa92976bb Mon Sep 17 00:00:00 2001
-From: Marco Franceschetti <vonfritz1@gmail.com>
-Date: Sun, 13 Mar 2016 09:44:54 +0100
-Subject: [PATCH] Fix compile errors with gcc5
-
-(cherry picked from commit e824d45043efd49607f66c89c921b07c1523bf9e)
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- drivers/net/wireless/actions/rtl8188etv/include/ieee80211.h    | 6 +++---
- drivers/net/wireless/actions/rtl8723bs/include/ieee80211.h     | 6 +++---
- drivers/net/wireless/actions/rtl8723bs_vq0/include/ieee80211.h | 6 +++---
- drivers/net/wireless/actions/rtl8723bu/include/ieee80211.h     | 6 +++---
- 4 files changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/drivers/net/wireless/actions/rtl8188etv/include/ieee80211.h b/drivers/net/wireless/actions/rtl8188etv/include/ieee80211.h
-index fc293c4..0898cd4 100755
---- a/drivers/net/wireless/actions/rtl8188etv/include/ieee80211.h
-+++ b/drivers/net/wireless/actions/rtl8188etv/include/ieee80211.h
-@@ -1314,18 +1314,18 @@ enum ieee80211_state {
- (((Addr[2]) & 0xff) == 0xff) && (((Addr[3]) & 0xff) == 0xff) && (((Addr[4]) & 0xff) == 0xff) && \
- (((Addr[5]) & 0xff) == 0xff))
- #else
--extern __inline int is_multicast_mac_addr(const u8 *addr)
-+static __inline int is_multicast_mac_addr(const u8 *addr)
- {
-         return ((addr[0] != 0xff) && (0x01 & addr[0]));
- }
- 
--extern __inline int is_broadcast_mac_addr(const u8 *addr)
-+static __inline int is_broadcast_mac_addr(const u8 *addr)
- {
- 	return ((addr[0] == 0xff) && (addr[1] == 0xff) && (addr[2] == 0xff) &&   \
- 		(addr[3] == 0xff) && (addr[4] == 0xff) && (addr[5] == 0xff));
- }
- 
--extern __inline int is_zero_mac_addr(const u8 *addr)
-+static __inline int is_zero_mac_addr(const u8 *addr)
- {
- 	return ((addr[0] == 0x00) && (addr[1] == 0x00) && (addr[2] == 0x00) &&   \
- 		(addr[3] == 0x00) && (addr[4] == 0x00) && (addr[5] == 0x00));
-diff --git a/drivers/net/wireless/actions/rtl8723bs/include/ieee80211.h b/drivers/net/wireless/actions/rtl8723bs/include/ieee80211.h
-index 09475ef..56e0f5a 100755
---- a/drivers/net/wireless/actions/rtl8723bs/include/ieee80211.h
-+++ b/drivers/net/wireless/actions/rtl8723bs/include/ieee80211.h
-@@ -1318,18 +1318,18 @@ enum ieee80211_state {
- (((Addr[2]) & 0xff) == 0xff) && (((Addr[3]) & 0xff) == 0xff) && (((Addr[4]) & 0xff) == 0xff) && \
- (((Addr[5]) & 0xff) == 0xff))
- #else
--extern __inline int is_multicast_mac_addr(const u8 *addr)
-+static __inline int is_multicast_mac_addr(const u8 *addr)
- {
-         return ((addr[0] != 0xff) && (0x01 & addr[0]));
- }
- 
--extern __inline int is_broadcast_mac_addr(const u8 *addr)
-+static __inline int is_broadcast_mac_addr(const u8 *addr)
- {
- 	return ((addr[0] == 0xff) && (addr[1] == 0xff) && (addr[2] == 0xff) &&   \
- 		(addr[3] == 0xff) && (addr[4] == 0xff) && (addr[5] == 0xff));
- }
- 
--extern __inline int is_zero_mac_addr(const u8 *addr)
-+static __inline int is_zero_mac_addr(const u8 *addr)
- {
- 	return ((addr[0] == 0x00) && (addr[1] == 0x00) && (addr[2] == 0x00) &&   \
- 		(addr[3] == 0x00) && (addr[4] == 0x00) && (addr[5] == 0x00));
-diff --git a/drivers/net/wireless/actions/rtl8723bs_vq0/include/ieee80211.h b/drivers/net/wireless/actions/rtl8723bs_vq0/include/ieee80211.h
-index 5dfc421..95144b6 100755
---- a/drivers/net/wireless/actions/rtl8723bs_vq0/include/ieee80211.h
-+++ b/drivers/net/wireless/actions/rtl8723bs_vq0/include/ieee80211.h
-@@ -1314,18 +1314,18 @@ enum ieee80211_state {
- (((Addr[2]) & 0xff) == 0xff) && (((Addr[3]) & 0xff) == 0xff) && (((Addr[4]) & 0xff) == 0xff) && \
- (((Addr[5]) & 0xff) == 0xff))
- #else
--extern __inline int is_multicast_mac_addr(const u8 *addr)
-+static __inline int is_multicast_mac_addr(const u8 *addr)
- {
-         return ((addr[0] != 0xff) && (0x01 & addr[0]));
- }
- 
--extern __inline int is_broadcast_mac_addr(const u8 *addr)
-+static __inline int is_broadcast_mac_addr(const u8 *addr)
- {
- 	return ((addr[0] == 0xff) && (addr[1] == 0xff) && (addr[2] == 0xff) &&   \
- 		(addr[3] == 0xff) && (addr[4] == 0xff) && (addr[5] == 0xff));
- }
- 
--extern __inline int is_zero_mac_addr(const u8 *addr)
-+static __inline int is_zero_mac_addr(const u8 *addr)
- {
- 	return ((addr[0] == 0x00) && (addr[1] == 0x00) && (addr[2] == 0x00) &&   \
- 		(addr[3] == 0x00) && (addr[4] == 0x00) && (addr[5] == 0x00));
-diff --git a/drivers/net/wireless/actions/rtl8723bu/include/ieee80211.h b/drivers/net/wireless/actions/rtl8723bu/include/ieee80211.h
-index 09475ef..56e0f5a 100755
---- a/drivers/net/wireless/actions/rtl8723bu/include/ieee80211.h
-+++ b/drivers/net/wireless/actions/rtl8723bu/include/ieee80211.h
-@@ -1318,18 +1318,18 @@ enum ieee80211_state {
- (((Addr[2]) & 0xff) == 0xff) && (((Addr[3]) & 0xff) == 0xff) && (((Addr[4]) & 0xff) == 0xff) && \
- (((Addr[5]) & 0xff) == 0xff))
- #else
--extern __inline int is_multicast_mac_addr(const u8 *addr)
-+static __inline int is_multicast_mac_addr(const u8 *addr)
- {
-         return ((addr[0] != 0xff) && (0x01 & addr[0]));
- }
- 
--extern __inline int is_broadcast_mac_addr(const u8 *addr)
-+static __inline int is_broadcast_mac_addr(const u8 *addr)
- {
- 	return ((addr[0] == 0xff) && (addr[1] == 0xff) && (addr[2] == 0xff) &&   \
- 		(addr[3] == 0xff) && (addr[4] == 0xff) && (addr[5] == 0xff));
- }
- 
--extern __inline int is_zero_mac_addr(const u8 *addr)
-+static __inline int is_zero_mac_addr(const u8 *addr)
- {
- 	return ((addr[0] == 0x00) && (addr[1] == 0x00) && (addr[2] == 0x00) &&   \
- 		(addr[3] == 0x00) && (addr[4] == 0x00) && (addr[5] == 0x00));
--- 
-2.10.2
-
diff --git a/board/roseapplepi/patches/linux/0005-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch b/board/roseapplepi/patches/linux/0005-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch
deleted file mode 100644
index 791dd930c7..0000000000
--- a/board/roseapplepi/patches/linux/0005-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch
+++ /dev/null
@@ -1,363 +0,0 @@
-From 21be6b635320321216dde9201fa57a3aed60ee12 Mon Sep 17 00:00:00 2001
-From: Joe Perches <joe@perches.com>
-Date: Thu, 25 Jun 2015 15:01:02 -0700
-Subject: [PATCH] compiler-gcc: integrate the various compiler-gcc[345].h files
-
-As gcc major version numbers are going to advance rather rapidly in the
-future, there's no real value in separate files for each compiler
-version.
-
-Deduplicate some of the macros #defined in each file too.
-
-Neaten comments using normal kernel commenting style.
-
-Signed-off-by: Joe Perches <joe@perches.com>
-Cc: Andi Kleen <andi@firstfloor.org>
-Cc: Michal Marek <mmarek@suse.cz>
-Cc: Segher Boessenkool <segher@kernel.crashing.org>
-Cc: Sasha Levin <levinsasha928@gmail.com>
-Cc: Anton Blanchard <anton@samba.org>
-Cc: Alan Modra <amodra@gmail.com>
-Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
-Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
-(cherry picked from commit cb984d101b30eb7478d32df56a0023e4603cba7f)
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- include/linux/compiler-gcc.h  | 120 ++++++++++++++++++++++++++++++++++++++++--
- include/linux/compiler-gcc3.h |  23 --------
- include/linux/compiler-gcc4.h |  88 -------------------------------
- include/linux/compiler-gcc5.h |  66 -----------------------
- 4 files changed, 116 insertions(+), 181 deletions(-)
- delete mode 100644 include/linux/compiler-gcc3.h
- delete mode 100644 include/linux/compiler-gcc4.h
- delete mode 100644 include/linux/compiler-gcc5.h
-
-diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
-index 24545cd90a25..0c5d746850c2 100644
---- a/include/linux/compiler-gcc.h
-+++ b/include/linux/compiler-gcc.h
-@@ -97,10 +97,122 @@
- #define __maybe_unused			__attribute__((unused))
- #define __always_unused			__attribute__((unused))
- 
--#define __gcc_header(x) #x
--#define _gcc_header(x) __gcc_header(linux/compiler-gcc##x.h)
--#define gcc_header(x) _gcc_header(x)
--#include gcc_header(__GNUC__)
-+/* gcc version specific checks */
-+
-+#if GCC_VERSION < 30200
-+# error Sorry, your compiler is too old - please upgrade it.
-+#endif
-+
-+#if GCC_VERSION < 30300
-+# define __used			__attribute__((__unused__))
-+#else
-+# define __used			__attribute__((__used__))
-+#endif
-+
-+#ifdef CONFIG_GCOV_KERNEL
-+# if GCC_VERSION < 30400
-+#   error "GCOV profiling support for gcc versions below 3.4 not included"
-+# endif /* __GNUC_MINOR__ */
-+#endif /* CONFIG_GCOV_KERNEL */
-+
-+#if GCC_VERSION >= 30400
-+#define __must_check		__attribute__((warn_unused_result))
-+#endif
-+
-+#if GCC_VERSION >= 40000
-+
-+/* GCC 4.1.[01] miscompiles __weak */
-+#ifdef __KERNEL__
-+# if GCC_VERSION >= 40100 &&  GCC_VERSION <= 40101
-+#  error Your version of gcc miscompiles the __weak directive
-+# endif
-+#endif
-+
-+#define __used			__attribute__((__used__))
-+#define __compiler_offsetof(a, b)					\
-+	__builtin_offsetof(a, b)
-+
-+#if GCC_VERSION >= 40100 && GCC_VERSION < 40600
-+# define __compiletime_object_size(obj) __builtin_object_size(obj, 0)
-+#endif
-+
-+#if GCC_VERSION >= 40300
-+/* Mark functions as cold. gcc will assume any path leading to a call
-+ * to them will be unlikely.  This means a lot of manual unlikely()s
-+ * are unnecessary now for any paths leading to the usual suspects
-+ * like BUG(), printk(), panic() etc. [but let's keep them for now for
-+ * older compilers]
-+ *
-+ * Early snapshots of gcc 4.3 don't support this and we can't detect this
-+ * in the preprocessor, but we can live with this because they're unreleased.
-+ * Maketime probing would be overkill here.
-+ *
-+ * gcc also has a __attribute__((__hot__)) to move hot functions into
-+ * a special section, but I don't see any sense in this right now in
-+ * the kernel context
-+ */
-+#define __cold			__attribute__((__cold__))
-+
-+#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
-+
-+#ifndef __CHECKER__
-+# define __compiletime_warning(message) __attribute__((warning(message)))
-+# define __compiletime_error(message) __attribute__((error(message)))
-+#endif /* __CHECKER__ */
-+#endif /* GCC_VERSION >= 40300 */
-+
-+#if GCC_VERSION >= 40500
-+/*
-+ * Mark a position in code as unreachable.  This can be used to
-+ * suppress control flow warnings after asm blocks that transfer
-+ * control elsewhere.
-+ *
-+ * Early snapshots of gcc 4.5 don't support this and we can't detect
-+ * this in the preprocessor, but we can live with this because they're
-+ * unreleased.  Really, we need to have autoconf for the kernel.
-+ */
-+#define unreachable() __builtin_unreachable()
-+
-+/* Mark a function definition as prohibited from being cloned. */
-+#define __noclone	__attribute__((__noclone__))
-+
-+#endif /* GCC_VERSION >= 40500 */
-+
-+#if GCC_VERSION >= 40600
-+/*
-+ * Tell the optimizer that something else uses this function or variable.
-+ */
-+#define __visible	__attribute__((externally_visible))
-+#endif
-+
-+/*
-+ * GCC 'asm goto' miscompiles certain code sequences:
-+ *
-+ *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
-+ *
-+ * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
-+ *
-+ * (asm goto is automatically volatile - the naming reflects this.)
-+ */
-+#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
-+
-+#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
-+#if GCC_VERSION >= 40400
-+#define __HAVE_BUILTIN_BSWAP32__
-+#define __HAVE_BUILTIN_BSWAP64__
-+#endif
-+#if GCC_VERSION >= 40800 || (defined(__powerpc__) && GCC_VERSION >= 40600)
-+#define __HAVE_BUILTIN_BSWAP16__
-+#endif
-+#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
-+
-+#if GCC_VERSION >= 50000
-+#define KASAN_ABI_VERSION 4
-+#elif GCC_VERSION >= 40902
-+#define KASAN_ABI_VERSION 3
-+#endif
-+
-+#endif	/* gcc version >= 40000 specific checks */
- 
- #if !defined(__noclone)
- #define __noclone	/* not needed */
-diff --git a/include/linux/compiler-gcc3.h b/include/linux/compiler-gcc3.h
-deleted file mode 100644
-index 7d89febe4d79..000000000000
---- a/include/linux/compiler-gcc3.h
-+++ /dev/null
-@@ -1,23 +0,0 @@
--#ifndef __LINUX_COMPILER_H
--#error "Please don't include <linux/compiler-gcc3.h> directly, include <linux/compiler.h> instead."
--#endif
--
--#if GCC_VERSION < 30200
--# error Sorry, your compiler is too old - please upgrade it.
--#endif
--
--#if GCC_VERSION >= 30300
--# define __used			__attribute__((__used__))
--#else
--# define __used			__attribute__((__unused__))
--#endif
--
--#if GCC_VERSION >= 30400
--#define __must_check		__attribute__((warn_unused_result))
--#endif
--
--#ifdef CONFIG_GCOV_KERNEL
--# if GCC_VERSION < 30400
--#   error "GCOV profiling support for gcc versions below 3.4 not included"
--# endif /* __GNUC_MINOR__ */
--#endif /* CONFIG_GCOV_KERNEL */
-diff --git a/include/linux/compiler-gcc4.h b/include/linux/compiler-gcc4.h
-deleted file mode 100644
-index 2507fd2a1eb4..000000000000
---- a/include/linux/compiler-gcc4.h
-+++ /dev/null
-@@ -1,88 +0,0 @@
--#ifndef __LINUX_COMPILER_H
--#error "Please don't include <linux/compiler-gcc4.h> directly, include <linux/compiler.h> instead."
--#endif
--
--/* GCC 4.1.[01] miscompiles __weak */
--#ifdef __KERNEL__
--# if GCC_VERSION >= 40100 &&  GCC_VERSION <= 40101
--#  error Your version of gcc miscompiles the __weak directive
--# endif
--#endif
--
--#define __used			__attribute__((__used__))
--#define __must_check 		__attribute__((warn_unused_result))
--#define __compiler_offsetof(a,b) __builtin_offsetof(a,b)
--
--#if GCC_VERSION >= 40100 && GCC_VERSION < 40600
--# define __compiletime_object_size(obj) __builtin_object_size(obj, 0)
--#endif
--
--#if GCC_VERSION >= 40300
--/* Mark functions as cold. gcc will assume any path leading to a call
--   to them will be unlikely.  This means a lot of manual unlikely()s
--   are unnecessary now for any paths leading to the usual suspects
--   like BUG(), printk(), panic() etc. [but let's keep them for now for
--   older compilers]
--
--   Early snapshots of gcc 4.3 don't support this and we can't detect this
--   in the preprocessor, but we can live with this because they're unreleased.
--   Maketime probing would be overkill here.
--
--   gcc also has a __attribute__((__hot__)) to move hot functions into
--   a special section, but I don't see any sense in this right now in
--   the kernel context */
--#define __cold			__attribute__((__cold__))
--
--#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
--
--#ifndef __CHECKER__
--# define __compiletime_warning(message) __attribute__((warning(message)))
--# define __compiletime_error(message) __attribute__((error(message)))
--#endif /* __CHECKER__ */
--#endif /* GCC_VERSION >= 40300 */
--
--#if GCC_VERSION >= 40500
--/*
-- * Mark a position in code as unreachable.  This can be used to
-- * suppress control flow warnings after asm blocks that transfer
-- * control elsewhere.
-- *
-- * Early snapshots of gcc 4.5 don't support this and we can't detect
-- * this in the preprocessor, but we can live with this because they're
-- * unreleased.  Really, we need to have autoconf for the kernel.
-- */
--#define unreachable() __builtin_unreachable()
--
--/* Mark a function definition as prohibited from being cloned. */
--#define __noclone	__attribute__((__noclone__))
--
--#endif /* GCC_VERSION >= 40500 */
--
--#if GCC_VERSION >= 40600
--/*
-- * Tell the optimizer that something else uses this function or variable.
-- */
--#define __visible __attribute__((externally_visible))
--#endif
--
--/*
-- * GCC 'asm goto' miscompiles certain code sequences:
-- *
-- *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
-- *
-- * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
-- * Fixed in GCC 4.8.2 and later versions.
-- *
-- * (asm goto is automatically volatile - the naming reflects this.)
-- */
--#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
--
--#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
--#if GCC_VERSION >= 40400
--#define __HAVE_BUILTIN_BSWAP32__
--#define __HAVE_BUILTIN_BSWAP64__
--#endif
--#if GCC_VERSION >= 40800 || (defined(__powerpc__) && GCC_VERSION >= 40600)
--#define __HAVE_BUILTIN_BSWAP16__
--#endif
--#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
-diff --git a/include/linux/compiler-gcc5.h b/include/linux/compiler-gcc5.h
-deleted file mode 100644
-index cdd1cc202d51..000000000000
---- a/include/linux/compiler-gcc5.h
-+++ /dev/null
-@@ -1,66 +0,0 @@
--#ifndef __LINUX_COMPILER_H
--#error "Please don't include <linux/compiler-gcc5.h> directly, include <linux/compiler.h> instead."
--#endif
--
--#define __used				__attribute__((__used__))
--#define __must_check			__attribute__((warn_unused_result))
--#define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
--
--/* Mark functions as cold. gcc will assume any path leading to a call
--   to them will be unlikely.  This means a lot of manual unlikely()s
--   are unnecessary now for any paths leading to the usual suspects
--   like BUG(), printk(), panic() etc. [but let's keep them for now for
--   older compilers]
--
--   Early snapshots of gcc 4.3 don't support this and we can't detect this
--   in the preprocessor, but we can live with this because they're unreleased.
--   Maketime probing would be overkill here.
--
--   gcc also has a __attribute__((__hot__)) to move hot functions into
--   a special section, but I don't see any sense in this right now in
--   the kernel context */
--#define __cold			__attribute__((__cold__))
--
--#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
--
--#ifndef __CHECKER__
--# define __compiletime_warning(message) __attribute__((warning(message)))
--# define __compiletime_error(message) __attribute__((error(message)))
--#endif /* __CHECKER__ */
--
--/*
-- * Mark a position in code as unreachable.  This can be used to
-- * suppress control flow warnings after asm blocks that transfer
-- * control elsewhere.
-- *
-- * Early snapshots of gcc 4.5 don't support this and we can't detect
-- * this in the preprocessor, but we can live with this because they're
-- * unreleased.  Really, we need to have autoconf for the kernel.
-- */
--#define unreachable() __builtin_unreachable()
--
--/* Mark a function definition as prohibited from being cloned. */
--#define __noclone	__attribute__((__noclone__))
--
--/*
-- * Tell the optimizer that something else uses this function or variable.
-- */
--#define __visible __attribute__((externally_visible))
--
--/*
-- * GCC 'asm goto' miscompiles certain code sequences:
-- *
-- *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
-- *
-- * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
-- * Fixed in GCC 4.8.2 and later versions.
-- *
-- * (asm goto is automatically volatile - the naming reflects this.)
-- */
--#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
--
--#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
--#define __HAVE_BUILTIN_BSWAP32__
--#define __HAVE_BUILTIN_BSWAP64__
--#define __HAVE_BUILTIN_BSWAP16__
--#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
--- 
-2.11.0
-
diff --git a/board/roseapplepi/uEnv.txt b/board/roseapplepi/uEnv.txt
old mode 100755
new mode 100644
index f9646e498e..2b9de727b4
--- a/board/roseapplepi/uEnv.txt
+++ b/board/roseapplepi/uEnv.txt
@@ -1,3 +1,3 @@
 # no ramdisk
 ramdisk_addr_r=-
-bootargs=clk_ignore_unused root=/dev/mmcblk0p2
+bootargs=console=ttyOWL2,115200
diff --git a/configs/roseapplepi_defconfig b/configs/roseapplepi_defconfig
index d315a02e16..45c42ec0f9 100644
--- a/configs/roseapplepi_defconfig
+++ b/configs/roseapplepi_defconfig
@@ -2,27 +2,25 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-
 BR2_GLOBAL_PATCH_DIR="board/roseapplepi/patches"
-# Linux headers same as kernel, a 3.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
-# kernel does not build with gcc 8.x
-BR2_GCC_VERSION_7_X=y
+# Linux headers same as kernel, a 5.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/roseapplepi/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/roseapplepi/genimage.cfg"
 
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,xapp-le,kernel,59dbf6a4998e967eb9c6bdcc9b506c0d96acb26b)/linux-59dbf6a4998e967eb9c6bdcc9b506c0d96acb26b.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="actduino_bubble_gum_linux"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.19"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/roseapplepi/linux.config"
 BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="actduino_bubble_gum_sdboot_linux"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="owl-s500-roseapplepi"
 
 # Filesystem / image
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Bootloaders
