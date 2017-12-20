From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 Dec 2017 18:02:50 +0200
Subject: [Buildroot] [PATCH 1/2] pulseaudio: normalize alsa-lib optional
 dependency
Message-ID: <6e8f78216f2cc0177456fa5723e6ad37832833da.1513785771.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Put together alsa-lib dependency and configure option code. As a side
effect we now avoid alsa-lib dependency when the required support in
alsa is missing.

Use positive logic.

Explicitly enable alsa support when available.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/pulseaudio/pulseaudio.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index a30d5401bae2..3863557881e5 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -18,7 +18,6 @@ PULSEAUDIO_CONF_OPTS = \
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkgconf libtool libsndfile speex host-intltool \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
-	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
@@ -119,7 +118,10 @@ PULSEAUDIO_CONF_OPTS += --enable-neon-opt=no
 endif
 
 # pulseaudio alsa backend needs pcm/mixer apis
-ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
+ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
+PULSEAUDIO_DEPENDENCIES += alsa-lib
+PULSEAUDIO_CONF_OPTS += --enable-alsa
+else
 PULSEAUDIO_CONF_OPTS += --disable-alsa
 endif
 
-- 
2.15.1
