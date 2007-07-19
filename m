From: Tom <fivemiletom@gmail.com>
Date: Wed, 18 Jul 2007 23:46:30 -0700
Subject: [Buildroot] Buildroot compilation errors (libintl) in cygwin.
In-Reply-To: <33486.24130.qm@web52108.mail.re2.yahoo.com>
References: <33486.24130.qm@web52108.mail.re2.yahoo.com>
Message-ID: <469F08C6.4060105@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gabbar Singh wrote:
> Thanks a lot for the input Rex.
> I did indeed add -lintl to the makefile and the error stopped. So every 
> place where there is any configuration happening, I need to change that 
> makefile.. correct ?
> I had to make changes in two places to make it run.

As Rex said, there were and are several places, some of which not 
directly in buildroot but in the extracted archives. Gabbar, if you can 
give us a list of all the places that you needed to fix for a more 
recent buildroot than the one I was talking about below, that would be 
appreciated.

Thanks,
Tom


---
Hi Bernhard, All

Enclosed is cygwin-1.patch for buildroot-20050524.tar.bz2.

- requires cygwin 1.5.24 with development package

- configure buildroot for arm, arm-generic, eabi, "pc-cygwin", 
uclibc-0.9.29, buildroot toolchain with gcc 4.1.2

- FIRST do one build attempt (will fail, just to get and extract uclibc)

- apply cygwin-1.patch with p1 (it is at very bottom of this email)

- THEN do another build attempt, which will build
   gmp, mpfr, newlib and arm-linux-uclibcgnueabi-gcc-4.1.2.exe
   before failing (*).

Thanks
Tom

PS: if someone could take care of the apple part, that would be great. 
Also, the one fix belongs to uclibc and not to buildroot...


(*) it fails when cross compiling uclibc, maybe my UCLIBC options? Hints 
appreciated, need this to test on target.

make MAKE="make -j1" -C /tw/buildroot/toolchain_build_arm/uClibc-0.9.29
\
                 PREFIX= \
                 DEVEL_PREFIX=/ \
                 RUNTIME_PREFIX=/ \
                 HOSTCC="gcc" \
                 all
arm-linux-uclibcgnueabi-gcc: n: No such file or directory
make[1]: Entering directory
`/tw/buildroot/toolchain_build_arm/uClibc-0.9.29'
arm-linux-uclibcgnueabi-gcc: n: No such file or directory
make[2]: `conf' is up to date.
arm-linux-uclibcgnueabi-gcc: n: No such file or directory
   CC ldso/ldso/ldso.oS
arm-linux-uclibcgnueabi-gcc: n: No such file or directory
make[1]: *** [ldso/ldso/ldso.oS] Error 1
make[1]: Leaving directory
`/tw/buildroot/toolchain_build_arm/uClibc-0.9.29'
make: *** [/tw/buildroot/toolchain_build_arm/uClibc-0.9.29/lib/libc.a]
Error 2





 > On Fri, May 25, 2007 at 11:52:35PM -0700, Tom wrote:
 >> Hi Bernhard and all,
 >>
 >> sorry if this thread is a little out of sequence, had problems with 
text attachment.
 >>
 >> Bernhard Fischer wrote:
 >>> Before you report it to the mpfr folks, please paste the error here,
 >>> since i suspect that it could have to do something with the
 >>> binary/library name extensions, which (IIRC) we currently do not handle
 >>> at all (there's a bug somewhere about this, if memory serves me right).
 >>>
 >> You were right about extensions, below is the error as produced by
 >> buildroot-20050516 built, I just added -verbose for ld.
 >> It can not resolve the depency to libgmp.so, because cygwin ld 
assumes libs to end in .a, .lib or .dll, and will append them to .so 
libs, which thus can never be found.
 >> Can I help to add support for this?
 >
 > Yes, you can.
 >
 > Depending on the target, set
 > ifneq $($(findstring linux,$(BR2_GNU_BUILD_SUFFIX)),)
 > EXEEXT:=
 > LIBEXT:=.a
 > SHREXT:=.so
 > endif
 > ifneq $($(findstring apple,$(BR2_GNU_BUILD_SUFFIX)),)
 > EXEEXT:=.pear
 > LIBEXT:=.dunno
 > SHREXT:=.dylib
 > endif
 > ifneq $($(findstring cygwin,$(BR2_GNU_BUILD_SUFFIX)),)
 > EXEEXT:=.exe
 > LIBEXT:=.dunno
 > SHREXT:=.dll
 > endif
 > ifneq $($(findstring mingw,$(BR2_GNU_BUILD_SUFFIX)),)
 > EXEEXT:=.exe
 > LIBEXT:=.dunno
 > SHREXT:=.dll
 > endif
 >
 > in the toplevel Makefile, before the
 > all: world
 > target, and use them accordingly.
 >
 >
 > While you're at it, it would be awesome if you could deal with this too:
 > We want to be able to select which flavour of lib is built (shared or
 > static) with a single config-option.
 > So, instead of changing all ".so" blindly to $(SHREXT), change it to
 > $(LIBTGTEXT) which is set either to
 >
 > ifeq $($(BR2_DEFAULT_LIB_TARGET),shared)
 > LIBTGTEXT=$(SHREXT)
 > else
 > LIBTGTEXT=$(LIBEXT)
 > endif
 >
 > below the newly added block i mentioned above.
 >
 > TIA and cheers,
 >


cygwin-1.patch:

--- buildroot.orig/Makefile    2007-05-29 11:55:38.025317600 -0700
+++ buildroot/Makefile    2007-05-29 19:54:26.130869700 -0700
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

--- buildroot.orig/Config.in    2007-05-29 11:54:55.651131200 -0700
+++ buildroot/Config.in    2007-05-29 19:39:05.976662000 -0700
@@ -373,6 +373,19 @@
      help
        This option hides outdated/obsolete versions of packages.

+config BR2_PREFER_STATIC_LIB
+    bool "prefer static libraries"
+    default n
+    help
+      Where possible, use static libraries.
+      This increases your code size a lot and should only be
+      used with a good reason why not use the default, which
+      is dynamic libraries.
+
+      If unsure, say No.
+
+      WARNING: This is highly experimental at the moment.
+
  endmenu

  source "toolchain/Config.in"
--- buildroot.orig/package/gmp/gmp.mk    2007-05-29 11:56:19.118278600 -0700
+++ buildroot/package/gmp/gmp.mk    2007-05-29 19:34:47.184755900 -0700
@@ -18,6 +18,18 @@
  GMP_BE:=no
  endif

+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+GMP_LIB_FLAGS:=--enable-static --disable-shared
+else
+GMP_LIB_FLAGS:=--disable-static --enable-shared
+endif
+
+ifeq ($(EXEEXT),".exe")
+GMP_CPP_FLAGS:=-DDLL_EXPORT
+else
+GMP_CPP_FLAGS:=-DDLL_EXPORT
+endif
+
  $(DL_DIR)/$(GMP_SOURCE):
       $(WGET) -P $(DL_DIR) $(GMP_SITE)/$(GMP_SOURCE)

@@ -35,6 +47,7 @@
          $(TARGET_CONFIGURE_OPTS) \
          CFLAGS="$(TARGET_CFLAGS)" \
          LDFLAGS="$(TARGET_LDFLAGS)" \
+        CPPFLAGS="$(GMP_CPP_FLAGS)" \
          ac_cv_c_bigendian=$(GMP_BE) \
          $(GMP_DIR)/configure \
          --target=$(GNU_TARGET_NAME) \
@@ -52,7 +65,7 @@
          --includedir=/include \
          --mandir=/usr/man \
          --infodir=/usr/info \
-        --enable-shared \
+        $(GMP_LIB_FLAGS) \
          $(DISABLE_NLS) \
      );
      touch $@
@@ -105,12 +118,12 @@
          CC_FOR_BUILD="$(HOSTCC)" \
          CC="$(HOSTCC)" \
          CFLAGS="$(HOST_CFLAGS)" \
+        CPPFLAGS="$(GMP_CPP_FLAGS)" \
          $(GMP_DIR)/configure \
          --prefix="$(GMP_HOST_DIR)" \
          --build=$(GNU_HOST_NAME) \
          --host=$(GNU_HOST_NAME) \
-        --enable-shared \
-        --enable-static \
+        $(GMP_LIB_FLAGS) \
          $(DISABLE_NLS) \
      );
      touch $@
--- 
buildroot.orig/toolchain_build_arm/uClibc-0.9.29/extra/config/Makefile 
2007-04-17 04:38:21.000000000 -0700
+++ buildroot/toolchain_build_arm/uClibc-0.9.29/extra/config/Makefile 
2007-05-29 19:34:47.200380600 -0700
@@ -21,7 +21,7 @@
      $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) 
$(HOST_LOADLIBES) $< -o $@

  $(host-cmulti): %: $(host-cobjs) $(host-cshlib)
-    $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) 
$(HOST_LOADLIBES) $($@-objs) -o $@
+    $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) 
$(HOST_LOADLIBES) $($@-objs) -lintl -o $@

  $(host-cobjs): %.o: %.c
      $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) -c $< 
-o $@
