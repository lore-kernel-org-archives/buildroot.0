From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 13 Jul 2017 15:00:05 -0500
Subject: [Buildroot] [PATCH v2 1/1] br toolchain: gcc4.x/5.x bugfix
	libsanitizer ppc
Message-ID: <1499976005-36459-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a missing include of signal.h

Verified to break 4.9.4 / 5.4.0 when using
target_platform=powerpc-unknown-linux-gnu with glibc 2.25:

../../../../gcc-host/libsanitizer/asan/asan_linux.cc: In function 'bool __asan::AsanInterceptsSignal(int)':
../../../../gcc-host/libsanitizer/asan/asan_linux.cc:222:20: error: 'SIGSEGV' was not declared in this scope
   return signum == SIGSEGV && common_flags()->handle_segv;

Resolves Bug: https://bugs.busybox.net/show_bug.cgi?id=10061

Upstream: https://patchwork.ozlabs.org/patch/725596/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

Changes v1 -> v2
[Baruch S
 - Added bug url and signed off

[Thomas P
 - Updated comment about applicability to 4.9.x
---
 .../942-asan-fix-missing-include-signal-h.patch    | 47 ++++++++++++++++++++++
 .../942-asan-fix-missing-include-signal-h.patch    | 47 ++++++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 package/gcc/4.9.4/942-asan-fix-missing-include-signal-h.patch
 create mode 100644 package/gcc/5.4.0/942-asan-fix-missing-include-signal-h.patch

diff --git a/package/gcc/4.9.4/942-asan-fix-missing-include-signal-h.patch b/package/gcc/4.9.4/942-asan-fix-missing-include-signal-h.patch
new file mode 100644
index 0000000..398fa7d
--- /dev/null
+++ b/package/gcc/4.9.4/942-asan-fix-missing-include-signal-h.patch
@@ -0,0 +1,47 @@
+From patchwork Wed Feb  8 11:07:16 2017
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: asan: fix missing include of signal.h
+From: Rolf Eike Beer <eb@emlix.com>
+X-Patchwork-Id: 725596
+Message-Id: <6824253.3U2boEivI2@devpool21>
+To: gcc-patches at gcc.gnu.org
+Date: Wed, 08 Feb 2017 12:07:16 +0100
+
+>From 205aa8e97bab553e5e6fe45896325e97962de704 Mon Sep 17 00:00:00 2001
+From: Rolf Eike Beer <eb@emlix.com>
+Date: Wed, 8 Feb 2017 11:42:52 +0100
+Subject: [PATCH] asan: fix missing include of signal.h
+
+This breaks when building gcc 4.9.4 / 5.4.0 with
+target_platform=powerpc-unknown-linux-gnu with glibc 2.25:
+
+../../../../gcc-host/libsanitizer/asan/asan_linux.cc: In function 'bool __asan::AsanInterceptsSignal(int)':
+../../../../gcc-host/libsanitizer/asan/asan_linux.cc:222:20: error: 'SIGSEGV' was not declared in this scope
+   return signum == SIGSEGV && common_flags()->handle_segv;
+
+This has been verified to apply to at least 4.9.4 and up to 5.4,
+the code has been reworked for gcc 6.
+
+Resolves (Buildroot) Bug: https://bugs.busybox.net/show_bug.cgi?id=10061
+
+Upstream: https://patchwork.ozlabs.org/patch/725596/
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ libsanitizer/asan/asan_linux.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsanitizer/asan/asan_linux.cc b/libsanitizer/asan/asan_linux.cc
+index c504168..59087b9 100644
+--- a/libsanitizer/asan/asan_linux.cc
++++ b/libsanitizer/asan/asan_linux.cc
+@@ -29,6 +29,7 @@
+ #include <dlfcn.h>
+ #include <fcntl.h>
+ #include <pthread.h>
++#include <signal.h>
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <unwind.h>
diff --git a/package/gcc/5.4.0/942-asan-fix-missing-include-signal-h.patch b/package/gcc/5.4.0/942-asan-fix-missing-include-signal-h.patch
new file mode 100644
index 0000000..398fa7d
--- /dev/null
+++ b/package/gcc/5.4.0/942-asan-fix-missing-include-signal-h.patch
@@ -0,0 +1,47 @@
+From patchwork Wed Feb  8 11:07:16 2017
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: asan: fix missing include of signal.h
+From: Rolf Eike Beer <eb@emlix.com>
+X-Patchwork-Id: 725596
+Message-Id: <6824253.3U2boEivI2@devpool21>
+To: gcc-patches at gcc.gnu.org
+Date: Wed, 08 Feb 2017 12:07:16 +0100
+
+>From 205aa8e97bab553e5e6fe45896325e97962de704 Mon Sep 17 00:00:00 2001
+From: Rolf Eike Beer <eb@emlix.com>
+Date: Wed, 8 Feb 2017 11:42:52 +0100
+Subject: [PATCH] asan: fix missing include of signal.h
+
+This breaks when building gcc 4.9.4 / 5.4.0 with
+target_platform=powerpc-unknown-linux-gnu with glibc 2.25:
+
+../../../../gcc-host/libsanitizer/asan/asan_linux.cc: In function 'bool __asan::AsanInterceptsSignal(int)':
+../../../../gcc-host/libsanitizer/asan/asan_linux.cc:222:20: error: 'SIGSEGV' was not declared in this scope
+   return signum == SIGSEGV && common_flags()->handle_segv;
+
+This has been verified to apply to at least 4.9.4 and up to 5.4,
+the code has been reworked for gcc 6.
+
+Resolves (Buildroot) Bug: https://bugs.busybox.net/show_bug.cgi?id=10061
+
+Upstream: https://patchwork.ozlabs.org/patch/725596/
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ libsanitizer/asan/asan_linux.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsanitizer/asan/asan_linux.cc b/libsanitizer/asan/asan_linux.cc
+index c504168..59087b9 100644
+--- a/libsanitizer/asan/asan_linux.cc
++++ b/libsanitizer/asan/asan_linux.cc
+@@ -29,6 +29,7 @@
+ #include <dlfcn.h>
+ #include <fcntl.h>
+ #include <pthread.h>
++#include <signal.h>
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <unwind.h>
-- 
1.9.1
