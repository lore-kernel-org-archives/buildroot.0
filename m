From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 14:25:40 +0200
Subject: [Buildroot] [PATCH 6/8] package/ecryptfs-utils: allow building with
 GCC_BUG_85862 and on Microblaze
In-Reply-To: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
References: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190522122542.84146-7-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnss gcc bug 85862 has been worked around and that caused build
failure on Microblaze.

Remove 'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862' and 'depends on
!BR2_microblaze' from Config.in allowing this package to build.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/ecryptfs-utils/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 6652d33e0e..68a659d33d 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -2,12 +2,10 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	bool "ecryptfs-utils"
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # keyutils
-	depends on !BR2_microblaze # keyutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
 	depends on !BR2_STATIC_LIBS # libnss, keyutils
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 # microblaze specific & GCC < 7.x
 	select BR2_PACKAGE_KEYUTILS
 	select BR2_PACKAGE_LIBNSS
 	# runtime dependency only, some scripts are using the
@@ -31,11 +29,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	  http://ecryptfs.org
 
 comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library"
-	depends on !BR2_microblaze
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS
-
-comment "ecryptfs needs a toolchain not affected by GCC bug 85862"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 # libnss
-- 
2.17.1
