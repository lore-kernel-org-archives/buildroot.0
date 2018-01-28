From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jan 2018 16:20:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/uclibc: Fix ffmpeg build on aarch64
Message-ID: <20180128152024.6994-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-sys-ucontext.h-include-bits-sigcontext.h.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/uclibc/0001-aarch64-sys-ucontext.h-include-bits-sigcontext.h.patch

diff --git a/package/uclibc/0001-aarch64-sys-ucontext.h-include-bits-sigcontext.h.patch b/package/uclibc/0001-aarch64-sys-ucontext.h-include-bits-sigcontext.h.patch
new file mode 100644
index 0000000000..0a1fdf6cb8
--- /dev/null
+++ b/package/uclibc/0001-aarch64-sys-ucontext.h-include-bits-sigcontext.h.patch
@@ -0,0 +1,49 @@
+From 1c27982bb8a007bb1a6a29db8e6efb1f40975879 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 28 Jan 2018 13:59:30 +0100
+Subject: [PATCH 1/1] aarch64/sys/ucontext.h: include bits/sigcontext.h
+
+Fixes a buildroot build error with ffmpeg
+
+In file included from /home/bernd/buildroot/output/host/aarch64-buildroot-linux-uclibc/sysroot/usr/include/signal.h:329:0,
+                 from fftools/ffmpeg.h:26,
+                 from fftools/ffmpeg_opt.c:23:
+/home/bernd/buildroot/output/host/aarch64-buildroot-linux-uclibc/sysroot/usr/include/sys/ucontext.h:52:16:
+ error: field 'uc_mcontext' has incomplete type
+     mcontext_t uc_mcontext;
+                ^~~~~~~~~~~
+
+using this defconfig:
+
+BR2_aarch64=y
+BR2_PACKAGE_FFMPEG=y
+
+sys/ucontext.h for other archs already include bits/sigcontext.h,
+on aarch64 this is needed as well.
+
+Patch sent upstream:
+https://mailman.uclibc-ng.org/pipermail/devel/2018-January/001622.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ libc/sysdeps/linux/aarch64/sys/ucontext.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libc/sysdeps/linux/aarch64/sys/ucontext.h b/libc/sysdeps/linux/aarch64/sys/ucontext.h
+index d17458896..dc7303b54 100644
+--- a/libc/sysdeps/linux/aarch64/sys/ucontext.h
++++ b/libc/sysdeps/linux/aarch64/sys/ucontext.h
+@@ -26,6 +26,10 @@
+ 
+ #include <sys/procfs.h>
+ 
++/* We need the signal context definitions even if they are not used
++   included in <signal.h>.  */
++#include <bits/sigcontext.h>
++
+ typedef elf_greg_t greg_t;
+ 
+ /* Container for all general registers.  */
+-- 
+2.11.0
+
-- 
2.11.0
