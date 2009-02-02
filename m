From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Feb 2009 20:13:58 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090202201358.37358764CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-02 20:13:57 +0000 (Mon, 02 Feb 2009)
New Revision: 25222

Log:
kernel-headers: bump 2.6.27/2.6.28 stable versions

Added:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-eth-driver-netpoll.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-headers.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-klist-warnings.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-objcopy-flags.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-fix-serial.h-include.patch

Removed:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-eth-driver-netpoll.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-headers.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-klist-warnings.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-objcopy-flags.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-fix-serial.h-include.patch

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-02-02 14:51:48 UTC (rev 25221)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-02-02 20:13:57 UTC (rev 25222)
@@ -117,7 +117,7 @@
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.13"	if BR2_KERNEL_HEADERS_2_6_27
-	default "2.6.28.2"	if BR2_KERNEL_HEADERS_2_6_28
+	default "2.6.27.14"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.28.3"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 

Deleted: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-eth-driver-netpoll.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-eth-driver-netpoll.patch	2009-02-02 14:51:48 UTC (rev 25221)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-eth-driver-netpoll.patch	2009-02-02 20:13:57 UTC (rev 25222)
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

Deleted: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-headers.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-headers.patch	2009-02-02 14:51:48 UTC (rev 25221)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-headers.patch	2009-02-02 20:13:57 UTC (rev 25222)
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

Deleted: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-klist-warnings.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-klist-warnings.patch	2009-02-02 14:51:48 UTC (rev 25221)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-klist-warnings.patch	2009-02-02 20:13:57 UTC (rev 25222)
@@ -1,12 +0,0 @@
---- a/include/linux/klist.h
-+++ b/include/linux/klist.h
-@@ -23,7 +23,7 @@ struct klist {
- 	struct list_head	k_list;
- 	void			(*get)(struct klist_node *);
- 	void			(*put)(struct klist_node *);
--};
-+} __attribute__ ((aligned (4)));
- 
- #define KLIST_INIT(_name, _get, _put)					\
- 	{ .k_lock	= __SPIN_LOCK_UNLOCKED(_name.k_lock),		\
-

Deleted: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-objcopy-flags.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-objcopy-flags.patch	2009-02-02 14:51:48 UTC (rev 25221)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-objcopy-flags.patch	2009-02-02 20:13:57 UTC (rev 25222)
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

Deleted: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-fix-serial.h-include.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-fix-serial.h-include.patch	2009-02-02 14:51:48 UTC (rev 25221)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-fix-serial.h-include.patch	2009-02-02 20:13:57 UTC (rev 25222)
@@ -1,55 +0,0 @@
-From 60c20fb8c00a2b23308ae4517f145383bc66d291 Mon Sep 17 00:00:00 2001
-From: Andy Whitcroft <apw@canonical.com>
-Date: Fri, 2 Jan 2009 13:49:04 +0000
-Subject: [PATCH] serial: RS485 ioctl structure uses __u32 include linux/types.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf-8
-Content-Transfer-Encoding: 8bit
-
-In the commit below a new struct serial_rs485 was introduced for a new
-ioctl:
-
-    commit c26c56c0f40e200e61d1390629c806f6adaffbcc
-    Author: Alan Cox <alan@redhat.com>
-    Date:   Mon Oct 13 10:37:48 2008 +0100
-
-	tty: Cris has a nice RS485 ioctl so we should steal it
-
-This structure uses the __u32 types for some of its members, which leads
-to the following compile error:
-
-    $ cc -I.../include -c X.c
-    In file included from X.c:2: .../include/linux/serial.h:185:
-		error: expected specifier-qualifier-list before ?__u32?
-    $
-
-It seems that these types are appropriate for this structure as it is
-to be exposed to userspace.  These types are available via linux/types.h
-so move the include of that outside the __KERNEL__ section.
-
-Signed-off-by: Andy Whitcroft <apw@canonical.com>
-Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
-Signed-off-by: Alan Cox <alan@redhat.com>
-Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
----
- include/linux/serial.h |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/include/linux/serial.h b/include/linux/serial.h
-index 1ea8d92..9136cc5 100644
---- a/include/linux/serial.h
-+++ b/include/linux/serial.h
-@@ -10,8 +10,9 @@
- #ifndef _LINUX_SERIAL_H
- #define _LINUX_SERIAL_H
- 
--#ifdef __KERNEL__
- #include <linux/types.h>
-+
-+#ifdef __KERNEL__
- #include <asm/page.h>
- 
- /*
--- 
-1.5.6.5
-

Copied: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-eth-driver-netpoll.patch (from rev 25218, trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-eth-driver-netpoll.patch)
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-eth-driver-netpoll.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-eth-driver-netpoll.patch	2009-02-02 20:13:57 UTC (rev 25222)
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

Copied: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-headers.patch (from rev 25218, trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-headers.patch)
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-headers.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-headers.patch	2009-02-02 20:13:57 UTC (rev 25222)
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

Copied: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-klist-warnings.patch (from rev 25218, trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-klist-warnings.patch)
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-klist-warnings.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-klist-warnings.patch	2009-02-02 20:13:57 UTC (rev 25222)
@@ -0,0 +1,12 @@
+--- a/include/linux/klist.h
++++ b/include/linux/klist.h
+@@ -23,7 +23,7 @@ struct klist {
+ 	struct list_head	k_list;
+ 	void			(*get)(struct klist_node *);
+ 	void			(*put)(struct klist_node *);
+-};
++} __attribute__ ((aligned (4)));
+ 
+ #define KLIST_INIT(_name, _get, _put)					\
+ 	{ .k_lock	= __SPIN_LOCK_UNLOCKED(_name.k_lock),		\
+

Copied: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-objcopy-flags.patch (from rev 25218, trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-objcopy-flags.patch)
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-objcopy-flags.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-objcopy-flags.patch	2009-02-02 20:13:57 UTC (rev 25222)
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

Copied: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-fix-serial.h-include.patch (from rev 25218, trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-fix-serial.h-include.patch)
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-fix-serial.h-include.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-fix-serial.h-include.patch	2009-02-02 20:13:57 UTC (rev 25222)
@@ -0,0 +1,55 @@
+From 60c20fb8c00a2b23308ae4517f145383bc66d291 Mon Sep 17 00:00:00 2001
+From: Andy Whitcroft <apw@canonical.com>
+Date: Fri, 2 Jan 2009 13:49:04 +0000
+Subject: [PATCH] serial: RS485 ioctl structure uses __u32 include linux/types.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+In the commit below a new struct serial_rs485 was introduced for a new
+ioctl:
+
+    commit c26c56c0f40e200e61d1390629c806f6adaffbcc
+    Author: Alan Cox <alan@redhat.com>
+    Date:   Mon Oct 13 10:37:48 2008 +0100
+
+	tty: Cris has a nice RS485 ioctl so we should steal it
+
+This structure uses the __u32 types for some of its members, which leads
+to the following compile error:
+
+    $ cc -I.../include -c X.c
+    In file included from X.c:2: .../include/linux/serial.h:185:
+		error: expected specifier-qualifier-list before ?__u32?
+    $
+
+It seems that these types are appropriate for this structure as it is
+to be exposed to userspace.  These types are available via linux/types.h
+so move the include of that outside the __KERNEL__ section.
+
+Signed-off-by: Andy Whitcroft <apw@canonical.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Alan Cox <alan@redhat.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+---
+ include/linux/serial.h |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/include/linux/serial.h b/include/linux/serial.h
+index 1ea8d92..9136cc5 100644
+--- a/include/linux/serial.h
++++ b/include/linux/serial.h
+@@ -10,8 +10,9 @@
+ #ifndef _LINUX_SERIAL_H
+ #define _LINUX_SERIAL_H
+ 
+-#ifdef __KERNEL__
+ #include <linux/types.h>
++
++#ifdef __KERNEL__
+ #include <asm/page.h>
+ 
+ /*
+-- 
+1.5.6.5
+
