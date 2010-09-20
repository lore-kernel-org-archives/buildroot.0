From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 20 Sep 2010 15:03:17 -0700
Subject: [Buildroot] [PATCH 3/3] Added gcc 4.5.1 to buildroot
In-Reply-To: <1285020197-30269-1-git-send-email-Martin.Banky@gmail.com>
References: <1285020197-30269-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285020197-30269-4-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mpc: gcc 4.5.1 requires this now.

gcc: The patches from gcc 4.4.4 are still needed
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/Config.in                                  |    1 +
 package/mpc/Config.in                              |   20 +++
 package/mpc/mpc.mk                                 |  111 ++++++++++++++++
 toolchain/binutils/binutils.mk                     |   16 +++
 toolchain/gcc/4.5.1/100-uclibc-conf.patch          |   33 +++++
 toolchain/gcc/4.5.1/301-missing-execinfo_h.patch   |   11 ++
 toolchain/gcc/4.5.1/302-c99-snprintf.patch         |   13 ++
 .../gcc/4.5.1/305-libmudflap-susv3-legacy.patch    |   49 +++++++
 toolchain/gcc/4.5.1/810-arm-softfloat-libgcc.patch |   38 ++++++
 .../powerpc-link-with-math-lib.patch.conditional   |  137 ++++++++++++++++++++
 toolchain/gcc/Config.in                            |    5 +
 toolchain/gcc/gcc-uclibc-4.x.mk                    |   14 ++-
 12 files changed, 447 insertions(+), 1 deletions(-)
 create mode 100644 package/mpc/Config.in
 create mode 100644 package/mpc/mpc.mk
 create mode 100644 toolchain/gcc/4.5.1/100-uclibc-conf.patch
 create mode 100644 toolchain/gcc/4.5.1/301-missing-execinfo_h.patch
 create mode 100644 toolchain/gcc/4.5.1/302-c99-snprintf.patch
 create mode 100644 toolchain/gcc/4.5.1/305-libmudflap-susv3-legacy.patch
 create mode 100644 toolchain/gcc/4.5.1/810-arm-softfloat-libgcc.patch
 create mode 100644 toolchain/gcc/4.5.1/powerpc-link-with-math-lib.patch.conditional

diff --git a/package/Config.in b/package/Config.in
index ce6057b..7a38e7d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -61,6 +61,7 @@ source "package/grep/Config.in"
 endif
 source "package/intltool/Config.in"
 source "package/make/Config.in"
+source "package/mpc/Config.in"
 source "package/mpfr/Config.in"
 source "package/libtool/Config.in"
 source "package/m4/Config.in"
diff --git a/package/mpc/Config.in b/package/mpc/Config.in
new file mode 100644
index 0000000..d7cd4cc
--- /dev/null
+++ b/package/mpc/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBMPC
+	bool "mpc"
+	select BR2_PACKAGE_LIBMPFR
+	select BR2_PACKAGE_LIBGMP
+	help
+	  Mpc is a C library for the arithmetic of complex numbers with
+	  arbitrarily high precision and correct rounding of the result.
+	  It is built upon and follows the same principles as Mpfr.
+	  
+	  http://www.multiprecision.org/
+
+
+config BR2_PACKAGE_LIBMPC_HEADERS
+	bool "mpc headers for target"
+	depends on BR2_PACKAGE_LIBMPC
+	select BR2_PACKAGE_LIBMPFR_HEADERS
+	select BR2_PACKAGE_LIBGMP_HEADERS
+	help
+	  Install the mpc headers for the target.
+
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
new file mode 100644
index 0000000..9fd2ba7
--- /dev/null
+++ b/package/mpc/mpc.mk
@@ -0,0 +1,111 @@
+#libmpc: libgmp libmpfr $(TARGET_DIR)/usr/lib/libmpc$(LIBTGTEXT)
+
+#############################################################
+#
+# mpc
+#
+#############################################################
+MPC_VERSION:=0.8.2
+MPC_SOURCE:=mpc-$(MPC_VERSION).tar.gz
+MPC_SITE:=http://www.multiprecision.org/mpc/download/$(MPC_SOURCE)
+MPC_CAT:=$(ZCAT)
+MPC_DIR:=$(TOOLCHAIN_DIR)/mpc-$(MPC_VERSION)
+MPC_TARGET_DIR:=$(BUILD_DIR)/mpc-$(MPC_VERSION)
+MPC_BINARY:=libmpc$(LIBTGTEXT)
+MPC_HOST_BINARY:=libmpc$(HOST_LIBEXT)
+MPC_LIBVERSION:=1.0.0
+
+$(DL_DIR)/$(MPC_SOURCE):
+	 $(call DOWNLOAD,$(MPC_SITE),$(MPC_SOURCE))
+
+libmpc-source: $(DL_DIR)/$(MPC_SOURCE)
+
+$(MPC_DIR)/.unpacked: $(DL_DIR)/$(MPC_SOURCE)
+	$(MPC_CAT) $(DL_DIR)/$(MPC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(MPC_DIR) package/mpc/ \*.patch
+	$(CONFIG_UPDATE) $(@D)
+	touch $@
+
+$(MPC_TARGET_DIR)/.configured: $(MPC_DIR)/.unpacked
+	mkdir -p $(MPC_TARGET_DIR)
+	(cd $(MPC_TARGET_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(MPC_DIR)/configure $(QUIET) \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		$(PREFERRED_LIB_FLAGS) \
+		--with-mpfr-lib=$(TARGET_DIR)/usr/lib/ \
+		--with-gmp-lib=$(TARGET_DIR)/usr/lib/ \
+		--with-mpfr-include=$(STAGING_DIR)/usr/include/ \
+		--with-gmp-include=$(STAGING_DIR)/usr/include/ \
+		$(DISABLE_NLS) \
+	)
+	touch $@
+
+$(MPC_TARGET_DIR)/.libs/$(MPC_BINARY): $(MPC_TARGET_DIR)/.configured
+	#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(MPC_TARGET_DIR)
+	$(MAKE) -C $(MPC_TARGET_DIR)
+
+$(STAGING_DIR)/usr/lib/$(MPC_BINARY): $(MPC_TARGET_DIR)/.libs/$(MPC_BINARY)
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(MPC_TARGET_DIR) install
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(STAGING_DIR)/usr/lib/libmpc$(LIBTGTEXT)*
+
+$(TARGET_DIR)/usr/lib/libmpc.so $(TARGET_DIR)/usr/lib/libmpc.so.$(MPC_LIBVERSION) $(TARGET_DIR)/usr/lib/libmpc.a: $(STAGING_DIR)/usr/lib/$(MPC_BINARY)
+	cp -dpf $(STAGING_DIR)/usr/lib/libmpc$(LIBTGTEXT)* $(TARGET_DIR)/usr/lib/
+ifeq ($(BR2_PACKAGE_LIBMPC_HEADERS),y)
+	test -d $(TARGET_DIR)/usr/include || mkdir -p $(TARGET_DIR)/usr/include
+	cp -dpf $(STAGING_DIR)/usr/include/mpc.h $(TARGET_DIR)/usr/include/
+endif
+
+libmpc: $(TARGET_DIR)/usr/lib/libmpc$(LIBTGTEXT)
+stage-libmpc: $(STAGING_DIR)/usr/lib/$(MPC_BINARY)
+
+libmpc-clean:
+	rm -f $(TARGET_DIR)/usr/lib/libmpc.* $(TARGET_DIR)/usr/include/mpc.h \
+		$(STAGING_DIR)/usr/lib/libmpc* $(STAGING_DIR)/usr/include/mpc.h
+	-$(MAKE) -C $(MPC_TARGET_DIR) clean
+
+libmpc-dirclean:
+	rm -rf $(MPC_TARGET_DIR) $(MPC_DIR)
+
+MPC_DIR2:=$(TOOLCHAIN_DIR)/mpc-$(MPC_VERSION)-host
+MPC_HOST_DIR:=$(TOOLCHAIN_DIR)/mpc
+$(MPC_DIR2)/.configured: $(MPC_DIR)/.unpacked
+	mkdir -p $(MPC_DIR2)
+	(cd $(MPC_DIR2); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		$(MPC_CPP_FLAGS) \
+		$(MPC_DIR)/configure $(QUIET) \
+		--prefix="$(MPC_HOST_DIR)" \
+		--build=$(GNU_HOST_NAME) \
+		--host=$(GNU_HOST_NAME) \
+		--disable-shared \
+		--enable-static \
+		--with-mpfr=$(MPFR_HOST_DIR) \
+		--with-gmp=$(GMP_HOST_DIR) \
+		$(DISABLE_NLS) \
+	)
+	touch $@
+
+$(MPC_HOST_DIR)/lib/libmpc$(HOST_LIBEXT): $(MPC_DIR2)/.configured
+	$(MAKE) -C $(MPC_DIR2) install
+
+host-libmpc: $(MPC_HOST_DIR)/lib/$(MPC_HOST_BINARY)
+host-libmpc-source: libmpc-source
+host-libmpc-clean:
+	rm -rf $(MPC_HOST_DIR)
+	-$(MAKE) -C $(MPC_DIR2) clean
+host-libmpc-dirclean:
+	rm -rf $(MPC_HOST_DIR) $(MPC_DIR2)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_LIBMPC),y)
+TARGETS+=libmpc
+endif
diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index 85b605e..ef9f644 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -29,6 +29,22 @@ EXTRA_BINUTILS_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_HOST_DIR)"
 BINUTILS_TARGET_CONFIG_OPTIONS=--with-gmp="$(GMP_TARGET_DIR)"
 BINUTILS_TARGET_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_TARGET_DIR)"
 
+ifeq ($(BR2_PACKAGE_LIBMPC),y)
+BINUTILS_ADD_MPC = y
+endif
+
+ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
+BINUTILS_ADD_MPC = y
+endif
+
+ifeq ($(BINUTILS_ADD_MPC),y)
+BINUTILS_HOST_PREREQ += $(TOOLCHAIN_DIR)/mpc/lib/libmpc$(HOST_LIBEXT)
+HOST_SOURCE += host-libmpc-source
+BINUTILS_TARGET_PREREQ += $(TARGET_DIR)/usr/lib/libmpc$(LIBTGTEXT)
+EXTRA_BINUTILS_CONFIG_OPTIONS += --with-mpc="$(MPC_HOST_DIR)"
+BINUTILS_TARGET_CONFIG_OPTIONS += --with-mpc="$(MPC_TARGET_DIR)"
+endif
+
 BINUTILS_PATCH_DIR:=toolchain/binutils/$(BINUTILS_VERSION)
 
 ifneq ($(filter xtensa%,$(ARCH)),)
diff --git a/toolchain/gcc/4.5.1/100-uclibc-conf.patch b/toolchain/gcc/4.5.1/100-uclibc-conf.patch
new file mode 100644
index 0000000..cca8c82
--- /dev/null
+++ b/toolchain/gcc/4.5.1/100-uclibc-conf.patch
@@ -0,0 +1,33 @@
+--- gcc/gcc/config/--- gcc/contrib/regression/objs-gcc.sh
++++ gcc/contrib/regression/objs-gcc.sh
+@@ -105,6 +105,10 @@
+  then
+   make all-gdb all-dejagnu all-ld || exit 1
+   make install-gdb install-dejagnu install-ld || exit 1
++elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
++ then
++  make all-gdb all-dejagnu all-ld || exit 1
++  make install-gdb install-dejagnu install-ld || exit 1
+ elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
+   make bootstrap || exit 1
+   make install || exit 1
+--- gcc/libjava/classpath/ltconfig
++++ gcc/libjava/classpath/ltconfig
+@@ -603,7 +603,7 @@
+ 
+ # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+ case $host_os in
+-linux-gnu*) ;;
++linux-gnu*|linux-uclibc*) ;;
+ linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+ esac
+ 
+@@ -1251,7 +1251,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux*)
+   version_type=linux
+   need_lib_prefix=no
+   need_version=no
diff --git a/toolchain/gcc/4.5.1/301-missing-execinfo_h.patch b/toolchain/gcc/4.5.1/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..0e2092f
--- /dev/null
+++ b/toolchain/gcc/4.5.1/301-missing-execinfo_h.patch
@@ -0,0 +1,11 @@
+--- gcc-4.0.0/boehm-gc/include/gc.h-orig	2005-04-28 22:28:57.000000000 -0500
++++ gcc-4.0.0/boehm-gc/include/gc.h	2005-04-28 22:30:38.000000000 -0500
+@@ -500,7 +500,7 @@
+ #ifdef __linux__
+ # include <features.h>
+ # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
++     && !defined(__ia64__) && !defined(__UCLIBC__)
+ #   ifndef GC_HAVE_BUILTIN_BACKTRACE
+ #     define GC_HAVE_BUILTIN_BACKTRACE
+ #   endif
diff --git a/toolchain/gcc/4.5.1/302-c99-snprintf.patch b/toolchain/gcc/4.5.1/302-c99-snprintf.patch
new file mode 100644
index 0000000..ba51a0e
--- /dev/null
+++ b/toolchain/gcc/4.5.1/302-c99-snprintf.patch
@@ -0,0 +1,13 @@
+Index: gcc-4.3.0/libstdc++-v3/include/c_global/cstdio
+===================================================================
+--- gcc-4.3.0/libstdc++-v3/include/c_global/cstdio	(revision 129202)
++++ gcc-4.3.0/libstdc++-v3/include/c_global/cstdio	(working copy)
+@@ -144,7 +144,7 @@
+ 
+ _GLIBCXX_END_NAMESPACE
+ 
+-#if _GLIBCXX_USE_C99
++#if _GLIBCXX_USE_C99 || defined __UCLIBC__
+ 
+ #undef snprintf
+ #undef vfscanf
diff --git a/toolchain/gcc/4.5.1/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.5.1/305-libmudflap-susv3-legacy.patch
new file mode 100644
index 0000000..374b1f8
--- /dev/null
+++ b/toolchain/gcc/4.5.1/305-libmudflap-susv3-legacy.patch
@@ -0,0 +1,49 @@
+Index: gcc-4.2/libmudflap/mf-hooks2.c
+===================================================================
+--- gcc-4.2/libmudflap/mf-hooks2.c	(revision 119834)
++++ gcc-4.2/libmudflap/mf-hooks2.c	(working copy)
+@@ -427,7 +427,7 @@
+ {
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
+-  bzero (s, n);
++  memset (s, 0, n);
+ }
+ 
+ 
+@@ -437,7 +437,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
+   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
+-  bcopy (src, dest, n);
++  memmove (dest, src, n);
+ }
+ 
+ 
+@@ -447,7 +447,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
+   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
+-  return bcmp (s1, s2, n);
++  return n == 0 ? 0 : memcmp (s1, s2, n);
+ }
+ 
+ 
+@@ -456,7 +456,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
+-  return index (s, c);
++  return strchr (s, c);
+ }
+ 
+ 
+@@ -465,7 +465,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
+-  return rindex (s, c);
++  return strrchr (s, c);
+ }
+ 
+ /* XXX:  stpcpy, memccpy */
diff --git a/toolchain/gcc/4.5.1/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.5.1/810-arm-softfloat-libgcc.patch
new file mode 100644
index 0000000..e6a30a3
--- /dev/null
+++ b/toolchain/gcc/4.5.1/810-arm-softfloat-libgcc.patch
@@ -0,0 +1,38 @@
+[PATCH] add the correct symbols to libgcc for uclibc arm softfloat
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ gcc/config/arm/linux-elf.h |    2 +-
+ gcc/config/arm/t-linux     |    6 +++++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+Index: gcc-4.4.0/gcc/config/arm/t-linux
+===================================================================
+--- gcc-4.4.0.orig/gcc/config/arm/t-linux
++++ gcc-4.4.0/gcc/config/arm/t-linux
+@@ -4,7 +4,11 @@
+ 
+ LIB1ASMSRC = arm/lib1funcs.asm
+ LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
+-	_arm_addsubdf3 _arm_addsubsf3
++	_arm_addsubdf3 _arm_addsubsf3 \
++	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
++	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
++	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
++	_arm_fixsfsi _arm_fixunssfsi
+ 
+ # MULTILIB_OPTIONS = mhard-float/msoft-float
+ # MULTILIB_DIRNAMES = hard-float soft-float
+Index: gcc-4.4.0/gcc/config/arm/linux-elf.h
+===================================================================
+--- gcc-4.4.0.orig/gcc/config/arm/linux-elf.h
++++ gcc-4.4.0/gcc/config/arm/linux-elf.h
+@@ -60,7 +60,7 @@
+    %{shared:-lc} \
+    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
+ 
+-#define LIBGCC_SPEC "%{msoft-float:-lfloat} %{mfloat-abi=soft*:-lfloat} -lgcc"
++#define LIBGCC_SPEC "-lgcc"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
+ 
diff --git a/toolchain/gcc/4.5.1/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.5.1/powerpc-link-with-math-lib.patch.conditional
new file mode 100644
index 0000000..3fe8757
--- /dev/null
+++ b/toolchain/gcc/4.5.1/powerpc-link-with-math-lib.patch.conditional
@@ -0,0 +1,137 @@
+http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00269.html
+
+On glibc the libc.so carries a copy of the math function copysignl() but
+on uClibc math functions like copysignl() live in libm. Since libgcc_s
+contains unresolved symbols, any attempt to link against libgcc_s
+without explicitely specifying -lm fails, resulting in a broken
+bootstrap of the compiler.
+
+
+diff -rdup gcc-4.4.0.old/gcc/config/t-slibgcc-elf-ver gcc-4.4.0/gcc/config/t-slibgcc-elf-ver
+
+diff -durN gcc-4.4.4.orig/gcc/config/t-slibgcc-elf-ver gcc-4.4.4/gcc/config/t-slibgcc-elf-ver
+--- gcc-4.4.4.orig/gcc/config/t-slibgcc-elf-ver	2010-01-04 16:13:08.000000000 +0100
++++ gcc-4.4.4/gcc/config/t-slibgcc-elf-ver	2010-05-16 19:38:36.000000000 +0200
+@@ -9,7 +9,7 @@
+ SHLIB_OBJS = @shlib_objs@
+ SHLIB_DIR = @multilib_dir@
+ SHLIB_SLIBDIR_QUAL = @shlib_slibdir_qual@
+-SHLIB_LC = -lc
++SHLIB_LC = @libgcc_libm@ -lc
+ SHLIB_MAKE_SOLINK = $(LN_S) $(SHLIB_SONAME) $(SHLIB_DIR)/$(SHLIB_SOLINK)
+ SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
+ 	$$(DESTDIR)$$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
+diff -durN gcc-4.4.4.orig/libgcc/Makefile.in gcc-4.4.4/libgcc/Makefile.in
+--- gcc-4.4.4.orig/libgcc/Makefile.in	2009-04-10 01:23:07.000000000 +0200
++++ gcc-4.4.4/libgcc/Makefile.in	2010-05-16 19:38:36.000000000 +0200
+@@ -39,6 +39,7 @@
+ decimal_float = @decimal_float@
+ enable_decimal_float = @enable_decimal_float@
+ fixed_point = @fixed_point@
++LIBGCC_LIBM = @LIBGCC_LIBM@
+ 
+ host_noncanonical = @host_noncanonical@
+ 
+@@ -787,9 +788,10 @@
+ 		@multilib_dir@,$(MULTIDIR),$(subst \
+ 		@shlib_objs@,$(objects),$(subst \
+ 		@shlib_base_name@,libgcc_s,$(subst \
++		@libgcc_libm@,$(LIBGCC_LIBM),$(subst \
+ 		@shlib_map_file@,$(mapfile),$(subst \
+ 		@shlib_slibdir_qual@,$(MULTIOSSUBDIR),$(subst \
+-		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK))))))))
++		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK)))))))))
+ 
+ libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
+ 	# @multilib_flags@ is still needed because this may use
+diff -durN gcc-4.4.4.orig/libgcc/configure gcc-4.4.4/libgcc/configure
+--- gcc-4.4.4.orig/libgcc/configure	2008-11-20 18:13:01.000000000 +0100
++++ gcc-4.4.4/libgcc/configure	2010-05-16 19:38:36.000000000 +0200
+@@ -272,7 +272,7 @@
+ PACKAGE_BUGREPORT=''
+ 
+ ac_unique_file="static-object.mk"
+-ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS libgcc_topdir enable_shared slibdir INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA AWK build build_cpu build_vendor build_os host host_cpu host_vendor host_os host_noncanonical build_libsubdir build_subdir host_subdir target_subdir AR ac_ct_AR LIPO ac_ct_LIPO NM ac_ct_NM RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP LN_S CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP decimal_float enable_decimal_float fixed_point vis_hide set_have_cc_tls tmake_file extra_parts asm_hidden_op LIBOBJS LTLIBOBJS'
++ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS libgcc_topdir enable_shared slibdir INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA AWK build build_cpu build_vendor build_os host host_cpu host_vendor host_os host_noncanonical build_libsubdir build_subdir host_subdir target_subdir AR ac_ct_AR LIPO ac_ct_LIPO NM ac_ct_NM RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP LN_S CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP decimal_float enable_decimal_float fixed_point vis_hide set_have_cc_tls LIBGCC_LIBM tmake_file extra_parts asm_hidden_op LIBOBJS LTLIBOBJS'
+ ac_subst_files=''
+ ac_pwd=`pwd`
+ 
+@@ -3547,6 +3547,39 @@
+ fi
+ 
+ 
++# On powerpc libgcc_s references copysignl which is a libm function but
++# glibc apparently also provides it via libc as opposed to uClibc where
++# it lives in libm.
++echo "$as_me:$LINENO: checking for library containing copysignl" >&5
++echo $ECHO_N "checking for library containing copysignl... $ECHO_C" >&6
++if test "${libgcc_cv_copysignl_lib+set}" = set; then
++  echo $ECHO_N "(cached) $ECHO_C" >&6
++else
++
++    echo '#include <features.h>' > conftest.c
++    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
++    libgcc_cv_copysignl_lib="-lc"
++    if { ac_try='${CC-cc} -S conftest.c -o conftest.s 1>&5'
++  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
++  (eval $ac_try) 2>&5
++  ac_status=$?
++  echo "$as_me:$LINENO: \$? = $ac_status" >&5
++  (exit $ac_status); }; }
++    then
++	libgcc_cv_copysignl_lib="-lm"
++    fi
++    rm -f conftest.*
++
++fi
++echo "$as_me:$LINENO: result: $libgcc_cv_copysignl_lib" >&5
++echo "${ECHO_T}$libgcc_cv_copysignl_lib" >&6
++
++case /${libgcc_cv_copysignl_lib}/ in
++  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
++  *) LIBGCC_LIBM= ;;
++esac
++
++
+ # Conditionalize the makefile for this target machine.
+ tmake_file_=
+ for f in ${tmake_file}
+@@ -4267,6 +4300,7 @@
+ s, at fixed_point@,$fixed_point,;t t
+ s, at vis_hide@,$vis_hide,;t t
+ s, at set_have_cc_tls@,$set_have_cc_tls,;t t
++s, at LIBGCC_LIBM@,$LIBGCC_LIBM,;t t
+ s, at tmake_file@,$tmake_file,;t t
+ s, at extra_parts@,$extra_parts,;t t
+ s, at asm_hidden_op@,$asm_hidden_op,;t t
+diff -durN gcc-4.4.4.orig/libgcc/configure.ac gcc-4.4.4/libgcc/configure.ac
+--- gcc-4.4.4.orig/libgcc/configure.ac	2008-11-20 18:13:01.000000000 +0100
++++ gcc-4.4.4/libgcc/configure.ac	2010-05-16 19:38:36.000000000 +0200
+@@ -223,6 +223,27 @@
+ fi
+ AC_SUBST(set_have_cc_tls)
+ 
++# On powerpc libgcc_s references copysignl which is a libm function but
++# glibc apparently also provides it via libc as opposed to uClibc where
++# it lives in libm.
++AC_CACHE_CHECK
++  libgcc_cv_copysignl_lib,
++    echo '#include <features.h>' > conftest.c
++    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
++    libgcc_cv_copysignl_lib="-lc"
++    if AC_TRY_COMMAND(${CC-cc} -S conftest.c -o conftest.s 1>&AS_MESSAGE_LOG_FD)
++    then
++	libgcc_cv_copysignl_lib="-lm"
++    fi
++    rm -f conftest.*
++  ])
++
++case /${libgcc_cv_copysignl_lib}/ in
++  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
++  *) LIBGCC_LIBM= ;;
++esac
++AC_SUBST(LIBGCC_LIBM)
++
+ # Conditionalize the makefile for this target machine.
+ tmake_file_=
+ for f in ${tmake_file}
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 70d8de9..2d10dda 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -25,6 +25,10 @@ choice
 		depends on !BR2_avr32
 		bool "gcc 4.4.x"
 
+	config BR2_GCC_VERSION_4_5_X
+		depends on !BR2_avr32
+		bool "gcc 4.5.x"
+
 	config BR2_GCC_VERSION_SNAP
 		depends on !BR2_avr32
 		bool "gcc snapshot"
@@ -48,6 +52,7 @@ config BR2_GCC_VERSION
 	default "4.2.4"     if BR2_GCC_VERSION_4_2_4
 	default "4.3.5"     if BR2_GCC_VERSION_4_3_X
 	default "4.4.4"     if BR2_GCC_VERSION_4_4_X
+	default "4.5.1"     if BR2_GCC_VERSION_4_5_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index f17b73f..bc9928a 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -101,12 +101,20 @@ GCC_WITH_HOST_GMP=--with-gmp=$(GMP_HOST_DIR)
 GCC_WITH_HOST_MPFR=--with-mpfr=$(MPFR_HOST_DIR)
 HOST_SOURCE += host-libgmp-source host-libmpfr-source
 
+ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
+GCC_WITH_HOST_MPC=--with-mpc=$(MPC_HOST_DIR)
+HOST_SOURCE += host-libmpc-source
+endif
+
 ifeq ($(BR2_INSTALL_FORTRAN),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),fortran
 #GCC_TARGET_PREREQ+=$(TARGET_DIR)/usr/lib/libmpfr.so $(TARGET_DIR)/usr/lib/libgmp.so
 #GCC_STAGING_PREREQ+=$(TOOLCHAIN_DIR)/mpfr/lib/libmpfr.so
 GCC_WITH_TARGET_GMP=--with-gmp="$(GMP_TARGET_DIR)"
 GCC_WITH_TARGET_MPFR=--with-mpfr="$(MPFR_TARGET_DIR)"
+ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
+GCC_WITH_TARGET_MPC=--with-mpc="$(MPC_TARGET_DIR)"
+endif
 endif
 
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
@@ -207,6 +215,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		$(GCC_TLS) \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
+		$(GCC_WITH_HOST_MPC) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(GCC_DECIMAL_FLOAT) \
@@ -282,6 +291,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 		$(GCC_TLS) \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
+		$(GCC_WITH_HOST_MPC) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(MULTILIB) \
@@ -358,6 +368,7 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
+		$(GCC_WITH_HOST_MPC) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(GCC_DECIMAL_FLOAT) \
@@ -462,7 +473,7 @@ gcc-dirclean: gcc_initial-dirclean
 GCC_BUILD_DIR4:=$(BUILD_DIR)/gcc-$(GCC_VERSION)-target
 
 $(GCC_BUILD_DIR4)/.prepared: $(STAMP_DIR)/gcc_libs_target_installed $(GCC_TARGET_PREREQ)
-	mkdir -p $(GCC_BUILD_DIR3)
+	mkdir -p $(GCC_BUILD_DIR4)
 	touch $@
 
 $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
@@ -491,6 +502,7 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_TARGET_GMP) \
 		$(GCC_WITH_TARGET_MPFR) \
+		$(GCC_WITH_TARGET_MPC) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(GCC_DECIMAL_FLOAT) \
-- 
1.7.2.3
