From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sun, 11 Jun 2017 23:58:54 +0200
Subject: [Buildroot] [PATCH] [PATCH v2] azure-iot-sdk-c: New package
Message-ID: <1497218334-3943-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v2: Rework the package with help from Arnouts comments
Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/azure-iot-sdk-c/Config.in          | 16 ++++++++++
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 51 ++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 package/azure-iot-sdk-c/Config.in
 create mode 100644 package/azure-iot-sdk-c/azure-iot-sdk-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1e87d3a..edc23c9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -76,6 +76,7 @@ N:	Anders Darander <anders@chargestorm.se>
 F:	package/ktap/
 
 N:	Andr? Hentschel <nerv@dawncrow.de>
+F:	package/azure-iot-sdk-c/
 F:	package/openal/
 F:	package/p7zip/
 F:	package/wine/
diff --git a/package/Config.in b/package/Config.in
index e00b162..a56520b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1247,6 +1247,7 @@ menu "Networking"
 	source "package/alljoyn-base/Config.in"
 	source "package/alljoyn-tcl/Config.in"
 	source "package/alljoyn-tcl-base/Config.in"
+	source "package/azure-iot-sdk-c/Config.in"
 	source "package/batman-adv/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
diff --git a/package/azure-iot-sdk-c/Config.in b/package/azure-iot-sdk-c/Config.in
new file mode 100644
index 0000000..9fb956a
--- /dev/null
+++ b/package/azure-iot-sdk-c/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_AZURE_IOT_SDK_C
+	bool "azure-iot-sdk-c"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Microsoft Azure IoT Hub device SDK for C is used
+	  to connect devices running C code to Azure IoT Hub.
+
+	  https://docs.microsoft.com/nl-nl/azure/iot-hub/iot-hub-device-sdk-c-intro
+
+comment "azure-iot-sdk-c needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
new file mode 100644
index 0000000..dbdef3e
--- /dev/null
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# azure-iot-sdk-c
+#
+################################################################################
+
+AZURE_IOT_SDK_C_VERSION = 2017-05-05
+AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
+AZURE_IOT_SDK_C_SITE_METHOD = git
+AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
+AZURE_IOT_SDK_C_LICENSE = MIT
+AZURE_IOT_SDK_C_LICENSE_FILES = LICENSE
+AZURE_IOT_SDK_C_INSTALL_STAGING = YES
+AZURE_IOT_SDK_C_DEPENDENCIES = libxml2 openssl libcurl util-linux
+AZURE_IOT_SDK_C_CONF_OPTS = -Dskip_samples=ON
+
+# The project only supports building one kind of library.
+# Further the install target installs the wrong files, so we do it here:
+ifeq ($(BR2_STATIC_LIBS),y)
+AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.a c-utility/libaziotsharedutil.a \
+	iothub_client/libiothub_client.a iothub_client/libiothub_client_mqtt_ws_transport.a \
+	iothub_client/libiothub_client_amqp_ws_transport.a \
+	iothub_client/libiothub_client_http_transport.a \
+	iothub_client/libiothub_client_amqp_transport.a \
+	iothub_client/libiothub_client_mqtt_transport.a \
+	iothub_service_client/libiothub_service_client.a serializer/libserializer.a umqtt/libumqtt.a
+else
+AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.so c-utility/libaziotsharedutil.so \
+	iothub_client/libiothub_client.so iothub_client/libiothub_client_mqtt_ws_transport.so \
+	iothub_client/libiothub_client_amqp_ws_transport.so \
+	iothub_client/libiothub_client_http_transport.so \
+	iothub_client/libiothub_client_amqp_transport.so \
+	iothub_client/libiothub_client_mqtt_transport.so \
+	iothub_service_client/libiothub_service_client.so serializer/libserializer.so umqtt/libumqtt.so
+endif
+
+define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
+	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
+		$(INSTALL) -D -m 0755 $(@D)/$(l) $(STAGING_DIR)/usr/lib/
+	)
+	cp -a $(@D)/c-utility/inc/* $(STAGING_DIR)/usr/include/
+	cp -a $(@D)/iothub_client/inc/* $(STAGING_DIR)/usr/include/
+endef
+
+define AZURE_IOT_SDK_C_INSTALL_TARGET_CMDS
+	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
+		$(INSTALL) -D -m 0755 $(@D)/$(l) $(TARGET_DIR)/usr/lib/
+	)
+endef
+
+$(eval $(cmake-package))
-- 
2.7.4
