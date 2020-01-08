From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jan 2020 17:46:07 +0100
Subject: [Buildroot] [git commit] package/bluez-alsa: bump to version 2.0.0
Message-ID: <20200108164457.3813584055@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97fb35a2ed83a8ec6df9b897deaf98177d33b8e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 2.0.0 adds support for MP3 with lame and full MPEG support with
mpg123, both optional.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bluez-alsa/bluez-alsa.hash |  2 +-
 package/bluez-alsa/bluez-alsa.mk   | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

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
index 4552be82f3..5c07a1a5e8 100644
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
@@ -32,6 +32,20 @@ else
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
