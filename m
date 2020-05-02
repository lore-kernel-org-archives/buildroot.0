From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 May 2020 22:04:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: fix build on musl
Message-ID: <20200502200444.3390908-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set PAHO_HIGH_PERFORMANCE to disable free redefiniton as suggested by
upstream in https://github.com/eclipse/paho.mqtt.c/issues/846.

This will avoid the following build failure on musl:

/tmp/instance-1/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/sched.h:80:17: error: expected declaration specifiers or '...' before string constant
 void free(void *);
                 ^
/tmp/instance-1/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/sched.h:80:17: error: expected declaration specifiers or '...' before numeric constant
 void free(void *);
                 ^
[ 35%] Building C object src/CMakeFiles/common_obj.dir/Base64.c.o
[ 36%] Building C object src/CMakeFiles/common_obj.dir/SHA1.c.o
make[3]: *** [src/CMakeFiles/common_obj.dir/build.make:284: src/CMakeFiles/common_obj.dir/MQTTReasonCodes.c.o] Error 1

Fixes:
 - http://autobuild.buildroot.org/results//fbe57a1602fed331ddff3ff3560dce02573816ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/paho-mqtt-c/paho-mqtt-c.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 6a6b5f3d64..c7ecf412cd 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -12,7 +12,8 @@ PAHO_MQTT_C_INSTALL_STAGING = YES
 
 PAHO_MQTT_C_CONF_OPTS = \
 	-DPAHO_ENABLE_TESTING=FALSE \
-	-DPAHO_ENABLE_CPACK=FALSE
+	-DPAHO_ENABLE_CPACK=FALSE \
+	-DPAHO_HIGH_PERFORMANCE=TRUE
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PAHO_MQTT_C_DEPENDENCIES += openssl
-- 
2.26.2
