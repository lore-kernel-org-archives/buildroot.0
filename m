From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 30 Mar 2018 18:50:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: add optional support for lua
Message-ID: <20180330165036.15754-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index eaf7b9c5bf..3b39be4a40 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -40,7 +40,6 @@ APACHE_CONF_OPTS = \
 	--without-suexec-bin \
 	--enable-mods-shared=all \
 	--with-mpm=$(APACHE_MPM) \
-	--disable-lua \
 	--disable-luajit
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
@@ -57,6 +56,15 @@ APACHE_CONF_OPTS += \
 	--disable-proxy-html
 endif
 
+ifeq ($(BR2_PACKAGE_LUA),y)
+APACHE_CONF_OPTS += \
+	--enable-lua \
+	--with-lua=$(STAGING_DIR)/usr
+APACHE_DEPENDENCIES += lua
+else
+APACHE_CONF_OPTS += --disable-lua
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 APACHE_DEPENDENCIES += openssl
 APACHE_CONF_OPTS += \
-- 
2.14.2
