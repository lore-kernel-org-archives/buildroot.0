From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 30 May 2007 11:47:34 +0200
Subject: [Buildroot] mpfr error on cygwin for arm
In-Reply-To: <465CEA84.70700@gmail.com>
References: <4656F77D.30303@teamboyce.co.uk> <465737B9.8070008@gmail.com>
	<20070525200333.GT24585@aon.at> <4657D933.8060109@gmail.com>
	<20070526094801.GC15885@aon.at> <465CEA84.70700@gmail.com>
Message-ID: <20070530094734.GD20055@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 29, 2007 at 08:07:48PM -0700, Tom wrote:
>Hi Bernhard, All
>
>Enclosed is cygwin-1.patch for buildroot-20050524.tar.bz2.

Thanks for doing this!

>- requires cygwin 1.5.24 with development package
>
>- configure buildroot for arm, arm-generic, eabi, "pc-cygwin", 
>uclibc-0.9.29, buildroot toolchain with gcc 4.1.2
>
>- FIRST do one build attempt (will fail, just to get and extract uclibc)
>
>- apply cygwin-1.patch with p1 (it is at very bottom of this email)
>
>- THEN do another build attempt, which will build
>  gmp, mpfr, newlib and arm-linux-uclibcgnueabi-gcc-4.1.2.exe
>  before failing (*).
>
>Thanks
>Tom
>
>PS: if someone could take care of the apple part, that would be great. 
>Also, the one fix belongs to uclibc and not to buildroot...
>
>
>(*) it fails when cross compiling uclibc, maybe my UCLIBC options? Hints 
>appreciated, need this to test on target.
>
>make MAKE="make -j1" -C /tw/buildroot/toolchain_build_arm/uClibc-0.9.29
>\
>                PREFIX= \
>                DEVEL_PREFIX=/ \
>                RUNTIME_PREFIX=/ \
>                HOSTCC="gcc" \
>                all
>arm-linux-uclibcgnueabi-gcc: n: No such file or directory
>make[1]: Entering directory
>`/tw/buildroot/toolchain_build_arm/uClibc-0.9.29'
>arm-linux-uclibcgnueabi-gcc: n: No such file or directory
>make[2]: `conf' is up to date.
>arm-linux-uclibcgnueabi-gcc: n: No such file or directory
>  CC ldso/ldso/ldso.oS
>arm-linux-uclibcgnueabi-gcc: n: No such file or directory
>make[1]: *** [ldso/ldso/ldso.oS] Error 1
>make[1]: Leaving directory
>`/tw/buildroot/toolchain_build_arm/uClibc-0.9.29'
>make: *** [/tw/buildroot/toolchain_build_arm/uClibc-0.9.29/lib/libc.a]
>Error 2

[snip]
>cygwin-1.patch:
>
>--- buildroot.orig/Makefile	2007-05-29 11:55:38.025317600 -0700
>+++ buildroot/Makefile	2007-05-29 19:54:26.130869700 -0700
[snip]
> source "toolchain/Config.in"
>--- buildroot.orig/package/gmp/gmp.mk	2007-05-29 11:56:19.118278600 -0700
>+++ buildroot/package/gmp/gmp.mk	2007-05-29 19:34:47.184755900 -0700
>@@ -18,6 +18,18 @@
> GMP_BE:=no
> endif
>
>+ifeq ($(BR2_PREFER_STATIC_LIB),y)
>+GMP_LIB_FLAGS:=--enable-static --disable-shared
>+else
>+GMP_LIB_FLAGS:=--disable-static --enable-shared
>+endif

Better put this into the toolchain/Makefile.in, like:
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+BR2_SHARED_LIBS:=--enable-static --disable-shared
+else
+BR2_SHARED_LIBS:=--disable-static --enable-shared
+endif
and use ./configure $(BR2_SHARED_LIBS) ...

>+
>+ifeq ($(EXEEXT),".exe")
>+GMP_CPP_FLAGS:=-DDLL_EXPORT
>+else
>+GMP_CPP_FLAGS:=-DDLL_EXPORT
>+endif

This can't be right.
[snip]

>buildroot.orig/toolchain_build_arm/uClibc-0.9.29/extra/config/Makefile 
>2007-04-17 04:38:21.000000000 -0700
>+++ buildroot/toolchain_build_arm/uClibc-0.9.29/extra/config/Makefile 
>2007-05-29 19:34:47.200380600 -0700
>@@ -21,7 +21,7 @@
> 	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) 
>$(HOST_LOADLIBES) $< -o $@
>
> $(host-cmulti): %: $(host-cobjs) $(host-cshlib)
>-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) 
>$(HOST_LOADLIBES) $($@-objs) -o $@
>+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) 
>$(HOST_LOADLIBES) $($@-objs) -lintl -o $@

Shouldn't this libintel rather go into HOST_LOADLIBES for windows?
