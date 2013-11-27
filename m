From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 27 Nov 2013 07:29:24 +0200
Subject: [Buildroot] [PATCH v2] libnspr: Add dependency on !BR2_xtensa
Message-ID: <d1411c9410eaa1ebe9389cb5c20f4209b96a041f.1385530164.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Chris Zankel <chris@zankel.net>

Xtensa is not yet supported in libnspr. Also add dependencies to libnss,
which requires libnspr, and ecryptfs-utils, which requires libnss.

Fixes
http://autobuild.buildroot.net/results/14b/14ba6426edbffa100de924aa69157b3f59368ff2/

[baruch: fix summary, add autobuild referench, add comment dependency]

Signed-off-by: Chris Zankel <chris@zankel.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ecryptfs-utils/Config.in | 2 +-
 package/libnspr/Config.in        | 4 ++--
 package/libnss/Config.in         | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 480aedd..4d00069 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on !BR2_avr32 && !BR2_microblaze # keyutils
 	depends on BR2_LARGEFILE # libnss
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
-	depends on !BR2_arc # libnss -> libnspr
+	depends on !BR2_arc && !BR2_xtensa # libnss -> libnspr
 	help
 	  eCryptfs is a POSIX-compliant enterprise cryptographic
 	  filesystem for Linux. It is stacked on top of any other
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 4ef3a51..a44bf8a 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBNSPR
 	bool "libnspr"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_arc
+	depends on !BR2_arc && !BR2_xtensa
 	help
 	  NSPR is the Netscape Portable Runtime library which provides
 	  a platform-neutral API for system level and libc like
@@ -12,5 +12,5 @@ config BR2_PACKAGE_LIBNSPR
 	  http://www.mozilla.org/projects/nspr/
 
 comment "libnspr needs a toolchain w/ largefile, threads"
-	depends on !BR2_arc
+	depends on !BR2_arc && !BR2_xtensa
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 88b1fde..f0c90ed 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
-	depends on !BR2_arc # libnspr
+	depends on !BR2_arc && !BR2_xtensa # libnspr
 	help
 	  Network Security Services (NSS) is a set of libraries designed
 	  to support development of security-enabled client and server
@@ -16,6 +16,6 @@ config BR2_PACKAGE_LIBNSS
 	  http://www.mozilla.org/projects/security/pki/nss/
 
 comment "libnss needs a toolchain w/ largefile, threads"
-	depends on !BR2_arc
+	depends on !BR2_arc && !BR2_xtensa
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
-- 
1.8.4.3
