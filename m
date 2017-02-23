From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 23:49:45 +0100
Subject: [Buildroot] [PATCH] libuv: add dependency on
	BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <1487890185-32361-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libuv library uses __sync atomic built-ins:

$ readelf -a -W output/target/usr/lib/libuv.so.1.0.0 | grep __sync
   122: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __sync_val_compare_and_swap_4

but this is not currently taken into account in the libuv package,
causing some build failures in packages using libuv as an optional
dependency, such as janus-gateway and mosquitto.

Therefore, this commit updates the libuv package with this additional
dependency. The reverse dependencies of libuv are also updated: cmake,
luv, luvi and moarvm.

Fixes:

 - http://autobuild.buildroot.net/results/bdaa67d763c0d8d377a04529c74f73bee7d4ccef/
   (janus-gateway)

 - http://autobuild.buildroot.net/results/2bc84ba2d1167018e2d48e5183ead22b6425dcf5/
   (mosquitto)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/Config.in  | 2 ++
 package/libuv/Config.in  | 2 ++
 package/luv/Config.in    | 2 ++
 package/luvi/Config.in   | 2 ++
 package/moarvm/Config.in | 3 ++-
 5 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 2706db5..c294927 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -28,6 +28,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_USE_MMU # libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	help
 	  CTest is a testing tool distributed as a part of CMake. It
 	  can be used to automate updating (using CVS for example),
@@ -40,6 +41,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7, NPTL"
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/libuv/Config.in b/package/libuv/Config.in
index 93fbd56..cdd73a6 100644
--- a/package/libuv/Config.in
+++ b/package/libuv/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBUV
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_barrier_*
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  libuv is a multi-platform support library with a focus
 	  on asynchronous I/O.
@@ -12,3 +13,4 @@ config BR2_PACKAGE_LIBUV
 comment "libuv needs a toolchain w/ NPTL, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/luv/Config.in b/package/luv/Config.in
index b085baf..e9d0109 100644
--- a/package/luv/Config.in
+++ b/package/luv/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LUV
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	help
 	  libuv bindings for LuaJIT and Lua.
 
@@ -12,3 +13,4 @@ config BR2_PACKAGE_LUV
 comment "luv needs a toolchain w/ NPTL, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/luvi/Config.in b/package/luvi/Config.in
index 18317f4..a9dd2ef 100644
--- a/package/luvi/Config.in
+++ b/package/luvi/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LUVI
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_PACKAGE_LUAJIT
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LUV
 	help
@@ -25,6 +26,7 @@ config BR2_PACKAGE_LUVI
 comment "luvi needs a toolchain w/ NPTL, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 comment "luvi needs LuaJIT"
 	depends on !BR2_PACKAGE_LUAJIT
diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index c6e1efa..c318ab4 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MOARVM
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # libatomic_ops
 	# needs AO_fetch_compare_and_swap, not implemented for sparcv8/sparcv9
 	depends on !BR2_sparc64 && !BR2_sparc
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LIBTOMMATH
 	select BR2_PACKAGE_LIBATOMIC_OPS
@@ -23,4 +24,4 @@ comment "moarvm needs a toolchain w/ NPTL, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	depends on !BR2_sparc64 && !BR2_sparc
-
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.7.4
