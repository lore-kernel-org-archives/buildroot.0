From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 22 Jun 2018 08:38:41 +0300
Subject: [Buildroot] [PATCH] gnutls: drop wchar dependency
Message-ID: <0498bce769c634b0718a5b0ce7337581d611c63e.1529645921.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 19448f40a0 (gnutls: use included unistring unless libunistring is
selected) made libunistring and optional dependency. So now gnutls need
no longer depend on wchar.

Drop wchar dependency of libmicrohttpd and libsoup, which are gnutls
reverse dependencies that do not depend themselves on wchar.

Update the comments in libsoup and taskd; the wchar dependency is now
not due to gnutls.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnutls/Config.in        | 5 ++---
 package/libmicrohttpd/Config.in | 5 ++---
 package/libsoup/Config.in       | 2 +-
 package/taskd/Config.in         | 2 +-
 package/vpnc/Config.in          | 5 ++---
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index ef995d21d2e0..61b4b239ff82 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	# https://gitlab.com/gnutls/gnutls/issues/203
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_PCRE
@@ -24,5 +23,5 @@ config BR2_PACKAGE_GNUTLS_TOOLS
 
 endif
 
-comment "gnutls needs a toolchain w/ wchar, dynamic library"
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+comment "gnutls needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 7f3c9bb8fda0..f3386a63f272 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -12,13 +12,12 @@ if BR2_PACKAGE_LIBMICROHTTPD
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
 	bool "https support"
 	depends on !BR2_STATIC_LIBS # gnutls
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GNUTLS
 	help
 	  Enable HTTPS (SSL) support.
 
-comment "libmicrohttpd https support needs a toolchain w/ wchar, dynamic library"
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+comment "libmicrohttpd https support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 endif
 
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 236d3c428a83..f5833229139a 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
-	depends on BR2_USE_WCHAR # glib2 and gnutls
+	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/taskd/Config.in b/package/taskd/Config.in
index 19d123fb5910..c068b347242b 100644
--- a/package/taskd/Config.in
+++ b/package/taskd/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_TASKD
 	bool "taskd"
 	depends on !BR2_STATIC_LIBS # gnutls
-	depends on BR2_USE_WCHAR # gnutls
+	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_GNUTLS
diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
index 6455b0d87abe..b988ba342bef 100644
--- a/package/vpnc/Config.in
+++ b/package/vpnc/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_VPNC
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_GNUTLS
@@ -16,6 +15,6 @@ config BR2_PACKAGE_VPNC
 
 	  http://www.unix-ag.uni-kl.de/~massar/vpnc
 
-comment "vpnc needs a toolchain w/ wchar, dynamic library"
+comment "vpnc needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS
-- 
2.17.1
