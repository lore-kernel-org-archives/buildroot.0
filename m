Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D883C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:25:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB4960F58
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AB4960F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E49A61BDD;
	Sat, 11 Sep 2021 16:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zo56dBbesd9X; Sat, 11 Sep 2021 16:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C32261BD8;
	Sat, 11 Sep 2021 16:25:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68B9E1BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6440882796
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFB7zdV_ZEtc for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:25:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED70082786
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631377517;
 bh=STBYhyMoJeV/BK68/5yxaZGAOnr4yhb4QmlelGxw1Ss=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=DVcEfIY8IFa4OZc1pBXa6B7DUgV5ZFSqzFvA+ospziaALJBcpUIJXEFP7fxF4ljss
 05uv6F4o/nyfzjYVHaERR+UiiYXjJJAuDuNZdgTDrtGTFb7dpkDi0toQBqyIEGnSgn
 dVJnh6gsb4JQdcbEKLcBwts+Di7XDmDasT1gqQJs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from NCC-5001D.lan ([83.130.82.162]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1M5wPb-1mJION3qQN-007SyT for
 <buildroot@buildroot.org>; Sat, 11 Sep 2021 18:25:17 +0200
From: Dagg Stompler <daggs@gmx.com>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 19:25:14 +0300
Message-Id: <20210911162515.29022-1-daggs@gmx.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:2to//FvpmRC8u7+KhTGFdqYQvQIsDvkQ5//IbdVkej57gHqfJWs
 +Qp7Ud1cDHXvXwnR9qg3V3seNHy4kqK4vXCDAUbV03jjaNz7pzgzSibRvYA+srEqs40sgta
 G4LEiBVuZ8cgL9QVXzEtBGpRFD7lQQaslH+YX/Vv96L4jvgixRWRgjxXL117tbyp1KMjZmU
 Aa2a61l9zs9Jv9ROGAPCA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nmh2CV7rHuI=:GkB9BJUVY3xm9g5XW83gVp
 6NWljoJ1tNNp2gTI2jkBcs5G7kkTR0BETLiwil+XSqJ+GSOoIlYnszC3V64O/fjSzjUoXKY62
 089rpvj5ums2MkwlLxA4adjiieu17tbW0JFJFTDB0778W/2a4CW+wdEpgy6MhyGnCMx4PAEap
 oUbK3qxG5kak7tXXrpo6ESkob4YUvHqHC14Fgb1ih60PMAR9iGgAn4xxna2T2eWLKpltXXfgV
 LzG/c91bPcvqyXNIUgcnkTglRPQ2E3n3BtDb6SRsO6CN1h7UYWc70qjZXEBV717bUFMyZP9Mj
 CLZqGG+1ZAz0ygiZVeQ9a3g5toz7zRNXx9R2RuxzbCHyulRvgDHMnJzrhfsVSy+Nwk59kCLvA
 S8xPzLXI678AIf358sxdK3NEtxChzhdSW9oN5AFquYj/8pxE2/c+Em+TZn8ES8hdW3wDFbdPy
 bEQKtQ55dxAndx9UxL6ZcwcK7dIVXASrOnQFVF8t0qsFUjKbDD7r787NcA6OE+T1Y6IskSZJM
 9wlHLZwEq2Y+Z3Kcq8KSoGhCwWOFKDVlyzRZTnVR1LdL72YrR/3BN5ay/0jzrB41jxr7N57mR
 qURWnmokc4WHyCoPG7B0FS+6bLAxKniKJB/J8AJ7frFrjr8nzbp28hhEfMAtKtARaqSBPbJyR
 y1zy9xvLeEOCAwUrE6Ca37LmPQADYXxd/F2y7sC6IgpAzK5I7aZ8eixr0b2rmJYD57GIuWSF/
 5fAl1Ik7j0BCvq8dRY+yLWNxYm4iUjXvj/dxt6iobDvg0jtHMVk4RA+9XxyqR//5N65TElnQf
 Oxjt9OkpC9v4OMUuPYKyEzOglyx+gj5onzlAMrram4CP+EBZOR5S5siQmfyhcKizW2Sd+CAx5
 4u6Sqa6sSdBP6ZIQw69mKEvqpNm5c8dZPB5/lMTAx59aQXFWI9clyyH/So7LtZf8D9ToU6pt3
 yrD9y7zMViMYBidgLqtXOIRmptSSx5p7Nyxsj1iixGC0LmttC4xChHE8t+PSQTOVdFiuf1hG/
 Sh3C5lA3l465xk+DnLRql5w0yZxXDroo+0kYhbRo6C8Mo4WSPC7WeBj51f10Vr7qTEDjQKEgn
 C9UJDo7tY6q040=
Subject: [Buildroot] [PATCH v2 1/2] configs/odroidc2: increase rootfs size
 to 124M
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

as result of e2fsprogs version bump, the image size required was
increased.
so to fix it and make sure there is enough size, set BR2_TARGET_ROOTFS_EXT2_SIZE
to 124M

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---

 v1 -> v2:
    reduce size from 256 to 124 (Yann E. MORIN)

 configs/odroidc2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 5f97fc3dd8..70e539d6f9 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -10,6 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAML0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="124M"
 BR2_ROOTFS_OVERLAY="board/hardkernel/odroidc2/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"

--
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
