From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri,  9 Nov 2007 01:57:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain:  gcc gcc/3.4.6
Message-ID: <20071109095725.A0C5D30062@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-09 01:57:25 -0800 (Fri, 09 Nov 2007)
New Revision: 20393

Log:
update gcc nios2 support, thanks atle

Added:
   trunk/buildroot/toolchain/gcc/3.4.6/901-nios2-ctor_dtor.patch
   trunk/buildroot/toolchain/gcc/3.4.6/nios2-config-fix.patch.conditional

Modified:
   trunk/buildroot/toolchain/Config.in.2
   trunk/buildroot/toolchain/gcc/Makefile.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2007-11-09 09:52:26 UTC (rev 20392)
+++ trunk/buildroot/toolchain/Config.in.2	2007-11-09 09:57:25 UTC (rev 20393)
@@ -48,7 +48,7 @@
 config BR2_SOFT_FLOAT
 	bool "Use software floating point by default"
 	default n
-	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_powerpc
+	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_nios2
 	help
 	  If your target CPU does not have a Floating Point Unit (FPU) or a
 	  kernel FPU emulator, but you still wish to support floating point

Added: trunk/buildroot/toolchain/gcc/3.4.6/901-nios2-ctor_dtor.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/3.4.6/901-nios2-ctor_dtor.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/3.4.6/901-nios2-ctor_dtor.patch	2007-11-09 09:57:25 UTC (rev 20393)
@@ -0,0 +1,52 @@
+Index: gcc/gcc/config/nios2/nios2.h
+===================================================================
+--- gcc/gcc/config/nios2/nios2.h	(revision 195)
++++ gcc/gcc/config/nios2/nios2.h	(revision 196)
+@@ -88,8 +88,6 @@
+       N_("All ld/st instructins do not use io variants (default)") },		\
+     { "smallc", 0,			\
+       N_("Link with a limited version of the C library") },		\
+-    { "ctors-in-init", 0,			\
+-      "" /* undocumented: N_("Link with static constructors and destructors in init") */ },		\
+     { "", TARGET_DEFAULT, 0 }				\
+ }
+ 
+@@ -140,12 +138,12 @@
+ #define STARTFILE_SPEC  \
+ "%{msys-crt0=*: %*} %{!msys-crt0=*: crt1%O%s} \
+  %{msys-crt0=: %eYou need a C startup file for -msys-crt0=} \
+- %{mctors-in-init: crti%O%s crtbegin%O%s} \
++ crti%O%s crtbegin%O%s \
+ "
+ 
+ #undef ENDFILE_SPEC 
+ #define ENDFILE_SPEC \
+- "%{mctors-in-init: crtend%O%s crtn%O%s}"
++ " crtend%O%s crtn%O%s"
+ 
+ 
+ /***********************
+Index: gcc/gcc/config/nios2/t-nios2
+===================================================================
+--- gcc/gcc/config/nios2/t-nios2	(revision 195)
++++ gcc/gcc/config/nios2/t-nios2	(revision 196)
+@@ -36,18 +36,8 @@
+ 	echo ''          >  ${DPBIT}
+ 	cat $(srcdir)/config/fp-bit.c >> ${DPBIT}
+ 
+-EXTRA_MULTILIB_PARTS = crtbegin.o crtend.o crti.o crtn.o 
++EXTRA_MULTILIB_PARTS = crtbegin.o crtend.o
+ 
+-# Assemble startup files. 
+-$(T)crti.o: $(srcdir)/config/nios2/crti.asm $(GCC_PASSES) 
+-	$(GCC_FOR_TARGET) $(GCC_CFLAGS) $(MULTILIB_CFLAGS) $(INCLUDES) \
+-	-c -o $(T)crti.o -x assembler-with-cpp $(srcdir)/config/nios2/crti.asm 
+-
+-$(T)crtn.o: $(srcdir)/config/nios2/crtn.asm $(GCC_PASSES) 
+-	$(GCC_FOR_TARGET) $(GCC_CFLAGS) $(MULTILIB_CFLAGS) $(INCLUDES) \
+-	-c -o $(T)crtn.o -x assembler-with-cpp $(srcdir)/config/nios2/crtn.asm 
+-
+-
+ ## You may need to provide additional #defines at the beginning of
+ ## fp-bit.c and dp-bit.c to control target endianness and other options
+ ##

Added: trunk/buildroot/toolchain/gcc/3.4.6/nios2-config-fix.patch.conditional
===================================================================
--- trunk/buildroot/toolchain/gcc/3.4.6/nios2-config-fix.patch.conditional	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/3.4.6/nios2-config-fix.patch.conditional	2007-11-09 09:57:25 UTC (rev 20393)
@@ -0,0 +1,19 @@
+--- gcc-3.4.6/gcc/config/t-linux-uclibc	2007-11-07 14:50:34.000000000 +0100
++++ /dev/null	2007-11-02 12:35:37.750656579 +0100
+@@ -1,5 +0,0 @@
+-# Remove glibc specific files added in t-linux
+-SHLIB_MAPFILES := $(filter-out $(srcdir)/config/libgcc-glibc.ver, $(SHLIB_MAPFILES))
+-
+-# Use unwind-dw2-fde instead of unwind-dw2-fde-glibc
+-LIB2ADDEH := $(subst unwind-dw2-fde-glibc.c,unwind-dw2-fde.c,$(LIB2ADDEH))
+--- gcc-3.4.6/gcc/config.gcc.orig	2007-11-07 14:50:34.000000000 +0100
++++ gcc-3.4.6/gcc/config.gcc	2007-11-07 15:32:31.000000000 +0100
+@@ -2334,7 +2334,7 @@
+ # Rather than hook into each target, just do it after all the linux
+ # targets have been processed
+ case ${target} in
+-*-linux-uclibc*) tm_defines="${tm_defines} USE_UCLIBC" ; tmake_file="${tmake_file} t-linux-uclibc"
++*-linux-uclibc*) tm_defines="${tm_defines} USE_UCLIBC"
+ esac
+ 
+ # Support for --with-cpu and related options (and a few unrelated options,

Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-11-09 09:52:26 UTC (rev 20392)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-11-09 09:57:25 UTC (rev 20393)
@@ -27,7 +27,9 @@
 ifeq ($(BR2_SOFT_FLOAT),y)
 # gcc 3.4.x soft float configuration is different than previous versions.
 ifeq ($(findstring x3.4.,x$(GCC_VERSION)),x3.4.)
+ifneq ($(BR2_nios2),y)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
+endif
 else
 SOFT_FLOAT_CONFIG_OPTION:=--without-float
 endif

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-11-09 09:52:26 UTC (rev 20392)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-11-09 09:57:25 UTC (rev 20393)
@@ -168,6 +168,9 @@
 	#toolchain/patch-kernel.sh $(GCC_DIR) toolchain/gcc i386-gcc-soft-float.patch
 	#endif
 endif
+ifeq ("$(strip $(ARCH))","nios2")
+	toolchain/patch-kernel.sh $(GCC_DIR) toolchain/gcc/$(GCC_VERSION) nios2-config-fix.patch.conditional
+endif
 	touch $@
 
 # The --without-headers option stopped working with gcc 3.0 and has never been
