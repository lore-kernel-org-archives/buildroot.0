From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Feb 2020 23:36:43 +0100
Subject: [Buildroot] [PATCH 2/3] package/udisks: add locale dependency
In-Reply-To: <20200213223644.2346193-1-fontaine.fabrice@gmail.com>
References: <20200213223644.2346193-1-fontaine.fabrice@gmail.com>
Message-ID: <20200213223644.2346193-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit b5f0c6efb24826641719c493382211e5d768417b forgot to propagate new
locale dependency from parted to udisks

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/udisks/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 80a905fd9b..f4044b0d0d 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_UDISKS
 	bool "udisks"
+	depends on BR2_ENABLE_LOCALE # parted
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # spidermonkey
 	depends on BR2_INSTALL_LIBSTDCPP # spidermonkey
 	depends on BR2_PACKAGE_HAS_UDEV
@@ -49,10 +50,10 @@ comment "udisks needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
 
-comment "udisks needs a glibc or musl toolchain with C++, wchar, dynamic library, NPTL, gcc >= 4.9"
+comment "udisks needs a glibc or musl toolchain with locale, C++, wchar, dynamic library, NPTL, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+	depends on !BR2_ENABLE_LOCALE || BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-- 
2.24.1
