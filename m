From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Aug 2019 22:44:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: fix static build with
 openssl
Message-ID: <20190804204458.2385-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mosquitto library can be built statically since commit
a95bdd964761ec69a23174f5213dd54b77d0971b however build fails with
openssl because mosquitto does not use pkg-config to retrieve static
dependencies so provide them through the STATIC_LIB_DEPS variable

Fixes:
 - http://autobuild.buildroot.org/results/2ee69a5d7834c9a4845ebde801be6aa8f97cc5fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mosquitto/mosquitto.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 6de6fc804f..2643ffe018 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -48,8 +48,10 @@ MOSQUITTO_MAKE_OPTS += WITH_THREADING=no
 endif
 
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-MOSQUITTO_DEPENDENCIES += libopenssl
-MOSQUITTO_MAKE_OPTS += WITH_TLS=yes
+MOSQUITTO_DEPENDENCIES += host-pkgconf libopenssl
+MOSQUITTO_MAKE_OPTS += \
+	WITH_TLS=yes \
+	STATIC_LIB_DEPS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
 else
 MOSQUITTO_MAKE_OPTS += WITH_TLS=no
 endif
-- 
2.20.1
