Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CC5C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 04:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14F9E40777;
	Thu,  2 May 2024 04:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMbR_mBTfkvz; Thu,  2 May 2024 04:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D57C040789
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D57C040789;
	Thu,  2 May 2024 04:56:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B87C1BF2C5
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 04:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00A048213C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 04:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpLB0C76SPIV for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 04:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2ACB82137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2ACB82137
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2ACB82137
 for <buildroot@buildroot.org>; Thu,  2 May 2024 04:56:05 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2e1e8c880ffso446091fa.2
 for <buildroot@buildroot.org>; Wed, 01 May 2024 21:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714625763; x=1715230563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D9UW1RnXzHZZKbDYjccxcyfKJH0FYuOkZBcPvsvnKuw=;
 b=Y2yMOQk42ztJtpPWWvZ5Lk9lZCTMzDPpulX392uXyGUeTQTY2yYg1mGb+GUwswTVYl
 2NVocRS90suWmdvK2jgezrWvoyaYLgfNkBDGDHOcbYT1RQEI5uQb/F84AnBgvfU73tt+
 IlsoehAToGZWmM2WH4SynFDjhauqlhrld4mYwClmgwT5fzsv0He/Fc4h4e8Reg6OcSiQ
 HxMwF+QhfqlGsjF8odP4HyqDWt1sonsguzo+pjLFUsB6ChxnisVibfl7dZpLYlccAVZe
 mp2ACS/4oHTOvbt/eb06Fit9QJtI1w7NVbQZUfVziU45nayiEnVcPnJ7X0eMKqRo3JoM
 aISg==
X-Gm-Message-State: AOJu0YwonJvqrv9GRID20EUUfJQmrmyVUJEVRu/pZ852MgN9W4QCjb6Q
 +7/qcjZcJxp5mJseJxPaZHBdlpN33AcdgKSu7vCuviWXKvmiQQVtI6gbuw==
X-Google-Smtp-Source: AGHT+IG0+F8js1LsdwFJnrNUD/U54H2P+YTgDlgUetlFGOqHgnMUwaTT8Gwq/wfrRNpj7EJnaKJMXg==
X-Received: by 2002:a05:651c:102f:b0:2e0:3ac:7237 with SMTP id
 w15-20020a05651c102f00b002e003ac7237mr2897233ljm.0.1714625762903; 
 Wed, 01 May 2024 21:56:02 -0700 (PDT)
Received: from localhost.localdomain (109-252-38-243.nat.spd-mgts.ru.
 [109.252.38.243]) by smtp.gmail.com with ESMTPSA id
 i8-20020a2e8648000000b002d8744903ebsm35466ljj.68.2024.05.01.21.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 21:56:02 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 May 2024 07:55:17 +0300
Message-ID: <20240502045518.4875-2-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502045518.4875-1-dm.chestnykh@gmail.com>
References: <20240502045518.4875-1-dm.chestnykh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714625763; x=1715230563; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D9UW1RnXzHZZKbDYjccxcyfKJH0FYuOkZBcPvsvnKuw=;
 b=HUoghYJObiMB+b7fjV9TEIoSqcS8HHV6/z2nzILPg+rXNjyVUzaiZJKs1dbV+hp4S9
 elbhf0T4r7k2TYEeXaRouVzeXaOA79t+U2kj5NTmc9n8s5vPytB+xr9DMUPo2XWHHt3h
 OZ+yuZ5LdjEgghYhqEUJfm5HB+3Ae2O1KeAOQmipGMEG8UjAkfkTGedDUi5YDfdeIDM2
 3wk+24vtYX8o/ZN+NdUXgCU/BUOtWLdQJqsk5EOEa5Gvfjq85usKw5gae+xOpIIczRpk
 WkT4aRP5/tXzJNqKjjVYytmlb7wuUCyBBbtEmPp1pHSz5cKuw8quOXCI9g8zkEFWUjn9
 MyYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HUoghYJO
Subject: [Buildroot] [PATCH v2 2/3] arch/Config.in: Allow building buildroot
 toolchain.
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this patch series we allow it again because SPARC
was fixed in uClibc-ng so SPARC systems works fine now.

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
v1 -> v2:
- Split the patch into two parts:
this part allows building buildroot toolchain
for SPARC.
---
 arch/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 9912f9fce6..e7349e83ae 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -216,11 +216,6 @@ config BR2_sh
 config BR2_sparc
 	bool "SPARC"
 	select BR2_USE_MMU
-	# uClibc-ng broken on sparc due to recent gcc changes
-	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
-	# gcc <= 10.x has been removed from Buildroot.
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC
 	  instruction set architecture (ISA) developed by Sun
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
