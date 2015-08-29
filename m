From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 29 Aug 2015 19:42:11 +0200
Subject: [Buildroot] [PATCH] package/libnspr: disable for musl toolchains
Message-ID: <1440870131-17263-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnspr use getprotobyname_r() which is not available on musl.

Also there is another error due to missing _PR_HAVE_GETHOSTBYNAME2 define:
prnetdb.c: In function ?PR_GetIPNodeByName?:
prnetdb.c:898:2: error: #error "Unknown name-to-address translation function"
 #error "Unknown name-to-address translation function"

_PR_HAVE_GETHOSTBYNAME2 is only set in pr/include/md/_linux.h if __GLIBC__
is defined.

To conclude, libnspr is not ready for musl.
Add reverse dependency on ecryptfs-utils and libnss.

Fixes:
http://autobuild.buildroot.net/results/c75/c756f82dfc49611fa3f650d9cf2a71b59d23c3d0/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/ecryptfs-utils/Config.in | 5 +++--
 package/libnspr/Config.in        | 5 +++--
 package/libnss/Config.in         | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index cb70e00..6c7ccbd 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
 	depends on !BR2_STATIC_LIBS # libnss, keyutils
+	depends on !BR2_TOOLCHAIN_USES_MUSL # libnss -> libnspr
 	help
 	  eCryptfs is a POSIX-compliant enterprise cryptographic
 	  filesystem for Linux. It is stacked on top of any other
@@ -29,9 +30,9 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 
 	  http://ecryptfs.org
 
-comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library"
+comment "ecryptfs-utils needs a uClibc or (e)glibc toolchain w/ threads, wchar, dynamic library"
 	depends on !BR2_microblaze
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index ba1ea55..7f5b63c 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_LIBNSPR
 	bool "libnspr"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  NSPR is the Netscape Portable Runtime library which provides
 	  a platform-neutral API for system level and libc like
@@ -16,7 +17,7 @@ config BR2_PACKAGE_LIBNSPR
 
 	  http://www.mozilla.org/projects/nspr/
 
-comment "libnspr needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "libnspr needs a uClibc or (e)glibc toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
 endif
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index f07bb04..e056fe1 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBNSS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # libnspr
 	help
 	  Network Security Services (NSS) is a set of libraries designed
 	  to support development of security-enabled client and server
@@ -15,6 +16,6 @@ config BR2_PACKAGE_LIBNSS
 
 	  http://www.mozilla.org/projects/security/pki/nss/
 
-comment "libnss needs a toolchain w/ threads, dynamic library"
+comment "libnss needs a uClibc or (e)glibc toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
-- 
2.4.3
