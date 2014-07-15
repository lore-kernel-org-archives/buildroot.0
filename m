From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:06:11 +0200
Subject: [Buildroot] [git commit] uclibc: fix tests building in uClibc
	0.9.33.2
Message-ID: <20140715210628.06B839D24C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fa35b77f7553ba3979784d94425377f6b272396
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following patches are required for successful bulding of uClibc built-int tests
(BR2_UCLIBC_INSTALL_TEST_SUITE=y):

1.
uclibc-0059-test-cater-for-config.patch
http://git.uclibc.org/uClibc/commit/test?id=7598eeaa1defa2884adaa890bb115c493d69cc35

2.
uclibc-0058-test-tls-fix-build-with-newer-binutils.patch
http://git.uclibc.org/uClibc/commit/test?id=931e8391565323ed2e589c83b83a7345813a5514

3.
uclibc-0060-test-Fix-math-c-dependency.patch
http://git.uclibc.org/uClibc/commit/test/math?id=a20a91ad7c042c46e4a2adee6d03315f857f9985

All mentioned patches must be removed as obsolete on bumping uClibc to the next
release.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...58-test-tls-fix-build-with-newer-binutils.patch |   37 +++++++++
 .../uclibc-0059-test-cater-for-config.patch        |   81 ++++++++++++++++++++
 .../uclibc-0060-test-Fix-math-c-dependency.patch   |   30 +++++++
 3 files changed, 148 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/0.9.33.2/uclibc-0058-test-tls-fix-build-with-newer-binutils.patch b/package/uclibc/0.9.33.2/uclibc-0058-test-tls-fix-build-with-newer-binutils.patch
new file mode 100644
index 0000000..04dfb1e
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0058-test-tls-fix-build-with-newer-binutils.patch
@@ -0,0 +1,37 @@
+From 931e8391565323ed2e589c83b83a7345813a5514 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 02 Oct 2013 07:08:29 +0000
+Subject: test: tls: fix build with newer binutils
+
+Fix the following build failures:
+
+ld: tst-tls10.o: undefined reference to symbol 'f2a'
+ld: tst-tls12.o: undefined reference to symbol 'a1'
+
+binutils ld defaults to --no-copy-dt-needed-entries since version 2.22. Add
+library dependencies explicitly.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+(limited to 'test')
+
+diff --git a/test/tls/Makefile.in b/test/tls/Makefile.in
+index 875c607..7ab4e2a 100644
+--- a/test/tls/Makefile.in
++++ b/test/tls/Makefile.in
+@@ -102,9 +102,9 @@ LDFLAGS_tst-tls6 := -ldl
+ LDFLAGS_tst-tls7 := -ldl
+ LDFLAGS_tst-tls8 := -ldl
+ LDFLAGS_tst-tls9 := -ldl
+-LDFLAGS_tst-tls10 := -Wl,-rpath-link=. tst-tlsmod8.so
+-LDFLAGS_tst-tls11 := -Wl,-rpath-link=. tst-tlsmod10.so
+-LDFLAGS_tst-tls12 := -Wl,-rpath-link=. tst-tlsmod12.so
++LDFLAGS_tst-tls10 := -Wl,-rpath-link=. tst-tlsmod8.so tst-tlsmod7.so
++LDFLAGS_tst-tls11 := -Wl,-rpath-link=. tst-tlsmod9.so tst-tlsmod10.so
++LDFLAGS_tst-tls12 := -Wl,-rpath-link=. tst-tlsmod11.so tst-tlsmod12.so
+ LDFLAGS_tst-tls13 := -ldl -Wl,-rpath-link=.
+ LDFLAGS_tst-tls14 := -ldl -Wl,-rpath-link=. tst-tlsmod14a.so
+ LDFLAGS_tst-tls15 := -ldl -Wl,-rpath-link=.
+--
+cgit v0.9.1
diff --git a/package/uclibc/0.9.33.2/uclibc-0059-test-cater-for-config.patch b/package/uclibc/0.9.33.2/uclibc-0059-test-cater-for-config.patch
new file mode 100644
index 0000000..f44c92c
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0059-test-cater-for-config.patch
@@ -0,0 +1,81 @@
+From 7598eeaa1defa2884adaa890bb115c493d69cc35 Mon Sep 17 00:00:00 2001
+From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Date: Sat, 23 Feb 2013 06:39:41 +0000
+Subject: test: cater for config
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+(limited to 'test')
+
+diff --git a/test/math/Makefile.in b/test/math/Makefile.in
+index e76cbdb..beef650 100644
+--- a/test/math/Makefile.in
++++ b/test/math/Makefile.in
+@@ -1,14 +1,16 @@
+ # uClibc math tests
+ # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
+ 
+-TESTS := basic-test tst-definitions test-fpucw test-float test-ifloat test-double test-idouble \
+-    rint signgam ilogb
+ # gamma (removed from TESTS, need to add "small errors are ok" machinery there)
+-ifeq ($(UCLIBC_HAS_LONG_DOUBLE_MATH),y)
+-TESTS += test-ldouble test-ildoubl compile_test c99_test
++TESTS_DISABLED := gamma
++ifeq ($(UCLIBC_HAS_LONG_DOUBLE_MATH),)
++TESTS_DISABLED += test-ldouble test-ildoubl compile_test c99_test
+ else
+ CFLAGS_basic-test := -DNO_LONG_DOUBLE
+ endif
++ifeq ($(DO_C99_MATH),)
++TESTS_DISABLED += test-float test-ifloat test-double test-idouble rint signgam ilogb
++endif
+ 
+ DODIFF_rint     := 1
+ DODIFF_signgam  := 1
+diff --git a/test/misc/Makefile.in b/test/misc/Makefile.in
+index 9b74d22..52a3e71 100644
+--- a/test/misc/Makefile.in
++++ b/test/misc/Makefile.in
+@@ -4,6 +4,7 @@
+ TESTS_DISABLED := outb tst-fnmatch bug-glob1 tst-gnuglob
+ ifeq  ($(UCLIBC_HAS_LFS),)
+ TESTS_DISABLED += dirent64
++TESTS_DISABLED += tst-statfs # assuming host has LFS on
+ endif
+ CFLAGS_dirent64 := -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+ 
+diff --git a/test/misc/tst-statfs.c b/test/misc/tst-statfs.c
+index 44ab3aa..b8b4229 100644
+--- a/test/misc/tst-statfs.c
++++ b/test/misc/tst-statfs.c
+@@ -1,5 +1,3 @@
+-#define _FILE_OFFSET_BITS 64
+-
+ #include <sys/vfs.h>
+ #include <errno.h>
+ #include <stdio.h>
+diff --git a/test/misc/tst-statvfs.c b/test/misc/tst-statvfs.c
+index c1e8fde..4b67719 100644
+--- a/test/misc/tst-statvfs.c
++++ b/test/misc/tst-statvfs.c
+@@ -1,5 +1,3 @@
+-#define _FILE_OFFSET_BITS 64
+-
+ #include <sys/statvfs.h>
+ #include <errno.h>
+ #include <stdio.h>
+diff --git a/test/unistd/Makefile.in b/test/unistd/Makefile.in
+index 24b9a37..cfef22e 100644
+--- a/test/unistd/Makefile.in
++++ b/test/unistd/Makefile.in
+@@ -5,7 +5,7 @@ ifeq ($(UCLIBC_HAS_LFS),)
+ TESTS_DISABLED := tst-preadwrite64 tst-posix_fallocate64
+ endif
+ ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),)
+-TESTS_DISABLED := tst-posix_fallocate
++TESTS_DISABLED += tst-posix_fallocate
+ endif
+ OPTS_getopt      := -abcXXX -9
+ OPTS_getopt_long := --add XXX --delete YYY --verbose
+--
+cgit v0.9.1
diff --git a/package/uclibc/0.9.33.2/uclibc-0060-test-Fix-math-c-dependency.patch b/package/uclibc/0.9.33.2/uclibc-0060-test-Fix-math-c-dependency.patch
new file mode 100644
index 0000000..c6ee47d
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0060-test-Fix-math-c-dependency.patch
@@ -0,0 +1,30 @@
+From a20a91ad7c042c46e4a2adee6d03315f857f9985 Mon Sep 17 00:00:00 2001
+From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Date: Tue, 18 Feb 2014 23:30:28 +0100
+Subject: [PATCH] test: Fix math .c dependency
+
+When explicitly running the compile target we were missing a dependency
+to generate the libm-test.c.
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ test/math/Makefile.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/test/math/Makefile.in b/test/math/Makefile.in
+index beef650..0285b66 100644
+--- a/test/math/Makefile.in
++++ b/test/math/Makefile.in
+@@ -25,7 +25,8 @@ EXTRA_LDFLAGS   := -lm
+ 
+ PERL := /usr/bin/perl
+ 
+-$(TESTS): libm-test.c
++MDEPS := $(wildcard test-*.c)
++$(MDEPS): libm-test.c
+ 
+ libm-test.c: libm-test-ulps-$(TARGET_ARCH) libm-test.inc gen-libm-test.pl
+ 	$(Q)$(PERL) ./gen-libm-test.pl -u libm-test-ulps-$(TARGET_ARCH) ./libm-test.inc -o "." 2>&1 > /dev/null
+-- 
+1.9.3
+
