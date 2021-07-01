From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Jul 2021 21:29:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/zstd: fix dynamic build without
 threads
Message-ID: <20210701192959.137405-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dynamic build without threads is broken since bump to version 1.5.0 in
commit aad8bbf58842dd62a4911d2c671ad9598e26b459

Indeed, dynamic library is built with threads support since
https://github.com/facebook/zstd/commit/91465e23b2710de031a762874cafb417f8b7556e

To fix this build failure, add -nomt if needed however libzstd-nomt is a
"special target that builds a library in single-thread mode _and_
without zstdmt_compress.c". For an unknown reason, this target fails to
build and don't create any symlinks so replace libzstd-{mt,nomt} by
lib-{mt,nomt} even if this will have the side effect of building a
shared and a static version of the library.

While at it, also replace "libzstd.a libzstd" by "lib"

Fixes:
 - http://autobuild.buildroot.org/results/e609601a0fc91c44d88a12c35b29ce937381462f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zstd/zstd.mk | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 2a876376a2..47d774bc81 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -43,19 +43,22 @@ ifeq ($(BR2_STATIC_LIBS),y)
 ZSTD_BUILD_LIBS = libzstd.a
 ZSTD_INSTALL_LIBS = install-static
 else ifeq ($(BR2_SHARED_LIBS),y)
-ZSTD_BUILD_LIBS = libzstd
+ZSTD_BUILD_LIBS = lib
 ZSTD_INSTALL_LIBS = install-shared
 else
-ZSTD_BUILD_LIBS = libzstd.a libzstd
+ZSTD_BUILD_LIBS = lib
 ZSTD_INSTALL_LIBS = install-static install-shared
 endif
 
 # The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
-# one. Building a multi-threaded binary with a library (which defaults to
-# single-threaded) gives a runtime error when compressing files.
-# The 'lib' makefile provides specific '%-mt' targets for this purpose.
+# one. Building a multi-threaded binary with a static library (which defaults
+# to single-threaded) gives a runtime error when compressing files.
+# The 'lib' makefile provides specific '%-mt' and '%-nomt' targets for this
+# purpose.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
+else
+ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
 endif
 
 define ZSTD_BUILD_CMDS
-- 
2.30.2
