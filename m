Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4BCE9A03B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 07:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 560F840752;
	Wed, 18 Feb 2026 07:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1kUM6IzD1Ou; Wed, 18 Feb 2026 07:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 551FD4074E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771400423;
	bh=YHRrxvM8Wlim0xk7XEJ+Hd2DTzGshOQAIbKuL8seFHM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tyayiy8wt5uPbg7HMYGTU10M6TJJ+aJijfO4k8TfM8wF9J0ZCFt2KaJPtYxcs5CeC
	 ymHWzMUPNHxvU2Tv5I31bWtZ0oA89K1XhtHcyMrh5trrog5ZLoLB1lVwvtA2IhRKXx
	 d0kTYetMyrZIkW8iS1NKG5oVBGzt+hMMlsy4sa/dYvE8IUPK6dvYDT/9Uow0Up7Cx2
	 4aGDVlCFEKR1DAS45OajlZMiai4/Ksw4NYmKCrgW+p7uh5MaDkXd0Fxbm692YKlWjR
	 KxTsc6NaXPiDzZTnQoFBQ+gitXs1qPimIFGaQBxlaRnpy4Lpbsyan6b7en8p0wq4EW
	 4k2x3BF498oqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 551FD4074E;
	Wed, 18 Feb 2026 07:40:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 197F0206
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 07:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AF87400A1
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 07:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fgyV0xxROsuy for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 07:40:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75CC04007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75CC04007C
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75CC04007C
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 07:40:21 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2a77c1d5c3bso18609155ad.0
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 23:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771400420; x=1772005220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krrGoSZancdqzQBEC5dv6rR7FrbOYnk36ycfeaD3sac=;
 b=a6ujIiCzS+6ywHmtz+rVKwAKWwNhxMaLChW/Bc6LxW1ilWo8oNqi2n1fuGC59HfkGZ
 sMjgIVmCCfCm2LdGDePZ3u11qKVGUKcifQyCZtFF2J+krvz0z79h4YDj+BkONK0b7GjH
 g3KG22ufR5tTeHD5YJzhtoAGqdou78JOr3GNd6TZxLornFC6CSjb6CalN3wMxqarjUra
 WtX2qBkhcEq8YCll+wMA16+CcUuiNye2xXNAXdMNIiY7X6h7UnNqkHqHriLl2SwTML6b
 bDZdUj4HvhgOKo/f6TEEfc65RYuSC98fgSRhQb7Szk7GvT0cYg0KimoN8nKxe1xFtfQr
 LvAQ==
X-Gm-Message-State: AOJu0Yw8e3SlBswRCz3BW/jiHRxnuvTBi4I62KUSJizt/VbRFrgf0lzW
 iyLAppTDntaSl0IpKFsgCOs08rPah1YjsNfu0THW08TFc+xswDsJXLdEnfLPogly
X-Gm-Gg: AZuq6aLwc3mPUX8vwwdmo1XDXliKyip+FqgtLipvtREJv2wsIuzaiJackuaAZntO5Wl
 dcpscUWaX05FW0hCkFP32YiiVH0dZ97Nh7ODhkQAHXC6CseYy0blF/gIXVNeyxEUVNr9UgrN3XF
 oyTPP64XMijNjEfkQQhRmc73O/8HMhwqSwbdnnoiC5GrlZVVeOLCBxi5WnNJhTbPD2t3PwAIkup
 yvHic08fkAx2mofVTdjSM7I2XgBgRPMsbWvE60Wh110iRLB5FUNf6yMF2/rpztPKgXk0uIyC5Vd
 6AFqpH4pndJDTt4fLnR8da9WFO5mVDF2n1HguTznZK+0mHgaCaGVPlYZi1fTQBiPVJrWM5pWU20
 zSUCTCJZ115DGrkiMtYK7EnA82kOyRwU9m9gi1TwV0JaCvBdc1LQQrzeRj8jEXCXcyGPSizFgeJ
 1uq5errYoZKCwsR5SBymRsKjFkhiEbWSjSa54=
X-Received: by 2002:a17:903:32c5:b0:2aa:d201:25f6 with SMTP id
 d9443c01a7336-2ad50f9bcb4mr11628645ad.45.1771400420043; 
 Tue, 17 Feb 2026 23:40:20 -0800 (PST)
Received: from fedora ([2409:40e5:11f4:5620:4e1e:6f24:6c18:dcbb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a6fa205sm134193055ad.3.2026.02.17.23.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 23:40:19 -0800 (PST)
From: Rick <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Rick <chakrabortyshubham66@gmail.com>
Date: Wed, 18 Feb 2026 13:09:58 +0530
Message-ID: <20260218073958.455704-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771400420; x=1772005220; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=krrGoSZancdqzQBEC5dv6rR7FrbOYnk36ycfeaD3sac=;
 b=dltd4mB+PuunK95ZvhX/d2/W5cmWjGGOBzUBSc+kQq9iqcOlrtxZiYJ60+3kigrQvv
 R1YU+gdekZbGNF9yFC7AvApxwdqseD9OuA3J9cjFdajPlSDRNuDROck/1P3ndG4WdcjI
 FYpzsArwOo8MwRIAva/3WdjJTfhFQmfRYzMendBNJpVqdVz51je5eNquPUaRRe/bNAUY
 NfbMudyIyEwbe6aLsggghauUhHd4tZdqDkIx8CLtD4H9mvR7SkAA4QrFA3/y5Zp/tb6S
 /+Tj49aoX32mr788ARa9gIJn5/mGYNfzpBeDTbV4pMVjZKkppbFxKP3eaYuRDkC09zxN
 wKjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dltd4mB+
Subject: [Buildroot] [PATCH] package/szip: fix build with GCC 15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GCC 15 defaults to C23, which no longer allows empty parameter lists ()
in function pointer declarations. Add explicit parameter types to
winner_function and winner_ref_function in src/rice.c.

Signed-off-by: Rick <chakrabortyshubham66@gmail.com>
---
 package/szip/0001-fix-gcc15-prototypes.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/szip/0001-fix-gcc15-prototypes.patch

diff --git a/package/szip/0001-fix-gcc15-prototypes.patch b/package/szip/0001-fix-gcc15-prototypes.patch
new file mode 100644
index 0000000000..77bb110734
--- /dev/null
+++ b/package/szip/0001-fix-gcc15-prototypes.patch
@@ -0,0 +1,13 @@
+--- a/src/rice.c
++++ b/src/rice.c
+@@ -103,8 +103,8 @@
+ #endif /* !HDF */
+ 
+ #ifndef REMOVE_SZIP_ENCODER
+-static int (*winner_function)();
+-static int (*winner_ref_function)();
++static int (*winner_function)(unsigned *sigma, unsigned *end);
++static int (*winner_ref_function)(unsigned *sigma, unsigned *end);
+ #endif /* !defined(REMOVE_SZIP_ENCODER) */
+ 
+ static boolean compress_exactly_as_chip;
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
