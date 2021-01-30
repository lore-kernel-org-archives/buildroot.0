From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 13:38:58 +0100
Subject: [Buildroot] [git commit] board/qemu/sh4*: Remove linux-headers patch
Message-ID: <20210130122102.70B7782929@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbbcacff7db7e8ba17bc70b48d0c4f0ebfdf7c8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previous patch about time data structures [1] provided a dirty fix
that did not solve the real issue.

After discussing with Linux folks on the SuperH mailing list [2],
the patch was deemed unnecessary, as the problem lied in uclibc.

[1] https://git.buildroot.net/buildroot/commit/?id=742f37de8d0e3797698411dfc6a63bd7e98aafe2
[2] https://patchwork.kernel.org/project/linux-sh/patch/20210123165652.10884-1-geoffrey.legourrierec at gmail.com/

Signed-off-by: Geoffrey Le Gourri??rec <geoffrey.legourrierec@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...types.h-and-not-time_types.h-in-sockios.h.patch | 76 ----------------------
 ...types.h-and-not-time_types.h-in-sockios.h.patch | 76 ----------------------
 configs/qemu_sh4_r2d_defconfig                     |  1 -
 configs/qemu_sh4eb_r2d_defconfig                   |  1 -
 4 files changed, 154 deletions(-)

diff --git a/board/qemu/sh4-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch b/board/qemu/sh4-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch
deleted file mode 100644
index 90bd4e8c6c..0000000000
--- a/board/qemu/sh4-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 34c78b21878ae7b0471299d11a7e861125e31b2c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Geoffrey=20Le=20Gourri=C3=A9rec?=
- <geoffrey.legourrierec@gmail.com>
-Date: Mon, 18 Jan 2021 23:40:28 +0100
-Subject: [PATCH] Use types.h and not time_types.h in sockios.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This fixes builds for sh arch when libc is not using relevant
-time data structures definitions for 32-bit machines. A previous
-commit [1] provided a fix, that we seemed to slip through here.
-
-As of the time of this writing, the bug was found with non-
-up to date uclibc 1.0.37 only (currently the only libc supporting
-sh architecture).
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fc94cf2092c7c1267fa2deb8388d624f50eba808
-
-Signed-off-by: Geoffrey Le Gourri??rec <geoffrey.legourrierec@gmail.com>
-Cc: Arnd Bergmann <arnd@arndb.de>
-
----
-
-For the record, here's the build-time error:
-
-/usr/bin/make -j2 -C /builds/clumsyape/buildroot/output/build/uclibc-1.0.37 ARCH="sh" CROSS_COMPILE="/builds/clumsyape/buildroot/output/host/bin/sh4-buildroot-linux-uclibc-" UCLIBC_EXTRA_CFLAGS="" HOSTCC="/usr/bin/gcc"
-make[1]: Entering directory '/builds/clumsyape/buildroot/output/build/uclibc-1.0.37'
-  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelcond.h
-  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelcond.h
-  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
-  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
-In file included from /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm/sockios.h:5,
-                 from /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm-generic/socket.h:6,
-                 from /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm/socket.h:1,
-                 from ./include/bits/socket.h:360,
-                 from ./include/sys/socket.h:39,
-                 from ./include/netinet/in.h:24,
-                 from ./include/resolv.h:57,
-                 from ./libpthread/nptl/descr.h:36,
-                 from ./libpthread/nptl/pthreadP.h:25,
-                 from <stdin>:2:
-/builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/linux/time_types.h:8:2: error: unknown type name '__kernel_time64_t'
-    8 |  __kernel_time64_t       tv_sec;                 /* seconds */
-      |  ^~~~~~~~~~~~~~~~~
-/builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/linux/time_types.h:32:2: error: unknown type name '__kernel_old_time_t'
-   32 |  __kernel_old_time_t tv_sec;  /* seconds */
-      |  ^~~~~~~~~~~~~~~~~~~
-libpthread/nptl/sysdeps/unix/sysv/linux/Makefile.commonarch:135: recipe for target 'libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h' failed
-make[1]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h] Error 1
-make[1]: Leaving directory '/builds/clumsyape/buildroot/output/build/uclibc-1.0.37'
-
-I did a quick header dependency analysis starting from __kernel_time64_t
-(one of the offending types), but could "follow up" to linux/time_types.h
-as expected; so I fail to understand how this could break. What's even
-more confusing is linux/time_types.h includes linux/types.h itself.
----
- arch/sh/include/uapi/asm/sockios.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/sh/include/uapi/asm/sockios.h b/arch/sh/include/uapi/asm/sockios.h
-index ef01ced9e169..d97d14685305 100644
---- a/arch/sh/include/uapi/asm/sockios.h
-+++ b/arch/sh/include/uapi/asm/sockios.h
-@@ -2,7 +2,7 @@
- #ifndef __ASM_SH_SOCKIOS_H
- #define __ASM_SH_SOCKIOS_H
- 
--#include <linux/time_types.h>
-+#include <linux/types.h>
- 
- /* Socket-level I/O control calls. */
- #define FIOGETOWN	_IOR('f', 123, int)
--- 
-2.17.1
-
diff --git a/board/qemu/sh4eb-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch b/board/qemu/sh4eb-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch
deleted file mode 100644
index 90bd4e8c6c..0000000000
--- a/board/qemu/sh4eb-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 34c78b21878ae7b0471299d11a7e861125e31b2c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Geoffrey=20Le=20Gourri=C3=A9rec?=
- <geoffrey.legourrierec@gmail.com>
-Date: Mon, 18 Jan 2021 23:40:28 +0100
-Subject: [PATCH] Use types.h and not time_types.h in sockios.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This fixes builds for sh arch when libc is not using relevant
-time data structures definitions for 32-bit machines. A previous
-commit [1] provided a fix, that we seemed to slip through here.
-
-As of the time of this writing, the bug was found with non-
-up to date uclibc 1.0.37 only (currently the only libc supporting
-sh architecture).
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fc94cf2092c7c1267fa2deb8388d624f50eba808
-
-Signed-off-by: Geoffrey Le Gourri??rec <geoffrey.legourrierec@gmail.com>
-Cc: Arnd Bergmann <arnd@arndb.de>
-
----
-
-For the record, here's the build-time error:
-
-/usr/bin/make -j2 -C /builds/clumsyape/buildroot/output/build/uclibc-1.0.37 ARCH="sh" CROSS_COMPILE="/builds/clumsyape/buildroot/output/host/bin/sh4-buildroot-linux-uclibc-" UCLIBC_EXTRA_CFLAGS="" HOSTCC="/usr/bin/gcc"
-make[1]: Entering directory '/builds/clumsyape/buildroot/output/build/uclibc-1.0.37'
-  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelcond.h
-  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelcond.h
-  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
-  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
-In file included from /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm/sockios.h:5,
-                 from /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm-generic/socket.h:6,
-                 from /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm/socket.h:1,
-                 from ./include/bits/socket.h:360,
-                 from ./include/sys/socket.h:39,
-                 from ./include/netinet/in.h:24,
-                 from ./include/resolv.h:57,
-                 from ./libpthread/nptl/descr.h:36,
-                 from ./libpthread/nptl/pthreadP.h:25,
-                 from <stdin>:2:
-/builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/linux/time_types.h:8:2: error: unknown type name '__kernel_time64_t'
-    8 |  __kernel_time64_t       tv_sec;                 /* seconds */
-      |  ^~~~~~~~~~~~~~~~~
-/builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/linux/time_types.h:32:2: error: unknown type name '__kernel_old_time_t'
-   32 |  __kernel_old_time_t tv_sec;  /* seconds */
-      |  ^~~~~~~~~~~~~~~~~~~
-libpthread/nptl/sysdeps/unix/sysv/linux/Makefile.commonarch:135: recipe for target 'libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h' failed
-make[1]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h] Error 1
-make[1]: Leaving directory '/builds/clumsyape/buildroot/output/build/uclibc-1.0.37'
-
-I did a quick header dependency analysis starting from __kernel_time64_t
-(one of the offending types), but could "follow up" to linux/time_types.h
-as expected; so I fail to understand how this could break. What's even
-more confusing is linux/time_types.h includes linux/types.h itself.
----
- arch/sh/include/uapi/asm/sockios.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/sh/include/uapi/asm/sockios.h b/arch/sh/include/uapi/asm/sockios.h
-index ef01ced9e169..d97d14685305 100644
---- a/arch/sh/include/uapi/asm/sockios.h
-+++ b/arch/sh/include/uapi/asm/sockios.h
-@@ -2,7 +2,7 @@
- #ifndef __ASM_SH_SOCKIOS_H
- #define __ASM_SH_SOCKIOS_H
- 
--#include <linux/time_types.h>
-+#include <linux/types.h>
- 
- /* Socket-level I/O control calls. */
- #define FIOGETOWN	_IOR('f', 123, int)
--- 
-2.17.1
-
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 395e0fc849..a14277dd05 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -3,7 +3,6 @@ BR2_sh=y
 BR2_sh4=y
 
 # System
-BR2_GLOBAL_PATCH_DIR="board/qemu/sh4-r2d/patches"
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 7f8e879b5d..4911ba0353 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -3,7 +3,6 @@ BR2_sh=y
 BR2_sh4eb=y
 
 # System
-BR2_GLOBAL_PATCH_DIR="board/qemu/sh4eb-r2d/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 
 # Filesystem
