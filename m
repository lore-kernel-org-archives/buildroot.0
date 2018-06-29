From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Jun 2018 13:44:04 +0300
Subject: [Buildroot] [PATCH] Revert "gnutls: drop wchar dependency"
Message-ID: <869c1f0ff206cd064a7a6e100e7d8f5073454360.1530269044.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 694cdb9273433e8a1278e2e3bb2a7fe2004aa813.

Just like commit 68c3f5257d94 (Revert "gnutls: make it non-wchar
friendly") before. It turns out that gnulib expects some other library
to provide a wctomb() implementation. So when the C library does not
provide one it is left as undefined symbol in libgnutls.so.

Add a comment to reduce the chance of repeating the same mistake again.

Fixes:
http://autobuild.buildroot.net/results/86f/86f08276fcb0cc557ab3cc5f57229b2c0c6ac2d7/
http://autobuild.buildroot.net/results/7c4/7c4bcb839f0ad5bc0496b4115ff391a3b312581a/
http://autobuild.buildroot.net/results/1c3/1c353f542c49bbe5520266c0ebb6a58589032453/

Reported-by: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Add a Config.in comment (Thomas P)
---
 package/gnutls/Config.in        | 7 +++++--
 package/libmicrohttpd/Config.in | 5 +++--
 package/libsoup/Config.in       | 2 +-
 package/taskd/Config.in         | 2 +-
 package/vpnc/Config.in          | 5 +++--
 5 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 61b4b239ff82..7e8dcc1e4f8b 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	# https://gitlab.com/gnutls/gnutls/issues/203
 	depends on !BR2_STATIC_LIBS
+	# gnulib requires a library that implements wctomb().
+	# This is noticed only when linking with libgnutls.so.
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_PCRE
@@ -23,5 +26,5 @@ config BR2_PACKAGE_GNUTLS_TOOLS
 
 endif
 
-comment "gnutls needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "gnutls needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index f3386a63f272..7f3c9bb8fda0 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -12,12 +12,13 @@ if BR2_PACKAGE_LIBMICROHTTPD
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
 	bool "https support"
 	depends on !BR2_STATIC_LIBS # gnutls
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GNUTLS
 	help
 	  Enable HTTPS (SSL) support.
 
-comment "libmicrohttpd https support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "libmicrohttpd https support needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 endif
 
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index f5833229139a..236d3c428a83 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_USE_WCHAR # glib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/taskd/Config.in b/package/taskd/Config.in
index c068b347242b..19d123fb5910 100644
--- a/package/taskd/Config.in
+++ b/package/taskd/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_TASKD
 	bool "taskd"
 	depends on !BR2_STATIC_LIBS # gnutls
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # gnutls
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_GNUTLS
diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
index b988ba342bef..6455b0d87abe 100644
--- a/package/vpnc/Config.in
+++ b/package/vpnc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_VPNC
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_GNUTLS
@@ -15,6 +16,6 @@ config BR2_PACKAGE_VPNC
 
 	  http://www.unix-ag.uni-kl.de/~massar/vpnc
 
-comment "vpnc needs a toolchain w/ dynamic library"
+comment "vpnc needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
-- 
2.18.0
