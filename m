From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 27 Nov 2013 17:48:39 +0200
Subject: [Buildroot] [PATCH v3 1/2] libnspr: Add dependency on !BR2_xtensa
	and !BR2_bfin
Message-ID: <3b85e7b21185d25eb6f40c25ac1402aa08b1bfeb.1385567320.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Chris Zankel <chris@zankel.net>

Xtensa is not yet supported in libnspr. Also add dependencies to libnss,
which requires libnspr, and ecryptfs-utils, which requires libnss.

Fixes (xtensa)
http://autobuild.buildroot.net/results/14b/14ba6426edbffa100de924aa69157b3f59368ff2/

Fixes (blackfin)
http://autobuild.buildroot.net/results/dd3/dd353703ed94cec48cd126d80cd2f1b039811be4/

[baruch: fix summary, add autobuild reference, add comment dependency,
 add blackfin]

Signed-off-by: Chris Zankel <chris@zankel.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---

v3:
	Move the list of arch dependencies to a separate config symbol to reduce
	the churn when arch dependencies changes (Thomas Petazzoni)

	Add blackfin to the not-supported list
---
 package/ecryptfs-utils/Config.in | 2 +-
 package/libnspr/Config.in        | 8 ++++++--
 package/libnss/Config.in         | 4 ++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 480aedd..4b34e0f 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on !BR2_avr32 && !BR2_microblaze # keyutils
 	depends on BR2_LARGEFILE # libnss
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
-	depends on !BR2_arc # libnss -> libnspr
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	help
 	  eCryptfs is a POSIX-compliant enterprise cryptographic
 	  filesystem for Linux. It is stacked on top of any other
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 4ef3a51..1d73287 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
+	def_bool y
+	depends on !BR2_arc && !BR2_xtensa && !BR2_bfin
+
 config BR2_PACKAGE_LIBNSPR
 	bool "libnspr"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_arc
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	help
 	  NSPR is the Netscape Portable Runtime library which provides
 	  a platform-neutral API for system level and libc like
@@ -12,5 +16,5 @@ config BR2_PACKAGE_LIBNSPR
 	  http://www.mozilla.org/projects/nspr/
 
 comment "libnspr needs a toolchain w/ largefile, threads"
-	depends on !BR2_arc
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 88b1fde..77128f6 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
-	depends on !BR2_arc # libnspr
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
 	help
 	  Network Security Services (NSS) is a set of libraries designed
 	  to support development of security-enabled client and server
@@ -16,6 +16,6 @@ config BR2_PACKAGE_LIBNSS
 	  http://www.mozilla.org/projects/security/pki/nss/
 
 comment "libnss needs a toolchain w/ largefile, threads"
-	depends on !BR2_arc
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
-- 
1.8.4.3
