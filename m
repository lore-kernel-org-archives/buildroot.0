From: Tom <fivemiletom@gmail.com>
Date: Thu, 31 May 2007 00:33:46 -0700
Subject: [Buildroot] mpfr error on cygwin for arm
In-Reply-To: <20070530094734.GD20055@aon.at>
References: <4656F77D.30303@teamboyce.co.uk> <465737B9.8070008@gmail.com>
	<20070525200333.GT24585@aon.at> <4657D933.8060109@gmail.com>
	<20070526094801.GC15885@aon.at> <465CEA84.70700@gmail.com>
	<20070530094734.GD20055@aon.at>
Message-ID: <465E7A5A.5080707@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernhard,

Below is cygwin-2.patch, which takes your recommendations into account, 
proceedings for cygwin-1.patch still apply.

Another issue I ran into now is the following for building the host 
gdb.exe, let me know if this is worth a separate thread:

make[1]: Leaving directory
`/tw/buildroot/toolchain_build_arm/gdbhost-6.6'
strip /tw/buildroot/toolchain_build_arm/gdbhost-6.6/gdb/gdb
strip: /tw/buildroot/toolchain_build_arm/gdbhost-6.6/gdb/gdb: No such 
file or directory
make: *** [/tw/buildroot/toolchain_build_arm/gdbhost-6.6/gdb/gdb] Error 1

The problem is that gdbhost-6.6/gdb/gdb does not exist. 
gdbhost-6.6/gdb/gdb.exe does exist (and works fine) and should not be 
stripped. Where should the cygwin exclusion for this happen?

Thanks
Tom

cygwin-2.patch
--------------
--- buildroot.orig/Makefile	2007-05-24 00:15:29.000000000 -0700
+++ buildroot/Makefile	2007-05-29 19:54:26.130869700 -0700
@@ -66,7 +66,32 @@
  #
  #############################################################

+ifneq (,$(findstring linux,$(BR2_GNU_BUILD_SUFFIX)))
+EXEEXT:=
+LIBEXT:=.a
+SHREXT:=.so
+endif
+ifneq (,$(findstring apple,$(BR2_GNU_BUILD_SUFFIX)))
+EXEEXT:=.pear
+LIBEXT:=.dunno
+SHREXT:=.dylib
+endif
+ifneq (,$(findstring cygwin,$(BR2_GNU_BUILD_SUFFIX)))
+EXEEXT:=.exe
+LIBEXT:=.lib
+SHREXT:=.dll
+endif
+ifneq (,$(findstring mingw,$(BR2_GNU_BUILD_SUFFIX)))
+EXEEXT:=.exe
+LIBEXT:=.lib
+SHREXT:=.dll
+endif

+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBTGTEXT=$(LIBEXT)
+else
+LIBTGTEXT=$(SHREXT)
+endif

  all:   world

--- buildroot.orig/Config.in	2007-05-24 00:15:29.000000000 -0700
+++ buildroot/Config.in	2007-05-29 19:39:05.976662000 -0700
@@ -373,6 +373,19 @@
  	help
  	  This option hides outdated/obsolete versions of packages.

+config BR2_PREFER_STATIC_LIB
+	bool "prefer static libraries"
+	default n
+	help
+	  Where possible, use static libraries.
+	  This increases your code size a lot and should only be
+	  used with a good reason why not use the default, which
+	  is dynamic libraries.
+
+	  If unsure, say No.
+
+	  WARNING: This is highly experimental at the moment.
+
  endmenu

  source "toolchain/Config.in"
--- buildroot.orig/toolchain/Makefile.in	2007-05-24
00:15:08.000000000 -0700
+++ buildroot/toolchain/Makefile.in	2007-05-30 19:30:26.858173300
-0700
@@ -10,6 +10,12 @@
  MULTILIB:=--disable-multilib
  endif

+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+PREFERRED_LIB_FLAGS:=--enable-static --disable-shared
+else
+PREFERRED_LIB_FLAGS:=--disable-static --enable-shared
+endif
+

  # FIXME -- this is temporary
  OPTIMIZE_FOR_CPU=$(ARCH)
---
buildroot.orig/toolchain_build_arm/uClibc-0.9.29/extra/config/Makefile
2007-04-17 04:38:21.000000000 -0700
+++ buildroot/toolchain_build_arm/uClibc-0.9.29/extra/config/Makefile
2007-05-29 19:34:47.200380600 -0700
@@ -21,7 +21,7 @@
  	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@)
$(HOST_LOADLIBES) $< -o $@

  $(host-cmulti): %: $(host-cobjs) $(host-cshlib)
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@)
$(HOST_LOADLIBES) $($@-objs) -o $@
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@)
$(HOST_LOADLIBES) $($@-objs) -lintl -o $@

  $(host-cobjs): %.o: %.c
  	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) -c
$< -o $@
--- buildroot.orig/package/gmp/gmp.mk	2007-05-24 00:15:24.000000000
-0700
+++ buildroot/package/gmp/gmp.mk	2007-05-30 20:56:55.313191500
-0700
@@ -18,6 +18,14 @@
  GMP_BE:=no
  endif

+# this is a workaround for a bug in GMP, please see
+# http://gmplib.org/list-archives/gmp-devel/2006-April/000618.html
+ifeq ($(EXEEXT),.exe)
+GMP_CPP_FLAGS:=-DDLL_EXPORT
+else
+GMP_CPP_FLAGS:=
+endif
+
  $(DL_DIR)/$(GMP_SOURCE):
  	 $(WGET) -P $(DL_DIR) $(GMP_SITE)/$(GMP_SOURCE)

@@ -35,6 +43,7 @@
  		$(TARGET_CONFIGURE_OPTS) \
  		CFLAGS="$(TARGET_CFLAGS)" \
  		LDFLAGS="$(TARGET_LDFLAGS)" \
+		CPPFLAGS="$(GMP_CPP_FLAGS)" \
  		ac_cv_c_bigendian=$(GMP_BE) \
  		$(GMP_DIR)/configure \
  		--target=$(GNU_TARGET_NAME) \
@@ -52,7 +61,7 @@
  		--includedir=/include \
  		--mandir=/usr/man \
  		--infodir=/usr/info \
-		--enable-shared \
+		$(PREFERRED_LIB_FLAGS) \
  		$(DISABLE_NLS) \
  	);
  	touch $@
@@ -105,12 +114,12 @@
  		CC_FOR_BUILD="$(HOSTCC)" \
  		CC="$(HOSTCC)" \
  		CFLAGS="$(HOST_CFLAGS)" \
+		CPPFLAGS="$(GMP_CPP_FLAGS)" \
  		$(GMP_DIR)/configure \
  		--prefix="$(GMP_HOST_DIR)" \
  		--build=$(GNU_HOST_NAME) \
  		--host=$(GNU_HOST_NAME) \
-		--enable-shared \
-		--enable-static \
+		$(PREFERRED_LIB_FLAGS) \
  		$(DISABLE_NLS) \
  	);
  	touch $@
