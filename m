From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  8 Feb 2019 21:50:41 +0100
Subject: [Buildroot] [PATCH] package/opentracing-cpp: needs dynamic library
 support
Message-ID: <20190208205042.12833-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

opentracing-cpp requires dlfcn.h from src/dynamic_load_unix.cpp.
This file is compiled unconditionally.

Disable opentracing-cpp on BR2_STATIC_LIBS configurations.

Fixes: http://autobuild.buildroot.net/results/454173aef9ff7c808294a974088d7682cad240a8/

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/opentracing-cpp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/opentracing-cpp/Config.in b/package/opentracing-cpp/Config.in
index ebcce35aa8..ff3067b7d1 100644
--- a/package/opentracing-cpp/Config.in
+++ b/package/opentracing-cpp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENTRACING_CPP
 	bool "opentracing-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	help
@@ -9,8 +10,9 @@ config BR2_PACKAGE_OPENTRACING_CPP
 
 	  http://opentracing.io
 
-comment "opentracing-cpp needs a toolchain w/ C++, threads, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "opentracing-cpp needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "opentracing-cpp needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.19.2
