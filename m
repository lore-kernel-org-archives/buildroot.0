From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Mar 2016 23:20:46 +0100
Subject: [Buildroot] [git commit] libcap, cdrkit, dvdrw-tools, fastd,
	squid: remove headers >= 3.0 dependency
Message-ID: <20160316224555.DA7017FE1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b80150d1374827205ad49fba2b9dfeaec437966
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the libcap package has a patch that makes it build with
kernel headers < 3.0 (which was needed for the host variant of
libcap), there is no longer a need to have a dependency on headers >=
3.0 for the target variant of libcap.

All reverse dependencies of libcap are handled in this commit, except
lxc, which will be handled in a separate commit since it needs some
special solution.

The build of all those packages has been tested with a toolchain that
uses kernel headers 2.6.32, which is the oldest that our default glibc
version accepts to use.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cdrkit/Config.in      | 5 -----
 package/dvdrw-tools/Config.in | 4 ----
 package/fastd/Config.in       | 4 +---
 package/libcap/Config.in      | 4 ----
 package/squid/Config.in       | 5 ++---
 5 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index 46c0ba9..af18ba9 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_CDRKIT
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_MMU # fork
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	bool "cdrkit"
 	help
 	  cdrkit is a suite of programs for recording CDs and DVDs,
@@ -12,7 +11,3 @@ config BR2_PACKAGE_CDRKIT
 	  extracting audio CD data, and more.
 
 	  http://www.cdrkit.org/
-
-comment "cdrkit needs a toolchain w/ headers >= 3.0"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/dvdrw-tools/Config.in b/package/dvdrw-tools/Config.in
index c9dd3dd..d4d6bd2 100644
--- a/package/dvdrw-tools/Config.in
+++ b/package/dvdrw-tools/Config.in
@@ -39,14 +39,10 @@ choice
 
 config BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND
 	bool "cdrkit"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # cdrkit
 	select BR2_PACKAGE_CDRKIT
 	help
 	  Symlink mkisofs to genisoimage from the cdrkit package.
 
-comment "cdrkit needs a toolchain w/ headers >= 3.0"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-
 config BR2_PACKAGE_DVDRW_TOOLS_XORRISO_BACKEND
 	bool "xorriso"
 	select BR2_PACKAGE_XORRISO
diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 55bdbd6..546d449 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_FASTD
 	bool "fastd"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	depends on !BR2_STATIC_LIBS # libuecc
 	select BR2_PACKAGE_LIBUECC
 	select BR2_PACKAGE_LIBSODIUM
@@ -24,8 +23,7 @@ config BR2_PACKAGE_FASTD_STATUS_SOCKET
 
 endif
 
-comment "fastd needs a toolchain w/ threads, headers >= 3.0, dynamic library"
+comment "fastd needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
 		|| BR2_STATIC_LIBS
diff --git a/package/libcap/Config.in b/package/libcap/Config.in
index 2e3c8d9..5b0c827 100644
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBCAP
 	bool "libcap"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # XATTR_NAME_CAPS
 	help
 	  This library implements the user-space interfaces to the
 	  POSIX 1003.1e capabilities available in Linux kernels. These
@@ -23,6 +22,3 @@ config BR2_PACKAGE_LIBCAP_TOOLS
 	  CONFIG_EXT2_FS_XATTR and CONFIG_EXT2_FS_SECURITY for ext2).
 
 endif
-
-comment "libcap needs a toolchain w/ headers >= 3.0"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/squid/Config.in b/package/squid/Config.in
index 0ab6b37..12bfe19 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,13 +1,12 @@
-comment "squid needs a toolchain w/ C++, headers >= 3.0"
+comment "squid needs a toolchain w/ C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_INSTALL_LIBSTDCPP
 	# needs fork()
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	select BR2_PACKAGE_LIBCAP
 	help
 	  Caching proxy for the Web supporting HTTP, HTTPS, FTP, and more.
