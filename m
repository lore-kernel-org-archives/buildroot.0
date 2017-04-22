From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:18:00 -0400
Subject: [Buildroot] [PATCH v2 14/25] fix ordering on configs starting with
	'n'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-14-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter n in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter n.
  
 package/neon/Config.in           |  2 +-
 package/netcat-openbsd/Config.in |  2 +-
 package/netsniff-ng/Config.in    | 10 +++++-----
 package/nfs-utils/Config.in      |  2 +-
 package/nginx/Config.in          |  4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/neon/Config.in b/package/neon/Config.in
index e76278c..9831343 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -27,8 +27,8 @@ config BR2_PACKAGE_NEON_XML
 
 config BR2_PACKAGE_NEON_EXPAT
 	bool "XML support with expat"
-	select BR2_PACKAGE_EXPAT
 	depends on !BR2_PACKAGE_NEON_LIBXML2
+	select BR2_PACKAGE_EXPAT
 	help
 	  Enable XML support in neon, using the Expat XML library.
 
diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
index 0df997c..6df87ec 100644
--- a/package/netcat-openbsd/Config.in
+++ b/package/netcat-openbsd/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_NETCAT_OPENBSD
 	bool "netcat-openbsd"
-	select BR2_PACKAGE_LIBBSD
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LIBBSD
 	help
 	  A simple Unix utility which reads and writes data across network
 	  connections using TCP or UDP protocol. It is designed to be a
diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index b59c876..c4803b2 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -1,16 +1,16 @@
 config BR2_PACKAGE_NETSNIFF_NG
 	bool "netsniff-ng"
+	# Build with uClibc fails due to missing ceill()
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBCLI
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBNET
-	# Build with uClibc fails due to missing ceill()
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	help
 	  netsniff-ng is a free, performant Linux network analyzer and
 	  networking toolkit. If you will, the Swiss army knife for
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index bfaddd1..4e13936 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -5,9 +5,9 @@ comment "nfs-utils needs a toolchain w/ threads"
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_RPCBIND # runtime
-	depends on BR2_USE_MMU # fork()
 	help
 	  The NFS Linux kernel server.
 
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index e6f2d96..36fa69c 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -141,8 +141,8 @@ config BR2_PACKAGE_NGINX_HTTP_CHARSET_MODULE
 
 config BR2_PACKAGE_NGINX_HTTP_GZIP_MODULE
 	bool "ngx_http_gzip_module"
-	select BR2_PACKAGE_ZLIB
 	default y
+	select BR2_PACKAGE_ZLIB
 	help
 	  Enable ngx_http_gzip_module
 
@@ -202,8 +202,8 @@ config BR2_PACKAGE_NGINX_HTTP_REFERER_MODULE
 
 config BR2_PACKAGE_NGINX_HTTP_REWRITE_MODULE
 	bool "ngx_http_rewrite_module"
-	select BR2_PACKAGE_PCRE
 	default y
+	select BR2_PACKAGE_PCRE
 	help
 	  Enable ngx_http_rewrite_module
 
-- 
2.9.3
