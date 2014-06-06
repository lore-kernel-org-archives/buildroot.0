From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 Jun 2014 14:44:27 +0100
Subject: [Buildroot] [PATCH 3/5] gnupg2: new package
In-Reply-To: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1402062269-57018-4-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/Config.in        |    1 +
 package/gnupg2/Config.in |   39 +++++++++++++++++++++++++++++++++++++++
 package/gnupg2/gnupg2.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 package/gnupg2/Config.in
 create mode 100644 package/gnupg2/gnupg2.mk

diff --git a/package/Config.in b/package/Config.in
index 56ef7ea..03d6670 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1073,6 +1073,7 @@ source "package/dialog/Config.in"
 source "package/dtach/Config.in"
 source "package/file/Config.in"
 source "package/gnupg/Config.in"
+source "package/gnupg2/Config.in"
 source "package/inotify-tools/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
new file mode 100644
index 0000000..ac2974d
--- /dev/null
+++ b/package/gnupg2/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_GNUPG2
+	bool "gnupg2"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBGPG_ERROR
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBASSUAN
+	select BR2_PACKAGE_LIBKSBA
+	select BR2_PACKAGE_PTH
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # pth
+	depends on BR2_USE_MMU # libassuan
+	help
+	  GnuPG is the GNU project's complete and free implementation
+	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
+	  to encrypt and sign your data and communication, features a
+	  versatile key management system as well as access modules
+	  for all kinds of public key directories. GnuPG, also known
+	  as GPG, is a command line tool with features for easy
+	  integration with other applications.
+
+	  http://gnupg.org/
+
+if BR2_PACKAGE_GNUPG2
+
+config BR2_PACKAGE_GNUPG2_GPGV2
+	bool "gpgv2"
+	help
+	  gpgv2 is an OpenPGP signature verification tool.
+
+	  This program is actually a stripped-down version of gpg
+	  which is only able to check signatures. It is somewhat
+	  smaller than the fully-blown gpg and uses a different (and
+	  simpler) way to check that the public keys used to make the
+	  signature are valid. There are no configuration files and
+	  only a few options are implemented.
+
+endif
+
+comment "gnupg2 depends on pth which doesn't work with uClibc"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
new file mode 100644
index 0000000..ff694e2
--- /dev/null
+++ b/package/gnupg2/gnupg2.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# gnupg2
+#
+################################################################################
+
+GNUPG2_VERSION = 2.0.23
+GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
+GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
+GNUPG2_LICENSE = GPLv3+
+GNUPG2_LICENSE_FILES = COPYING
+GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba pth
+GNUPG2_CONF_OPT = --disable-rpath --disable-regex --disable-doc
+GNUPG2_CONF_OPT += --with-libgpg-error-prefix=$(STAGING_DIR)/usr
+GNUPG2_CONF_OPT += --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+GNUPG2_CONF_OPT += --with-libassuan-prefix=$(STAGING_DIR)/usr
+GNUPG2_CONF_OPT += --with-ksba-prefix=$(STAGING_DIR)/usr
+GNUPG2_CONF_OPT += --with-pth-prefix=$(STAGING_DIR)/usr
+
+ifneq ($(BR2_PACKAGE_GNUPG2_GPGV2),y)
+define GNUPG2_REMOVE_GPGV2
+	rm -f $(TARGET_DIR)/usr/bin/gpgv2
+endef
+GNUPG2_POST_INSTALL_TARGET_HOOKS += GNUPG2_REMOVE_GPGV2
+endif
+
+$(eval $(autotools-package))
-- 
1.7.1
