From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 23:04:10 +0100
Subject: [Buildroot] [git commit] package/stress-ng: bump to version 0.09.55
Message-ID: <20190312220122.05E918EC91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9524384192ea42dbfcc3ff84c63b574d91870510
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop three patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-stress-ng.h-fix-include-on-semaphore.h.patch | 34 ----------------------
 .../0002-stress-stackmmap-needs-swapcontext.patch  | 29 ------------------
 ...test-bsd-wchar-Explicitly-include-stdio.h.patch | 29 ------------------
 package/stress-ng/stress-ng.hash                   |  2 +-
 package/stress-ng/stress-ng.mk                     |  2 +-
 5 files changed, 2 insertions(+), 94 deletions(-)

diff --git a/package/stress-ng/0001-stress-ng.h-fix-include-on-semaphore.h.patch b/package/stress-ng/0001-stress-ng.h-fix-include-on-semaphore.h.patch
deleted file mode 100644
index 3d656f3159..0000000000
--- a/package/stress-ng/0001-stress-ng.h-fix-include-on-semaphore.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 818ed67f67c487d519bb55ed5656cff2dd58375e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 4 Dec 2018 21:41:12 +0100
-Subject: [PATCH] stress-ng.h: fix include on semaphore.h
-
-semaphore.h is available only if HAVE_LIB_PTHREAD and
-HAVE_SEM_POSIX are defined
-
-Fixes:
- - http://autobuild.buildroot.org/results/1c95898b2833683a22bbe2ff8471fa08d94210e1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/ColinIanKing/stress-ng/commit/9b861e679f9de32e4c68437453756f93e13c01fb]
----
- stress-ng.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/stress-ng.h b/stress-ng.h
-index 0485dc1c..1bf2e207 100644
---- a/stress-ng.h
-+++ b/stress-ng.h
-@@ -53,7 +53,9 @@
- #include <dirent.h>
- #include <limits.h>
- #include <setjmp.h>
-+#if defined(HAVE_LIB_PTHREAD) && (HAVE_SEM_POSIX)
- #include <semaphore.h>
-+#endif
- #include <sched.h>
- 
- #if defined(__GNUC__) && defined(__linux__)
--- 
-2.14.1
-
diff --git a/package/stress-ng/0002-stress-stackmmap-needs-swapcontext.patch b/package/stress-ng/0002-stress-stackmmap-needs-swapcontext.patch
deleted file mode 100644
index 8c1bf6025b..0000000000
--- a/package/stress-ng/0002-stress-stackmmap-needs-swapcontext.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 748ac7e88833472211ccce82563beb5050528e00 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 4 Dec 2018 21:52:49 +0100
-Subject: [PATCH] stress-stackmmap: needs swapcontext
-
-Fixes:
- - http://autobuild.buildroot.org/results/f2d3b06afa6e31527a71c03671c8f08eb3f46c36
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- stress-stackmmap.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/stress-stackmmap.c b/stress-stackmmap.c
-index c2f4c31d..eb31d084 100644
---- a/stress-stackmmap.c
-+++ b/stress-stackmmap.c
-@@ -24,7 +24,7 @@
-  */
- #include "stress-ng.h"
- 
--#if defined(__linux__)
-+#if defined(HAVE_SWAPCONTEXT)
- 
- #include <ucontext.h>
- 
--- 
-2.14.1
-
diff --git a/package/stress-ng/0003-test-test-bsd-wchar-Explicitly-include-stdio.h.patch b/package/stress-ng/0003-test-test-bsd-wchar-Explicitly-include-stdio.h.patch
deleted file mode 100644
index 931aaff2bd..0000000000
--- a/package/stress-ng/0003-test-test-bsd-wchar-Explicitly-include-stdio.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 291070801245da26e4841c321910b55016ca23c0 Mon Sep 17 00:00:00 2001
-From: Vadim Kochan <vadim4j@gmail.com>
-Date: Tue, 1 Jan 2019 17:24:54 +0200
-Subject: [PATCH] test/test-bsd-wchar: Explicitly include stdio.h
-
-libbsd's wchar requires FILE for some it's functions, for some
-reason it is not included by wchar automatically and the test fails. So
-include it explicitly.
-
-Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
----
- test/test-bsd-wchar.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/test/test-bsd-wchar.c b/test/test-bsd-wchar.c
-index 4f7c7ca..6125968 100644
---- a/test/test-bsd-wchar.c
-+++ b/test/test-bsd-wchar.c
-@@ -22,6 +22,7 @@
-  * functionality.
-  *
-  */
-+#include <stdio.h>
- #include <bsd/wchar.h>
- 
- int main(void)
--- 
-2.14.1
-
diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index c7c6ec0fe8..fd7ab42224 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 ed888f5192297855f3ce39b4591b1decc9c580c9753f2cc9c86449f50d23aeb0 stress-ng-0.09.47.tar.xz
+sha256 3430e007c4d27c5d79ff177a209d81acc7d3242dbf28effb05ecb92b32a8a03f stress-ng-0.09.55.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 42b27e3cd9..767af79f25 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.09.47
+STRESS_NG_VERSION = 0.09.55
 STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
 STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
