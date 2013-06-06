From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 15:02:38 +0200
Subject: [Buildroot] [git commit] Revert "gnutls: wchar only needed for
	tools"
Message-ID: <20130606130642.066649A988@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=669de89be785f83ae4840b0ba3983d044e374172
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7672b1235d8f786938af66068c1c1da8a766bb38.

It turns out that libgnutls.so ends up with a reference to wctomb() on
uClibc, as uClibc doesn't have vasnprintf so gnutls builds its internal
gnulib version of it, referencing wctomb().

Fix it by going back to requiring wchar for the base gnutls library as well.

Fixes http://autobuild.buildroot.net/results/780/780e825e56dc78f1ea347ca462e2e31044428775/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/Config.in       |    2 +-
 package/gnutls/Config.in        |    9 +++------
 package/libmicrohttpd/Config.in |    4 ++++
 package/libsoup/Config.in       |    2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 4c9741b..93f9ab5 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_IPTABLES
 	select BR2_PACKAGE_GNUTLS
 	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
-	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index a4eaa98..f699af7 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -2,21 +2,18 @@ config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_PCRE
+	depends on BR2_USE_WCHAR
 	help
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
 
 	  http://www.gnutls.org
 
-if BR2_PACKAGE_GNUTLS
-
 config BR2_PACKAGE_GNUTLS_TOOLS
 	bool "install tools"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_GNUTLS
 	help
 	  Install GnuTLS command line tools for various cryptographic tasks.
 
-comment "gnutls tools requires a toolchain with WCHAR support"
+comment "gnutls requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
-
-endif
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 4e78a99..2e4de0f 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBMICROHTTPD
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
        bool "https support"
        depends on BR2_PACKAGE_LIBMICROHTTPD
+       depends on BR2_USE_WCHAR
        select BR2_PACKAGE_GNUTLS
        select BR2_PACKAGE_LIBGCRYPT
        help
@@ -17,3 +18,6 @@ config BR2_PACKAGE_LIBMICROHTTPD_SSL
 
 comment "libmicrohttpd needs a toolchain with thread support"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libmicrohttpd https support needs a toolchain with wchar support"
+	depends on BR2_PACKAGE_LIBMICROHTTPD && !BR2_USE_WCHAR
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index c3b4ceb..57b425f 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_USE_WCHAR # glib2 and gnutls
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
