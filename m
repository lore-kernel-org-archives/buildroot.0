From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 21 Feb 2013 21:03:26 +0200
Subject: [Buildroot] [PATCH] new package: gnome-keyring
Message-ID: <1361473406-5765-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GNOME Keyring

GNOME Keyring is a collection of components in GNOME that store secrets,
passwords, keys, certificates and makes them available to applications.

GNOME Keyring is integrated with the user's login, so that their secret
storage can be unlocked when the user's logins into their session.

GNOME Keyring is based around a standard called PKCS#11 which is a standard
way for applications to manage certificates and keys on smart cards or secure
storage.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                      |    1 +
 package/gnome-keyring/Config.in        |   24 ++++++++++++++++++++++++
 package/gnome-keyring/gnome-keyring.mk |   22 ++++++++++++++++++++++
 3 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 package/gnome-keyring/Config.in
 create mode 100644 package/gnome-keyring/gnome-keyring.mk

diff --git a/package/Config.in b/package/Config.in
index b2b580b..55c99bb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -169,6 +169,7 @@ source "package/feh/Config.in"
 source "package/freerdp/Config.in"
 source "package/gqview/Config.in"
 source "package/gmpc/Config.in"
+source "package/gnome-keyring/Config.in"
 source "package/gob2/Config.in"
 source "package/gtkperf/Config.in"
 source "package/leafpad/Config.in"
diff --git a/package/gnome-keyring/Config.in b/package/gnome-keyring/Config.in
new file mode 100644
index 0000000..a29fa9f
--- /dev/null
+++ b/package/gnome-keyring/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_GNOME_KEYRING
+	bool "gnome-keyring"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_GCONF
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LINUX_PAM
+	select BR2_PACKAGE_LIBTASN1
+	select BR2_PACKAGE_LIBGCRYPT
+	help
+	  GNOME Keyring is a collection of components in GNOME that store 
+	  secrets, passwords, kets, certificates  and make them available
+	  to applications.
+
+	  GNOME Keyring is integrated with the user's login, so that their
+	  secret storage can be unlocked when the user logins into their
+	  session.
+
+	  GNOME Keyring is based around a standard called PKCS#11,
+	  which is a standard way for applications to manage
+	  certificates and keys on smart cards or secure storage
+
+	  https://live.gnome.org/GnomeKeyring
+
diff --git a/package/gnome-keyring/gnome-keyring.mk b/package/gnome-keyring/gnome-keyring.mk
new file mode 100644
index 0000000..4daa204
--- /dev/null
+++ b/package/gnome-keyring/gnome-keyring.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# gnome-keyring
+#
+#############################################################
+
+GNOME_KEYRING_MAJOR_VERSION = 2.28
+GNOME_KEYRING_MINOR_VERSION = 2
+GNOME_KEYRING_VERSION = $(GNOME_KEYRING_MAJOR_VERSION).$(GNOME_KEYRING_MINOR_VERSION)
+GNOME_KEYRING_SOURCE = gnome-keyring-$(GNOME_KEYRING_VERSION).tar.bz2
+GNOME_KEYRING_SITE = http://ftp.gnome.org/pub/gnome/sources/gnome-keyring/$(GNOME_KEYRING_MAJOR_VERSION)
+GNOME_KEYRING_DEPENDENCIES += dbus linux-pam libtasn1 libgcrypt gconf \
+			      libglib2 libgtk2
+GNOME_KEYRING_CONF_OPT += --with-pam-dir=/lib/security \
+			  --with-root-certs=/etc/ssl/certs
+GNOME_KEYRING_AUTORECONF = YES
+GNOME_KEYRING_INSTALL_STAGING = YES
+GNOME_KEYRING_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
+			 ASN1PARSER=$(STAGING_DIR)/usr/bin/asn1Parser \
+			 ac_cv_file__dev_random=yes
+
+$(eval $(autotools-package))
-- 
1.7.7.6
