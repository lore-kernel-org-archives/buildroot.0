From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 18:48:08 -0300
Subject: [Buildroot] [PATCH 19/20] alsa-lib: bump to version 1.0.25
In-Reply-To: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331502489-5036-19-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...nline.patch => alsa-lib-avr32-bad-inline.patch} |    0
 package/multimedia/alsa-lib/alsa-lib.mk            |   12 +++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)
 rename package/multimedia/alsa-lib/{alsa-lib-1.0.18-avr32-bad-inline.patch => alsa-lib-avr32-bad-inline.patch} (100%)

diff --git a/package/multimedia/alsa-lib/alsa-lib-1.0.18-avr32-bad-inline.patch b/package/multimedia/alsa-lib/alsa-lib-avr32-bad-inline.patch
similarity index 100%
rename from package/multimedia/alsa-lib/alsa-lib-1.0.18-avr32-bad-inline.patch
rename to package/multimedia/alsa-lib/alsa-lib-avr32-bad-inline.patch
diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index aa6ca51..d02bbda 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -3,18 +3,24 @@
 # alsa-lib
 #
 #############################################################
-ALSA_LIB_VERSION = 1.0.24.1
+
+ALSA_LIB_VERSION = 1.0.25
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_INSTALL_STAGING = YES
-
 ALSA_LIB_CFLAGS=$(TARGET_CFLAGS)
-
 ALSA_LIB_CONF_OPT = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
 		    --with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
 		    --with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))" \
 		    --without-versioned
 
+# Can't build with static & shared at the same time (1.0.25+)
+ifneq ($(BR2_PREFER_STATIC),y)
+ALSA_LIB_CONF_OPT += --enable-static=no
+else
+ALSA_LIB_CONF_OPT += --enable-shared=no
+endif
+
 ifneq ($(BR2_PACKAGE_ALSA_LIB_ALOAD),y)
 ALSA_LIB_CONF_OPT += --disable-aload
 endif
-- 
1.7.3.4
