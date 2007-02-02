From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  2 Feb 2007 05:49:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.1.2
Message-ID: <20070202134939.8061D485E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-02 05:49:38 -0800 (Fri, 02 Feb 2007)
New Revision: 17724

Log:
- update for default endian


Modified:
   trunk/buildroot/toolchain/gcc/4.1.2/800-arm-bigendian.patch


Changeset:
Modified: trunk/buildroot/toolchain/gcc/4.1.2/800-arm-bigendian.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.1.2/800-arm-bigendian.patch	2007-02-02 12:50:17 UTC (rev 17723)
+++ trunk/buildroot/toolchain/gcc/4.1.2/800-arm-bigendian.patch	2007-02-02 13:49:38 UTC (rev 17724)
@@ -3,8 +3,10 @@
 
 See http://gcc.gnu.org/PR16350
 
---- gcc-4.1.0/gcc/config/arm/linux-elf.h
-+++ gcc-4.1.0/gcc/config/arm/linux-elf.h
+Index: gcc-4.1.1/gcc/config/arm/linux-elf.h
+===================================================================
+--- gcc-4.1.1.orig/gcc/config/arm/linux-elf.h
++++ gcc-4.1.1/gcc/config/arm/linux-elf.h
 @@ -28,19 +28,33 @@
  #undef  TARGET_VERSION
  #define TARGET_VERSION  fputs (" (ARM GNU/Linux with ELF)", stderr);
@@ -51,9 +53,11 @@
     SUBTARGET_EXTRA_LINK_SPEC
  
  #undef  LINK_SPEC
---- gcc-4.1.0/gcc/config.gcc
-+++ gcc-4.1.0/gcc/config.gcc
-@@ -672,6 +672,11 @@
+Index: gcc-4.1.1/gcc/config.gcc
+===================================================================
+--- gcc-4.1.1.orig/gcc/config.gcc
++++ gcc-4.1.1/gcc/config.gcc
+@@ -672,6 +672,11 @@ arm*-*-netbsd*)
  	;;
  arm*-*-linux*)			# ARM GNU/Linux with ELF
  	tm_file="dbxelf.h elfos.h linux.h arm/elf.h arm/linux-gas.h arm/linux-elf.h" 
@@ -65,3 +69,59 @@
  	tmake_file="${tmake_file} t-linux arm/t-arm"
  	case ${target} in
  	arm*-*-linux-gnueabi)
+Index: gcc-4.1.1/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-4.1.1.orig/gcc/config/arm/linux-eabi.h
++++ gcc-4.1.1/gcc/config/arm/linux-eabi.h
+@@ -20,6 +20,17 @@
+    the Free Software Foundation, 51 Franklin Street, Fifth Floor,
+    Boston, MA 02110-1301, USA.  */
+ 
++/*
++ * 'config.gcc' defines TARGET_BIG_ENDIAN_DEFAULT as 1 for arm*b-*
++ * (big endian) configurations.
++ */
++#undef TARGET_LINKER_EMULATION
++#if TARGET_BIG_ENDIAN_DEFAULT
++#define TARGET_LINKER_EMULATION "armelfb_linux_eabi"
++#else
++#define TARGET_LINKER_EMULATION "armelf_linux_eabi"
++#endif
++
+ /* On EABI GNU/Linux, we want both the BPABI builtins and the
+    GNU/Linux builtins.  */
+ #undef TARGET_OS_CPP_BUILTINS
+@@ -48,7 +59,7 @@
+ #define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
+ 
+ #undef SUBTARGET_EXTRA_LINK_SPEC
+-#define SUBTARGET_EXTRA_LINK_SPEC " -m armelf_linux_eabi"
++#define SUBTARGET_EXTRA_LINK_SPEC " -m " TARGET_LINKER_EMULATION
+ 
+ /* Use ld-linux.so.3 so that it will be possible to run "classic"
+    GNU/Linux binaries on an EABI system.  */
+Index: gcc-4.1.1/gcc/config/arm/bpabi.h
+===================================================================
+--- gcc-4.1.1.orig/gcc/config/arm/bpabi.h
++++ gcc-4.1.1/gcc/config/arm/bpabi.h
+@@ -33,9 +33,19 @@
+ #undef FPUTYPE_DEFAULT
+ #define FPUTYPE_DEFAULT FPUTYPE_VFP
+ 
++/*
++ * 'config.gcc' defines TARGET_BIG_ENDIAN_DEFAULT as 1 for arm*b-*
++ * (big endian) configurations.
++ */
++#if TARGET_BIG_ENDIAN_DEFAULT
++#define TARGET_ENDIAN_DEFAULT MASK_BIG_END
++#else
++#define TARGET_ENDIAN_DEFAULT 0
++#endif
++
+ /* EABI targets should enable interworking by default.  */
+ #undef TARGET_DEFAULT
+-#define TARGET_DEFAULT MASK_INTERWORK
++#define TARGET_DEFAULT (MASK_INTERWORK | TARGET_ENDIAN_DEFAULT)
+ 
+ /* The ARM BPABI functions return a boolean; they use no special
+    calling convention.  */
