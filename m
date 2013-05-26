From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 00:08:16 +0200
Subject: [Buildroot] [PATCH 06/20] poco: Add upstream patch to add support
	for aarch64.
In-Reply-To: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369606110-8088-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Newton <will.newton@linaro.org>

Signed-off-by: Will Newton <will.newton@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poco/Config.in          |    4 ++--
 package/poco/poco-aarch64.patch |   39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 package/poco/poco-aarch64.patch

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 402f96d..47ca83d 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_POCO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !(BR2_aarch64 || BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel || BR2_xtensa)
+	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel || BR2_xtensa)
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	help
@@ -62,4 +62,4 @@ endif # BR2_PACKAGE_POCO
 comment "poco requires a toolchain with WCHAR, threads, and C++ support"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !(BR2_aarch64 || BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel || BR2_xtensa)
+	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel || BR2_xtensa)
diff --git a/package/poco/poco-aarch64.patch b/package/poco/poco-aarch64.patch
new file mode 100644
index 0000000..f629f7b
--- /dev/null
+++ b/package/poco/poco-aarch64.patch
@@ -0,0 +1,39 @@
+From 37899eda9563d9134cb5864751b6432cabfaac3e Mon Sep 17 00:00:00 2001
+From: Will Newton <will.newton@linaro.org>
+Date: Tue, 21 May 2013 22:11:05 +0100
+Subject: [PATCH] Foundation/include/Poco/Platform.h: Add support for AArch64.
+
+Add support for big and little endian AArch64 preprocessor defines.
+---
+ Foundation/include/Poco/Platform.h | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/Foundation/include/Poco/Platform.h b/Foundation/include/Poco/Platform.h
+index f34f277..8ddb4cb 100644
+--- a/Foundation/include/Poco/Platform.h
++++ b/Foundation/include/Poco/Platform.h
+@@ -145,6 +145,7 @@
+ #define POCO_ARCH_S390    0x0c
+ #define POCO_ARCH_SH      0x0d
+ #define POCO_ARCH_NIOS2   0x0e
++#define POCO_ARCH_AARCH64 0x0f
+ 
+ 
+ #if defined(__ALPHA) || defined(__alpha) || defined(__alpha__) || defined(_M_ALPHA)
+@@ -207,7 +208,12 @@
+ 	#else
+ 		#define POCO_ARCH_BIG_ENDIAN 1
+ 	#endif
+-
++#elif defined(__AARCH64EL__)
++	#define POCO_ARCH POCO_ARCH_AARCH64
++	#define POCO_ARCH_LITTLE_ENDIAN 1
++#elif defined(__AARCH64EB__)
++	#define POCO_ARCH POCO_ARCH_AARCH64
++	#define POCO_ARCH_BIG_ENDIAN 1
+ #endif
+ 
+ 
+-- 
+1.8.1.4
+
-- 
1.7.9.5
