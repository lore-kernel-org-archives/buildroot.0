From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] libaio: add patch to support
	AVR32
Message-ID: <20101214003644.00D6882927@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1e17f73d279e71d6669649d2a16835b3d45fed48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                           |    2 +-
 package/libaio/libaio-0.3.109-avr32-support.patch |  122 +++++++++++++++++++++
 2 files changed, 123 insertions(+), 1 deletions(-)
 create mode 100644 package/libaio/libaio-0.3.109-avr32-support.patch

diff --git a/CHANGES b/CHANGES
index 98af6f5..e99e491 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 
 	Updated/fixed packages: alsa-utils, at, busybox, bzip2, dbus,
 	direcfb-examples, dmalloc, cloop, cups, ffmpeg, gdk-pixbuf,
-	hostapd, i2c-tools, input-tools, libconfig, lsof,
+	hostapd, i2c-tools, input-tools, libaio, libconfig, lsof,
 	ltp-testsuite, lvm2, m4, memtester, mii-diag, mrouted,
 	netplug, openssh, openssl, openvpn, pango, qt, rsync, sdl_gfx,
 	sdl_sound, sysklogd, sysvinit, udev, usbutils, xz, zlib
diff --git a/package/libaio/libaio-0.3.109-avr32-support.patch b/package/libaio/libaio-0.3.109-avr32-support.patch
new file mode 100644
index 0000000..57bb1f3
--- /dev/null
+++ b/package/libaio/libaio-0.3.109-avr32-support.patch
@@ -0,0 +1,122 @@
+Add AVR32 support to libaio
+
+Taken from OpenWRT repository.
+
+--- a/src/libaio.h
++++ b/src/libaio.h
+@@ -107,6 +107,10 @@ typedef enum io_iocb_cmd {
+ #  else
+ #    error "neither mipseb nor mipsel?"
+ #  endif
++#elif defined(__avr32__) /* big endian, 32 bits */
++#define PADDED(x, y)	unsigned y; x
++#define PADDEDptr(x, y)	unsigned y; x
++#define PADDEDul(x, y)	unsigned y; unsigned long x;
+ #else
+ #error	endian?
+ #endif
+--- /dev/null
++++ b/src/syscall-avr32.h
+@@ -0,0 +1,91 @@
++/*
++ * Copyright (C) 2007 Atmel Corporation
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#define __NR_io_setup		197
++#define __NR_io_destroy		198
++#define __NR_io_getevents	199
++#define __NR_io_submit		200
++#define __NR_io_cancel		201
++
++#define io_syscall1(type,fname,sname,type1,arg1)			\
++type fname(type1 arg1)							\
++{									\
++	register long __r12 __asm__("r12") = (long)arg1;		\
++	register long __res_r12 __asm__("r12");				\
++	register long __scno __asm__("r8") = __NR_##sname;		\
++	__asm__ __volatile__("scall"					\
++			     : "=r"(__res_r12)				\
++			     : "0"(__r12), "r"(__scno)			\
++			     : "memory");				\
++	return (type) __res_r12;					\
++}
++
++#define io_syscall2(type,fname,sname,type1,arg1,type2,arg2)		\
++type fname(type1 arg1, type2 arg2)					\
++{									\
++	register long __r12 __asm__("r12") = (long)arg1;		\
++	register long __r11 __asm__("r11") = (long)arg2;		\
++	register long __res_r12 __asm__("r12");				\
++	register long __scno __asm__("r8") = __NR_##sname;		\
++	__asm__ __volatile__("scall"					\
++			     : "=r"(__res_r12)				\
++			     : "0"(__r12), "r"(__r11), "r"(__scno)	\
++			     : "memory");				\
++	return (type) __res_r12;					\
++}
++
++#define io_syscall3(type,fname,sname,type1,arg1,type2,arg2,type3,arg3)	\
++type fname(type1 arg1, type2 arg2, type3 arg3)				\
++{									\
++	register long __r12 __asm__("r12") = (long)arg1;		\
++	register long __r11 __asm__("r11") = (long)arg2;		\
++	register long __r10 __asm__("r10") = (long)arg3;		\
++	register long __res_r12 __asm__("r12");				\
++	register long __scno __asm__("r8") = __NR_##sname;		\
++	__asm__ __volatile__("scall"					\
++			     : "=r"(__res_r12)				\
++			     : "0"(__r12), "r"(__r11), "r"(__r10),	\
++			       "r"(__scno)				\
++			     : "memory");				\
++	return (type) __res_r12;					\
++}
++
++#define io_syscall4(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4) \
++type fname(type1 arg1, type2 arg2, type3 arg3, type4 arg4)		\
++{									\
++	register long __r12 __asm__("r12") = (long)arg1;		\
++	register long __r11 __asm__("r11") = (long)arg2;		\
++	register long __r10 __asm__("r10") = (long)arg3;		\
++	register long __r9 __asm__("r9") = (long)arg4;			\
++	register long __res_r12 __asm__("r12");				\
++	register long __scno __asm__("r8") = __NR_##sname;		\
++	__asm__ __volatile__("scall"					\
++			     : "=r"(__res_r12)				\
++			     : "0"(__r12), "r"(__r11), "r"(__r10),	\
++			       "r"(__r9), "r"(__scno)			\
++			     : "memory");				\
++	return (type) __res_r12;					\
++}
++
++#define io_syscall5(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4,type5,arg5) \
++type fname(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5)	\
++{									\
++	register long __r12 __asm__("r12") = (long)arg1;		\
++	register long __r11 __asm__("r11") = (long)arg2;		\
++	register long __r10 __asm__("r10") = (long)arg3;		\
++	register long __r9 __asm__("r9") = (long)arg4;			\
++	register long __r5 __asm__("r5") = (long)arg5;			\
++	register long __res_r12 __asm__("r12");				\
++	register long __scno __asm__("r8") = __NR_##sname;		\
++	__asm__ __volatile__("scall"					\
++			     : "=r"(__res_r12)				\
++			     : "0"(__r12), "r"(__r11), "r"(__r10),	\
++			       "r"(__r9), "r"(__r5), "r"(__scno)	\
++			     : "memory");				\
++	return (type) __res_r12;					\
++}
+--- a/src/syscall.h
++++ b/src/syscall.h
+@@ -32,6 +32,8 @@
+ #include "syscall-parisc.h"
+ #elif defined(__mips__)
+ #include "syscall-mips.h"
++#elif defined(__avr32__)
++#include "syscall-avr32.h"
+ #else
+ #error "add syscall-arch.h"
+ #endif
-- 
1.7.2.2
