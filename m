From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 23:14:59 +0000 (UTC)
Subject: [Buildroot] svn commit: [25745]
	trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090318231459.EF87A7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 23:14:59 +0000 (Wed, 18 Mar 2009)
New Revision: 25745

Log:
kernel-headers: adjust patch names for 2.6.28.8

Added:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.8-cris-eth-driver-netpoll.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.8-cris-headers.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.8-cris-objcopy-flags.patch

Removed:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-eth-driver-netpoll.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-headers.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-objcopy-flags.patch


Changeset:
Deleted: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-eth-driver-netpoll.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-eth-driver-netpoll.patch	2009-03-18 23:05:54 UTC (rev 25744)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-eth-driver-netpoll.patch	2009-03-18 23:14:59 UTC (rev 25745)
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

Deleted: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-headers.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-headers.patch	2009-03-18 23:05:54 UTC (rev 25744)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-headers.patch	2009-03-18 23:14:59 UTC (rev 25745)
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

Deleted: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-objcopy-flags.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-objcopy-flags.patch	2009-03-18 23:05:54 UTC (rev 25744)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-objcopy-flags.patch	2009-03-18 23:14:59 UTC (rev 25745)
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

Copied: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.8-cris-eth-driver-netpoll.patch (from rev 25742, trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-eth-driver-netpoll.patch)
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.8-cris-eth-driver-netpoll.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.8-cris-eth-driver-netpoll.patch	2009-03-18 23:14:59 UTC (rev 25745)
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

Copied: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.8-cris-headers.patch (from rev 25742, trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-headers.patch)
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.8-cris-headers.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.8-cris-headers.patch	2009-03-18 23:14:59 UTC (rev 25745)
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

Copied: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.8-cris-objcopy-flags.patch (from rev 25742, trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.7-cris-objcopy-flags.patch)
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.8-cris-objcopy-flags.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.8-cris-objcopy-flags.patch	2009-03-18 23:14:59 UTC (rev 25745)
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
