From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 21:52:13 +0100
Subject: [Buildroot] [git commit branch/next] gnupg2: don't preserve the old
 gpg2 executable name
Message-ID: <20171127205352.5F564811E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86dfb429ae1770550beb49299ef08ef05605c190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit e82fadab236a (gnupg2: bump to version 2.2.0) added a configure
option to keep the old 'gpg2' executable name to avoid conflict with the
gnupg package. It turns out that gnupg depends on !BR2_PACKAGE_GNUPG2
since commit 2cadb26e6d4 (gnupg: make gnupg and gnupg2 mutually
exclusive). Drop this configure option.

Rename the config option that controls the removal of gpgv2, now gpgv,
to match the new name. Add legacy config symbol handling.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy         | 11 +++++++++++
 package/gnupg2/Config.in |  6 +++---
 package/gnupg2/gnupg2.mk | 10 ++++------
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 35a6d6e..c8db9fa 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,17 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
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
+###############################################################################
 comment "Legacy options removed in 2017.11"
 
 config BR2_PACKAGE_RFKILL
diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index c287089..ef1817e 100644
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
index 0466ed6..f5fcb15 100644
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
