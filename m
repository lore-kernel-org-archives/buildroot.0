From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 21:19:48 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/libpjsip: add
 optional dependency on speex
Message-ID: <20181216201831.644BC8651B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00ad41c674380e3fa5159d876930423beb07a485
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b9c6b38f2a2a43900d899af356415eea746157c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index b3c439d51c..f4a57965b8 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -27,8 +27,6 @@ LIBPJSIP_CONF_ENV = \
 LIBPJSIP_CONF_OPTS = \
 	--disable-sound \
 	--disable-gsm-codec \
-	--disable-speex-codec \
-	--disable-speex-aec \
 	--disable-resample \
 	--disable-video \
 	--disable-opencore-amr \
@@ -63,6 +61,18 @@ else
 LIBPJSIP_CONF_OPTS += --disable-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
+LIBPJSIP_CONF_OPTS += \
+	--enable-speex-aec \
+	--enable-speex-codec \
+	--with-external-speex
+LIBPJSIP_DEPENDENCIES += speex speexdsp
+else
+LIBPJSIP_CONF_OPTS += \
+	--disable-speex-aec \
+	--disable-speex-codec
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 LIBPJSIP_DEPENDENCIES += util-linux
 endif
