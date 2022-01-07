Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A0CC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E6AA60AED;
	Fri,  7 Jan 2022 20:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDOcVFhWzQ3s; Fri,  7 Jan 2022 20:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF8AD60AE6;
	Fri,  7 Jan 2022 20:49:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57EC61BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44D03404C5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnGh8QqRCsiz for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:49:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F5E540010
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:49:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q8so13199162wra.12
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 12:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T+vDzvBsbZUS6R3X2WTI5NR6WtmfV0SXl9cGa1PxLyY=;
 b=ZRo+3otMQj2QGNdIF44YIUiDE3uf5IXPzkYSbHJE7wNJrI/DXfMbWOWGLXsAFbrY6+
 DIFfqeZHagMptMqnPVAPg/xQ5MkNhq5tXm+t0QJX49Vn+/qrHZsFvf4H27q5rqQthSPU
 KsO/aCScJ3WfLMLS53/su49RJkRALOVx7kwZBqWsrFiZ5dBovIt90pzDWqXzQVj8Cmaq
 t9z5h1M864oe8z/7jYtYsxeu6nyrKKQilZN1+UNncHXqmEw+MgkbAl8/tjDSO1Du1KPo
 l9QCKdcqpUDYQXVAGrlQFezzH0aCVb8apfy+ZJqFHMq0ArAexEREUDvSmVMcDz6GyC6/
 lqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T+vDzvBsbZUS6R3X2WTI5NR6WtmfV0SXl9cGa1PxLyY=;
 b=7hpsIpg4hw/iYnCqjTQjDyDj65Bs07w7L9SiDBeJcl97Uy3O/h6QtTHnrxSiwkzL/6
 OcrSbT2RdrUCmswzD0zfMFpDdbCcPq/KQs8i7KlXiCmPH02aJAiT14T0yZmDpJLoO5pb
 E3l4H5iebiKmatx2IFYyKTmW9hPf2HUBEdH4KWXCOhlefP6p3n8SwAz4NAqpoQxOaIPR
 UK03+dZreeRmR9SjK6fwkILniLqqNlp916r/31ArHOhllU28qL6tB7stG8Lxp+ANsKZP
 /8dCHKT3WEioW0yBBZ+rg1ltxO9ThYUdwr0SS9VfPNDw56RphxUxeD6SwYuLMFk3anVH
 8mJA==
X-Gm-Message-State: AOAM532Kvq33WxJn8GyBVBRsAYw5wepnZsUU5ujiPHpdJOXgZizAdxtn
 HCiE0KE5/pz/kdr9f6scycUkyNKiMCg=
X-Google-Smtp-Source: ABdhPJw28UURyf9uZpvPXMrxHkEKBDP1v9ioPH91yWx3btkhZGVpC+gpUZfvtvXZgddvGBkSOUMW4Q==
X-Received: by 2002:adf:f9cc:: with SMTP id w12mr9569wrr.430.1641588546545;
 Fri, 07 Jan 2022 12:49:06 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id d5sm5570499wrs.61.2022.01.07.12.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 12:49:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 21:47:54 +0100
Message-Id: <20220107204754.1462472-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/domoticz: fix build with libexecinfo
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix build failure raised since the addition of the libexecinfo package
in commit eea8ba446c10701a273432552108d80fb2224ef4

Fixes:
 - Not autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 826e6f5e58..0d1088d395 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -41,6 +41,11 @@ DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_SQLITE=OFF \
 	-DUSE_BUILTIN_MQTT=OFF
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+DOMOTICZ_DEPENDENCIES += libexecinfo
+DOMOTICZ_CONF_OPTS += -DEXECINFO_LIBRARIES=-lexecinfo
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 DOMOTICZ_DEPENDENCIES += libusb
 DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=ON
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
