From: Philipp Claves <claves@budelmann-elektronik.com>
Date: Fri,  1 Mar 2013 14:38:28 +0100
Subject: [Buildroot] [PATCH 2/3] Add GnuPG Made Easy (gpgme) library.
In-Reply-To: <1362145109-32509-1-git-send-email-claves@budelmann-elektronik.com>
References: <20130301111856.4753d13b@skate>
 <1362145109-32509-1-git-send-email-claves@budelmann-elektronik.com>
Message-ID: <1362145109-32509-2-git-send-email-claves@budelmann-elektronik.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philipp Claves <claves@budelmann-elektronik.com>
---
 package/Config.in            |  1 +
 package/libgpgme/Config.in   | 13 +++++++++++++
 package/libgpgme/libgpgme.mk | 17 +++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/libgpgme/Config.in
 create mode 100644 package/libgpgme/libgpgme.mk

diff --git a/package/Config.in b/package/Config.in
index a6910a3..252c306 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -379,6 +379,7 @@ source "package/beecrypt/Config.in"
 source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
+source "package/libgpgme/Config.in"
 source "package/libassuan/Config.in"
 source "package/libmcrypt/Config.in"
 source "package/libmhash/Config.in"
diff --git a/package/libgpgme/Config.in b/package/libgpgme/Config.in
new file mode 100644
index 0000000..6ebf8d2
--- /dev/null
+++ b/package/libgpgme/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBGPGME
+	bool "libgpgme"
+	#gnupg is not needed to build, but at runtime.
+	select BR2_PACKAGE_GNUPG
+	select BR2_PACKAGE_LIBGPG_ERROR
+	select BR2_PACKAGE_LIBASSUAN
+	help
+	  GnuPG Made Easy (GPGME) is a library designed to make access to GnuPG
+	  easier for applications.
+	  
+	  opkg uses libpgpme for signature verification.
+
+	  http://www.gnupg.org/related_software/gpgme/
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
new file mode 100644
index 0000000..833a83c
--- /dev/null
+++ b/package/libgpgme/libgpgme.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libgpgme
+#
+#############################################################
+
+LIBGPGME_VERSION = 1.3.2
+LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme/
+LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
+LIBGPGME_LICENSE = LGPLv2.1+
+LIBGPGME_LICENSE_FILES = COPYING.LESSER
+LIBGPGME_INSTALL_STAGING = YES
+#libgpgme, needs to know the gpg binary path on the target.
+LIBGPGME_CONF_OPT = --with-gpg=/usr/bin/gpg --without-gpgsm --without-gpgconf --without-g13
+LIBGPGME_DEPENDENCIES = libassuan libgpg-error
+
+$(eval $(autotools-package))
-- 
1.8.1.4
