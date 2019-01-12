From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jan 2019 21:50:26 +0100
Subject: [Buildroot] [PATCH 2/2] boost: bump to version 1.69.0
In-Reply-To: <20190112205026.6173-1-fontaine.fabrice@gmail.com>
References: <20190112205026.6173-1-fontaine.fabrice@gmail.com>
Message-ID: <20190112205026.6173-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove fifth patch (already in version)
- Remove BR2_PACKAGE_BOOST_SIGNALS as signals is now removed. Its
  removal was announced in 1.68 and its deprecation was announced in
  1.54. Users are encouraged to use Signals2 instead.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                                   |  7 ++
 ...static-detection-of-lock-free-atomic-ints.patch | 80 ----------------------
 package/boost/Config.in                            |  5 --
 package/boost/boost.hash                           |  4 +-
 package/boost/boost.mk                             |  6 +-
 5 files changed, 11 insertions(+), 91 deletions(-)
 delete mode 100644 package/boost/0005-fix-static-detection-of-lock-free-atomic-ints.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 6f1e3eef2b..ac8c07075c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_BOOST_SIGNALS
+	bool "Boost signals removed"
+	select BR2_LEGACY
+	help
+	  Its removal was announced in boost 1.68 and its deprecation was
+	  announced in 1.54. Users are encouraged to use Signals2 instead.
+
 config BR2_PACKAGE_LUA_5_2
 	bool "Lua 5.2.x version removed"
 	select BR2_LEGACY
diff --git a/package/boost/0005-fix-static-detection-of-lock-free-atomic-ints.patch b/package/boost/0005-fix-static-detection-of-lock-free-atomic-ints.patch
deleted file mode 100644
index 9e87aaedf0..0000000000
--- a/package/boost/0005-fix-static-detection-of-lock-free-atomic-ints.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 48be99d20753ecab8817b030b95a7f1260aa777f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 5 Sep 2018 12:04:15 +0200
-Subject: [PATCH 17/17] fix static detection of lock-free atomic ints
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When build statically, boost is unable to detect lock-free atomics ints
-because it tries to link dynamically with boost_system, see
-output/build/boost-1.67.0/bin.v2/config.log (with -d5 option):
-
-Using shell: /bin/sh -c
-    argv[0] = '/bin/sh'
-    argv[1] = '-c'
-    argv[2] = '
-    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g -Wextra -Wno-long-long -Wno-unused-parameter -Wunused-function -pedantic -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_THREAD_BUILD_DLL=1  -I"." -c -o "bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o" "libs/thread/src/../build/has_atomic_flag_lockfree_test.cpp"
-'
-gcc.compile.c++ bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o
-
-    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g -Wextra -Wno-long-long -Wno-unused-parameter -Wunused-function -pedantic -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_THREAD_BUILD_DLL=1  -I"." -c -o "bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o" "libs/thread/src/../build/has_atomic_flag_lockfree_test.cpp"
-
-0.033561 sec system; 0.126314 sec user; 288.682473 sec clock
-gcc.compile.c++ bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o
-
-    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline -Wall -pedantic -g  -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1  -I"." -c -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o" "libs/system/src/error_code.cpp"
-
-0.084060 sec system; 0.644133 sec user; 8.858824 sec clock
-SEM: <s>gcc-link-semaphore now used by <pbin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi>libboost_system.so.1.67.0
-Using shell: /bin/sh -c
-    argv[0] = '/bin/sh'
-    argv[1] = '-c'
-    argv[2] = '
-    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"    -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0" -Wl,-h -Wl,libboost_system.so.1.67.0 -shared -Wl,--start-group "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o"  -Wl,-Bstatic  -Wl,-Bdynamic -lrt -Wl,--end-group -fPIC -pthread -g  -Wl,-elf2flt -static
-'
-gcc.link.dll bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0
-
-    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"    -o "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0" -Wl,-h -Wl,libboost_system.so.1.67.0 -shared -Wl,--start-group "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o"  -Wl,-Bstatic  -Wl,-Bdynamic -lrt -Wl,--end-group -fPIC -pthread -g  -Wl,-elf2flt -static
-
-ld (ld-elf2flt): -shared used without passing a shared library ID
-collect2: error: ld a retourn? le statut de sortie 1
-0.003123 sec system; 0.004732 sec user; 15.646509 sec clock
-...failed gcc.link.dll bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0...
-
-To fix this, move the exe statement before the boost/thread project
-
-Fixes:
- - http://autobuild.buildroot.org/results/f46d38991385cbc2a4fa14eb31074e770cd79803
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/boostorg/thread/commit/f7581a366294c6f5381e0371c242af327c6da655]
----
- build/Jamfile.v2 | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/libs/thread/build/Jamfile.v2 b/build/Jamfile.v2
-index ce8c7f47..26d8b9c3 100644
---- a/libs/thread/build/Jamfile.v2
-+++ b/libs/thread/build/Jamfile.v2
-@@ -38,6 +38,8 @@ import path ;
- import configure ; 
- import threadapi-feature ;
- 
-+exe has_atomic_flag_lockfree : ../build/has_atomic_flag_lockfree_test.cpp ;
-+
- project boost/thread
-     : source-location ../src
-     : requirements <threading>multi
-@@ -141,8 +143,6 @@ project boost/thread
-       <library>/boost/system//boost_system
-     ;
- 
--exe has_atomic_flag_lockfree : ../build/has_atomic_flag_lockfree_test.cpp ; 
--
- rule tag ( name : type ? : property-set )
- {
-     local result = $(name) ;
--- 
-2.17.1
-
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 93e30c4f2b..3eeb4c92d2 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -279,11 +279,6 @@ config BR2_PACKAGE_BOOST_SERIALIZATION
 	help
 	  Serialization for persistence and marshalling.
 
-config BR2_PACKAGE_BOOST_SIGNALS
-	bool "boost-signals"
-	help
-	  Managed signals & slots callback implementation.
-
 config BR2_PACKAGE_BOOST_STACKTRACE
 	bool "boost-stacktrace"
 	depends on !BR2_STATIC_LIBS
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index f3322aed98..c67c3f4a54 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From http://www.boost.org/users/history/version_1_68_0.html
-sha256 7f6130bc3cf65f56a618888ce9d5ea704fa10b462be126ad053e80e553d6d8b7  boost_1_68_0.tar.bz2
+# From http://www.boost.org/users/history/version_1_69_0.html
+sha256 8f32d4617390d1c2d16f26a27ab60d97807b35440d45891fa340fc2648b04406  boost_1_69_0.tar.bz2
 
 # Locally computed
 sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 14f6162003..576e597afa 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.68.0
+BOOST_VERSION = 1.69.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
@@ -16,8 +16,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
 	contract coroutine date_time exception filesystem graph graph_parallel \
 	iostreams locale log math mpi program_options python random regex \
-	serialization signals system test thread timer type_erasure \
-	wave)
+	serialization system test thread timer type_erasure wave)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
@@ -41,7 +40,6 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_REGEX),,regex)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SERIALIZATION),,serialization)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SIGNALS),,signals)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_STACKTRACE),,stacktrace)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SYSTEM),,system)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
-- 
2.14.1
