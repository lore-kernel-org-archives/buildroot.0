From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed, 27 Feb 2008 18:13:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/libpng
	package/microcom package/ etc...
Message-ID: <20080228021343.DF5EA120154@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2008-02-27 18:13:42 -0800 (Wed, 27 Feb 2008)
New Revision: 21130

Log:
Make sure 'linkage.h' headers are installed. Add hack to bootstrap newer 
versions of GCC. Filter out 'gnu99' from assembly flags. Use the 
'headers' target instead of 'pregen' to prepare for more NPTL 
integration. Fix broken MTD package configuration....someone believes in 
the Klingon release process apparently. Fix build issues with netplug 
and libpng. Fix source path for microcom as original site no longer 
exists.


Added:
   trunk/buildroot/package/libpng/remove-setjmp-error.patch
   trunk/buildroot/package/netplug/netplug-getsockname-cast.patch
   trunk/buildroot/toolchain/gcc/4.1.2/801-arm-bootstrap-libgcc.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-001-add-linkage-header.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-filter-gnu99-from-assembly-flags.patch

Modified:
   trunk/buildroot/package/microcom/microcom.mk
   trunk/buildroot/package/mtd/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Added: trunk/buildroot/package/libpng/remove-setjmp-error.patch
===================================================================
--- trunk/buildroot/package/libpng/remove-setjmp-error.patch	                        (rev 0)
+++ trunk/buildroot/package/libpng/remove-setjmp-error.patch	2008-02-28 02:13:42 UTC (rev 21130)
@@ -0,0 +1,17 @@
+diff -ur libpng-1.2.16/pngconf.h libpng-1.2.16-patched/pngconf.h
+--- libpng-1.2.16/pngconf.h	2007-01-31 07:22:33.000000000 -0600
++++ libpng-1.2.16-patched/pngconf.h	2008-02-27 17:40:23.707516659 -0600
+@@ -310,13 +310,6 @@
+ #      define PNG_SAVE_BSD_SOURCE
+ #      undef _BSD_SOURCE
+ #    endif
+-#    ifdef _SETJMP_H
+-     /* If you encounter a compiler error here, see the explanation
+-      * near the end of INSTALL.
+-      */
+-         __png.h__ already includes setjmp.h;
+-         __dont__ include it again.;
+-#    endif
+ #  endif /* __linux__ */
+ 
+    /* include setjmp.h for error handling */

Modified: trunk/buildroot/package/microcom/microcom.mk
===================================================================
--- trunk/buildroot/package/microcom/microcom.mk	2008-02-27 21:42:13 UTC (rev 21129)
+++ trunk/buildroot/package/microcom/microcom.mk	2008-02-28 02:13:42 UTC (rev 21130)
@@ -26,7 +26,7 @@
 # TARGETS
 # http://microcom.port5.com/m102.tar.gz
 MICROCOM_VERSION:=1.02
-MICROCOM_SITE:=http://microcom.port5.com/
+MICROCOM_SITE:=http://buildroot.uclibc.org/downloads/buildroot-sources/
 MICROCOM_SOURCE:=m102.tar.gz
 MICROCOM_DIR:=$(BUILD_DIR)/microcom-$(MICROCOM_VERSION)
 

Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2008-02-27 21:42:13 UTC (rev 21129)
+++ trunk/buildroot/package/mtd/Config.in	2008-02-28 02:13:42 UTC (rev 21130)
@@ -46,9 +46,9 @@
 
 config BR2_PACKAGE_MTD_ORIG_STRING
 	string
-	depends on BR2_PACKAGE_MTD_ORIG
+	depends on BR2_PACKAGE_MTD
 	default "mtd-utils-1.1.0.tar.bz2" if BR2_PACKAGE_MTD_UTILS
-	default "mtd_20061007.orig.tar.gz" if BR2_PACKAGE_MTD_20050122
+	default "mtd_20061007.orig.tar.gz" if BR2_PACKAGE_MTD_20061007
 	default "mtd_20050122.orig.tar.gz" if BR2_PACKAGE_MTD_20050122
 	default $(BR2_PACKAGE_MTD_SNAPSHOT_STRING) if BR2_PACKAGE_MTD_SNAPSHOT
 

Added: trunk/buildroot/package/netplug/netplug-getsockname-cast.patch
===================================================================
--- trunk/buildroot/package/netplug/netplug-getsockname-cast.patch	                        (rev 0)
+++ trunk/buildroot/package/netplug/netplug-getsockname-cast.patch	2008-02-28 02:13:42 UTC (rev 21130)
@@ -0,0 +1,12 @@
+diff -ur netplug-1.2.9/netlink.c netplug-1.2.9-patched/netlink.c
+--- netplug-1.2.9/netlink.c	2005-01-07 23:57:09.000000000 -0600
++++ netplug-1.2.9-patched/netlink.c	2008-02-27 17:59:48.373864047 -0600
+@@ -286,7 +286,7 @@
+ 
+     int addr_len = sizeof(addr);
+ 
+-    if (getsockname(fd, (struct sockaddr *) &addr, &addr_len) == -1) {
++    if (getsockname(fd, (struct sockaddr *) &addr, (socklen_t *) &addr_len) == -1) {
+         do_log(LOG_ERR, "Could not get socket details: %m");
+         exit(1);
+     }

Added: trunk/buildroot/toolchain/gcc/4.1.2/801-arm-bootstrap-libgcc.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.1.2/801-arm-bootstrap-libgcc.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.1.2/801-arm-bootstrap-libgcc.patch	2008-02-28 02:13:42 UTC (rev 21130)
@@ -0,0 +1,63 @@
+diff -ur gcc-4.1.2/gcc/config/arm/unwind-arm.c gcc-4.1.2-patched/gcc/config/arm/unwind-arm.c
+--- gcc-4.1.2/gcc/config/arm/unwind-arm.c	2006-09-20 12:31:12.000000000 -0500
++++ gcc-4.1.2-patched/gcc/config/arm/unwind-arm.c	2008-02-27 13:30:45.339282365 -0600
+@@ -29,7 +29,13 @@
+ 
+ /* We add a prototype for abort here to avoid creating a dependency on
+    target headers.  */
++#ifndef BOOTSTRAP_GCC
+ extern void abort (void);
++#else
++void abort (void)
++{
++}
++#endif
+ 
+ /* Definitions for C++ runtime support routines.  We make these weak
+    declarations to avoid pulling in libsupc++ unnecessarily.  */
+@@ -542,7 +548,9 @@
+ 	{
+ 	  UCB_SAVED_CALLSITE_ADDR (ucbp) = saved_vrs.core.r[R_PC];
+ 
++#ifndef BOOTSTRAP_GCC
+ 	  next_vrs = saved_vrs;
++#endif
+ 
+ 	  /* Call the pr to decide what to do.  */
+ 	  pr_result = ((personality_routine) UCB_PR_ADDR (ucbp))
+@@ -572,7 +580,9 @@
+       if (entry_code != _URC_OK)
+ 	return entry_code;
+ 
++#ifndef BOOTSTRAP_GCC
+       saved_vrs = next_vrs;
++#endif
+     }
+   while (pr_result == _URC_CONTINUE_UNWIND);
+ 
+diff -ur gcc-4.1.2/gcc/mklibgcc.in gcc-4.1.2-patched/gcc/mklibgcc.in
+--- gcc-4.1.2/gcc/mklibgcc.in	2006-09-10 02:13:12.000000000 -0500
++++ gcc-4.1.2-patched/gcc/mklibgcc.in	2008-02-27 13:39:15.697843177 -0600
+@@ -169,7 +169,7 @@
+   # It is too hard to guarantee that vis_hide and gen-hide-list will never
+   # be referenced if SHLIB_LINK is not set, so set them to the values they'd
+   # have if SHLIB_LINK were set and we didn't have visibility support.
+-  echo "vis_hide ="
++  echo "vis_hide :=-DBOOTSTRAP_GCC"
+   echo "gen-hide-list = echo > \$@"
+ fi
+ 
+diff -ur gcc-4.1.2/gcc/unwind-dw2.c gcc-4.1.2-patched/gcc/unwind-dw2.c
+--- gcc-4.1.2/gcc/unwind-dw2.c	2005-11-17 19:19:10.000000000 -0600
++++ gcc-4.1.2-patched/gcc/unwind-dw2.c	2008-02-27 13:29:55.414640030 -0600
+@@ -1311,8 +1311,10 @@
+       void *c = current->reg[i];
+       void *t = target->reg[i];
+ 
++#ifndef BOOTSTRAP_GCC
+       if (t && c && t != c)
+ 	memcpy (c, t, dwarf_reg_size_table[i]);
++#endif
+     }
+ 
+   /* If the current frame doesn't have a saved stack pointer, then we

Added: trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-001-add-linkage-header.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-001-add-linkage-header.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-001-add-linkage-header.patch	2008-02-28 02:13:42 UTC (rev 21130)
@@ -0,0 +1,18 @@
+diff -ur linux-2.6.21.5/include/asm-arm/Kbuild linux-2.6.21.5-patched/include/asm-arm/Kbuild
+--- linux-2.6.21.5/include/asm-arm/Kbuild	2007-06-11 13:37:06.000000000 -0500
++++ linux-2.6.21.5-patched/include/asm-arm/Kbuild	2008-02-27 18:17:46.999128276 -0600
+@@ -1 +1,3 @@
+ include include/asm-generic/Kbuild.asm
++
++header-y += linkage.h
+diff -ur linux-2.6.21.5/include/linux/Kbuild linux-2.6.21.5-patched/include/linux/Kbuild
+--- linux-2.6.21.5/include/linux/Kbuild	2007-06-11 13:37:06.000000000 -0500
++++ linux-2.6.21.5-patched/include/linux/Kbuild	2008-02-27 18:15:05.921149678 -0600
+@@ -100,6 +100,7 @@
+ header-y += jffs2.h
+ header-y += keyctl.h
+ header-y += limits.h
++header-y += linkage.h
+ header-y += lock_dlm_plock.h
+ header-y += magic.h
+ header-y += major.h

Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-filter-gnu99-from-assembly-flags.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-filter-gnu99-from-assembly-flags.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-filter-gnu99-from-assembly-flags.patch	2008-02-28 02:13:42 UTC (rev 21130)
@@ -0,0 +1,12 @@
+diff -ur uClibc-0.9.29/Makerules uClibc-0.9.29-patched/Makerules
+--- uClibc-0.9.29/Makerules	2006-12-10 18:25:23.000000000 -0600
++++ uClibc-0.9.29-patched/Makerules	2008-01-26 17:04:50.965699518 -0600
+@@ -96,7 +96,7 @@
+ disp_ld        = $($(DISP)_disp_ld)
+ 
+ cmd_compile.c = $(CC) -c $< -o $@ $(CFLAGS) $(ARCH_CFLAGS) $(CFLAGS-$(suffix $@)) $(filter-out $(CFLAGS-OMIT-$(notdir $<)),$(CFLAGS-$(notdir $(^D)))) $(CFLAGS-$(subst $(top_srcdir),,$(dir $<))) $(CFLAGS-$(notdir $<)) $(CFLAGS-$(notdir $@))
+-cmd_compile.S = $(cmd_compile.c) -D__ASSEMBLER__ $(ASFLAGS) $(ARCH_ASFLAGS) $(ASFLAGS-$(suffix $@)) $(ASFLAGS-$(notdir $<)) $(ASFLAGS-$(notdir $@))
++cmd_compile.S = $(filter-out -std=gnu99, $(cmd_compile.c)) -D__ASSEMBLER__ $(ASFLAGS) $(ARCH_ASFLAGS) $(ASFLAGS-$(suffix $@)) $(ASFLAGS-$(notdir $<)) $(ASFLAGS-$(notdir $@))
+ cmd_compile.m = $(cmd_compile.c) -DL_$(patsubst %$(suffix $(notdir $@)),%,$(notdir $@))
+ cmd_compile-m = $(CC) $^ -c -o $@ $(CFLAGS) $(ARCH_CFLAGS) $(CFLAGS-$(suffix $@)) $(CFLAGS-$(notdir $(@D))) $(CFLAGS-$(notdir $@))
+ cmd_strip     = $(STRIPTOOL) $(STRIP_FLAGS) $^

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-02-27 21:42:13 UTC (rev 21129)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-02-28 02:13:42 UTC (rev 21130)
@@ -378,7 +378,7 @@
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		HOSTCC="$(HOSTCC)" \
-		pregen install_dev
+		headers install_dev
 	# Install the kernel headers to the first stage gcc include dir
 	# if necessary
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
