From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 15:17:21 +0200
Subject: [Buildroot] [git commit] package/azure-iot-sdk-c: create function
 for library installation
Message-ID: <20200413133359.7CFA68EA22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43822bb6db8851df4d6568622b58196895028f91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As a preparation for adding the creation of some symlinks, let's
factor the library installation into a function.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index e6345104eb..6781da4177 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -44,18 +44,20 @@ AZURE_IOT_SDK_C_LIBS += \
 	umqtt/libumqtt.so
 endif
 
-define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
+define AZURE_IOT_SDK_C_INSTALL_LIBS
 	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
-		$(INSTALL) -D -m 0755 $(@D)/$(l) $(STAGING_DIR)/usr/lib/$(notdir $(l))
+		$(INSTALL) -D -m 0755 $(@D)/$(l) $(1)/usr/lib/$(notdir $(l))
 	)
+endef
+
+define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
+	$(call AZURE_IOT_SDK_C_INSTALL_LIBS,$(STAGING_DIR))
 	cp -a $(@D)/c-utility/inc/* $(STAGING_DIR)/usr/include/
 	cp -a $(@D)/iothub_client/inc/* $(STAGING_DIR)/usr/include/
 endef
 
 define AZURE_IOT_SDK_C_INSTALL_TARGET_CMDS
-	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
-		$(INSTALL) -D -m 0755 $(@D)/$(l) $(TARGET_DIR)/usr/lib/$(notdir $(l))
-	)
+	$(call AZURE_IOT_SDK_C_INSTALL_LIBS,$(TARGET_DIR))
 endef
 
 $(eval $(cmake-package))
