From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 21:53:04 +0200
Subject: [Buildroot] [git commit] package/paho-mqtt-c: drop dynamic library
 dependency
Message-ID: <20200620195127.59A9E82610@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddde40f371d8fb1db2eb03d2b736ee773e086a17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

paho-mqtt-c can be built statically since version 1.3.3 and
https://github.com/eclipse/paho.mqtt.c/commit/f1459fac2532658a04962ae0ab67b5c3dc92ad75

See https://github.com/eclipse/paho.mqtt.c/issues/848

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/janus-gateway/Config.in    |  5 ++---
 package/paho-mqtt-c/Config.in      |  5 ++---
 package/paho-mqtt-c/paho-mqtt-c.mk | 14 ++++++++++++++
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index fc32546717..136e6f0b20 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -59,12 +59,11 @@ comment "transports"
 
 config BR2_PACKAGE_JANUS_GATEWAY_MQTT
 	bool "MQTT"
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_PAHO_MQTT_C
 
-comment "MQTT transport needs a toolchain w/ threads and dynamic library support"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+comment "MQTT transport needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_JANUS_GATEWAY_RABBITMQ
 	bool "RabbitMQ"
diff --git a/package/paho-mqtt-c/Config.in b/package/paho-mqtt-c/Config.in
index 3560d8c08c..0f4b2a29b2 100644
--- a/package/paho-mqtt-c/Config.in
+++ b/package/paho-mqtt-c/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_PAHO_MQTT_C
 	bool "paho-mqtt-c"
-	depends on !BR2_STATIC_LIBS  # dlopen()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  MQTT client C library
 
 	  https://eclipse.org/paho/clients/c/
 
-comment "paho-mqtt-c needs a toolchain w/ threads and dynamic library support"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+comment "paho-mqtt-c needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index aa2a0b026e..984c512bbc 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -22,4 +22,18 @@ else
 PAHO_MQTT_C_CONF_OPTS += -DPAHO_WITH_SSL=FALSE
 endif
 
+ifeq ($(BR2_SHARED_LIBS),y)
+PAHO_MQTT_C_CONF_OPTS += \
+	-DPAHO_BUILD_SHARED=TRUE \
+	-DPAHO_BUILD_STATIC=FALSE
+else ifeq ($(BR2_STATIC_LIBS),y)
+PAHO_MQTT_C_CONF_OPTS += \
+	-DPAHO_BUILD_SHARED=FALSE \
+	-DPAHO_BUILD_STATIC=TRUE
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+PAHO_MQTT_C_CONF_OPTS += \
+	-DPAHO_BUILD_SHARED=TRUE \
+	-DPAHO_BUILD_STATIC=TRUE
+endif
+
 $(eval $(cmake-package))
