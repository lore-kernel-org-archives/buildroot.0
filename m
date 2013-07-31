From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 13:49:32 +0200
Subject: [Buildroot] [git commit] libgpgme: new package
Message-ID: <20130731114959.26E369AF47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61861a2ffbcc04bc641d0e42c659bcc810eee226
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: bump version, add --with-gpg-error-prefix and
--with-libassuan-prefix options.]

Signed-off-by: Philipp Claves <claves@budelmann-elektronik.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/libgpgme/Config.in   |   11 +++++++++++
 package/libgpgme/libgpgme.mk |   23 +++++++++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b6d6020..6171693 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -418,6 +418,7 @@ source "package/cryptodev/Config.in"
 source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
+source "package/libgpgme/Config.in"
 source "package/libassuan/Config.in"
 source "package/libmcrypt/Config.in"
 source "package/libmhash/Config.in"
diff --git a/package/libgpgme/Config.in b/package/libgpgme/Config.in
new file mode 100644
index 0000000..f97a3fe
--- /dev/null
+++ b/package/libgpgme/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBGPGME
+	bool "libgpgme"
+	#gnupg is not needed to build, but at runtime.
+	select BR2_PACKAGE_GNUPG
+	select BR2_PACKAGE_LIBGPG_ERROR
+	select BR2_PACKAGE_LIBASSUAN
+	help
+	  GnuPG Made Easy (GPGME) is a library designed to make access
+	  to GnuPG easier for applications.
+
+	  http://www.gnupg.org/related_software/gpgme/
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
new file mode 100644
index 0000000..ee983df
--- /dev/null
+++ b/package/libgpgme/libgpgme.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# libgpgme
+#
+################################################################################
+
+LIBGPGME_VERSION = 1.4.2
+LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme/
+LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
+LIBGPGME_LICENSE = LGPLv2.1+
+LIBGPGME_LICENSE_FILES = COPYING.LESSER
+LIBGPGME_INSTALL_STAGING = YES
+
+# libgpgme, needs to know the gpg binary path on the target.
+LIBGPGME_CONF_OPT = --with-gpg=/usr/bin/gpg \
+	--with-gpg-error-prefix=$(STAGING_DIR)/usr \
+	--with-libassuan-prefix=$(STAGING_DIR)/usr \
+	--without-gpgsm \
+	--without-gpgconf \
+	--without-g13
+LIBGPGME_DEPENDENCIES = libassuan libgpg-error
+
+$(eval $(autotools-package))
