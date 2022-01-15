Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D46C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 21:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D09CD4012D;
	Sat, 15 Jan 2022 21:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZS3C9jce5M7; Sat, 15 Jan 2022 21:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED97D40571;
	Sat, 15 Jan 2022 21:15:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC0041BF393
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 21:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA2D581C58
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 21:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kx7iu184EnWF for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 21:15:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE5EB81AF4
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 21:15:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 s6-20020a7bc386000000b0034a89445406so10640495wmj.2
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 13:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3+1yQ7IqqE7VUxqu1iTNVdZmPWY4AIWRs0iIS5jt4Fg=;
 b=J2RkQw56in2vyq+ZCW+SNT9cvtzffwlcmZwIhuOyD6apvjF8t2Rk2zg8p8akQLfCi+
 qImjwMAJm/aBmDFUEL8vIBINVLqQy7kTBSbnhW1lfKZSvJbmskEbg1lQxNxGJlJeOyFL
 ZrAjS4KG8qcn0s3mIQYeSOUoTPTws9TzqcKlfN+n8zZmE7a0IWvS7tfHSOESMA+Ey7Hz
 ngB71fT4ZQgce7KhYAqH0B7kZujV+SBylEtyT0P5ILLhV9MO3ipGn4BipH4IUXwnGc63
 NXH4jxksy6tMa3zV734ncz2R4K3m8kzuke4r7E/+NLflk5rSLnI2mW2JVMjmRPQwGCJV
 xfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3+1yQ7IqqE7VUxqu1iTNVdZmPWY4AIWRs0iIS5jt4Fg=;
 b=HU2wyaAknp3nHzH1k9aPPEWWXz6rb1ZaX/IiuzyD+miNchSDLHQDiVrAc4Rbibs3MN
 P076HdgWLy+QwmFJ0gIaEpDZ+WlkPPs4SPkr2Q6E8ysTfMSrcwIWPuc0oDoSWDzcakAx
 cq5ldC2AlxWlgSn1gc0KMoVaBlshOq1Cq/Qf6QUVmKA+sGzwqm+sPtlvSIoE0TAff9YO
 YzVbfVWaZzy3r/RbLOASyPYaypNxWVx3omCBOzcAdw/df2EcgQunFoNkc9mDjZbSlJ/3
 opTfVqEvZ492qnUtoNrljGih3Nz81UoaG0gYLL5prxNFO3KwSK++8ply5enQ71TcGyyZ
 ebjw==
X-Gm-Message-State: AOAM531YVtuZw+InwQI50XW1K2L2jT6/d58yVZ3Bati7DtwBT7hXpoar
 uEKGojf2sSRP/749Y52qVdqPcU/7Lno=
X-Google-Smtp-Source: ABdhPJyiqAGROlAZih8H5oGGwEjGZgUnEz8uepE904J4kyju1G8BRveLY5urqcZH4XE8dsb8INov4Q==
X-Received: by 2002:a5d:6a0a:: with SMTP id m10mr13328025wru.296.1642281317936; 
 Sat, 15 Jan 2022 13:15:17 -0800 (PST)
Received: from gilles-Gazelle-Professional.. (138.23.87.79.rev.sfr.net.
 [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id b5sm4547956wmq.28.2022.01.15.13.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 13:15:17 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 22:14:49 +0100
Message-Id: <20220115211449.393250-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iozone: bump to version 3_493
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/iozone/iozone.hash | 2 +-
 package/iozone/iozone.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 1255392e38..9ecf1d1af8 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  93c9142d61e6a71ea43b0a266bad7f49f07ce5f5d31b36f8edf4dd386795c483  iozone3_492.tgz
+sha256  5a52f5017e022e737f5b55f320cc6ada0f2a8c831a5f996cce2a44e03e91c038  iozone3_493.tgz
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 2282a44eb8..2df4a2aa84 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3.492
+IOZONE_VERSION = 3.493
 IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tgz
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
