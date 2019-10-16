From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 16 Oct 2019 11:55:01 +0200
Subject: [Buildroot] [PATCH] package/bluez-alsa: bump to version 2.0.0
Message-ID: <20191016095501.3829-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the bluealsa-aplay client application as a config option, as it does
not use libglib2 anymore (like the server application bluealsa), but libdbus.
Furthermore, bluealsa can be used without bluealsa-aplay.

Version 2.0.0 adds optional support for MP3 support with lame, and full MPEG
support with mpg123.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bluez-alsa/Config.in       |  6 ++++++
 package/bluez-alsa/bluez-alsa.hash |  2 +-
 package/bluez-alsa/bluez-alsa.mk   | 24 ++++++++++++++++++++++--
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
index e52933f07c..e8a0343f77 100644
--- a/package/bluez-alsa/Config.in
+++ b/package/bluez-alsa/Config.in
@@ -18,6 +18,12 @@ config BR2_PACKAGE_BLUEZ_ALSA
 
 if BR2_PACKAGE_BLUEZ_ALSA
 
+config BR2_PACKAGE_BLUEZ_ALSA_APLAY
+	bool "aplay"
+	select BR2_PACKAGE_DBUS
+	help
+	  Simple BlueALSA player.
+
 config BR2_PACKAGE_BLUEZ_ALSA_HCITOP
 	bool "hcitop"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index afc84329b3..37c4919f91 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  6287ae6135795a78470068ef9d9ea660d556cefc409905bd9211fda04d1e1f8e  bluez-alsa-1.4.0.tar.gz
+sha256  451c99c2045a1ec1ffe0d054be4774fbd01af34d6d1a2757d346d02718381697  bluez-alsa-2.0.0.tar.gz
 sha256  45fe8648faa0e735d4aaf60c32ddd37fc7f027d34ccedcf0f69d8aa961b63b25  LICENSE
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index 4552be82f3..6b04dfbc07 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ_ALSA_VERSION = 1.4.0
+BLUEZ_ALSA_VERSION = 2.0.0
 BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,v$(BLUEZ_ALSA_VERSION))
 BLUEZ_ALSA_LICENSE = MIT
 BLUEZ_ALSA_LICENSE_FILES = LICENSE
@@ -20,7 +20,6 @@ endef
 BLUEZ_ALSA_POST_PATCH_HOOKS += BLUEZ_ALSA_MKDIR_M4
 
 BLUEZ_ALSA_CONF_OPTS = \
-	--enable-aplay \
 	--disable-debug-time \
 	--with-alsaplugindir=/usr/lib/alsa-lib \
 	--with-alsaconfdir=/usr/share/alsa
@@ -32,6 +31,20 @@ else
 BLUEZ_ALSA_CONF_OPTS += --disable-aac
 endif
 
+ifeq ($(BR2_PACKAGE_LAME),y)
+BLUEZ_ALSA_DEPENDENCIES += lame
+BLUEZ_ALSA_CONF_OPTS += --enable-mp3lame
+else
+BLUEZ_ALSA_CONF_OPTS += --disable-mp3lame
+endif
+
+ifeq ($(BR2_PACKAGE_MPG123),y)
+BLUEZ_ALSA_DEPENDENCIES += mpg123
+BLUEZ_ALSA_CONF_OPTS += --enable-mpg123
+else
+BLUEZ_ALSA_CONF_OPTS += --disable-mpg123
+endif
+
 # no build dependency, disables internal HFP in favor of oFonos HFP profile
 ifeq ($(BR2_PACKAGE_OFONO),y)
 BLUEZ_ALSA_CONF_OPTS += --enable-ofono
@@ -39,6 +52,13 @@ else
 BLUEZ_ALSA_CONF_OPTS += --disable-ofono
 endif
 
+ifeq ($(BR2_PACKAGE_BLUEZ_ALSA_APLAY),y)
+BLUEZ_ALSA_DEPENDENCIES += dbus
+BLUEZ_ALSA_CONF_OPTS += --enable-aplay
+else
+BLUEZ_ALSA_CONF_OPTS += --disable-aplay
+endif
+
 ifeq ($(BR2_PACKAGE_BLUEZ_ALSA_HCITOP),y)
 BLUEZ_ALSA_DEPENDENCIES += libbsd ncurses
 BLUEZ_ALSA_CONF_OPTS += --enable-hcitop
-- 
2.23.0
