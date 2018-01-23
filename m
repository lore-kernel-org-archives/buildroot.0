From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 23 Jan 2018 05:39:24 -0500
Subject: [Buildroot] [PATCH v2 1/1] libcpprestsdk: require nptl threads.
Message-ID: <20180123103924.23294-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pthread_condattr_setclock is uses which is NPTL only.

Fixes http://autobuild.buildroot.net/results/abf058948c9e4e9a50d42a05689b76bfb54a02e2/build-end.log

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Removed BR2_TOOLCHAIN_HAS_THREADS (Baruch)
  - Removed NPTL threads from comment in favor of just NPTL (Baruch)
  - Removed redundant threads from comment (Baruch)
 package/libcpprestsdk/Config.in | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index 64c383c2c9..a07159b124 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LIBCPPRESTSDK
 	bool "libcpprestsdk"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR # boost
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_CHRONO
@@ -22,9 +22,10 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 
 	  https://github.com/Microsoft/cpprestsdk
 
-comment "libcpprestsdk needs a toolchain w/ C++, wchar, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR
+comment "libcpprestsdk needs a toolchain w/ NPTL, C++, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_USE_WCHAR
 
 comment "libcpprestsdk needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.14.3
