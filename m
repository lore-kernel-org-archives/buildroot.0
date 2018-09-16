From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:11:45 +0200
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.9.0
Message-ID: <20180916131636.4F76888277@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19544fc3aa46c1276445a6a04c948f8fac20dcdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.samba.org/samba/history/samba-4.9.0.html

Added optional dependency to libarchive to fix configure error:

Checking for libarchive existence
Checking for header archive.h        : no
/home/buildroot/br5/output/build/samba4-4.9.0/source3/wscript:225:
 error: libarchive support not found. Try installing libarchive-dev or
 libarchive-devel. Otherwise, use --without-libarchive to build without
 libarchive support. libarchive support is required for the smbclient
 tar-file mode

Disabled gpgme support to fix configure error:

Checking for program gpgme-config    : not found
Checking for library gpgme           : not found
Checking for gpgme_new               : not found
/home/buildroot/br5/output/build/samba4-4.9.0/source4/dsdb/samdb/ldb_modules/wscript:40:
 error: GPGME support not found. Try installing libgpgme11-dev or
 gpgme-devel and python-gpgme. Otherwise, use --without-gpgme to build
 without GPGME support or --without-ad-dc to build without the Samba AD
 DC. GPGME support is required for the GPG encrypted password sync
 feature

Buildroot has no python-gpgme package atm so we disable this option
for now.

Disabled experimental LMDB LDB backend as well, this also needed an
addition to samba4-cache.txt.

AD DC support needs jansson, for details see release notes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/Config.in        |  1 +
 package/samba4/samba4-cache.txt |  1 +
 package/samba4/samba4.hash      |  4 ++--
 package/samba4/samba4.mk        | 17 ++++++++++++++---
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 298fdc6608..4ccd22aa2d 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -30,6 +30,7 @@ if BR2_PACKAGE_SAMBA4
 config BR2_PACKAGE_SAMBA4_AD_DC
 	bool "AD DC"
 	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_JANSSON
 	help
 	  Enable Active Directory Domain Controller functionality.
 
diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
index 0485f0dbb1..e3a3720fc8 100644
--- a/package/samba4/samba4-cache.txt
+++ b/package/samba4/samba4-cache.txt
@@ -39,3 +39,4 @@ Checking value of SIGRTMAX: "64"
 Checking value of SIGRTMIN: "34"
 Checking errno of iconv for illegal multibyte sequence: "0"
 checking for clnt_create(): OK
+Checking for a 64-bit host to support lmdb: NO
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 9594c7a932..b01ece7b67 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.8.5.tar.asc
-sha256 e58ee6b1262d4128b8932ceee59d5f0b0a9bbe00547eb3cc4c41552de1a65155  samba-4.8.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.0.tar.asc
+sha256 d071e9e738e9583d0b9ce1c758d46808b76078405787c88a0c5b465bef8a9b15  samba-4.9.0.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 2db7a81df3..c7aaf6ba29 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.8.5
+SAMBA4_VERSION = 4.9.0
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
@@ -69,6 +69,13 @@ else
 SAMBA4_CONF_OPTS += --disable-gnutls
 endif
 
+ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
+SAMBA4_CONF_OPTS += --with-libarchive
+SAMBA4_DEPENDENCIES += libarchive
+else
+SAMBA4_CONF_OPTS += --without-libarchive
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 SAMBA4_CONF_ENV += NCURSES_CONFIG="$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)"
 SAMBA4_DEPENDENCIES += ncurses
@@ -108,6 +115,8 @@ define SAMBA4_CONFIGURE_CMDS
 			--disable-iprint \
 			--without-pam \
 			--without-dmapi \
+			--without-gpgme \
+			--without-ldb-lmdb \
 			--disable-glusterfs \
 			--with-cluster-support \
 			--bundled-libraries='!asn1_compile,!compile_et' \
@@ -127,8 +136,10 @@ define SAMBA4_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-ifeq ($(BR2_PACKAGE_SAMBA4_AD_DC),)
-SAMBA4_CONF_OPTS += --without-ad-dc
+ifeq ($(BR2_PACKAGE_SAMBA4_AD_DC),y)
+SAMBA4_DEPENDENCIES += jansson
+else
+SAMBA4_CONF_OPTS += --without-ad-dc --without-json-audit
 endif
 
 ifeq ($(BR2_PACKAGE_SAMBA4_ADS),y)
