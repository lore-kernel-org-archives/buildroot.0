Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4A3C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 14:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A12CE4049F;
	Sat, 20 Jul 2024 14:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0JQhFf0-hsf; Sat, 20 Jul 2024 14:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CDB6404B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CDB6404B6;
	Sat, 20 Jul 2024 14:50:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C7F91BF33D
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 14:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AA7E80B56
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 14:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrBdnnRoY80Q for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 14:50:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F288E80B4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F288E80B4F
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F288E80B4F
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 14:50:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-368440b073bso1115320f8f.0
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 07:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721487022; x=1722091822;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p+lHsed8WvqUGki4r8DYj2RVyJHIPCqvnIJsv7y4ltY=;
 b=VZfYhPqx0EbvtKe59MfhKMfzHDJFtsK0RdY9OHuF7Xy5zTNvFRGtG+1W52xdQD+CVM
 3glD3CbHmBNeUxXAkn2DEqdJl/T1FZSh0Uif1nuWYB7tiX/Kn51yos9ElzzDldTBZvVT
 HW3QkV9w8KNLcXsmNsmdtzm5Wsk7AtBXfM6Bb4VIDuWKY7kfwcEkXZlKXh3ez7z8tW2X
 di86ecT1p4AXL93nktYhRbZhbu6TUMoyopnJqe9yksS0eROPbMlmyFxESjwyZc+7tSXY
 dJuivjfoShcf1Uu9AHOFTQpJQNCnbDsJu+0Y6KgGPz34I+gA6Rzaooxm7lVRKenzxWXk
 o1BA==
X-Gm-Message-State: AOJu0Yw9NrwQGe8xx9gVkZXLWDN6h3qRfrCQvJaaRVUuEuLGb4WI8v2x
 9Px8M9supF5tc1m5WOoh6TA5suArVXhvbKZc+TXLdGGKq5Tm1uomOD6IDA==
X-Google-Smtp-Source: AGHT+IF5CNAaU9JZzl3jfXy8F0ZI0V93+pixNxikdy+v30f8tkel0c3DGeysPCFG6X9YXZN6gF97Cw==
X-Received: by 2002:a5d:59ac:0:b0:368:374d:81ec with SMTP id
 ffacd0b85a97d-369b66afaebmr1746462f8f.10.1721487021560; 
 Sat, 20 Jul 2024 07:50:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687868bc91sm4058189f8f.45.2024.07.20.07.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 07:50:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 16:50:18 +0200
Message-ID: <20240720145018.1087079-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721487022; x=1722091822; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p+lHsed8WvqUGki4r8DYj2RVyJHIPCqvnIJsv7y4ltY=;
 b=d1H1GAoQpbLeVXeK2GnN33GQeeZ0cfNRVddxeC7eZw3DRLBgLp78pgviOULGyVyi9z
 uFBE+vNLmxr+GyxqDYUjgiWMOM+NL/QfnqQ7ULibUNEv0q9jNdt2yhiMEzm6A1yNKpAy
 KnoqexyZDUPRA/4Uk8aUDEsXF5Ja5gEU2eWFtVrnyN55dHG+BgrYIk4sa8C0ot0a9Rb/
 yQ+FL2T3tevOTCDsRMGnM6cZwCgkgRyvOt5TyOoMGsWUSvvfd1s3Ot6bwh3D4zsIENiZ
 wAlIzne9pD9WWbFK6Iodz0tIohKMcuUZalkQrdPggXrOT/bAZyyoyrcXAagVJrnPdA+3
 69rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d1H1GAoQ
Subject: [Buildroot] [PATCH 1/1] package/flashrom: fix satamv handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

satamv is only available on x86 resulting in the following build failure
since switch to meson-package in commit
37dded43ae681e8319d7b76f9a612c71991467a9:

../output-1/build/flashrom-1.3.0/meson.build:475:6: ERROR: Problem encountered: satamv selected but not supported on this platform

Fixes: 37dded43ae681e8319d7b76f9a612c71991467a9
 - http://autobuild.buildroot.org/results/c689bf039d7686a9b42c6fcb84f87b555a9bcfb6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flashrom/flashrom.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 0b474caab4..478b53e1ac 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -65,7 +65,6 @@ FLASHROM_PROGRAMMERS += \
 	nicintel_eeprom \
 	nicintel_spi \
 	ogp_spi \
-	satamv \
 	satasii
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
@@ -74,7 +73,8 @@ FLASHROM_PROGRAMMERS += \
 	atapromise \
 	nic3com \
 	nicnatsemi \
-	nicrealtek
+	nicrealtek \
+	satamv
 endif
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
