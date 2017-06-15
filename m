From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 15 Jun 2017 08:13:12 -0400
Subject: [Buildroot] [PATCH 5/7] janus-gatway: add mqtt to transport section
In-Reply-To: <20170615121314.1485-1-aduskett@codeblue.com>
References: <20170615121314.1485-1-aduskett@codeblue.com>
Message-ID: <20170615121314.1485-5-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/janus-gateway/Config.in        | 4 ++++
 package/janus-gateway/janus-gateway.mk | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 3b3d148..4122708 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -68,6 +68,10 @@ config BR2_PACKAGE_JANUS_RABBITMQ
 	bool "RabbitMQ"
 	select BR2_PACKAGE_RABBITMQ_C
 
+config BR2_PACKAGE_JANUS_MQTT
+	bool "MQTT"
+	select BR2_PACKAGE_PAHO_MQTT_C
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 6aa824e..915f812 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -104,6 +104,13 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-rabbitmq
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_MQTT),y)
+JANUS_GATEWAY_DEPENDENCIES += paho-mqtt-c
+JANUS_GATEWAY_CONF_OPTS += --enable-mqtt
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-mqtt
+endif
+
 # Parallel build broken
 JANUS_GATEWAY_MAKE = $(MAKE1)
 
-- 
2.9.4
