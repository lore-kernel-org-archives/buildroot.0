Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547BAC64EC4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 15:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01114812AB;
	Mon,  6 Mar 2023 15:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01114812AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZfIFbxhHcC5L; Mon,  6 Mar 2023 15:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 454EB81299;
	Mon,  6 Mar 2023 15:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 454EB81299
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5019D1BF399
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 15:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 293E660A9F
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 15:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 293E660A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7sZCNPfCINd4 for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 15:52:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E4B160A98
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E4B160A98
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 15:52:59 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u9so40628611edd.2
 for <buildroot@buildroot.org>; Mon, 06 Mar 2023 07:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678117977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wyGaiO0RSgF1LbVDrxz0fI5oRLep8x5y6YLakolEhX8=;
 b=Gy3ZE1DPALhbowMmSZBOVl2UdXZ505IMp/JgIPHqqx47T+Z72q3Kv843ji8GXY0w93
 HzS7zDD2PElvF30sMaUXqvH5RGisZlfYcOFMR4Hec5nOqI8vyDYZCslfF2hKXeMW/WgH
 4gc0fEQJol8z4Uz9ewGJkVQKachr7T55EbOUe2d4Gwroa6NjHkc42Dd/oT4arW6y49Nz
 g1o6XzVXkRBKDOLoZwaoSe+1NOPDwuAi2eCoQ9IqpUyR04u0475Q3czZfzv5WaRIaYx4
 2nbcO35z6KR1L54jusqS/HXzDP/f8XCXwzuJdzoIH24CtuB3/24OBwkPGBWyMDxJt1G5
 yh0A==
X-Gm-Message-State: AO0yUKV9RTCj3qDSM3x7Cm3V9Xdmq1MdS6ToOogcsk7IPx9o2+sPbPaq
 uE1X2siglK3zxItD30IUMDZ5rVWXXrjQFQ==
X-Google-Smtp-Source: AK7set+db9nIHyNZn6VLKuqMSySUskYTbuCIljXzM/CbeBBIrTNS82qqTPvj+G7jqCslLjEhGcl3dQ==
X-Received: by 2002:a17:907:8e88:b0:878:7cf3:a9e7 with SMTP id
 tx8-20020a1709078e8800b008787cf3a9e7mr13192290ejc.65.1678117976811; 
 Mon, 06 Mar 2023 07:52:56 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 qo3-20020a170907212300b008d2d2990c9fsm4774715ejb.93.2023.03.06.07.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:52:56 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Mar 2023 16:52:53 +0100
Message-Id: <20230306155252.476859-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678117977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wyGaiO0RSgF1LbVDrxz0fI5oRLep8x5y6YLakolEhX8=;
 b=h2/WXk73ikdI1bfmxzoaRaoATV8XBZ512btaUEu+yCc5/5fQmSFmUIXDOct6zjUKP7
 zYjFLw2nvTdylKruNxaGzFldbLwsl9XmwdUJoFAJz97Nte/UKiDh72Cmrf9McFX8oLaw
 4GVtVINIDcIu+88cgvVWW1mwzKq5Q2eyxNflC1A0l6grDysSKJP0fmlWW9vE4YF+DMvE
 6ElZcfD5OeLI8fKxAIeHg1AlCBNlDHPdqwnkCMnkw4DL6bTH+PAEl21I/dVIxDm3fttK
 KQG8TiN0nVa5SSK5RMYDR4YkaRjHu/NLwqqIxaczvnkroRdCbs3tEmiUx8asu2NpWGiN
 0YQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h2/WXk73
Subject: [Buildroot] [PATCH 2/3] package/rauc: switch to meson build
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/rauc/rauc.mk | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 2baa25ec9e..4168d6c2db 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -11,9 +11,10 @@ RAUC_LICENSE = LGPL-2.1
 RAUC_LICENSE_FILES = COPYING
 RAUC_CPE_ID_VENDOR = pengutronix
 RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
+RAUC_CONF_OPTS += -Dtests=false
 
 ifeq ($(BR2_PACKAGE_RAUC_DBUS),y)
-RAUC_CONF_OPTS += --enable-service
+RAUC_CONF_OPTS += -Dservice=true
 RAUC_DEPENDENCIES += dbus
 
 # systemd service uses dbus interface
@@ -28,35 +29,35 @@ endef
 endif
 
 else
-RAUC_CONF_OPTS += --disable-service
+RAUC_CONF_OPTS += -Dservice=false
 endif
 
 ifeq ($(BR2_PACKAGE_RAUC_GPT),y)
-RAUC_CONF_OPTS += --enable-gpt
+RAUC_CONF_OPTS += -Dgpt=enabled
 RAUC_DEPENDENCIES += util-linux-libs
 else
-RAUC_CONF_OPTS += --disable-gpt
+RAUC_CONF_OPTS += -Dgpt=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_RAUC_NETWORK),y)
-RAUC_CONF_OPTS += --enable-network
+RAUC_CONF_OPTS += -Dnetwork=true
 RAUC_DEPENDENCIES += libcurl
 else
-RAUC_CONF_OPTS += --disable-network
+RAUC_CONF_OPTS += -Dnetwork=false
 endif
 
 ifeq ($(BR2_PACKAGE_RAUC_JSON),y)
-RAUC_CONF_OPTS += --enable-json
+RAUC_CONF_OPTS += -Djson=enabled
 RAUC_DEPENDENCIES += json-glib
 else
-RAUC_CONF_OPTS += --disable-json
+RAUC_CONF_OPTS += -Djson=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_RAUC_STREAMING),y)
-RAUC_CONF_OPTS += --enable-streaming
+RAUC_CONF_OPTS += -Dstreaming=true
 RAUC_DEPENDENCIES += libnl
 else
-RAUC_CONF_OPTS += --disable-streaming
+RAUC_CONF_OPTS += -Dstreaming=false
 endif
 
 HOST_RAUC_DEPENDENCIES = \
@@ -65,12 +66,13 @@ HOST_RAUC_DEPENDENCIES = \
 	host-libglib2 \
 	host-squashfs \
 	$(if $(BR2_PACKAGE_HOST_LIBP11),host-libp11)
+
 HOST_RAUC_CONF_OPTS += \
-	--disable-network \
-	--disable-json \
-	--disable-service \
-	--without-dbuspolicydir \
-	--with-systemdunitdir=no
+	-Dnetwork=false \
+	-Dstreaming=false \
+	-Djson=disabled \
+	-Dservice=false \
+	-Dtests=false
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
