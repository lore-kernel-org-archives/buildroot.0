Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F85C38142
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 15:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C8CF40A91;
	Mon, 23 Jan 2023 15:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C8CF40A91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hfI-euCtSiRY; Mon, 23 Jan 2023 15:57:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD0B040A6D;
	Mon, 23 Jan 2023 15:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD0B040A6D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D35E1BF3D5
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 15:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38AB981FCF
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 15:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38AB981FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRTj2Yq2YNle for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 15:57:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 992F281FCC
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 992F281FCC
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 15:57:05 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id b17so11817329pld.7
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 07:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VXfzopMnPNeOyDtZ8SgvPyBzXRsUPXY7W/NTfijdMCc=;
 b=ADMVE0+fxnicO7k4d5O3bc3USTvxJnaeDMayabQ/3IfUqaN5gIwAfmAJYy8qb62i89
 pDKe7g7emLgUKhtjcaBR9gBXSxrUfwIYmulABlG7a986jU54Pxj5bpcokK4TCDmG+7P5
 fgafWwkdFAYlnOwFGVdgi2PGfTYFhlStI1L86Lql7PG06EftyJ/ujf4b/p5QBIS/1kZF
 AY5SZ6TAbXtG5epa09UQqHgtE2P2mXjyXiHSlkLLKMlHPmhbOFV1kL6Ga67XjSp97c/H
 bxGyjK/U9qFrCJMqojpshr/sDZ9aHwizLLefflwpg5ePtykt4Vn2jgjceesdgqC9dwCR
 KGkA==
X-Gm-Message-State: AFqh2kriHNpiVH80oU88yHB4i8VL+HTDr+bbiWGmm57CVCfLS+m2vq7n
 5SLFOzYgC5BeeRKuO2ZCTCVo54ayrt322w==
X-Google-Smtp-Source: AMrXdXsuHAM1WrZl8h8txsKG3o4Gi+w0RInJyiS8B1CT6YRvBgZR9PvSJwj1TNgK4dzocuSzLu7Zgw==
X-Received: by 2002:a17:902:7049:b0:194:c241:f604 with SMTP id
 h9-20020a170902704900b00194c241f604mr19755999plt.57.1674489424974; 
 Mon, 23 Jan 2023 07:57:04 -0800 (PST)
Received: from localhost.localdomain (204-83-79-2.sktn.hsdb.sasknet.sk.ca.
 [204.83.79.2]) by smtp.gmail.com with ESMTPSA id
 a4-20020a63e844000000b004b6c3d7aa21sm20647861pgk.8.2023.01.23.07.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:57:04 -0800 (PST)
From: Ramon Crichlow <rcrichlow9000@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 09:56:59 -0600
Message-Id: <20230123155659.4207-1-rcrichlow9000@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VXfzopMnPNeOyDtZ8SgvPyBzXRsUPXY7W/NTfijdMCc=;
 b=R9YU1Bl8+QMqoHsr0bENx2nsk7/xQSVW3Mw5iT+xmQxJLNfeb73GF1GlMsHn+zT4SD
 WLbU6GmQSCvyFFr+MVyAbzz5GEwPWVY2seHe3Cpp3Mwunh+siRcUA+y7PrVrbB09l+6k
 qK4EjURIJazxegkkqOD8vf2mEL1b6KJHpjS1thSF92kWcS+PgCianhndv/NPZLup+/fk
 GP1Z29HvHMiOMEaAE5Zz9uaJL14ECmyLJK+AUj5TLVC2ZiwYvGKFSlrhbWn5TFb6aqJE
 PAKYrqEZGUcGT1RwVtLrRDS+yMqKvKY946gzl91vPSs/TEfGayTK6z5SA1pz+xJOJVjA
 9JAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R9YU1Bl8
Subject: [Buildroot] [PATCH 1/1] Added beaglebone-green-wireless device tree
 to beaglebone_defconfig and genimage.cfg
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
Cc: Ramon Crichlow <rcrichlow9000@gmail.com>,
 Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ramon Crichlow <rcrichlow9000@gmail.com>
---
 board/beaglebone/genimage.cfg | 1 +
 configs/beaglebone_defconfig  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
index 42ca2cf107..987d205075 100644
--- a/board/beaglebone/genimage.cfg
+++ b/board/beaglebone/genimage.cfg
@@ -11,6 +11,7 @@ image boot.vfat {
 			"am335x-boneblack.dtb",
 			"am335x-bonegreen.dtb",
 			"am335x-boneblack-wireless.dtb",
+			"am335x-bonegreen-wireless.dtb",
 		}
 	}
 
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 06154d98b7..639b491e97 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -23,7 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.30-ti-r3)/linux-5.10.30-ti-r3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
