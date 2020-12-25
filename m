From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 25 Dec 2020 22:50:32 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/mosquitto: fix static build with cjson
Message-ID: <20201225215032.3796886-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/98e0bccf3e1a964bb6a52265bd6f11a681ec220d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Korsgaard):
 - Use CLIENT_STATIC_LDADD instead of adding -lcjson to CLIENT_LDFLAGS
   in config.mk

 package/mosquitto/mosquitto.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 0db78a384a..74fd7401da 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -11,6 +11,7 @@ MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
 MOSQUITTO_INSTALL_STAGING = YES
 
 MOSQUITTO_MAKE_OPTS = \
+	CLIENT_STATIC_LDADD="$(MOSQUITTO_STATIC_LIBS)" \
 	UNAME=Linux \
 	STRIP=true \
 	prefix=/usr \
@@ -50,9 +51,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MOSQUITTO_DEPENDENCIES += host-pkgconf openssl
-MOSQUITTO_MAKE_OPTS += \
-	WITH_TLS=yes \
-	CLIENT_STATIC_LDADD="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
+MOSQUITTO_MAKE_OPTS += WITH_TLS=yes
+MOSQUITTO_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 else
 MOSQUITTO_MAKE_OPTS += WITH_TLS=no
 endif
@@ -60,6 +60,7 @@ endif
 ifeq ($(BR2_PACKAGE_CJSON),y)
 MOSQUITTO_DEPENDENCIES += cjson
 MOSQUITTO_MAKE_OPTS += WITH_CJSON=yes
+MOSQUITTO_STATIC_LIBS += -lcjson
 else
 MOSQUITTO_MAKE_OPTS += WITH_CJSON=no
 endif
-- 
2.29.2
