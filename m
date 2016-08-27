From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 27 Aug 2016 02:17:03 +0200
Subject: [Buildroot] [PATCH] package/protobuf: uses fork(),
	not available on no-MMU platforms
Message-ID: <20160827001703.18155-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Propagate the dependency to the packages mosh and ola.

Fixes:
http://autobuild.buildroot.net/results/2c1/2c151e84d7854a810465dc16869023e0ada2d586/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mosh/Config.in     | 1 +
 package/ola/Config.in      | 1 +
 package/protobuf/Config.in | 1 +
 3 files changed, 3 insertions(+)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index b4189ee..e9f68ce 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_MOSH
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
+	depends on BR2_USE_MMU # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PROTOBUF
diff --git a/package/ola/Config.in b/package/ola/Config.in
index 7b56f5c..9fbf22b 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -9,6 +9,7 @@ menuconfig BR2_PACKAGE_OLA
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_USE_MMU # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 3215a07..4a8d1ef 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -33,6 +33,7 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	help
 	  Protocol buffers are Google's language-neutral, platform-neutral,
-- 
2.9.3
