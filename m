From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Oct 2018 11:01:59 +0200
Subject: [Buildroot] [PATCH v3 7/9] package/libpjsip: add optional
 dependency to speex
In-Reply-To: <20181014090202.31122-1-bernd.kuhls@t-online.de>
References: <20181014090202.31122-1-bernd.kuhls@t-online.de>
Message-ID: <20181014090202.31122-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: initial revision

 package/libpjsip/libpjsip.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index ab9fca5821..46f07a4f6b 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -40,8 +40,6 @@ LIBPJSIP_CONF_ENV = \
 LIBPJSIP_CONF_OPTS = \
 	--disable-sound \
 	--disable-gsm-codec \
-	--disable-speex-codec \
-	--disable-speex-aec \
 	--disable-resample \
 	--disable-video \
 	--disable-opencore-amr \
@@ -76,6 +74,18 @@ else
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
-- 
2.19.1
