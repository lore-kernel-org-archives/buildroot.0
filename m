Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D950CC46467
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 08:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A01540534;
	Mon, 16 Jan 2023 08:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A01540534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LASyMox1qbeh; Mon, 16 Jan 2023 08:05:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D4D7403A5;
	Mon, 16 Jan 2023 08:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D4D7403A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD4D81BF2B6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 08:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95E74813C1
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 08:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E74813C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KBbjeTtLku3l for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 08:05:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABECD8139C
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABECD8139C
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 08:05:23 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id az20so47032203ejc.1
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 00:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qD31RWdt29qBk9zLHGeCd4S43QtdUeykaD3dxVOZYjY=;
 b=5WERqltjpfkAvnnBpZHhUQazDE1hMwXF7nY47LlWHldNssr9Y0q3tvGYvyHCWf0738
 ZIY9AdXNFgb5c1rJ5oWKHWH6gD+JFMU1j5c9nSdibGqLmQ4/uHaSkiEOLdAipLQBxW9l
 YfiEbZwtBoKQWzbADwOe/2KrTYgHoam5pY1JnjJV3QH+jwvTHHCnCFHiipSFFndzaXbF
 K1co0OA0CAY9Keyu3rDf53F6zopLE5msOUNW+8j7rwyHV0oCV1/tGUPnXmSlUZ84S/34
 VlXJ1RzlImoDdiAZ/EgCSPvoxrGbi0MB394yxraHuxav+51k9Gz1OUP5xn0Zgw6j5hWQ
 /TYg==
X-Gm-Message-State: AFqh2kqdjbegrg0/5zt73cWKFmmKSBP8GXvHy+Mvqgt9BCkkJ8Fm/JCM
 t/vrgulnRFfF68TeNah+Dc47rTy2+r0=
X-Google-Smtp-Source: AMrXdXu6pJE2siKKvr69VEPqdrHMQprxTgXNz7B5OWd/QiZjqjJ5uZoSyAo7yW5GfmbXujyZN0H4Yg==
X-Received: by 2002:a17:906:b053:b0:7ad:ca80:5669 with SMTP id
 bj19-20020a170906b05300b007adca805669mr92876350ejb.64.1673856321573; 
 Mon, 16 Jan 2023 00:05:21 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 j18-20020a17090623f200b007add62dafbasm11363009ejg.157.2023.01.16.00.05.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:05:21 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 09:05:13 +0100
Message-Id: <20230116080513.21407-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qD31RWdt29qBk9zLHGeCd4S43QtdUeykaD3dxVOZYjY=;
 b=TUcPTCwrWIvdk40hwdzMDZUwoFb2GrFIt78rzPCN7xxqrd9zX4ceNn0WpXd9spWMId
 7NXqWGuv8ljecjJVSCqOIjXAjthe/OKrToavkBaDXR3BrgdN14us8Q4VIy3dgqbVpgOq
 hUI2IXbrq6s7K+KvqjhjHqqaTSTT6/+9bA6fnntk56k5UMnmcas4DvSmoeRfCmFZ0Zpk
 BupIHB/QntAeOdRKqDMv1VhhjFOdvQbwzuO7NL26sCNRqTSxiTHu1w75H0DnLuwLTEtg
 G1t079bQWFUHHFuVscLv6c+DsUojURb8un5HKAUO+KtaYqCsWhjvfdhFdTA07acUr0lt
 DquQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TUcPTCwr
Subject: [Buildroot] [PATCH] package/util-linux: add an option to enable
 irqtop
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

irqtop is an IRQ monitoring tool.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/util-linux/Config.in     | 7 +++++++
 package/util-linux/util-linux.mk | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 917f1bc2b4..c7e4d2d8bc 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -161,6 +161,13 @@ config BR2_PACKAGE_UTIL_LINUX_IPCS
 	help
 	  Show information on IPC facilities
 
+config BR2_PACKAGE_UTIL_LINUX_IRQTOP
+	bool "irqtop"
+	depends on BR2_USE_MMU # libsmartcols
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	help
+	  Show information on IRQs
+
 config BR2_PACKAGE_UTIL_LINUX_KILL
 	bool "kill"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b53b94ec31..87ec3c19d7 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -136,6 +136,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCMK),--enable-ipcmk,--disable-ipcmk) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_IRQTOP),--enable-irqtop,--disable-irqtop) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
