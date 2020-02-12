From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 12 Feb 2020 19:06:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/gensio: bump to version 1.5.1
Message-ID: <20200212180653.428941-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update indentation of hash file (2 spaces)
- This will fix a build failure without threads thanks to
  https://github.com/cminyard/gensio/commit/8918de5b30f90b826c48064e9ee92304b63ffe85
  and associated upstream patch

Fixes:
 - http://autobuild.buildroot.org/results/e94d0e0b46afc1223a74bcc471909f4adef0d6f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tests-Makefile-am-don-t-add-lpthread.patch | 29 +++++++++++++++++++
 package/gensio/gensio.hash                    | 12 ++++----
 package/gensio/gensio.mk                      |  6 ++--
 3 files changed, 39 insertions(+), 8 deletions(-)
 create mode 100644 package/gensio/0001-tests-Makefile-am-don-t-add-lpthread.patch

diff --git a/package/gensio/0001-tests-Makefile-am-don-t-add-lpthread.patch b/package/gensio/0001-tests-Makefile-am-don-t-add-lpthread.patch
new file mode 100644
index 0000000000..5a9f3b7da5
--- /dev/null
+++ b/package/gensio/0001-tests-Makefile-am-don-t-add-lpthread.patch
@@ -0,0 +1,29 @@
+From f63b15e690581d898da56ef2540b6199f5728e58 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 11 Feb 2020 19:14:53 +0100
+Subject: [PATCH] tests/Makefile.am: don't add -lpthread
+
+Don't add -lpthread unconditionally to oomtest_LDADD to avoid a build
+failure without threads, it will be added to LIBS by configure.ac if
+needed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/cminyard/gensio/commit/f63b15e690581d898da56ef2540b6199f5728e58]
+---
+ tests/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index a280acc..b4335c5 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -127,7 +127,7 @@ test_fuzz: test_fuzz_certauth test_fuzz_mux test_fuzz_ssl test_fuzz_telnet \
+ 
+ oomtest_SOURCES = oomtest.c
+ 
+-oomtest_LDADD = $(top_builddir)/lib/libgensio.la $(OPENSSL_LIBS) -lpthread
++oomtest_LDADD = $(top_builddir)/lib/libgensio.la $(OPENSSL_LIBS)
+ 
+ noinst_PROGRAMS = oomtest
+ 
diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index fcf5662f67..623b41904c 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/ser2net/files/
-md5 3a84895e41b9ca85801d2d5727977356  gensio-1.4.1.tar.gz
-sha1 3b268b7c37edabd87547f98d03ecf4929f3e5381  gensio-1.4.1.tar.gz
+# From https://sourceforge.net/projects/ser2net/files/ser2net/
+md5  53c027dfaaf374f57d5f36a6250fc018  gensio-1.5.1.tar.gz
+sha1  8329d7828016e643f60b8b3e70564d32cd03008f  gensio-1.5.1.tar.gz
 # Locally computed:
-sha256 a0608921c6ccec115a1298d02423b9d8482b444f5772d8a8fde7ceabbadd679a  gensio-1.4.1.tar.gz
-sha256 501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
-sha256 dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
+sha256  c1ed28f5bd72185dba666a900d29afbecba58727d6c0dde4a182143273fc1e6b  gensio-1.5.1.tar.gz
+sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
+sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index a975fcb9e6..cf9c18f80f 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 1.4.1
-GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net
+GENSIO_VERSION = 1.5.1
+GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
 GENSIO_INSTALL_STAGING = YES
+# We're patching configure.ac
+GENSIO_AUTORECONF = YES
 GENSIO_CONF_OPTS = \
 	--without-openipmi \
 	--without-swig \
-- 
2.24.1
