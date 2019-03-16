From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 16 Mar 2019 20:57:52 +0100
Subject: [Buildroot] [PATCH] package/bluez-alsa: bump to version 1.4.0
Message-ID: <20190316195752.25035-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:
* License file has been renamed: LICENSE.txt -> LICENSE
* Update license file hash -> List of contributors are in a seperate
file now
* Configure option `--with-alsadatadir` has been renamed to `--with-alsaconfdir`
* Configure option `--enable-pcm-test` has been removed
* New optional configure option `ofono` (no build dependency, will
disable internal HFP in favor of oFonos HFP profile)

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bluez-alsa/bluez-alsa.hash |  4 ++--
 package/bluez-alsa/bluez-alsa.mk   | 14 ++++++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index ba81eadf34..384428f880 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  29dad23877d0cf46a16e2f8d3746219e89068c33d052059caf1caaacd8b40cac  bluez-alsa-v1.3.1.tar.gz
-sha256  9a18d8b11802d0cec100839a0676a6fc48a4179f8f70b8e12a7f3d6b7a8fd70a  LICENSE.txt
+sha256  6287ae6135795a78470068ef9d9ea660d556cefc409905bd9211fda04d1e1f8e  bluez-alsa-v1.4.0.tar.gz
+sha256  45fe8648faa0e735d4aaf60c32ddd37fc7f027d34ccedcf0f69d8aa961b63b25  LICENSE
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index 5c0bb4f12b..c1806aef8b 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-BLUEZ_ALSA_VERSION = v1.3.1
+BLUEZ_ALSA_VERSION = v1.4.0
 BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,$(BLUEZ_ALSA_VERSION))
 BLUEZ_ALSA_LICENSE = MIT
-BLUEZ_ALSA_LICENSE_FILES = LICENSE.txt
+BLUEZ_ALSA_LICENSE_FILES = LICENSE
 BLUEZ_ALSA_DEPENDENCIES = alsa-lib bluez5_utils libglib2 sbc host-pkgconf
 
 # git repo, no configure
@@ -22,9 +22,8 @@ BLUEZ_ALSA_POST_PATCH_HOOKS += BLUEZ_ALSA_MKDIR_M4
 BLUEZ_ALSA_CONF_OPTS = \
 	--enable-aplay \
 	--disable-debug-time \
-	--disable-pcm-test \
 	--with-alsaplugindir=/usr/lib/alsa-lib \
-	--with-alsadatadir=/usr/share/alsa
+	--with-alsaconfdir=/usr/share/alsa
 
 ifeq ($(BR2_PACKAGE_FDK_AAC),y)
 BLUEZ_ALSA_DEPENDENCIES += fdk-aac
@@ -33,6 +32,13 @@ else
 BLUEZ_ALSA_CONF_OPTS += --disable-aac
 endif
 
+# no build dependency, disables internal HFP in favor of oFonos HFP profile
+ifeq ($(BR2_PACKAGE_OFONO),y)
+BLUEZ_ALSA_CONF_OPTS += --enable-ofono
+else
+BLUEZ_ALSA_CONF_OPTS += --disable-ofono
+endif
+
 ifeq ($(BR2_PACKAGE_BLUEZ_ALSA_HCITOP),y)
 BLUEZ_ALSA_DEPENDENCIES += libbsd ncurses
 BLUEZ_ALSA_CONF_OPTS += --enable-hcitop
-- 
2.21.0
