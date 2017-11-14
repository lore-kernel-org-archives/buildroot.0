From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Nov 2017 14:02:38 +0200
Subject: [Buildroot] [PATCH next v2 1/2] gnupg2: don't preserve the old gpg2
 executable name
Message-ID: <4f74cc073562f0ae1d00bdb8b49fb13151a6cf20.1510660959.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit e82fadab236a (gnupg2: bump to version 2.2.0) added a configure
option to keep the old 'gpg2' executable name to avoid conflict with the
gnupg package. It turns out that gnupg depends on !BR2_PACKAGE_GNUPG2
since commit 2cadb26e6d4 (gnupg: make gnupg and gnupg2 mutually
exclusive). Drop this configure option.

Rename the config option that controls the removal of gpgv2, now gpgv,
to match the new name. Add legacy config symbol handling.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: move legacy entry to 2018.02
---
 Config.in.legacy         | 11 +++++++++++
 package/gnupg2/Config.in |  6 +++---
 package/gnupg2/gnupg2.mk | 10 ++++------
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 35a6d6e1fe74..c8db9fac42e9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -142,6 +142,17 @@ comment "build, or run, in unpredictable ways.               "
 comment "----------------------------------------------------"
 endif
 
+###############################################################################
+comment "Legacy options removed in 2018.02"
+
+config BR2_PACKAGE_GNUPG2_GPGV2
+	bool "gnupg2 gpgv2 option removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GNUPG2_GPGV
+	help
+	  The gpgv2 executable is now named gpgv. The config option
+	  has been renamed accordingly.
+
 ###############################################################################
 comment "Legacy options removed in 2017.11"
 
diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index c28708965780..ef1817ef02dc 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -28,10 +28,10 @@ config BR2_PACKAGE_GNUPG2
 
 if BR2_PACKAGE_GNUPG2
 
-config BR2_PACKAGE_GNUPG2_GPGV2
-	bool "gpgv2"
+config BR2_PACKAGE_GNUPG2_GPGV
+	bool "gpgv"
 	help
-	  gpgv2 is an OpenPGP signature verification tool.
+	  gpgv is an OpenPGP signature verification tool.
 
 	  This program is actually a stripped-down version of gpg
 	  which is only able to check signatures. It is somewhat
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 0466ed633f25..f5fcb15e369b 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -12,9 +12,7 @@ GNUPG2_LICENSE_FILES = COPYING
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
 
-# Keep the gpg2 binary name to avoid conflict with gnupg
 GNUPG2_CONF_OPTS = \
-	--enable-gpg-is-gpg2 \
 	--disable-rpath --disable-regex --disable-doc \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
@@ -22,11 +20,11 @@ GNUPG2_CONF_OPTS = \
 	--with-ksba-prefix=$(STAGING_DIR)/usr \
 	--with-npth-prefix=$(STAGING_DIR)/usr
 
-ifneq ($(BR2_PACKAGE_GNUPG2_GPGV2),y)
-define GNUPG2_REMOVE_GPGV2
-	rm -f $(TARGET_DIR)/usr/bin/gpgv2
+ifneq ($(BR2_PACKAGE_GNUPG2_GPGV),y)
+define GNUPG2_REMOVE_GPGV
+	rm -f $(TARGET_DIR)/usr/bin/gpgv
 endef
-GNUPG2_POST_INSTALL_TARGET_HOOKS += GNUPG2_REMOVE_GPGV2
+GNUPG2_POST_INSTALL_TARGET_HOOKS += GNUPG2_REMOVE_GPGV
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-- 
2.15.0
