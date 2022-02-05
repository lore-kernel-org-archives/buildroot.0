Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19D3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 20:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 163F460776;
	Sat,  5 Feb 2022 20:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gg700BrMFk2F; Sat,  5 Feb 2022 20:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F4FC605A0;
	Sat,  5 Feb 2022 20:18:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E2201BF39E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8431981312
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xZ_9znDOHWLT for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 20:18:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78BD780C31
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 20:18:43 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id r144so11788851iod.9
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 12:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hAXTF6xm+PmACcwJFj73lmxar8azRjoCRp+azxgZIxs=;
 b=Mm2L2st4V81INaxd7wPeFCwo5r0fYfj9msmGMIkmgQlEjBPqUcYbyfmDkvapJKxhwK
 cCmhErhaJpzLEsnUsBpAxH2sDbFX6tjSNK6Y4Ow0KUWobSZMX1sALat1InfHHpgdiqPl
 zpp09l3w1HquUlxK5vRW/cHsrl1W11a8m7I/+w4HfRp7yNb4LLZ62UF8eBc0WEd+zDm+
 +mWhemBQbKBCs6/wfl4qGht5cEALn0Wmm2/tbb+w9lWM5WM+yvh/KUE9t+ntrE7W6Z6J
 eCeuU8p6ejOaoaQGLvAxx63VzimzDYWrBM4D96rVsElv5oC5CzDnQclsEy0RGCX+Z/JX
 1j4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hAXTF6xm+PmACcwJFj73lmxar8azRjoCRp+azxgZIxs=;
 b=z/yk8gZ11GjpFnp/os4T+4MKaTnKmbpChaZbSddhMojRFMHfayrXB+/oHvSEqJ3FdL
 2jW666XWfuvdX+OJt+emHbzuYZA21d/81FnEmcUH1i/mgQ3z1XOZnU5t1Ntr+6S63ymI
 CsHNpcukLWJq+EJ8WKuH0o+E8o3tRum1p73bSQwRodd30TW+9xFQtAFrefSbTCyd0DpC
 rK/V92MxgPO4vCzty0cpqIyitBBl5jTU8Xul+z2TR2wbfZV5U5pPWBSmebPW5+eNpv1z
 Y/i3aunEAMDQiX0lvpN4wGF5vf7Er5BQfkXNR+7fpSCIpCCTp8d4yXKt7RFp0tUKyYaF
 v4bw==
X-Gm-Message-State: AOAM53114TIgtMG30KMapFVoR/68WN4mhxorIBOATJV3C7uf3j+T/P5c
 o9sT/zXiAmugO5YDiZOeWnfSpfD5STg=
X-Google-Smtp-Source: ABdhPJxdS18bwGa1VgGIsJgXDarnS7jBMqNCXJzO/g51Mlj9KLpwPyHX2AwGaraSW3frssBN/aUXjg==
X-Received: by 2002:a05:6602:330b:: with SMTP id
 b11mr2260525ioz.156.1644092322260; 
 Sat, 05 Feb 2022 12:18:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id a7sm2781090ilq.88.2022.02.05.12.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 12:18:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 13:18:30 -0700
Message-Id: <20220205201837.3324085-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 1/8] package/webp: enable host build
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be needed by qt5webengine.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/webp/webp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index d1462426c6..7c2625df23 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -19,6 +19,10 @@ WEBP_CONF_OPTS += \
 	--with-tiffincludedir=$(STAGING_DIR)/usr/include \
 	--with-tifflibdir=$(STAGING_DIR)/usr/lib
 
+HOST_WEBP_CONF_OPTS += \
+	--enable-libwebpdemux \
+	--enable-libwebpmux
+
 ifeq ($(BR2_PACKAGE_WEBP_DEMUX),y)
 WEBP_CONF_OPTS += --enable-libwebpdemux
 else
@@ -56,3 +60,4 @@ WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
 WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
