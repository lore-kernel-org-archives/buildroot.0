From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 14:26:14 -0500 (EST)
Subject: [Buildroot] [PATCH] fix gcc's ARM uClinux support
Message-ID: <alpine.LFD.2.00.0812031425290.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Here's an additional patch to properly build gcc for uClinux on ARM.
This is activated when BR2_GNU_TARGET_SUFFIX contains "uclinux" or
"uclinuxeabi", or variations on the same theme.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: toolchain/gcc/4.3.1/990-arm-uclinux.patch
===================================================================
--- toolchain/gcc/4.3.1/990-arm-uclinux.patch	(revision 0)
+++ toolchain/gcc/4.3.1/990-arm-uclinux.patch	(revision 0)
@@ -0,0 +1,78 @@
+diff -ur gcc-4.3.1.orig/gcc/config/arm/bpabi.h gcc-4.3.1/gcc/config/arm/bpabi.h
+--- gcc-4.3.1.orig/gcc/config/arm/bpabi.h	2007-11-08 08:44:09.000000000 -0500
++++ gcc-4.3.1/gcc/config/arm/bpabi.h	2008-12-01 04:18:46.000000000 -0500
+@@ -55,11 +55,15 @@
+ #undef  SUBTARGET_EXTRA_ASM_SPEC
+ #define SUBTARGET_EXTRA_ASM_SPEC "%{mabi=apcs-gnu|mabi=atpcs:-meabi=gnu;:-meabi=4}"
+ 
++#ifndef SUBTARGET_EXTRA_LINK_SPEC
++#define SUBTARGET_EXTRA_LINK_SPEC ""
++#endif
++
+ /* The generic link spec in elf.h does not support shared libraries.  */
+ #undef  LINK_SPEC
+ #define LINK_SPEC "%{mbig-endian:-EB} %{mlittle-endian:-EL} "		\
+   "%{static:-Bstatic} %{shared:-shared} %{symbolic:-Bsymbolic} "	\
+-  "-X"
++  "-X" SUBTARGET_EXTRA_LINK_SPEC
+ 
+ #if defined (__thumb__)
+ #define RENAME_LIBRARY_SET ".thumb_set"
+diff -ur gcc-4.3.1.orig/gcc/config/arm/uclinux-eabi.h gcc-4.3.1/gcc/config/arm/uclinux-eabi.h
+--- gcc-4.3.1.orig/gcc/config/arm/uclinux-eabi.h	2007-08-02 06:49:31.000000000 -0400
++++ gcc-4.3.1/gcc/config/arm/uclinux-eabi.h	2008-12-01 04:18:46.000000000 -0500
+@@ -42,7 +42,8 @@
+   while (false)
+ 
+ #undef SUBTARGET_EXTRA_LINK_SPEC
+-#define SUBTARGET_EXTRA_LINK_SPEC " -m armelf_linux_eabi"
++#define SUBTARGET_EXTRA_LINK_SPEC " -m armelf_linux_eabi -elf2flt" \
++  " --pic-veneer --target2=abs"
+ 
+ /* We default to the "aapcs-linux" ABI so that enums are int-sized by
+    default.  */
+diff -ur gcc-4.3.1.orig/gcc/config/arm/uclinux-elf.h gcc-4.3.1/gcc/config/arm/uclinux-elf.h
+--- gcc-4.3.1.orig/gcc/config/arm/uclinux-elf.h	2007-08-02 06:49:31.000000000 -0400
++++ gcc-4.3.1/gcc/config/arm/uclinux-elf.h	2008-12-01 04:21:28.000000000 -0500
+@@ -54,7 +54,7 @@
+ #define CPLUSPLUS_CPP_SPEC "-D_GNU_SOURCE %(cpp)"
+ 
+ #undef SUBTARGET_EXTRA_LINK_SPEC
+-#define SUBTARGET_EXTRA_LINK_SPEC " -m armelf_linux"
++#define SUBTARGET_EXTRA_LINK_SPEC " -m armelf_linux -melf2flt"
+ 
+ /* Now we define the strings used to build the spec file.  */
+ #undef  STARTFILE_SPEC
+diff -ur gcc-4.3.1.orig/gcc/config/arm/unwind-arm.h gcc-4.3.1/gcc/config/arm/unwind-arm.h
+--- gcc-4.3.1.orig/gcc/config/arm/unwind-arm.h	2007-09-04 11:05:01.000000000 -0400
++++ gcc-4.3.1/gcc/config/arm/unwind-arm.h	2008-12-01 04:18:46.000000000 -0500
+@@ -232,11 +232,11 @@
+       if (!tmp)
+ 	return 0;
+ 
+-#if defined(linux) || defined(__NetBSD__)
++#if (defined(linux) && !defined(__uClinux__)) || defined(__NetBSD__)
+       /* Pc-relative indirect.  */
+       tmp += ptr;
+       tmp = *(_Unwind_Word *) tmp;
+-#elif defined(__symbian__)
++#elif defined(__symbian__) || defined(__uClinux__)
+       /* Absolute pointer.  Nothing more to do.  */
+ #else
+       /* Pc-relative pointer.  */
+diff -ur gcc-4.3.1.orig/gcc/config.gcc gcc-4.3.1/gcc/config.gcc
+--- gcc-4.3.1.orig/gcc/config.gcc	2008-05-21 04:54:15.000000000 -0400
++++ gcc-4.3.1/gcc/config.gcc	2008-12-01 04:18:46.000000000 -0500
+@@ -759,10 +759,10 @@
+ 	tm_file="$tm_file arm/aout.h arm/arm.h"
+ 	;;
+ arm*-*-uclinux*)		# ARM ucLinux
+-	tm_file="dbxelf.h elfos.h arm/unknown-elf.h arm/elf.h arm/linux-gas.h arm/uclinux-elf.h arm/uclinux-elf.h"
++	tm_file="dbxelf.h elfos.h arm/unknown-elf.h arm/elf.h arm/linux-gas.h arm/uclinux-elf.h"
+ 	tmake_file="arm/t-arm arm/t-arm-elf"
+ 	case ${target} in
+-	arm*-*-uclinux-*eabi)
++	arm*-*-uclinux*eabi)
+ 	    tm_file="$tm_file arm/bpabi.h arm/uclinux-eabi.h"
+ 	    tmake_file="$tmake_file arm/t-bpabi"
+   	    # The BPABI long long divmod functions return a 128-bit value in
