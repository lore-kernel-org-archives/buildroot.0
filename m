From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Mar 2021 08:44:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/rsyslog: add imhttp support
Message-ID: <20210315074423.1530562-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

imhttp support is available since version 8.2010.0 and only depends on
civetweb:
https://github.com/rsyslog/rsyslog/commit/6102f6083cfa73fe4a91e3d34c4d1dc924465278

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsyslog/rsyslog.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index d20a13dbdd..6da2a469a9 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -30,11 +30,17 @@ RSYSLOG_CONF_OPTS += --disable-elasticsearch \
 	--disable-omhttp \
 	--disable-fmhttp \
 	--disable-imdocker \
-	--disable-imhttp \
 	--disable-impcap \
 	--disable-omhttpfs \
 	--disable-mmkubernetes
 
+ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
+RSYSLOG_DEPENDENCIES += civetweb
+RSYSLOG_CONF_OPTS += --enable-imhttp
+else
+RSYSLOG_CONF_OPTS += --disable-imhttp
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 RSYSLOG_DEPENDENCIES += gnutls
 RSYSLOG_CONF_OPTS += --enable-gnutls
-- 
2.30.0
