From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 25 Jan 2019 15:34:52 -0800
Subject: [Buildroot] [PATCH] toolchain: add variadic MI thunk support flag
Message-ID: <20190125233452.6316-1-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC uses thunk functions to adjust the 'this' pointer when calling
C++ member functions in classes derived with multiple inheritance.
Generation of thunk functions requires support from the compiler
back end. In the absence of that support target-independent code
in the C++ front end is used to generate thunk functions, but it
does not support vararg functions.

Support for this feature is currently missing in or1k and xtensa
toolchains.

Add flag BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK that indicates
presence of this feature in the toolchain. Add dependency to packages
that require this feature to be built.

Fixes:
http://autobuild.buildroot.net/results/c9e660c764edbd7cf0ae54ab0f0f412464721446/
http://autobuild.buildroot.net/results/9a3bf4b411c418ea78d59e35d23ba865dd453890/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/libtorrent-rasterbar/Config.in |  6 ++++--
 toolchain/Config.in                    | 13 +++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/libtorrent-rasterbar/Config.in b/package/libtorrent-rasterbar/Config.in
index aa986f2388e0..e9a1a40fb9b1 100644
--- a/package/libtorrent-rasterbar/Config.in
+++ b/package/libtorrent-rasterbar/Config.in
@@ -1,6 +1,7 @@
-comment "libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.8"
+comment "libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, variadic MI thunks, gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
 
 config BR2_PACKAGE_LIBTORRENT_RASTERBAR
 	bool "libtorrent-rasterbar"
@@ -8,6 +9,7 @@ config BR2_PACKAGE_LIBTORRENT_RASTERBAR
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
 	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_CHRONO
diff --git a/toolchain/Config.in b/toolchain/Config.in
index baf192c936d4..5109f66946ef 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -93,6 +93,19 @@ config BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_sparc_v8
 	depends on !BR2_m68k_cf5208
 
+# GCC uses thunk functions to adjust the 'this' pointer when calling
+# C++ member functions in classes derived with multiple inheritance.
+# Generation of thunk functions requires support from the compiler
+# back end. In the absence of that support target-independent code
+# in the C++ front end is used to generate thunk functions, but it
+# does not support vararg functions.
+# or1k will support it in the gcc mainline starting with gcc-9.
+config BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
+	bool
+	default y
+	depends on !BR2_or1k
+	depends on !BR2_xtensa
+
 # Prior to gcc 7.x, exception_ptr, nested_exception and future from
 # libstdc++ would only be provided on architectures that support
 # always lock-free atomic ints. See
-- 
2.11.0
