From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Feb 2017 19:40:29 +0200
Subject: [Buildroot] [PATCH next] putty: bump to version 0.68
Message-ID: <dd7aaa6481a0e373e72c5c03ac5c73d6916da1ce.1488303629.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patches.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/putty/0001-uxcons-Fix-on-musl-libc.patch   | 29 ---------------------
 ...02-Fix-__uint128_t-compile-error-on-MinGW.patch | 30 ----------------------
 package/putty/putty.hash                           |  4 +--
 package/putty/putty.mk                             |  2 +-
 4 files changed, 3 insertions(+), 62 deletions(-)
 delete mode 100644 package/putty/0001-uxcons-Fix-on-musl-libc.patch
 delete mode 100644 package/putty/0002-Fix-__uint128_t-compile-error-on-MinGW.patch

diff --git a/package/putty/0001-uxcons-Fix-on-musl-libc.patch b/package/putty/0001-uxcons-Fix-on-musl-libc.patch
deleted file mode 100644
index 5f43af0d0555..000000000000
--- a/package/putty/0001-uxcons-Fix-on-musl-libc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4ae1577b432c1859704d2763f70a764dee23bd98 Mon Sep 17 00:00:00 2001
-From: Kylie McClain <somasis@exherbo.org>
-Date: Thu, 28 Apr 2016 22:40:32 -0400
-Subject: [PATCH] uxcons: Fix on musl libc
-
-musl libc exports FD_SET and friends in sys/select.h.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit 4ae1577b432c
-
- unix/uxcons.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/unix/uxcons.c b/unix/uxcons.c
-index b9fd67fe9274..f2a25f3fed70 100644
---- a/unix/uxcons.c
-+++ b/unix/uxcons.c
-@@ -12,6 +12,7 @@
- #include <termios.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#include <sys/select.h>
- 
- #include "putty.h"
- #include "storage.h"
--- 
-2.8.1
-
diff --git a/package/putty/0002-Fix-__uint128_t-compile-error-on-MinGW.patch b/package/putty/0002-Fix-__uint128_t-compile-error-on-MinGW.patch
deleted file mode 100644
index 514b6298d93c..000000000000
--- a/package/putty/0002-Fix-__uint128_t-compile-error-on-MinGW.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 3377ea57f5d333d65d44a1130161396782389e88 Mon Sep 17 00:00:00 2001
-From: Tim Kosse <tim.kosse@filezilla-project.org>
-Date: Tue, 11 Aug 2015 09:43:34 +0200
-Subject: [PATCH] Fix  __uint128_t compile error on MinGW.
-
-MinGW has __uint128_t, but not __uint64_t.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit 3377ea57f5
-
- sshbn.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sshbn.h b/sshbn.h
-index a043241eea67..9366f614ae4c 100644
---- a/sshbn.h
-+++ b/sshbn.h
-@@ -26,7 +26,7 @@
-  * using the same 'two machine registers' kind of code generation that
-  * 32-bit targets use for 64-bit ints. If we have one of these, we can
-  * use a 64-bit BignumInt and a 128-bit BignumDblInt. */
--typedef __uint64_t BignumInt;
-+typedef unsigned long long BignumInt;
- typedef __uint128_t BignumDblInt;
- #define BIGNUM_INT_MASK  0xFFFFFFFFFFFFFFFFULL
- #define BIGNUM_TOP_BIT   0x8000000000000000ULL
--- 
-2.8.1
-
diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 75990e417664..5aea4f308cd9 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,3 +1,3 @@
 # Hashes from: http://the.earth.li/~sgtatham/putty/0.67/{sha256,sha512}sums
-sha256 80192458e8a46229de512afeca5c757dd8fce09606b3c992fbaeeee29b994a47                                                                 putty-0.67.tar.gz
-sha512 c2b17da46b8db3fe3837a10cb9cf5dd4b3ef6bfa15cadab83f3b87cf1479ed31fced90b774297ae53bdcbbdf230fc80d5c73d5ff3be6916fb591fd7ce3d35eca putty-0.67.tar.gz
+sha256 7ba256f46e5a353cafe811ce7914d0e22a52bdfc0e6e2d183ad28b5af44cd09c                                                                 putty-0.68.tar.gz
+sha512 e3a6e4f45e1fce70d4cbb6d4769ab72b23c10920e48a88bba95b3f4c225b0193ddc1444e69d572bdec5e505d2c56fed365f07d990c156b35f272b56f978ef5d3 putty-0.68.tar.gz
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 5155714c326a..a2a731e3ab6c 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.67
+PUTTY_VERSION = 0.68
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_SUBDIR = unix
 PUTTY_LICENSE = MIT
-- 
2.11.0
