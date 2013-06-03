From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jun 2013 17:27:00 +0200
Subject: [Buildroot] [git commit] gnutls: wchar only needed for tools
Message-ID: <20130603152934.77C7A9A891@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7672b1235d8f786938af66068c1c1da8a766bb38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And adjust reverse dependencies to match.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/Config.in       |    2 +-
 package/gnutls/Config.in        |    9 ++++++---
 package/libmicrohttpd/Config.in |    4 ----
 package/libsoup/Config.in       |    2 +-
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 93f9ab5..4c9741b 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_IPTABLES
 	select BR2_PACKAGE_GNUTLS
 	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
-	depends on BR2_USE_WCHAR # libglib2 and gnutls
+	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index f699af7..a4eaa98 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -2,18 +2,21 @@ config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_PCRE
-	depends on BR2_USE_WCHAR
 	help
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
 
 	  http://www.gnutls.org
 
+if BR2_PACKAGE_GNUTLS
+
 config BR2_PACKAGE_GNUTLS_TOOLS
 	bool "install tools"
-	depends on BR2_PACKAGE_GNUTLS
+	depends on BR2_USE_WCHAR
 	help
 	  Install GnuTLS command line tools for various cryptographic tasks.
 
-comment "gnutls requires a toolchain with WCHAR support"
+comment "gnutls tools requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
+
+endif
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 2e4de0f..4e78a99 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_LIBMICROHTTPD
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
        bool "https support"
        depends on BR2_PACKAGE_LIBMICROHTTPD
-       depends on BR2_USE_WCHAR
        select BR2_PACKAGE_GNUTLS
        select BR2_PACKAGE_LIBGCRYPT
        help
@@ -18,6 +17,3 @@ config BR2_PACKAGE_LIBMICROHTTPD_SSL
 
 comment "libmicrohttpd needs a toolchain with thread support"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "libmicrohttpd https support needs a toolchain with wchar support"
-	depends on BR2_PACKAGE_LIBMICROHTTPD && !BR2_USE_WCHAR
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 57b425f..c3b4ceb 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
-	depends on BR2_USE_WCHAR # glib2 and gnutls
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
