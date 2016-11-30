From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Nov 2016 17:04:45 +0000
Subject: [Buildroot] [PATCH next 4/4] lttng-libust: bump version to 2.9.0
In-Reply-To: <20161130170445.55222-1-Vincent.Riera@imgtec.com>
References: <20161130170445.55222-1-Vincent.Riera@imgtec.com>
Message-ID: <20161130170445.55222-4-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop sha256 hash. The combination of md5 and sha1 hashes is enough.

Add a patch that fixes a build failure due to using the compiler of the
host machine. The patch has been submitted as a pull request:
  https://github.com/lttng/lttng-ust/pull/41

Release notes:
  https://lists.lttng.org/pipermail/lttng-dev/2016-November/026761.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...s-Makefile.am-define-C-and-C-compilers-fo.patch | 49 ++++++++++++++++++++++
 package/lttng-libust/lttng-libust.hash             |  9 ++--
 package/lttng-libust/lttng-libust.mk               |  2 +-
 3 files changed, 53 insertions(+), 7 deletions(-)
 create mode 100644 package/lttng-libust/0002-doc-examples-Makefile.am-define-C-and-C-compilers-fo.patch

diff --git a/package/lttng-libust/0002-doc-examples-Makefile.am-define-C-and-C-compilers-fo.patch b/package/lttng-libust/0002-doc-examples-Makefile.am-define-C-and-C-compilers-fo.patch
new file mode 100644
index 0000000..5172dbb
--- /dev/null
+++ b/package/lttng-libust/0002-doc-examples-Makefile.am-define-C-and-C-compilers-fo.patch
@@ -0,0 +1,49 @@
+From f54894580da85e33f934c5c9bf5ab32d3fcce18b Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Wed, 30 Nov 2016 16:52:51 +0000
+Subject: [PATCH] doc/examples/Makefile.am: define C and C++ compilers for
+ CMake
+
+This prevents build failures when cross-compiling.
+
+If we don't define the compiler, it will use the one from the host
+machine. For instance "/usr/bin/c++", which is incorrect.
+
+The failure looks like this:
+
+.............................................................
+[ 10%] Building CXX object CMakeFiles/tracepoint-provider.dir/tracepoint-provider.cpp.o
+/usr/bin/c++   -Dtracepoint_provider_EXPORTS -I/br/output/build/lttng-libust-2.9.0/doc/examples/cmake-multiple-shared-libraries/. -isystem /br/output/build/lttng-libust-2.9.0/include  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC   -o CMakeFiles/tracepoint-provider.dir/tracepoint-provider.cpp.o -c /br/output/build/lttng-libust-2.9.0/doc/examples/cmake-multiple-shared-libraries/tracepoint-provider.cpp
+In file included from /br/output/build/lttng-libust-2.9.0/include/lttng/tracepoint.h:29:0,
+                 from /br/output/build/lttng-libust-2.9.0/doc/examples/cmake-multiple-shared-libraries/tracepoint-provider.h:32,
+                 from /br/output/build/lttng-libust-2.9.0/doc/examples/cmake-multiple-shared-libraries/tracepoint-provider.cpp:26:
+/br/output/build/lttng-libust-2.9.0/include/lttng/tracepoint-rcu.h:26:27: fatal error: urcu/compiler.h: No such file or directory
+ #include <urcu/compiler.h>
+                           ^
+compilation terminated.
+.............................................................
+
+Pull request URL: https://github.com/lttng/lttng-ust/pull/41
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ doc/examples/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/doc/examples/Makefile.am b/doc/examples/Makefile.am
+index 424b844..5bc1f4c 100644
+--- a/doc/examples/Makefile.am
++++ b/doc/examples/Makefile.am
+@@ -152,7 +152,9 @@ all-local:
+ 				cmake \
+ 				-DCMAKE_INCLUDE_PATH="$(abs_top_srcdir)/include;$(abs_top_builddir)/include" \
+ 				-DCMAKE_LIBRARY_PATH="$(abs_top_builddir)/liblttng-ust/.libs" \
++				-DCMAKE_C_COMPILER="$(CC)" \
+ 				-DCMAKE_C_FLAGS="$(CFLAGS) $(CPPFLAGS)" \
++				-DCMAKE_CXX_COMPILER="$(CXX)" \
+ 				-DCMAKE_CXX_FLAGS="$(CXXFLAGS) $(CPPFLAGS)" \
+ 				-DCMAKE_EXE_LINKER_FLAGS="$(LDFLAGS)" \
+ 				.. && \
+-- 
+2.10.1
+
diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index a4a2907..e080361 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,6 +1,3 @@
-# From http://lttng.org/files/lttng-ust/lttng-ust-2.8.1.tar.bz2.{md5,sha1}
-md5     be505077245dc05f93370a565eec15f4  lttng-ust-2.8.1.tar.bz2
-sha1    8bebdcbcb453d2643fb226dbe92de61764f1ee3b  lttng-ust-2.8.1.tar.bz2
-
-# Locally generated
-sha256  6e41349107e83e7b43c69ed358e48788ca2fd095bad61737b850e3f3d2c0508a  lttng-ust-2.8.1.tar.bz2
+# From http://lttng.org/files/lttng-ust/lttng-ust-2.9.0.tar.bz2.{md5,sha1}
+md5 77f3378ba37a36801420bce87b702e9c  lttng-ust-2.9.0.tar.bz2
+sha1 9937eae64540821b8597cce081e92be76e6b5568  lttng-ust-2.9.0.tar.bz2
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 7a83f46..23cc745 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.8.1
+LTTNG_LIBUST_VERSION = 2.9.0
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1, MIT (system headers), GPLv2 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
-- 
2.10.1
