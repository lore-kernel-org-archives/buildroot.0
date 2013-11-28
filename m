From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 19:25:08 +0100
Subject: [Buildroot] ucilbc 0.9.33.2 fails to build on buildroot 2013.11
 internal toolchain
In-Reply-To: <5297837C.3@mail.ru>
References: <5297837C.3@mail.ru>
Message-ID: <20131128192508.4c4c0106@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Varnin,

On Thu, 28 Nov 2013 21:55:08 +0400, Alexander Varnin wrote:

> Building uclibc with default config now fails for me, after upgrading
> to latest buildroot (now from 2013.11-rc3 branch).Attaching my config.
> Build system is Debian Wheezy.
> 
> Here is short output of make command:
> 
> varnin at debian5 ~/minipos-OS-build-2013.11> make
> make -C /home/varnin/buildroot
> O=/home/varnin/minipos-OS-build-2013.11/.
> >>> uclibc 0.9.33.2 Building
> /usr/bin/make -j1 -C
> /home/varnin/minipos-OS-build-2013.11/build/uclibc-0.9.33.2 ARCH="arm"
> CROSS_COMPILE="/home/varnin/minipos-OS-build-2013.11/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-"
> UCLIBC_EXTRA_CFLAGS=" " HOSTCC="/usr/bin/gcc" PREFIX= DEVEL_PREFIX=/
> RUNTIME_PREFIX=/ all
> make[3]: Nothing to be done for `locale_headers'.
>   LD libuClibc-0.9.33.2.so
> libc/libc_so.a(lockf.os): In function `__GI_lockf':
> /home/varnin/minipos-OS-build-2013.11/build/uclibc-0.9.33.2/libc/misc/file/lockf.c:73:
> undefined reference to `_Unwind_Resume'
> libc/libc_so.a(lockf.os):(.ARM.extab+0x0): undefined reference to
> `__gcc_personality_v0'
> collect2: error: ld returned 1 exit status
> make[2]: *** [lib/libc.so] ?????? 1
> make[1]: ***
> [/home/varnin/minipos-OS-build-2013.11/build/uclibc-0.9.33.2/.stamp_built]
> ?????? 2
> make: *** [_all] ?????? 2

My guess is that you have BR2_ENABLE_DEBUG=y in your Buildroot .config,
right?

If that's the case, then you've hit the problem that uClibc doesn't
build properly when debugging support is enabled. That's unfortunately
an upstream uClibc problem, I believe.

Either disable BR2_ENABLE_DEBUG in Buildroot (which will disable
debugging support for all packages), or if you want to keep debugging
support enabled globally but don't care about debugging support in
uClibc, apply a change like:

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 20d3bb6..062ac0d 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -390,14 +390,6 @@ UCLIBC_WCHAR_CONFIG = $(call UCLIBC_OPT_UNSET,UCLIBC_HAS_WCHAR,$(@D))
 endif
 
 #
-# debug
-#
-
-ifeq ($(BR2_ENABLE_DEBUG),y)
-UCLIBC_DEBUG_CONFIG = $(call UCLIBC_OPT_SET,DODEBUG,y,$(@D))
-endif
-
-#
 # strip
 #

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
