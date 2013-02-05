From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 11:45:28 +0100
Subject: [Buildroot] [git commit] Revert "gnutls: make it non-wchar friendly"
Message-ID: <20130205111041.094D49A972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68c3f5257d94d0fc0437747014f3c1ff4d02aa8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit f1b86cef9884894df26ed25efaabe254f8f0754b

While the fix makes gnutls build without wchar, it doesn't actually work as
there's no rpl_wctomb implementation so the .so ends up with an undefined
reference to wctomb:

./host/usr/bin/arm-linux-nm -D staging/usr/lib/libgnutls.so.28|grep wctomb
         U wctomb

Causing linker errors for packages trying to use it:

  CCLD   msmtp
host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgnutls.so:
undefined reference to `wctomb'
collect2: ld returned 1 exit status

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/Config.in         |    2 +-
 package/gnutls/Config.in          |    6 +++---
 package/libmicrohttpd/Config.in   |    4 ++++
 package/libsoup/Config.in         |    2 +-
 package/network-manager/Config.in |    2 +-
 5 files changed, 10 insertions(+), 6 deletions(-)

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
index c2ff4ed..3a34c48 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	select BR2_PACKAGE_NETTLE
+	depends on BR2_USE_WCHAR
 	help
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
@@ -9,10 +10,9 @@ config BR2_PACKAGE_GNUTLS
 
 config BR2_PACKAGE_GNUTLS_TOOLS
 	bool "install tools"
-	depends on BR2_PACKAGE_GNUTLS
 	depends on BR2_USE_WCHAR
 	help
 	  Install GnuTLS command line tools for various cryptographic tasks.
 
-comment "gnutls tools requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_GNUTLS && !BR2_USE_WCHAR
+comment "gnutls requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
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
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 9b84083..cc33a1d 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_DBUS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
-	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS_GLIB
