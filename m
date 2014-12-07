From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:21:53 +0100
Subject: [Buildroot] [git commit] package/libnss: need dynamic library
	support
Message-ID: <20141207202159.59403800F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40a53388ea297308dbfd2397f71c935bc0515a49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/e01733c4b8c23f62e2081f0c4aadc16e22c4a2c4/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ecryptfs-utils/Config.in |    6 ++++--
 package/libnss/Config.in         |    6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 0d912c7..16c0d69 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
+	depends on !BR2_PREFER_STATIC_LIB # libnss
 	help
 	  eCryptfs is a POSIX-compliant enterprise cryptographic
 	  filesystem for Linux. It is stacked on top of any other
@@ -29,8 +30,9 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 
 	  http://ecryptfs.org
 
-comment "ecryptfs-utils needs a toolchain w/ largefile, threads, wchar"
+comment "ecryptfs-utils needs a toolchain w/ largefile, threads, wchar, dynamic library"
 	depends on !BR2_avr32 && !BR2_microblaze
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		BR2_PREFER_STATIC_LIB
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 690f928..4e8792c 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBNSS
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Network Security Services (NSS) is a set of libraries designed
 	  to support development of security-enabled client and server
@@ -15,6 +16,7 @@ config BR2_PACKAGE_LIBNSS
 
 	  http://www.mozilla.org/projects/security/pki/nss/
 
-comment "libnss needs a toolchain w/ largefile, threads"
+comment "libnss needs a toolchain w/ largefile, threads, dynamic library"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_PREFER_STATIC_LIB
