From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 19:43:28 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] gcc: fix build of
	libsanitizer in gcc 4.9 and 5.x on PowerPC
Message-ID: <20170719204800.A33077FCBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e61dee1a6a1bd36e73ccb2b149db8d4181fb3139
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

libsanitizer in gcc fails to build on PowerPC with gcc versions 4.9
and 5.x used in conjunction with glibc 2.25, with the following error:

../../../../gcc-host/libsanitizer/asan/asan_linux.cc: In function 'bool __asan::AsanInterceptsSignal(int)':
../../../../gcc-host/libsanitizer/asan/asan_linux.cc:222:20: error: 'SIGSEGV' was not declared in this scope
   return signum == SIGSEGV && common_flags()->handle_segv;

This commit adds a patch that has been submitted to upstream gcc
(https://patchwork.ozlabs.org/patch/725596/) but not merged. The patch
is no longer needed with gcc 6.x and later because the code has been
reworked.

Fixes Buildroot bug #10061

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Thomas: rework commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(cherry picked from commit 5c90f6a7b68ebdc43ea72b763ec98a0a300c57a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../942-asan-fix-missing-include-signal-h.patch    | 36 ++++++++++++++++++++++
 .../942-asan-fix-missing-include-signal-h.patch    | 36 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/package/gcc/4.9.4/942-asan-fix-missing-include-signal-h.patch b/package/gcc/4.9.4/942-asan-fix-missing-include-signal-h.patch
new file mode 100644
index 0000000..5f00c04
--- /dev/null
+++ b/package/gcc/4.9.4/942-asan-fix-missing-include-signal-h.patch
@@ -0,0 +1,36 @@
+From 205aa8e97bab553e5e6fe45896325e97962de704 Mon Sep 17 00:00:00 2001
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
index 0000000..5f00c04
--- /dev/null
+++ b/package/gcc/5.4.0/942-asan-fix-missing-include-signal-h.patch
@@ -0,0 +1,36 @@
+From 205aa8e97bab553e5e6fe45896325e97962de704 Mon Sep 17 00:00:00 2001
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
