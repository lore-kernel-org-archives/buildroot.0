From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Jun 2020 21:57:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libhttpserver: needs gcc >= 5
Message-ID: <20200613195730.2028789-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libhtpserver uses the following constructor since version 0.18.0 and
https://github.com/etr/libhttpserver/commit/9cdc90177e12902adf4063300fd688fcfdbe8168:

http_request(http_request&& b) noexcept = default;

This raises the following build failure on gcc 4.8:

In file included from http_request.cpp:22:0:
httpserver/http_request.hpp:234:9: error: function 'httpserver::http_request::http_request(httpserver::http_request&&)' defaulted on its first declaration with an exception-specification that differs from the implicit declaration 'httpserver::http_request::http_request(httpserver::http_request&&)'
         http_request(http_request&& b) noexcept = default;
         ^

This build failure is due to the following gcc bug:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59526

Instead of adding BR2_TOOLCHAIN_HAS_GCC_BUG_59526, simply add a
dependency on gcc >= 5

Fixes:
 - http://autobuild.buildroot.org/results/18a29056e0191d9f23e1f9c6f72b13c07d03b300/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libhttpserver/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libhttpserver/Config.in b/package/libhttpserver/Config.in
index 03715d0569..0261e866b4 100644
--- a/package/libhttpserver/Config.in
+++ b/package/libhttpserver/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBHTTPSERVER
 	bool "libhttpserver"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBMICROHTTPD
 	help
@@ -11,5 +12,6 @@ config BR2_PACKAGE_LIBHTTPSERVER
 
 	  https://github.com/etr/libhttpserver
 
-comment "libhttpserver needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libhttpserver needs a toolchain w/ C++, threads, gcc >= 5"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-- 
2.26.2
