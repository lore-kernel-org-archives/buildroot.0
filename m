From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 27 Dec 2019 10:37:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/leveldb: fix static build with
 -latomic
In-Reply-To: <20191227093736.373515-1-fontaine.fabrice@gmail.com>
References: <20191227093736.373515-1-fontaine.fabrice@gmail.com>
Message-ID: <20191227093736.373515-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop workaround and use an upstreamable solution to link with -latomic

Fixes:
 - http://autobuild.buildroot.org/results/01d5a50581ac9e9b46f40e6f9665f74897db5e6f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...keLists.txt-check-for-atomic-library.patch | 49 +++++++++++++++++++
 package/leveldb/leveldb.mk                    |  4 --
 2 files changed, 49 insertions(+), 4 deletions(-)
 create mode 100644 package/leveldb/0003-CMakeLists.txt-check-for-atomic-library.patch

diff --git a/package/leveldb/0003-CMakeLists.txt-check-for-atomic-library.patch b/package/leveldb/0003-CMakeLists.txt-check-for-atomic-library.patch
new file mode 100644
index 0000000000..98609b6b93
--- /dev/null
+++ b/package/leveldb/0003-CMakeLists.txt-check-for-atomic-library.patch
@@ -0,0 +1,49 @@
+From 9e82eb57870ec7c01734b44ed4bb994362004df3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 Dec 2019 10:20:53 +0100
+Subject: [PATCH] CMakeLists.txt: check for atomic library
+
+On some architectures, atomic binutils are provided by the libatomic
+library from gcc. Linking with libatomic is therefore necessary,
+otherwise the build fails with:
+
+[100%] Linking CXX executable leveldbutil
+/home/fabrice/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: libleveldb.a(env_posix.cc.o): in function `leveldb::(anonymous namespace)::Limiter::Acquire()':
+env_posix.cc:(.text+0x124): undefined reference to `__atomic_fetch_sub_4'
+
+This is often for example the case on sparcv8 32 bit.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/01d5a50581ac9e9b46f40e6f9665f74897db5e6f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/google/leveldb/pull/765]
+---
+ CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index be41ba4..9d6773f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -41,6 +41,7 @@ include(CheckIncludeFile)
+ check_include_file("unistd.h" HAVE_UNISTD_H)
+ 
+ include(CheckLibraryExists)
++check_library_exists(atomic __atomic_fetch_add_4 "" HAVE_ATOMIC)
+ check_library_exists(crc32c crc32c_value "" HAVE_CRC32C)
+ check_library_exists(snappy snappy_compress "" HAVE_SNAPPY)
+ check_library_exists(tcmalloc malloc "" HAVE_TCMALLOC)
+@@ -270,6 +271,9 @@ if(HAVE_CLANG_THREAD_SAFETY)
+       -Werror -Wthread-safety)
+ endif(HAVE_CLANG_THREAD_SAFETY)
+ 
++if(HAVE_ATOMIC)
++  target_link_libraries(leveldb atomic)
++endif(HAVE_ATOMIC)
+ if(HAVE_CRC32C)
+   target_link_libraries(leveldb crc32c)
+ endif(HAVE_CRC32C)
+-- 
+2.24.0
+
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 086fc53e47..8456e6ec95 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -14,8 +14,4 @@ LEVELDB_CONF_OPTS = \
 	-DLEVELDB_BUILD_BENCHMARKS=OFF \
 	-DLEVELDB_BUILD_TESTS=OFF \
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-LEVELDB_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-endif
-
 $(eval $(cmake-package))
-- 
2.24.0
