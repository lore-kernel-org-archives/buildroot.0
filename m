Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7782C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 16:40:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 682386112D
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 16:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 682386112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0339783498;
	Fri, 22 Oct 2021 16:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKKgfjRs0M6q; Fri, 22 Oct 2021 16:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74B22826B0;
	Fri, 22 Oct 2021 16:40:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7CE1BF36F
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 16:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9807340104
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 16:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3VjPw6etWOh for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 16:40:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB8FD400FB
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 16:40:18 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id t2so4004479qtn.12
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gTvFkOEcnMBYfw0Ei3sREqQ8VtKeZcuhl6ZBc7IhwYQ=;
 b=Za6jFsJqHy1UCXGxE/7JlKn2kG6884a5UHPWch7Y574WDkTVrfWTKegVia0daICFOB
 R/rWgJsRKruQQap5nFx69MLVZPmibE6JTjwbZpdA2ANjVkDGCX83yA3AeCqW5G9mCWDF
 YoBA+IxjzeLL3RmKyQ8VHtmkIctLb0x/Lr0U45d0D6944GoVFEDY5jdr7tvmTmfreuIA
 qORfOOMiFZe0rulpAB3yO5zKW7YwfnAOzPZN+bFPWoiLPCYXHABcDd+0cYzUDisN3ozz
 BPURdm8TmpPHGFu9uft2coLqb1ZFG4rG7g2ywFOJJwemzl2N84aajNXFxksDTHmBdhXi
 SZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gTvFkOEcnMBYfw0Ei3sREqQ8VtKeZcuhl6ZBc7IhwYQ=;
 b=KsuiwDGIEa+1gSHb6W5LuCKanPyd1/IZJwPO8PWlYrCpXKGX4eRQCgSAyxyWM8Ju09
 VPgVg9n+FZdfnqIz9PuIvWoGsu+mL4AHTz3YFYMDRXjJX1KIifoyJlymBu7122vVMxyF
 cIjHk0I01llzSFey6gq3cI+MKxQ1m4v9PTennutoHQ6o8i1C8EAECrbeZJPrsEKhZ4SK
 oDaYhxp5F4NjzrCDAJ5z9wvybWCsYKHZPeu3Qjo7w1peImiIeipNjLU5r3g2M0C2ubQb
 9xUxKcAzq79wQCjPtzs7dbfiUv3JK74xsQvdDYvpN8sbsnRu6x2ocGJixGFJom1WuP8e
 x6qg==
X-Gm-Message-State: AOAM533e8UBMSHtCDZ90C8aR7jKVAZAVfOoAHHa4ggnvo3YZ+sulJcw6
 7rhevGKR1+UGix2vvSaNYyKMjzSfCmU=
X-Google-Smtp-Source: ABdhPJzDXuZRVsfGuyxj9tpQIsKiLjfrPBHMqLoyA/T98mRPK0O1W3cRnNjdIzs3bOG0G+90chjWsQ==
X-Received: by 2002:a05:622a:1492:: with SMTP id
 t18mr1075790qtx.229.1634920815739; 
 Fri, 22 Oct 2021 09:40:15 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id g18sm4282568qto.71.2021.10.22.09.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 09:40:15 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 09:40:11 -0700
Message-Id: <20211022164011.78007-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump to version 14.18.1
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
Cc: Daniel Price <daniel.price@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to updating Acorn to v8.4.1

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 098049c021..3a4571e8e5 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From https://nodejs.org/dist/v14.17.6/SHASUMS256.txt
-sha256  f458cd0b1cb1540611cb08709d833c0c59c74da79310ae1984cc8bad1404ad5e  node-v14.17.6.tar.xz
+sha256  3fa1d71adddfab2f5e3e41874b4eddbdf92b65cade4a43922fb1e437afcf89ed  node-v14.18.1.tar.xz
 
 # Hash for license file
-sha256  4c3016fb267bc473af18b305068f7f2d206ccd5ab98297ec593e1c32d73ad4fc  LICENSE
+sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 32f4947c0d..42ef1baa64 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 14.17.6
+NODEJS_VERSION = 14.18.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-qemu host-python3 host-nodejs c-ares \
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
