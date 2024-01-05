Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F96C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 17:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA9E383834;
	Fri,  5 Jan 2024 17:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA9E383834
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4468Z2eTiTJ; Fri,  5 Jan 2024 17:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E024837A1;
	Fri,  5 Jan 2024 17:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E024837A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF4DD1BF3B8
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 17:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B85EA83696
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 17:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B85EA83696
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJxDIcsBsc3j for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 17:49:22 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE7E883704
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 17:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE7E883704
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d8909a6feso19225385e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 09:49:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704476959; x=1705081759;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RsbTgS98zGcPzcwYCbtp4s/PzFXkPGSZdnj9DHOnccs=;
 b=PMiqsVI/0EFOusxPXLPa5abntk7AY7cyO8LufeNlUB8riUO/0k1ZaUAQpLWzlnoS3z
 zRgMoy4Wt+KbWAHtzsf/rH2Sx7pJKlwpSpKge4pjMdcTcVepk4to6J4uvrGx39CDy633
 CFHSvQdLc0qLVL26+G2SkP6Ru0ublaBN0HhTFY+iLBzrmXNCoVHpSHTjlGGPQIj1JeGD
 PE9yHwDOiRPnw/hw58eS8gqrPD+6N4eQc4z8VEwO7t4Xi644kYFvNvUtbUiD8nNysVvF
 IK/RERwbnzRZeegu2nOLGZso+i5O8sqdPRZPrXCbO+fSfyjkrE2Bam0wzzD4TNoQ8zFg
 NrCQ==
X-Gm-Message-State: AOJu0Yz8M8++W3Rckv6ObGS5y00EB1Q9IpVoLijQeByjzJ+9ez3WjZei
 sCrQ5LwGoDJ6pyLOPUbcMmYf+h8O9vU=
X-Google-Smtp-Source: AGHT+IHHsREBhhTNqz6COjHpmiyjMpICJ+YaPCAkZsb2TiN58oU0i4JBKAuT6N6MyXFnREZawh0lFg==
X-Received: by 2002:a05:600c:5102:b0:40d:8986:62f6 with SMTP id
 o2-20020a05600c510200b0040d898662f6mr971150wms.226.1704476959440; 
 Fri, 05 Jan 2024 09:49:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k4-20020a5d6284000000b00336c43b366fsm1796550wru.12.2024.01.05.09.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 09:49:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 18:49:17 +0100
Message-ID: <20240105174917.734849-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704476959; x=1705081759; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RsbTgS98zGcPzcwYCbtp4s/PzFXkPGSZdnj9DHOnccs=;
 b=DdWfaqJe6lOgWaqgxtdyk31K5cyiBQUzKVGW3gtTrk8be/p/3rXZKo0dzeUXCI40w7
 xExP+uHnAeVu12l57ixABS2suoKUV1oGiei6YmEhtz5Rq/ozMdbuhM4cbztm4Em3OJRA
 3ieNwAVRmi76kl37GzM+NzcHs7nn/NNrW5cguyLFwSI3wBnvrSIzau+4Lu9HjmURqg9V
 9Lu1TG5qKYgnnj35MhjmkGbZ6dE3cKwVUAyHE/OT9jMdFnnBpMQVpxFZWgy20yJkcpGE
 CTakQ09pdfRhEua57uy6HbViEvWDllOVMAkjJYGRPtaVtMNbk1dJnY6s+eySWDOaY0ND
 KPEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DdWfaqJe
Subject: [Buildroot] [PATCH 1/1] package/cups: fix systemd handling
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--{dis,en}able-systemd is unrecognized since bump to version 2.4.0 in
commit 07230bfcbc4b3c760a1d96a2595e3557c5e7278b and
https://github.com/OpenPrinting/cups/commit/796bd7cf235b1f738e54ccdcab150ee97827ec23:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --disable-systemd, --disable-avahi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups/cups.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 2ad5eeb5cf..c46baa63b6 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -37,10 +37,8 @@ CUPS_DEPENDENCIES = \
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 CUPS_CONF_OPTS += --with-systemd=/usr/lib/systemd/system \
-	--enable-systemd
+	--with-ondemand=systemd
 CUPS_DEPENDENCIES += systemd
-else
-CUPS_CONF_OPTS += --disable-systemd
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
