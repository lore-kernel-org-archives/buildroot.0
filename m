From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 06:58:04 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/azure-iot-sdk-c:
 fix installation of libumqtt
Message-ID: <20200506051930.D6FA88D7AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4150265b1b6152b6f65960bf3c93deb1d0217d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Unlike the other libraries built by azure-iot-sdk-c, libumqtt follows
a regular versioning scheme. It has a libumqtt.so.1 SONAME, with
libumqtt.so.1 being a symlink to libumqtt.so.1.1.11.

However, we currently install the library itself as libumqtt.so to the
target filesystem, which is not its SONAME, which means it cannot be
found by any other library/program linked against it.

This commit fixes that by installing the library as
libumqtt.so.1.1.11, and creating the appropriate symlinks. The static
library installation is not modified.

Signed-off-by: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 570dd0c31b2149cd913866eb6777caa4a1b05a56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 6781da4177..35ddb672fb 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -41,13 +41,19 @@ AZURE_IOT_SDK_C_LIBS += \
 	iothub_client/libiothub_client_mqtt_transport.so \
 	iothub_service_client/libiothub_service_client.so \
 	serializer/libserializer.so \
-	umqtt/libumqtt.so
+	umqtt/libumqtt.so.1.1.11
+
+define AZURE_IOT_SDK_C_CREATE_SYMLINKS
+	ln -sf libumqtt.so.1.1.11 $(1)/usr/lib/libumqtt.so.1
+	ln -sf libumqtt.so.1.1.11 $(1)/usr/lib/libumqtt.so
+endef
 endif
 
 define AZURE_IOT_SDK_C_INSTALL_LIBS
 	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
 		$(INSTALL) -D -m 0755 $(@D)/$(l) $(1)/usr/lib/$(notdir $(l))
 	)
+	$(call AZURE_IOT_SDK_C_CREATE_SYMLINKS,$(1))
 endef
 
 define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
