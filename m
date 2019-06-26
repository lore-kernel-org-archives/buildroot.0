From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 26 Jun 2019 14:58:56 +0200
Subject: [Buildroot] [PATCH v2 3/7] package/ecryptfs-utils: remove libnss
 gcc bug dependency
In-Reply-To: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
References: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190626125900.48230-4-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package libnss has BR2_TOOLCHAIN_HAS_GCC_BUG_85862 dependency and since
ecryptfs-utils depends on libnss it has to have this dependency too. But
libnss has been worked around for Gcc Bug 85862 on previous patch, then
we can remove 'depends on !BR_TOOLCHAIN_HAS_GCC_BUG_85862' and its
comment from Config.in.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/ecryptfs-utils/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index b589368a6a..68a659d33d 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
 	depends on !BR2_STATIC_LIBS # libnss, keyutils
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 # microblaze specific & GCC < 7.x
 	select BR2_PACKAGE_KEYUTILS
 	select BR2_PACKAGE_LIBNSS
 	# runtime dependency only, some scripts are using the
@@ -34,6 +33,3 @@ comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS
-
-comment "ecryptfs needs a toolchain not affected by GCC bug 85862"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 # libnss
-- 
2.17.1
