From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jun 2018 11:43:33 +0200
Subject: [Buildroot] [git commit] gnutls: drop wchar dependency
Message-ID: <20180622094418.8D6F48155A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=694cdb9273433e8a1278e2e3bb2a7fe2004aa813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 19448f40a0 (gnutls: use included unistring unless libunistring is
selected) made libunistring an optional dependency.  So now gnutls no longer
depend on wchar.

Drop wchar dependency of libmicrohttpd and libsoup, which are gnutls
reverse dependencies that do not depend themselves on wchar.

Update the comments in libsoup and taskd; the wchar dependency is now
not due to gnutls.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/Config.in        | 5 ++---
 package/libmicrohttpd/Config.in | 5 ++---
 package/libsoup/Config.in       | 2 +-
 package/taskd/Config.in         | 2 +-
 package/vpnc/Config.in          | 5 ++---
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index ef995d21d2..61b4b239ff 100644
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
index 7f3c9bb8fd..f3386a63f2 100644
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
index 236d3c428a..f583322913 100644
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
index 19d123fb59..c068b34724 100644
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
index 6455b0d87a..b988ba342b 100644
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
