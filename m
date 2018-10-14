From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Oct 2018 11:02:00 +0200
Subject: [Buildroot] [PATCH v3 8/9] package/libpjsip: add optional
 dependency to libgsm
In-Reply-To: <20181014090202.31122-1-bernd.kuhls@t-online.de>
References: <20181014090202.31122-1-bernd.kuhls@t-online.de>
Message-ID: <20181014090202.31122-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: initial revision

 package/libpjsip/libpjsip.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 46f07a4f6b..5f5f1f5081 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -39,7 +39,6 @@ LIBPJSIP_CONF_ENV = \
 
 LIBPJSIP_CONF_OPTS = \
 	--disable-sound \
-	--disable-gsm-codec \
 	--disable-resample \
 	--disable-video \
 	--disable-opencore-amr \
@@ -67,6 +66,16 @@ LIBPJSIP_CONF_OPTS = \
 # so we want to use it.
 LIBPJSIP_CONF_OPTS += --enable-epoll
 
+ifeq ($(BR2_PACKAGE_LIBGSM),y)
+LIBPJSIP_CONF_OPTS += \
+	--enable-gsm-codec \
+	--with-external-gsm
+LIBPJSIP_DEPENDENCIES += libgsm
+else
+LIBPJSIP_CONF_OPTS += \
+	--disable-gsm-codec
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 LIBPJSIP_DEPENDENCIES += libopenssl
 LIBPJSIP_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
-- 
2.19.1
