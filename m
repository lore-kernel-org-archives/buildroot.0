From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Oct 2016 16:41:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/libbluray: include signal.h to fix
	build errors
Message-ID: <20161023144115.19982-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build errors with uClibc-ng on the following platforms:

bfin: http://autobuild.buildroot.net/results/fbf/fbf63bbe0974b490b875a95fb930ba601364b85a/
m68k: http://autobuild.buildroot.net/results/cc9/cc9b87c4c695f97a056cc53f19e7662750dffeff/
microblazeel: http://autobuild.buildroot.net/results/941/941c06e29f6542e258f20799dc6f3f94b2f8af88/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
I am unsure whether this is the right fix or not, therefore I did not
send the patch upstream yet. A different solution is to include signal.h
in sysroot/usr/include/pthread.h in line 686, right before the header
file bits/sigthread.h is included. This may point to a problem either in
the prebuilt toolchain or uClibc itself, CC'ing Thomas & Waldemar.

 ...tex.c-include-signal.h-to-fix-build-error.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libbluray/0001-src-util-mutex.c-include-signal.h-to-fix-build-error.patch

diff --git a/package/libbluray/0001-src-util-mutex.c-include-signal.h-to-fix-build-error.patch b/package/libbluray/0001-src-util-mutex.c-include-signal.h-to-fix-build-error.patch
new file mode 100644
index 0000000..3170cff
--- /dev/null
+++ b/package/libbluray/0001-src-util-mutex.c-include-signal.h-to-fix-build-error.patch
@@ -0,0 +1,39 @@
+From e84951a340565012d78f0d7c607bb01cc4571ebe Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 22 Oct 2016 18:45:20 +0200
+Subject: [PATCH 1/1] src/util/mutex.c: include signal.h to fix build errors
+
+Fixes build errors with uClibc-ng on the following platforms:
+
+bfin: http://autobuild.buildroot.net/results/fbf/fbf63bbe0974b490b875a95fb930ba601364b85a/
+m68k: http://autobuild.buildroot.net/results/cc9/cc9b87c4c695f97a056cc53f19e7662750dffeff/
+microblazeel: http://autobuild.buildroot.net/results/941/941c06e29f6542e258f20799dc6f3f94b2f8af88/
+
+Quoting the compile error:
+
+In file included from /home/buildroot/br4/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/include/pthread.h:686:0,
+                 from src/util/mutex.c:32:
+/home/buildroot/br4/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/include/bits/sigthread.h:31:14: error: unknown type name ?__sigset_t?
+        const __sigset_t *__restrict __newmask,
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+
+ src/util/mutex.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/util/mutex.c b/src/util/mutex.c
+index c32bb5f..e854435 100644
+--- a/src/util/mutex.c
++++ b/src/util/mutex.c
+@@ -29,6 +29,7 @@
+ #if defined(_WIN32)
+ #   include <windows.h>
+ #elif defined(HAVE_PTHREAD_H)
++#   include <signal.h>
+ #   include <pthread.h>
+ #else
+ #   error no mutex support found
+-- 
+2.9.3
+
-- 
2.9.3
