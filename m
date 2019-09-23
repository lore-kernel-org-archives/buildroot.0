From: stephan.hoffmann at ext.grandcentrix.net <stephan.hoffmann@ext.grandcentrix.net>
Date: Mon, 23 Sep 2019 13:52:06 +0200
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: fix missing libraries
Message-ID: <20190923115206.4468-1-stephan.hoffmann@ext.grandcentrix.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>

libparson.so and libumqtt.so.1 are missing.

The package builds libparson, but does not install it.
It also does not install the symlinks for libumqtt.so.1.1.11.

Signed-off-by: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 8b3f670399..0cf16ad371 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -17,27 +17,38 @@ AZURE_IOT_SDK_C_CONF_OPTS = -Dskip_samples=ON
 # The project only supports building one kind of library.
 # Further the install target installs the wrong files, so we do it here:
 ifeq ($(BR2_STATIC_LIBS),y)
-AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.a c-utility/libaziotsharedutil.a \
-	iothub_client/libiothub_client.a iothub_client/libiothub_client_mqtt_ws_transport.a \
+AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.a \
+	c-utility/libaziotsharedutil.a \
+	iothub_client/libiothub_client.a \
+	iothub_client/libiothub_client_mqtt_ws_transport.a \
 	iothub_client/libiothub_client_amqp_ws_transport.a \
 	iothub_client/libiothub_client_http_transport.a \
 	iothub_client/libiothub_client_amqp_transport.a \
 	iothub_client/libiothub_client_mqtt_transport.a \
-	iothub_service_client/libiothub_service_client.a serializer/libserializer.a umqtt/libumqtt.a
+	iothub_service_client/libiothub_service_client.a \
+	serializer/libserializer.a \
+	umqtt/libumqtt.a \
+	libparson.a
 else
 AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.so c-utility/libaziotsharedutil.so \
-	iothub_client/libiothub_client.so iothub_client/libiothub_client_mqtt_ws_transport.so \
+	iothub_client/libiothub_client.so \
+	iothub_client/libiothub_client_mqtt_ws_transport.so \
 	iothub_client/libiothub_client_amqp_ws_transport.so \
 	iothub_client/libiothub_client_http_transport.so \
 	iothub_client/libiothub_client_amqp_transport.so \
 	iothub_client/libiothub_client_mqtt_transport.so \
-	iothub_service_client/libiothub_service_client.so serializer/libserializer.so umqtt/libumqtt.so
+	iothub_service_client/libiothub_service_client.so \
+	serializer/libserializer.so \
+	umqtt/libumqtt.so.1.1.11 \
+	libparson.so
 endif
 
 define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
 	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
 		$(INSTALL) -D -m 0755 $(@D)/$(l) $(STAGING_DIR)/usr/lib/
 	)
+	ln -sf libumqtt.so.1.1.11 $(STAGING_DIR)/usr/lib/libumqtt.so.1
+	ln -sf libumqtt.so.1.1.11 $(STAGING_DIR)/usr/lib/libumqtt.so
 	cp -a $(@D)/c-utility/inc/* $(STAGING_DIR)/usr/include/
 	cp -a $(@D)/iothub_client/inc/* $(STAGING_DIR)/usr/include/
 endef
@@ -46,6 +57,9 @@ define AZURE_IOT_SDK_C_INSTALL_TARGET_CMDS
 	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
 		$(INSTALL) -D -m 0755 $(@D)/$(l) $(TARGET_DIR)/usr/lib/
 	)
+	ln -sf libumqtt.so.1.1.11 $(TARGET_DIR)/usr/lib/libumqtt.so.1
+	ln -sf libumqtt.so.1.1.11 $(TARGET_DIR)/usr/lib/libumqtt.so
+
 endef
 
 $(eval $(cmake-package))
-- 
2.17.1


-- 

*Azure IoT* Gold Partner ? *Azure Sphere* Elite Partner ? *Vodafone 
NB-IoT* Partner ? Apple *MFi* & *HomeKit* Developer ? *Bluetooth* SIG ? 
*zigbee* Alliance ? *LoRa* Alliance ? *Thread* Group


grandcentrix GmbH???
Holzmarkt 1???50676 *K?ln*?|?Phoenixseestrasse 18???44263 *Dortmund*???
Deutschland
| t <https://twitter.com/grandcentrix> | f 
<https://www.facebook.com/GrandCentrix/> | in 
<https://www.linkedin.com/company/grandcentrix> | phone: +49-221-677-860-0 
|?email: hello at grandcentrix.net <mailto:hello@grandcentrix.net>



Amtsgericht K?ln | HRB ?70119 | Gesch?ftsf?hrer: R. Rottmann, M. Willnow | 
USt.-IdNr.: DE266333969
