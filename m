From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 25 Jan 2017 22:43:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: Only CLI client
	depends on !uClibc
Message-ID: <20170125214358.14952-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested using this minimal defconfig

BR2_KERNEL_HEADERS_3_4=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_BLUEZ5_UTILS=y
BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL=y
BR2_PACKAGE_BLUEZ5_UTILS_TEST=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bluez5_utils/Config.in | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 18b7bbf0e0..a7c0ee4ba4 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -6,8 +6,6 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	depends on !BR2_STATIC_LIBS # uses dlfcn
 	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-	# wordexp support not in our uClibc configuration
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
@@ -41,10 +39,15 @@ comment "OBEX support needs a toolchain w/ C++"
 
 config BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 	bool "build CLI client"
+	# wordexp support not in our uClibc configuration
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_READLINE
 	help
 	  Enable the Bluez 5.x command line client.
 
+comment "bluez5-utils client needs a glibc or musl toolchain"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
 	bool "install GATT tool"
 	depends on BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
@@ -77,10 +80,9 @@ config BR2_PACKAGE_BLUEZ5_UTILS_TEST
 
 endif
 
-comment "bluez5-utils needs a glibc or musl toolchain w/ wchar, threads, headers >= 3.4, dynamic library"
+comment "bluez5-utils needs a toolchain w/ wchar, threads, headers >= 3.4, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS || \
-		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
 
-- 
2.11.0
