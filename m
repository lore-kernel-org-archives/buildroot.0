From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Jun 2015 15:38:56 +0200
Subject: [Buildroot] [git commit] opkg: gpg support needs libgpg-error
Message-ID: <20150606133953.807FE8177E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de823a5bd3976ac9fcf039c57869ccf8e9fc0a45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1ec/1ec6990354016a740a8f54e07066e5fa4e732ab0/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opkg/Config.in |    1 +
 package/opkg/opkg.mk   |    6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index df6ebff..495ce91 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -23,6 +23,7 @@ if BR2_PACKAGE_OPKG
 config BR2_PACKAGE_OPKG_GPG_SIGN
 	bool "gnupg support"
 	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_LIBGPG_ERROR
 	help
 	  Enable opkg package signature checking support using
 	  gnupg/libgpgme.
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 5c79fc7..bcf3f78 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -22,8 +22,10 @@ endef
 
 ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
 OPKG_CONF_OPTS += --enable-gpg
-OPKG_CONF_ENV = ac_cv_path_GPGME_CONFIG=$(STAGING_DIR)/usr/bin/gpgme-config
-OPKG_DEPENDENCIES += libgpgme
+OPKG_CONF_ENV += \
+	ac_cv_path_GPGME_CONFIG=$(STAGING_DIR)/usr/bin/gpgme-config \
+	ac_cv_path_GPGERR_CONFIG=$(STAGING_DIR)/usr/bin/gpg-error-config
+OPKG_DEPENDENCIES += libgpgme libgpg-error
 else
 OPKG_CONF_OPTS += --disable-gpg
 endif
