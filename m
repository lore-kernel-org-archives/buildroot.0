From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon,  4 May 2009 16:21:17 +0200
Subject: [Buildroot] [PATCH 2/3] kernel-headers: bump 2.6.27.x / 2.6.28.x
In-Reply-To: <1241446878-32056-1-git-send-email-jacmet@uclibc.org>
References: <1241446878-32056-1-git-send-email-jacmet@uclibc.org>
Message-ID: <1241446878-32056-2-git-send-email-jacmet@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Korsgaard <jacmet@sunsite.dk>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    4 +-
 .../linux-2.6.28.10-cris-eth-driver-netpoll.patch  |   11 +++++
 .../linux-2.6.28.10-cris-headers.patch             |   28 ++++++++++++
 .../linux-2.6.28.10-cris-objcopy-flags.patch       |   45 ++++++++++++++++++++
 .../linux-2.6.28.9-cris-eth-driver-netpoll.patch   |   11 -----
 .../linux-2.6.28.9-cris-headers.patch              |   28 ------------
 .../linux-2.6.28.9-cris-objcopy-flags.patch        |   45 --------------------
 7 files changed, 86 insertions(+), 86 deletions(-)
 create mode 100644 toolchain/kernel-headers/linux-2.6.28.10-cris-eth-driver-netpoll.patch
 create mode 100644 toolchain/kernel-headers/linux-2.6.28.10-cris-headers.patch
 create mode 100644 toolchain/kernel-headers/linux-2.6.28.10-cris-objcopy-flags.patch
 delete mode 100644 toolchain/kernel-headers/linux-2.6.28.9-cris-eth-driver-netpoll.patch
 delete mode 100644 toolchain/kernel-headers/linux-2.6.28.9-cris-headers.patch
 delete mode 100644 toolchain/kernel-headers/linux-2.6.28.9-cris-objcopy-flags.patch

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 46c8d8d..6c457c7 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -60,8 +60,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.21"	if BR2_KERNEL_HEADERS_2_6_27
-	default "2.6.28.9"	if BR2_KERNEL_HEADERS_2_6_28
+	default "2.6.27.22"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.2"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
diff --git a/toolchain/kernel-headers/linux-2.6.28.10-cris-eth-driver-netpoll.patch b/toolchain/kernel-headers/linux-2.6.28.10-cris-eth-driver-netpoll.patch
new file mode 100644
index 0000000..5711767
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.28.10-cris-eth-driver-netpoll.patch
@@ -0,0 +1,11 @@
+--- a/drivers/net/cris/eth_v10.c.org	2009-01-28 09:19:09.000000000 +0100
++++ b/drivers/net/cris/eth_v10.c	2009-01-28 09:19:16.000000000 +0100
+@@ -1707,7 +1707,7 @@
+ static void
+ e100_netpoll(struct net_device* netdev)
+ {
+-	e100rxtx_interrupt(NETWORK_DMA_TX_IRQ_NBR, netdev, NULL);
++	e100rxtx_interrupt(NETWORK_DMA_TX_IRQ_NBR, netdev);
+ }
+ #endif
+ 
diff --git a/toolchain/kernel-headers/linux-2.6.28.10-cris-headers.patch b/toolchain/kernel-headers/linux-2.6.28.10-cris-headers.patch
new file mode 100644
index 0000000..ff2fa49
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.28.10-cris-headers.patch
@@ -0,0 +1,28 @@
+diff -urN linux-2.6.28/arch/cris/include/arch-v10/arch/Kbuild linux-2.6.28.my/arch/cris/include/arch-v10/arch/Kbuild
+--- linux-2.6.28/arch/cris/include/arch-v10/arch/Kbuild	2008-12-25 00:26:37.000000000 +0100
++++ linux-2.6.28.my/arch/cris/include/arch-v10/arch/Kbuild	2009-01-12 12:59:06.000000000 +0100
+@@ -1,3 +1,5 @@
++header-y += elf.h
++header-y += ptrace.h
+ header-y += user.h
+ header-y += svinto.h
+ header-y += sv_addr_ag.h
+diff -urN linux-2.6.28/arch/cris/include/asm/Kbuild linux-2.6.28.my/arch/cris/include/asm/Kbuild
+--- linux-2.6.28/arch/cris/include/asm/Kbuild	2008-12-25 00:26:37.000000000 +0100
++++ linux-2.6.28.my/arch/cris/include/asm/Kbuild	2009-01-12 13:14:40.000000000 +0100
+@@ -1,11 +1,13 @@
+ include include/asm-generic/Kbuild.asm
+ 
+-header-y += arch-v10/
+-header-y += arch-v32/
++header-y += ../arch-v10/arch/
++header-y += ../arch-v32/arch/
+ 
++header-y += elf.h
+ header-y += ethernet.h
+ header-y += rtc.h
+ header-y += sync_serial.h
++header-y += user.h
+ 
+ unifdef-y += etraxgpio.h
+ unifdef-y += rs485.h
diff --git a/toolchain/kernel-headers/linux-2.6.28.10-cris-objcopy-flags.patch b/toolchain/kernel-headers/linux-2.6.28.10-cris-objcopy-flags.patch
new file mode 100644
index 0000000..32da2f0
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.28.10-cris-objcopy-flags.patch
@@ -0,0 +1,45 @@
+--- linux-2.6.28/arch/cris/Makefile	2008-12-25 00:26:37.000000000 +0100
++++ linux-2.6.28.my/arch/cris/Makefile	2009-01-12 13:21:44.000000000 +0100
+@@ -40,7 +40,7 @@
+ 
+ LD = $(CROSS_COMPILE)ld -mcrislinux
+ 
+-OBJCOPYFLAGS := -O binary -R .note -R .comment -S
++OBJCOPYFLAGS := -O binary -R .note -R .note.gnu.build-id -R .comment
+ 
+ CPPFLAGS_vmlinux.lds = -DDRAM_VIRTUAL_BASE=0x$(CONFIG_ETRAX_DRAM_VIRTUAL_BASE)
+ 
+diff -urN linux-2.6.28/arch/cris/arch-v10/boot/Makefile linux-2.6.28.my/arch/cris/arch-v10/boot/Makefile
+--- linux-2.6.28/arch/cris/arch-v10/boot/Makefile	2008-12-25 00:26:37.000000000 +0100
++++ linux-2.6.28.my/arch/cris/arch-v10/boot/Makefile	2009-01-12 13:28:25.000000000 +0100
+@@ -2,8 +2,6 @@
+ # arch/cris/arch-v10/boot/Makefile
+ #
+ 
+-OBJCOPYFLAGS = -O binary --remove-section=.bss
+-
+ subdir- := compressed rescue
+ targets := Image
+ 
+diff -urN linux-2.6.28/arch/cris/arch-v10/boot/compressed/Makefile linux-2.6.28.my/arch/cris/arch-v10/boot/compressed/Makefile
+--- linux-2.6.28/arch/cris/arch-v10/boot/compressed/Makefile	2008-12-25 00:26:37.000000000 +0100
++++ linux-2.6.28.my/arch/cris/arch-v10/boot/compressed/Makefile	2009-01-12 13:28:33.000000000 +0100
+@@ -6,7 +6,6 @@
+ ccflags-y += -O2 $(LINUXINCLUDE)
+ ldflags-y += -T $(srctree)/$(src)/decompress.lds
+ OBJECTS = $(obj)/head.o $(obj)/misc.o
+-OBJCOPYFLAGS = -O binary --remove-section=.bss
+ 
+ quiet_cmd_image = BUILD   $@
+ cmd_image = cat $(obj)/decompress.bin $(obj)/piggy.gz > $@
+diff -urN linux-2.6.28/arch/cris/arch-v10/boot/rescue/Makefile linux-2.6.28.my/arch/cris/arch-v10/boot/rescue/Makefile
+--- linux-2.6.28/arch/cris/arch-v10/boot/rescue/Makefile	2008-12-25 00:26:37.000000000 +0100
++++ linux-2.6.28.my/arch/cris/arch-v10/boot/rescue/Makefile	2009-01-12 13:28:40.000000000 +0100
+@@ -5,7 +5,6 @@
+ ccflags-y += -O2 $(LINUXINCLUDE)
+ asflags-y += $(LINUXINCLUDE)
+ ldflags-y += -T $(srctree)/$(src)/rescue.lds
+-OBJCOPYFLAGS = -O binary --remove-section=.bss
+ obj-$(CONFIG_ETRAX_AXISFLASHMAP) = head.o
+ OBJECT := $(obj)/head.o
+ 
diff --git a/toolchain/kernel-headers/linux-2.6.28.9-cris-eth-driver-netpoll.patch b/toolchain/kernel-headers/linux-2.6.28.9-cris-eth-driver-netpoll.patch
deleted file mode 100644
index 5711767..0000000
--- a/toolchain/kernel-headers/linux-2.6.28.9-cris-eth-driver-netpoll.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/drivers/net/cris/eth_v10.c.org	2009-01-28 09:19:09.000000000 +0100
-+++ b/drivers/net/cris/eth_v10.c	2009-01-28 09:19:16.000000000 +0100
-@@ -1707,7 +1707,7 @@
- static void
- e100_netpoll(struct net_device* netdev)
- {
--	e100rxtx_interrupt(NETWORK_DMA_TX_IRQ_NBR, netdev, NULL);
-+	e100rxtx_interrupt(NETWORK_DMA_TX_IRQ_NBR, netdev);
- }
- #endif
- 
diff --git a/toolchain/kernel-headers/linux-2.6.28.9-cris-headers.patch b/toolchain/kernel-headers/linux-2.6.28.9-cris-headers.patch
deleted file mode 100644
index ff2fa49..0000000
--- a/toolchain/kernel-headers/linux-2.6.28.9-cris-headers.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-diff -urN linux-2.6.28/arch/cris/include/arch-v10/arch/Kbuild linux-2.6.28.my/arch/cris/include/arch-v10/arch/Kbuild
---- linux-2.6.28/arch/cris/include/arch-v10/arch/Kbuild	2008-12-25 00:26:37.000000000 +0100
-+++ linux-2.6.28.my/arch/cris/include/arch-v10/arch/Kbuild	2009-01-12 12:59:06.000000000 +0100
-@@ -1,3 +1,5 @@
-+header-y += elf.h
-+header-y += ptrace.h
- header-y += user.h
- header-y += svinto.h
- header-y += sv_addr_ag.h
-diff -urN linux-2.6.28/arch/cris/include/asm/Kbuild linux-2.6.28.my/arch/cris/include/asm/Kbuild
---- linux-2.6.28/arch/cris/include/asm/Kbuild	2008-12-25 00:26:37.000000000 +0100
-+++ linux-2.6.28.my/arch/cris/include/asm/Kbuild	2009-01-12 13:14:40.000000000 +0100
-@@ -1,11 +1,13 @@
- include include/asm-generic/Kbuild.asm
- 
--header-y += arch-v10/
--header-y += arch-v32/
-+header-y += ../arch-v10/arch/
-+header-y += ../arch-v32/arch/
- 
-+header-y += elf.h
- header-y += ethernet.h
- header-y += rtc.h
- header-y += sync_serial.h
-+header-y += user.h
- 
- unifdef-y += etraxgpio.h
- unifdef-y += rs485.h
diff --git a/toolchain/kernel-headers/linux-2.6.28.9-cris-objcopy-flags.patch b/toolchain/kernel-headers/linux-2.6.28.9-cris-objcopy-flags.patch
deleted file mode 100644
index 32da2f0..0000000
--- a/toolchain/kernel-headers/linux-2.6.28.9-cris-objcopy-flags.patch
+++ /dev/null
@@ -1,45 +0,0 @@
---- linux-2.6.28/arch/cris/Makefile	2008-12-25 00:26:37.000000000 +0100
-+++ linux-2.6.28.my/arch/cris/Makefile	2009-01-12 13:21:44.000000000 +0100
-@@ -40,7 +40,7 @@
- 
- LD = $(CROSS_COMPILE)ld -mcrislinux
- 
--OBJCOPYFLAGS := -O binary -R .note -R .comment -S
-+OBJCOPYFLAGS := -O binary -R .note -R .note.gnu.build-id -R .comment
- 
- CPPFLAGS_vmlinux.lds = -DDRAM_VIRTUAL_BASE=0x$(CONFIG_ETRAX_DRAM_VIRTUAL_BASE)
- 
-diff -urN linux-2.6.28/arch/cris/arch-v10/boot/Makefile linux-2.6.28.my/arch/cris/arch-v10/boot/Makefile
---- linux-2.6.28/arch/cris/arch-v10/boot/Makefile	2008-12-25 00:26:37.000000000 +0100
-+++ linux-2.6.28.my/arch/cris/arch-v10/boot/Makefile	2009-01-12 13:28:25.000000000 +0100
-@@ -2,8 +2,6 @@
- # arch/cris/arch-v10/boot/Makefile
- #
- 
--OBJCOPYFLAGS = -O binary --remove-section=.bss
--
- subdir- := compressed rescue
- targets := Image
- 
-diff -urN linux-2.6.28/arch/cris/arch-v10/boot/compressed/Makefile linux-2.6.28.my/arch/cris/arch-v10/boot/compressed/Makefile
---- linux-2.6.28/arch/cris/arch-v10/boot/compressed/Makefile	2008-12-25 00:26:37.000000000 +0100
-+++ linux-2.6.28.my/arch/cris/arch-v10/boot/compressed/Makefile	2009-01-12 13:28:33.000000000 +0100
-@@ -6,7 +6,6 @@
- ccflags-y += -O2 $(LINUXINCLUDE)
- ldflags-y += -T $(srctree)/$(src)/decompress.lds
- OBJECTS = $(obj)/head.o $(obj)/misc.o
--OBJCOPYFLAGS = -O binary --remove-section=.bss
- 
- quiet_cmd_image = BUILD   $@
- cmd_image = cat $(obj)/decompress.bin $(obj)/piggy.gz > $@
-diff -urN linux-2.6.28/arch/cris/arch-v10/boot/rescue/Makefile linux-2.6.28.my/arch/cris/arch-v10/boot/rescue/Makefile
---- linux-2.6.28/arch/cris/arch-v10/boot/rescue/Makefile	2008-12-25 00:26:37.000000000 +0100
-+++ linux-2.6.28.my/arch/cris/arch-v10/boot/rescue/Makefile	2009-01-12 13:28:40.000000000 +0100
-@@ -5,7 +5,6 @@
- ccflags-y += -O2 $(LINUXINCLUDE)
- asflags-y += $(LINUXINCLUDE)
- ldflags-y += -T $(srctree)/$(src)/rescue.lds
--OBJCOPYFLAGS = -O binary --remove-section=.bss
- obj-$(CONFIG_ETRAX_AXISFLASHMAP) = head.o
- OBJECT := $(obj)/head.o
- 
-- 
1.6.2
