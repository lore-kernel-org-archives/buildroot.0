Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EED5C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Mar 2022 21:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D14E8408A4;
	Sun,  6 Mar 2022 21:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmkoYm-nmo4V; Sun,  6 Mar 2022 21:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D258D402BD;
	Sun,  6 Mar 2022 21:01:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD2DF1BF401
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 21:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B699760B7C
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 21:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iASiMoQg57r3 for <buildroot@lists.busybox.net>;
 Sun,  6 Mar 2022 21:01:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE78560B6E
 for <buildroot@buildroot.org>; Sun,  6 Mar 2022 21:01:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 36AFE82A4E; Sun,  6 Mar 2022 20:53:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Mar 2022 21:38:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acf5b437cc329a392f26e5367de1f64b3601b605
X-Git-Newrev: d1debbb4c7eb205d3ccddaa7849e3121a4929c6c
X-Patchwork-Hint: ignore
Message-Id: <20220306205305.36AFE82A4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/azure-iot-sdk-c: drop custom
 install rules
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d1debbb4c7eb205d3ccddaa7849e3121a4929c6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop custom install rules which have been added since the addition of
the package in commit 2d837933e55216dc31a2206b063689cfd04a4c01 but are
now resulting in a broken installion

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14636

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 58 ------------------------------
 1 file changed, 58 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 3f00db3ff4..e6de8c851b 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -14,62 +14,4 @@ AZURE_IOT_SDK_C_INSTALL_STAGING = YES
 AZURE_IOT_SDK_C_DEPENDENCIES = libxml2 openssl libcurl util-linux
 AZURE_IOT_SDK_C_CONF_OPTS = -Dskip_samples=ON
 
-# The project only supports building one kind of library.
-# Further the install target installs the wrong files, so we do it here:
-ifeq ($(BR2_STATIC_LIBS),y)
-AZURE_IOT_SDK_C_LIBS += \
-	uamqp/libuamqp.a \
-	c-utility/libaziotsharedutil.a \
-	iothub_client/libiothub_client.a \
-	iothub_client/libiothub_client_mqtt_ws_transport.a \
-	iothub_client/libiothub_client_amqp_ws_transport.a \
-	iothub_client/libiothub_client_http_transport.a \
-	iothub_client/libiothub_client_amqp_transport.a \
-	iothub_client/libiothub_client_mqtt_transport.a \
-	iothub_service_client/libiothub_service_client.a \
-	serializer/libserializer.a \
-	umqtt/libumqtt.a \
-	deps/uhttp/libuhttp.a \
-	deps/umock-c/libumock_c.a \
-	libparson.a
-else
-AZURE_IOT_SDK_C_LIBS += \
-	uamqp/libuamqp.so \
-	c-utility/libaziotsharedutil.so \
-	iothub_client/libiothub_client.so \
-	iothub_client/libiothub_client_mqtt_ws_transport.so \
-	iothub_client/libiothub_client_amqp_ws_transport.so \
-	iothub_client/libiothub_client_http_transport.so \
-	iothub_client/libiothub_client_amqp_transport.so \
-	iothub_client/libiothub_client_mqtt_transport.so \
-	iothub_service_client/libiothub_service_client.so \
-	serializer/libserializer.so \
-	umqtt/libumqtt.so.1.1.12 \
-	deps/uhttp/libuhttp.so \
-	deps/umock-c/libumock_c.so \
-	libparson.so
-
-define AZURE_IOT_SDK_C_CREATE_SYMLINKS
-	ln -sf libumqtt.so.1.1.12 $(1)/usr/lib/libumqtt.so.1
-	ln -sf libumqtt.so.1.1.12 $(1)/usr/lib/libumqtt.so
-endef
-endif
-
-define AZURE_IOT_SDK_C_INSTALL_LIBS
-	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
-		$(INSTALL) -D -m 0755 $(@D)/$(l) $(1)/usr/lib/$(notdir $(l))
-	)
-	$(call AZURE_IOT_SDK_C_CREATE_SYMLINKS,$(1))
-endef
-
-define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
-	$(call AZURE_IOT_SDK_C_INSTALL_LIBS,$(STAGING_DIR))
-	cp -a $(@D)/c-utility/inc/* $(STAGING_DIR)/usr/include/
-	cp -a $(@D)/iothub_client/inc/* $(STAGING_DIR)/usr/include/
-endef
-
-define AZURE_IOT_SDK_C_INSTALL_TARGET_CMDS
-	$(call AZURE_IOT_SDK_C_INSTALL_LIBS,$(TARGET_DIR))
-endef
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
