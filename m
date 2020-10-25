From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 15:58:49 +0100
Subject: [Buildroot] [git commit] package/weston: add patch fixing missing
 fnctl include
Message-ID: <20201025144707.4FBC884094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8f806a2ef59f80aee2116e7eb67344f9db40ff9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed to fix a build issue with musl libc.

Fixes:
http://autobuild.buildroot.net/results/931/931dc2bfd431dffc4693b62e0889e43709331d8e/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...de-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch b/package/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
new file mode 100644
index 0000000000..2eb6bd838c
--- /dev/null
+++ b/package/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
@@ -0,0 +1,48 @@
+From b10c0e843dcb8148bbe869bb15261955b94ac98c Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 8 Sep 2020 19:37:42 -0400
+Subject: [PATCH] tests: include fcntl.h for open(), O_RDWR, O_CLOEXEC and
+ O_CREAT
+
+musl libc (unlike glibc) requires explicitly incuding fcntl.h to define open(),
+O_RDWR, O_CLOEXEC and O_CREAT. Otherwise the build fails with the errors:
+
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c: In function 'wait_for_lock':
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:7: warning: implicit declaration of function 'open'; did you mean 'popen'? [-Wimplicit-function-declaration]
+|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
+|       |       ^~~~
+|       |       popen
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: error: 'O_RDWR' undeclared (first use in this function)
+|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
+|       |                       ^~~~~~
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: note: each undeclared identifier is reported only once for each function it appears in
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:32: error: 'O_CLOEXEC' undeclared (first use in this function)
+|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
+|       |                                ^~~~~~~~~
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:44: error: 'O_CREAT' undeclared (first use in this function)
+|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
+|       |                                            ^~~~~~~
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1 at gmail.com: backport from upstream commit
+b10c0e843dcb8148bbe869bb15261955b94ac98c]
+---
+ tests/weston-test-fixture-compositor.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/weston-test-fixture-compositor.c b/tests/weston-test-fixture-compositor.c
+index 1c32959c..c1eb26c4 100644
+--- a/tests/weston-test-fixture-compositor.c
++++ b/tests/weston-test-fixture-compositor.c
+@@ -35,6 +35,7 @@
+ #include <stdarg.h>
+ #include <stdlib.h>
+ #include <errno.h>
++#include <fcntl.h>
+ 
+ #include "shared/helpers.h"
+ #include "weston-test-fixture-compositor.h"
+-- 
+2.25.1
+
