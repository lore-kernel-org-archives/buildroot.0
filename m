From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 26 Aug 2016 23:28:21 +0200
Subject: [Buildroot] [PATCH] zeromq: disable for static linking
Message-ID: <20160826212821.GA21305@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/3aa73620d0f1afcc82de93069c9693e1ca755bb9

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/zeromq/Config.in | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index d5c9dea..178b044 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,12 +1,13 @@
-comment "zeromq needs a toolchain w/ C++, wchar, threads"
+comment "zeromq needs a toolchain w/ C++, wchar, threads, dynamic library"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
-		BR2_TOOLCHAIN_HAS_THREADS)
+		BR2_TOOLCHAIN_HAS_THREADS) || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
@@ -27,12 +28,8 @@ config BR2_PACKAGE_ZEROMQ
 
 if BR2_PACKAGE_ZEROMQ
 
-comment "norm support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 config BR2_PACKAGE_ZEROMQ_NORM
 	bool "NORM support"
-	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_NORM
 	help
 	  Add support for NACK-Oriented Reliable Multicast (RFC 5740)
-- 
2.1.4
