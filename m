From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 18:25:43 +0200
Subject: [Buildroot] [git commit] gnutls: requires WCHAR support
Message-ID: <20120725162729.6A24A96E6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6845c4f7103bc3d0105f25b4c02ccb5ceeb9fe80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnutls uses wctomb(), which is available only on C libraries with
wide-char support. This fixes the following build failure:

 http://autobuild.buildroot.org/results/cd4e73be80fbb64858f4cf911d2b893b0fc06465/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman/Config.in         |    2 +-
 package/gnutls/Config.in          |    4 ++++
 package/libsoup/Config.in         |    2 +-
 package/network-manager/Config.in |    2 +-
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index c9bc94f..2fcb6c1 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_IPTABLES
 	select BR2_PACKAGE_GNUTLS
 	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
-	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_INET_IPV6
 	help
 	  The Connection Manager (ConnMan) project provides a daemon for
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index cedf120..556caea 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	select BR2_PACKAGE_LIBGCRYPT
+	depends on BR2_USE_WCHAR
 	help
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
 
 	  http://www.gnu.org/software/gnutls/gnutls.html
+
+comment "gnutls requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index eee6ade..f40625d 100644
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
index fb0c0e9..a120d01 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_DBUS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
-	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_ALL_EXTRAS
