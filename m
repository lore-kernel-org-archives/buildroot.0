From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Dec 2012 23:39:59 +0100
Subject: [Buildroot] [git commit] gnutls: make it non-wchar friendly
Message-ID: <20121226224225.769D19A496@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1b86cef9884894df26ed25efaabe254f8f0754b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make gnutls work for non-wchar toolchains.
It's just a matter of throwing a helping hand to configure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/Config.in         |    2 +-
 package/gnutls/Config.in          |    4 ----
 package/gnutls/gnutls.mk          |    5 ++++-
 package/libsoup/Config.in         |    2 +-
 package/network-manager/Config.in |    2 +-
 5 files changed, 7 insertions(+), 8 deletions(-)

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
index 556caea..cedf120 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	select BR2_PACKAGE_LIBGCRYPT
-	depends on BR2_USE_WCHAR
 	help
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
 
 	  http://www.gnu.org/software/gnutls/gnutls.html
-
-comment "gnutls requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 2634642..506d7f5 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -10,7 +10,10 @@ GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
 GNUTLS_LICENSE_FILES = COPYING lib/COPYING
 GNUTLS_DEPENDENCIES = host-pkgconf libgcrypt $(if $(BR2_PACKAGE_ZLIB),zlib)
-GNUTLS_CONF_ENV = acl_cv_rpath=no
+GNUTLS_CONF_ENV = acl_cv_rpath=no \
+	ac_cv_header_wchar_h=$(if $(BR2_USE_WCHAR),yes,no) \
+	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no) \
+	gt_cv_c_wint_t=$(if $(BR2_USE_WCHAR),yes,no)
 GNUTLS_CONF_OPT = --with-libgcrypt --without-libgcrypt-prefix \
 		--without-p11-kit --disable-rpath
 GNUTLS_INSTALL_STAGING = YES
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
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index e2324d6..f2544da 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_DBUS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
-	depends on BR2_USE_WCHAR # libglib2 and gnutls
+	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS_GLIB
