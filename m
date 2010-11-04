From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] gcc 4.5.x powerpc: fix
	softfloat and gcc pr#43810
Message-ID: <20101104230331.5F98E8DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aa3e75ecd1a2cf0a00d44f13e6f6a6adc7e97cc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../powerpc-link-with-math-lib.patch.conditional   |   76 ++++++++-----------
 toolchain/gcc/gcc-uclibc-4.x.mk                    |   16 ++++-
 2 files changed, 45 insertions(+), 47 deletions(-)

diff --git a/toolchain/gcc/4.5.1/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.5.1/powerpc-link-with-math-lib.patch.conditional
index 3fe8757..7e75e87 100644
--- a/toolchain/gcc/4.5.1/powerpc-link-with-math-lib.patch.conditional
+++ b/toolchain/gcc/4.5.1/powerpc-link-with-math-lib.patch.conditional
@@ -6,13 +6,12 @@ contains unresolved symbols, any attempt to link against libgcc_s
 without explicitely specifying -lm fails, resulting in a broken
 bootstrap of the compiler.
 
+Forward port to gcc 4.5.1 by Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -rdup gcc-4.4.0.old/gcc/config/t-slibgcc-elf-ver gcc-4.4.0/gcc/config/t-slibgcc-elf-ver
-
-diff -durN gcc-4.4.4.orig/gcc/config/t-slibgcc-elf-ver gcc-4.4.4/gcc/config/t-slibgcc-elf-ver
---- gcc-4.4.4.orig/gcc/config/t-slibgcc-elf-ver	2010-01-04 16:13:08.000000000 +0100
-+++ gcc-4.4.4/gcc/config/t-slibgcc-elf-ver	2010-05-16 19:38:36.000000000 +0200
-@@ -9,7 +9,7 @@
+diff -Nura gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver gcc-4.5.1/gcc/config/t-slibgcc-elf-ver
+--- gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver	2010-11-03 14:35:08.644904042 -0300
++++ gcc-4.5.1/gcc/config/t-slibgcc-elf-ver	2010-11-03 14:35:56.332904024 -0300
+@@ -27,7 +27,7 @@
  SHLIB_OBJS = @shlib_objs@
  SHLIB_DIR = @multilib_dir@
  SHLIB_SLIBDIR_QUAL = @shlib_slibdir_qual@
@@ -21,9 +20,9 @@ diff -durN gcc-4.4.4.orig/gcc/config/t-slibgcc-elf-ver gcc-4.4.4/gcc/config/t-sl
  SHLIB_MAKE_SOLINK = $(LN_S) $(SHLIB_SONAME) $(SHLIB_DIR)/$(SHLIB_SOLINK)
  SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
  	$$(DESTDIR)$$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
-diff -durN gcc-4.4.4.orig/libgcc/Makefile.in gcc-4.4.4/libgcc/Makefile.in
---- gcc-4.4.4.orig/libgcc/Makefile.in	2009-04-10 01:23:07.000000000 +0200
-+++ gcc-4.4.4/libgcc/Makefile.in	2010-05-16 19:38:36.000000000 +0200
+diff -Nura gcc-4.5.1.orig/libgcc/Makefile.in gcc-4.5.1/libgcc/Makefile.in
+--- gcc-4.5.1.orig/libgcc/Makefile.in	2010-11-03 14:32:44.272904042 -0300
++++ gcc-4.5.1/libgcc/Makefile.in	2010-11-03 14:37:03.893904042 -0300
 @@ -39,6 +39,7 @@
  decimal_float = @decimal_float@
  enable_decimal_float = @enable_decimal_float@
@@ -32,7 +31,7 @@ diff -durN gcc-4.4.4.orig/libgcc/Makefile.in gcc-4.4.4/libgcc/Makefile.in
  
  host_noncanonical = @host_noncanonical@
  
-@@ -787,9 +788,10 @@
+@@ -798,9 +799,10 @@
  		@multilib_dir@,$(MULTIDIR),$(subst \
  		@shlib_objs@,$(objects),$(subst \
  		@shlib_base_name@,libgcc_s,$(subst \
@@ -44,22 +43,21 @@ diff -durN gcc-4.4.4.orig/libgcc/Makefile.in gcc-4.4.4/libgcc/Makefile.in
  
  libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
  	# @multilib_flags@ is still needed because this may use
-diff -durN gcc-4.4.4.orig/libgcc/configure gcc-4.4.4/libgcc/configure
---- gcc-4.4.4.orig/libgcc/configure	2008-11-20 18:13:01.000000000 +0100
-+++ gcc-4.4.4/libgcc/configure	2010-05-16 19:38:36.000000000 +0200
-@@ -272,7 +272,7 @@
- PACKAGE_BUGREPORT=''
- 
- ac_unique_file="static-object.mk"
--ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS libgcc_topdir enable_shared slibdir INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA AWK build build_cpu build_vendor build_os host host_cpu host_vendor host_os host_noncanonical build_libsubdir build_subdir host_subdir target_subdir AR ac_ct_AR LIPO ac_ct_LIPO NM ac_ct_NM RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP LN_S CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP decimal_float enable_decimal_float fixed_point vis_hide set_have_cc_tls tmake_file extra_parts asm_hidden_op LIBOBJS LTLIBOBJS'
-+ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS libgcc_topdir enable_shared slibdir INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA AWK build build_cpu build_vendor build_os host host_cpu host_vendor host_os host_noncanonical build_libsubdir build_subdir host_subdir target_subdir AR ac_ct_AR LIPO ac_ct_LIPO NM ac_ct_NM RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP LN_S CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP decimal_float enable_decimal_float fixed_point vis_hide set_have_cc_tls LIBGCC_LIBM tmake_file extra_parts asm_hidden_op LIBOBJS LTLIBOBJS'
- ac_subst_files=''
- ac_pwd=`pwd`
- 
-@@ -3547,6 +3547,39 @@
+diff -Nura gcc-4.5.1.orig/libgcc/configure gcc-4.5.1/libgcc/configure
+--- gcc-4.5.1.orig/libgcc/configure	2010-11-03 14:32:44.283904042 -0300
++++ gcc-4.5.1/libgcc/configure	2010-11-03 14:39:48.685904042 -0300
+@@ -557,6 +557,7 @@
+ extra_parts
+ tmake_file
+ set_use_emutls
++LIBGCC_LIBM
+ set_have_cc_tls
+ vis_hide
+ fixed_point
+@@ -3847,6 +3848,37 @@
+   set_use_emutls="-DUSE_EMUTLS"
  fi
  
- 
 +# On powerpc libgcc_s references copysignl which is a libm function but
 +# glibc apparently also provides it via libc as opposed to uClibc where
 +# it lives in libm.
@@ -79,7 +77,7 @@ diff -durN gcc-4.4.4.orig/libgcc/configure gcc-4.4.4/libgcc/configure
 +  echo "$as_me:$LINENO: \$? = $ac_status" >&5
 +  (exit $ac_status); }; }
 +    then
-+	libgcc_cv_copysignl_lib="-lm"
++       libgcc_cv_copysignl_lib="-lm"
 +    fi
 +    rm -f conftest.*
 +
@@ -91,23 +89,13 @@ diff -durN gcc-4.4.4.orig/libgcc/configure gcc-4.4.4/libgcc/configure
 +  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
 +  *) LIBGCC_LIBM= ;;
 +esac
-+
-+
+ 
  # Conditionalize the makefile for this target machine.
  tmake_file_=
- for f in ${tmake_file}
-@@ -4267,6 +4300,7 @@
- s, at fixed_point@,$fixed_point,;t t
- s, at vis_hide@,$vis_hide,;t t
- s, at set_have_cc_tls@,$set_have_cc_tls,;t t
-+s, at LIBGCC_LIBM@,$LIBGCC_LIBM,;t t
- s, at tmake_file@,$tmake_file,;t t
- s, at extra_parts@,$extra_parts,;t t
- s, at asm_hidden_op@,$asm_hidden_op,;t t
-diff -durN gcc-4.4.4.orig/libgcc/configure.ac gcc-4.4.4/libgcc/configure.ac
---- gcc-4.4.4.orig/libgcc/configure.ac	2008-11-20 18:13:01.000000000 +0100
-+++ gcc-4.4.4/libgcc/configure.ac	2010-05-16 19:38:36.000000000 +0200
-@@ -223,6 +223,27 @@
+diff -Nura gcc-4.5.1.orig/libgcc/configure.ac gcc-4.5.1/libgcc/configure.ac
+--- gcc-4.5.1.orig/libgcc/configure.ac	2010-11-03 14:32:44.735904042 -0300
++++ gcc-4.5.1/libgcc/configure.ac	2010-11-03 14:42:11.278904045 -0300
+@@ -238,6 +238,27 @@
  fi
  AC_SUBST(set_have_cc_tls)
  
@@ -121,7 +109,7 @@ diff -durN gcc-4.4.4.orig/libgcc/configure.ac gcc-4.4.4/libgcc/configure.ac
 +    libgcc_cv_copysignl_lib="-lc"
 +    if AC_TRY_COMMAND(${CC-cc} -S conftest.c -o conftest.s 1>&AS_MESSAGE_LOG_FD)
 +    then
-+	libgcc_cv_copysignl_lib="-lm"
++       libgcc_cv_copysignl_lib="-lm"
 +    fi
 +    rm -f conftest.*
 +  ])
@@ -132,6 +120,6 @@ diff -durN gcc-4.4.4.orig/libgcc/configure.ac gcc-4.4.4/libgcc/configure.ac
 +esac
 +AC_SUBST(LIBGCC_LIBM)
 +
- # Conditionalize the makefile for this target machine.
- tmake_file_=
- for f in ${tmake_file}
+ # See if we have emulated thread-local storage.
+ GCC_CHECK_EMUTLS
+ set_use_emutls=
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 7e3ee49..684dca8 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -43,6 +43,16 @@ EXTRA_GCC_CONFIG_OPTIONS+=--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
 	--with-bugurl="http://bugs.buildroot.net/"
 endif
 
+# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
+# Workaround until it's fixed in 4.5.2 or later
+ifeq ($(ARCH),powerpc)
+ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
+GCC_OPTSPACE=--disable-target-optspace
+endif
+else
+GCC_OPTSPACE=--enable-target-optspace
+endif
+
 GCC_TARGET_PREREQ=
 GCC_STAGING_PREREQ=
 
@@ -204,7 +214,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		--enable-languages=c \
 		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
 		--disable-__cxa_atexit \
-		--enable-target-optspace \
+		$(GCC_OPTSPACE) \
 		--with-gnu-ld \
 		--disable-shared \
 		--disable-libssp \
@@ -282,7 +292,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 		--enable-languages=c \
 		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
 		--disable-__cxa_atexit \
-		--enable-target-optspace \
+		$(GCC_OPTSPACE) \
 		--with-gnu-ld \
 		--enable-shared \
 		--disable-libssp \
@@ -359,7 +369,7 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		$(BR2_CONFIGURE_STAGING_SYSROOT) \
 		$(BR2_CONFIGURE_BUILD_TOOLS) \
 		--disable-__cxa_atexit \
-		--enable-target-optspace \
+		$(GCC_OPTSPACE) \
 		--with-gnu-ld \
 		--disable-libssp \
 		--disable-multilib \
-- 
1.7.1
