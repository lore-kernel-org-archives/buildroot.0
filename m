Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C39C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 20:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5E6681886;
	Sat,  5 Mar 2022 20:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4gwjTdYmVDne; Sat,  5 Mar 2022 20:45:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E2281858;
	Sat,  5 Mar 2022 20:45:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA4CA1BF5B4
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 20:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7CA540360
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 20:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v8RSu9RtT4jX for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 20:45:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B2DC40124
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 20:45:30 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so7911477wms.3
 for <buildroot@buildroot.org>; Sat, 05 Mar 2022 12:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+cxtYDHKzTu27M9OxKf8/5Fn/McxT+RgAB7vXnD1dsY=;
 b=qdJeYJNpXQAetYPjJRp3EVsAfRuw7yVuFlGFSl3SeN+qPMJPVLqkCTJFhAXakdV9Of
 qRnmfYyFRcOwxXLmpOkpYc+XIyWDaBRxE1CLbVBhsKPiDAOf/fhSmfmQA7I8mOqhtj1B
 PtrBExOq2CCgc0k12z3CBf6dNxTW8qSu3Uvp/aViw7VZqPCarjQqy4Nj76WhZHMokj/p
 BNg1674mgkGw9RA2ac+4wuT33GQg9hmA46mGu84Hpfal7pQ4xLYMfnxSNeHzPLdC3v/z
 VPi4EeRdNJBOy9kmToKgMO7YclP0rmZbP/zsDsNlZpmXu/gveF8Af+5PP9r6zLU0LGb5
 BYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+cxtYDHKzTu27M9OxKf8/5Fn/McxT+RgAB7vXnD1dsY=;
 b=cRfDlnTazyeVuumHZ/2cS9LUA4NcAy+6mSyis9WFfMxMFWF6+aRfA2uieaGDfPEzyZ
 VKrSaooYDU9GtbTfE0fdJqt+p0eDAeP5yaJG+XoTtCSaTyS1lLnbDPt6DMSHe+DDzH9n
 cuVL1JgGtHeWP9cZVwWNVfAbPKBw0pYXFboWEsxEB1aIy4/IfWXv2aII78/XByqXi0MM
 wTQGCf+3cth0+3Sm9w55z887kHGRgiYwNljPJNhKUPLkj9Ii0ZwFWZgEGwvwb0OnLVCp
 ik3CcKQrjT6sH4ph42CR6SrKHMkFaiLgHYrC5M+lQqGjexaIOwbRwy3SK0IJQJ2R7JK2
 Lh4Q==
X-Gm-Message-State: AOAM533MEi2nb7jIQ8pv9oNC4mw3xjb/kDtc3zVENatiVRRGngodlHUv
 Gs3UYDW11/G8iyH0nAV4nKZfHr+02Ro=
X-Google-Smtp-Source: ABdhPJx7lqGsCo4hr1ljKJAkR9VaWGmV5mhZ63hcR2xqiB5itghN9l3wynHM5/veuglWWoZ3EwrlGg==
X-Received: by 2002:a05:600c:4fd6:b0:37f:2a37:87a3 with SMTP id
 o22-20020a05600c4fd600b0037f2a3787a3mr3463856wmq.152.1646513128116; 
 Sat, 05 Mar 2022 12:45:28 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b0038167e239a2sm9415021wmq.19.2022.03.05.12.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Mar 2022 12:45:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Mar 2022 21:44:46 +0100
Message-Id: <20220305204446.823802-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: drop custom
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop custom install rules which have been added since the addition of
the package in commit 2d837933e55216dc31a2206b063689cfd04a4c01 but are
now resulting in a broken installion

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14636

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 58 ----------------------
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
