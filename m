From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  8 Jun 2016 19:54:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/p7zip: add support for blackfin
Message-ID: <1465408487-22960-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested using this defconfig:

BR2_bfin=y
BR2_PACKAGE_P7ZIP=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/p7zip/0001-bfin.patch | 19 +++++++++++++++++++
 package/p7zip/Config.in       |  3 ---
 2 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 package/p7zip/0001-bfin.patch

diff --git a/package/p7zip/0001-bfin.patch b/package/p7zip/0001-bfin.patch
new file mode 100644
index 0000000..76addb6
--- /dev/null
+++ b/package/p7zip/0001-bfin.patch
@@ -0,0 +1,19 @@
+Add support for blackfin arch.
+
+Fixes compilation error:
+../../../../CPP/myWindows/mySplitCommandLine.cpp:99:8: error: #error ENDIANNESS
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(Patch sent upstream: https://sourceforge.net/p/p7zip/patches/33/
+
+diff -uNr p7zip_15.14.1.org/C/CpuArch.h p7zip_15.14.1/C/CpuArch.h
+--- p7zip_15.14.1.org/C/CpuArch.h	2016-02-17 07:27:16.000000000 +0100
++++ p7zip_15.14.1/C/CpuArch.h	2016-06-08 19:47:49.000000000 +0200
+@@ -66,6 +66,7 @@
+     || defined(__MIPSEL__) \
+     || defined(__MIPSEL) \
+     || defined(_MIPSEL) \
++    || defined(__BFIN__) \
+     || (defined(__BYTE_ORDER__) && (__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__))
+   #define MY_CPU_LE
+ #endif
diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
index cd9de7e..840949c 100644
--- a/package/p7zip/Config.in
+++ b/package/p7zip/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_P7ZIP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
-	# missing endianness definitions
-	depends on !BR2_bfin
 	help
 	  p7zip is a quick port of the command line version of 7-zip for Unix.
 	  (see http://www.7-zip.org)
@@ -14,5 +12,4 @@ config BR2_PACKAGE_P7ZIP
 	  http://sourceforge.net/projects/p7zip
 
 comment "p7zip needs a toolchain w/ threads, wchar, C++"
-	depends on !BR2_bfin
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
-- 
2.8.1
