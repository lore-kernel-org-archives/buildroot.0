From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 20:16:17 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: target/linux
	toolchain/kernel-headers
Message-ID: <20090112201617.C654076724@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-12 20:16:16 +0000 (Mon, 12 Jan 2009)
New Revision: 24805

Log:
toolchain: fix cris build with 2.6.28 kernel headers

Patch by Hinko Kocevar <hinko.kocevar@cetrtapot.si>

Added:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28-cris-headers.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28-cris-objcopy-flags.patch

Modified:
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2009-01-12 17:02:03 UTC (rev 24804)
+++ trunk/buildroot/target/linux/Makefile.in	2009-01-12 20:16:16 UTC (rev 24805)
@@ -59,9 +59,13 @@
 ifeq ($(LINUX26_FORMAT),vmlinux)
 LINUX26_BINLOC=$(LINUX26_FORMAT)
 else
+ifeq ($(BR2_ARCH),"cris")
+LINUX26_BINLOC=arch/$(KERNEL_ARCH)/arch-v10/boot/$(LINUX26_FORMAT)
+else
 LINUX26_BINLOC=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 endif
 endif
+endif
 
 # File name for the Linux kernel binary
 ifndef LINUX26_KERNEL

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2009-01-12 17:02:03 UTC (rev 24804)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2009-01-12 20:16:16 UTC (rev 24805)
@@ -86,6 +86,11 @@
 		HOSTCXX="$(HOSTCXX)" \
 		INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install; \
 	)
+ifeq ($(BR2_ARCH),"cris")
+	ln -s $(LINUX_HEADERS_DIR)/include/arch-v10/arch $(LINUX_HEADERS_DIR)/include/arch
+	cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/linux/user.h $(LINUX_HEADERS_DIR)/include/linux
+	$(SED) "/^#include <asm\/page\.h>/d" $(LINUX_HEADERS_DIR)/include/asm/user.h
+endif
 	touch $@
 
 endif

Added: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28-cris-headers.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28-cris-headers.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28-cris-headers.patch	2009-01-12 20:16:16 UTC (rev 24805)
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

Added: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28-cris-objcopy-flags.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28-cris-objcopy-flags.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28-cris-objcopy-flags.patch	2009-01-12 20:16:16 UTC (rev 24805)
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
