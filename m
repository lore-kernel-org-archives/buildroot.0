From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 13:49:53 +0200
Subject: [Buildroot] [git commit] opkg: Add gnupg signature checking support.
Message-ID: <20130731114959.44EEA9AF55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d31db334c3ad219c5a55aece8602880c7eb732ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add ac_cv_path_GPGME_CONFIG in the configure environment to
help opkg find libgpgme.]

Signed-off-by: Philipp Claves <claves@budelmann-elektronik.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opkg/Config.in |   10 ++++++++++
 package/opkg/opkg.mk   |   10 +++++++++-
 2 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index eb997a7..5906210 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -11,3 +11,13 @@ config BR2_PACKAGE_OPKG
 
 	  http://code.google.com/p/opkg/
 
+if BR2_PACKAGE_OPKG
+
+config BR2_PACKAGE_OPKG_GPG_SIGN
+	bool "gnupg support"
+	select BR2_PACKAGE_LIBGPGME
+	help
+	  Enable opkg package signature checking support using
+	  gnupg/libgpgme.
+
+endif
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 9e1c623..5846433 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -9,7 +9,7 @@ OPKG_SOURCE = opkg-$(OPKG_VERSION).tar.gz
 OPKG_SITE = http://opkg.googlecode.com/svn/trunk/
 OPKG_SITE_METHOD = svn
 OPKG_INSTALL_STAGING = YES
-OPKG_CONF_OPT = --disable-curl --disable-gpg
+OPKG_CONF_OPT = --disable-curl
 OPKG_AUTORECONF = YES
 # Uses PKG_CHECK_MODULES() in configure.ac
 OPKG_DEPENDENCIES = host-pkgconf
@@ -19,6 +19,14 @@ define OPKG_CREATE_LOCKDIR
 	mkdir -p $(TARGET_DIR)/usr/lib/opkg
 endef
 
+ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
+OPKG_CONF_OPT += --enable-gpg
+OPKG_CONF_ENV = ac_cv_path_GPGME_CONFIG=$(STAGING_DIR)/usr/bin/gpgme-config
+OPKG_DEPENDENCIES += libgpgme
+else
+OPKG_CONF_OPT += --disable-gpg
+endif
+
 OPKG_POST_INSTALL_TARGET_HOOKS += OPKG_CREATE_LOCKDIR
 
 $(eval $(autotools-package))
