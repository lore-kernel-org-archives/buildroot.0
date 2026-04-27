Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B819FF885E
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 11:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52EEF84F8F;
	Mon, 27 Apr 2026 11:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jvYwULb-OYa; Mon, 27 Apr 2026 11:00:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61D0684FA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777287656;
	bh=/Pvh2xvSETAcbnE9p8K6cwxtJQRizbCpPHkXY2tuWwE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=g/GLMvJy3G2mMo9OB34sjrp3R0e9zfoXqIhCArcPnzeshHIse2CjP0fo5OIy3nlgQ
	 nAeW/37iUHAIXRxjKfAQUzdBbS6LtXNdkKxOiL+DBgurXvH7DNi/mnSD0FbBJeu7yR
	 yOBE2oYXp2iyEyx5lQPFQMJL0Y/p+JY1+DCDgPlsdPRcKN2azq/V/BZx/l2q9CtrA/
	 Uiyetef17VtObgX2S8Ab4ihfkmC/igIzZbHQm8BTGLQcOscftWTLnMVtFy4iroulE+
	 znBZFaUiP4UUDLkbz1FvOYCq95bBxFSQy1ulonoeAELejhaWmg+52Sk9UjhPRvadeZ
	 DPV3q5dJ4o0Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61D0684FA4;
	Mon, 27 Apr 2026 11:00:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3DC5231
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 11:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B610984FFC
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 11:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yUyUevvGJCO for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 11:00:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E334984FE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E334984FE0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E334984FE0
 for <buildroot@busybox.net>; Mon, 27 Apr 2026 11:00:52 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ba6b39871a3so1224993066b.0
 for <buildroot@busybox.net>; Mon, 27 Apr 2026 04:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777287651; x=1777892451;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pz+P3rXdMEO/8PQ+34WuGvFJ4NhS6AcmN94Mju+oDd4=;
 b=anFxeDoraibxUar8Qi6V5qRbPgOI9u9yccAC9P9so1xZXmGNIzGnxzy5lHKHsMf5iu
 zX2286OYMCcHZxdOVKjUk0btyFGRlXjxIlcAaFH4WMQtPRhNbuyB6Q5WjKaVKJvdVmgz
 ZjhJBmojdCW24fFfIWlKX3taOHwKt4+aR6IOtTZPQiPnfw79BTnQCBmaFdfM4PsbUcrz
 fFQM8RjbtqaLPZmh2F6hlslaQDaOOr/O6I8p6PikMLb0F9mu5iuwH2vSlEP88VR4MzW1
 id7pcWydbzw3fpIAY7Pf0/R+3k8wmVHJwXvhCT1o289e/jbOmrDceGsdMXoYQs9VjfWQ
 nkkg==
X-Gm-Message-State: AOJu0YyjXCakCdxtuxFGQZEjeUXLQWNTNftMQJahti1lTAFbUtUqlR6I
 JBvHiIp2I5EciG2AT5oGhtc+YwUoaNS6CUkQCubAFgSczR1XBE0bhpC1D6/4DrHYxarbUPni1Cq
 B1yHtXdF+scc=
X-Gm-Gg: AeBDiesBD/TOxQsl2V98faXTSDUas/WQekt9m9wHRRbmGYXiCsXhLsqrk/Gu+G5Ybrk
 j9+vmBqwLgpPrkcWG77pC+a1vosVm9mGkNdzfcmoSVwlL18HsBFrqgRFbkArqgpgWQtMQ+7S5jy
 pYMUY5vMJVR10pVDrt4hckoXt4UFTf7cfXX9X6UvG+ZSr7BTvCDdrWsxY+Jo+OXKTT8ATsifFcI
 BKDp8mq2bCJhLEPrlctZWghu4RqPBMt9mSn/P9tQ8uNKDh7YRzdqXTHWLJl1A11JW4sKk+D380H
 ohALNvcxjEUBH5VlMa+j3p3t7Hmj9jNKXBFmiYb1d8NS/J2o2hcqPZCtxtY7aUq7z91aeAdGHa7
 KFFawMsLU6GM/mJ0CxjLgomoQ+LmkEjvAxPmV2KmJI9F3UBKa6hIBSxs+EWJePnH30T+wxNtriD
 Ln1J2JGpazfJF2l87hN13ZyCNbMR5Z4BepdtajaoAb8gSnq3Vd64eW/rFJaCJC
X-Received: by 2002:a17:907:6ea0:b0:ba5:3dec:8b63 with SMTP id
 a640c23a62f3a-ba53dec8c4cmr1600174166b.25.1777287648503; 
 Mon, 27 Apr 2026 04:00:48 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6794b925d0fsm901154a12.15.2026.04.27.04.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 04:00:48 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 27 Apr 2026 13:00:45 +0200
Message-ID: <20260427110045.71300-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1777287651; x=1777892451; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pz+P3rXdMEO/8PQ+34WuGvFJ4NhS6AcmN94Mju+oDd4=;
 b=WbsuXtpJ/br+vBuWaWVWz8ovpJlaWBP6wuO9qg0nJG1H9C3mvWi8ZfodZFSHJ5qD4r
 BTMjru3VGEGWnvw7fEB/X6SWlmjoWWWBn7fqg0MbVGp5HZpvWkbcXb/gAJyDH78HxLpA
 5EauCqTLDRdlhXp3yH5rcxWaFfE+0vBLqOoLdHqNK9zEqL3ypd4UfrW9q43aKFccnk+W
 Gb8lbkcg6Xwar+cPSH7SIaMMHSPfpKMVKV+rE0EPqTDmirxQpCSbzGZbNRvnOW7fpA9f
 Hc9T6vjJa62OJJWks58voq3cPD9ntiJUDaGeiFX7nQtVHMGj6SmxLaPCU4WJvyPo6/JC
 Du3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=WbsuXtpJ
Subject: [Buildroot] [PATCH] package/tcpdump: bump to version 4.99.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/tcpdump/tcpdump.hash | 4 ++--
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index b29ac0606..f69b672be 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature at
-# https://www.tcpdump.org/release/tcpdump-4.99.5.tar.gz.sig
+# https://www.tcpdump.org/release/tcpdump-4.99.6.tar.gz.sig
 # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
-sha256  8c75856e00addeeadf70dad67c9ff3dd368536b2b8563abf6854d7c764cd3adb  tcpdump-4.99.5.tar.gz
+sha256  5839921a0f67d7d8fa3dacd9cd41e44c89ccb867e8a6db216d62628c7fd14b09  tcpdump-4.99.6.tar.gz
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index f4086ef12..c3d777ca7 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.99.5
+TCPDUMP_VERSION = 4.99.6
 TCPDUMP_SITE = https://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
