From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 12:57:45 +0200
Subject: [Buildroot] [git commit] package/ecryptfs-utils: remove libnss gcc
 bug dependency
Message-ID: <20190803105500.299D18122D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=862e47aec2ff8165c83d99f49639a1006be78ef2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package libnss had a BR2_TOOLCHAIN_HAS_GCC_BUG_85862 dependency and
since ecryptfs-utils depends on libnss it does have this dependnecy as
well.

However, gcc bug 85862 has been worked around now in libnss by
disabling optimization, so libnss no longer has this
BR2_TOOLCHAIN_HAS_GCC_BUG_85862 dependency. We can therefore drop it
from ecryptfs-utils as well.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
