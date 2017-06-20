From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 23:09:33 +0200
Subject: [Buildroot] [git commit] janus-gateway: add mqtt to transport
	section
Message-ID: <20170620211023.2AFE47FBE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c14c1f5e679a2009f9253d051ea6e274d54e367
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
[Thomas: propagate paho-mqtt dependencies, use alphabetic ordering.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in        | 9 +++++++++
 package/janus-gateway/janus-gateway.mk | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 7fa23ec..b0e4ae9 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -56,6 +56,15 @@ config BR2_PACKAGE_JANUS_VOICE_MAIL
 
 comment "transports"
 
+config BR2_PACKAGE_JANUS_MQTT
+	bool "MQTT"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_PAHO_MQTT_C
+
+comment "MQTT transport needs a toolchain w/ threads and dynamic library support"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_JANUS_RABBITMQ
 	bool "RabbitMQ"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 35faf77..b19ed54 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -83,6 +83,13 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-voicemail
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_MQTT),y)
+JANUS_GATEWAY_DEPENDENCIES += paho-mqtt-c
+JANUS_GATEWAY_CONF_OPTS += --enable-mqtt
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-mqtt
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_RABBITMQ),y)
 JANUS_GATEWAY_DEPENDENCIES += rabbitmq-c
 JANUS_GATEWAY_CONF_OPTS += --enable-rabbitmq
