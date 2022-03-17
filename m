Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7C4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 07:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D21D580B74;
	Thu, 17 Mar 2022 07:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zub6hg5LcJey; Thu, 17 Mar 2022 07:49:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E34968478B;
	Thu, 17 Mar 2022 07:49:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30EEA1BF3B0
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 07:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CF3A4000B
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 07:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7tuO4qGEMGK for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 07:48:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08A31404C0
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 07:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D42AD83E73; Thu, 17 Mar 2022 07:40:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 08:12:40 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: caddd00d7b7ce4164c1a58811907867bf73a3f90
X-Git-Newrev: 434773e57842e0fd5801830b2143a28592f7626b
X-Patchwork-Hint: ignore
Message-Id: <20220317074006.D42AD83E73@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/azure-iot-sdk-c:
 drop custom install rules
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

commit: https://git.buildroot.net/buildroot/commit/?id=434773e57842e0fd5801830b2143a28592f7626b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Drop custom install rules which have been added since the addition of
the package in commit 2d837933e55216dc31a2206b063689cfd04a4c01 but are
now resulting in a broken installion

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14636

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d1debbb4c7eb205d3ccddaa7849e3121a4929c6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 58 ------------------------------
 1 file changed, 58 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index c664ad83a4..a8f42a25bc 100644
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
