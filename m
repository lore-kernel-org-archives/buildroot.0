Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27750E77197
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 20:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5E9160628;
	Sun,  5 Jan 2025 20:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8zBYx_LI2RM; Sun,  5 Jan 2025 20:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0854760646
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0854760646;
	Sun,  5 Jan 2025 20:08:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47D2CD92
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 20:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35FC460629
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 20:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alZNvMq55OhZ for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 20:08:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 011D360628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 011D360628
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 011D360628
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 20:08:40 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E77E0B00617;
 Sun,  5 Jan 2025 21:08:33 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun,  5 Jan 2025 21:08:26 +0100
Message-ID: <20250105200826.2858503-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736107717;
 bh=2U7prQna9978odZj/YW0mUwi6lxWPR90+H2AXv050oY=;
 h=From:To:Cc:Subject:Date:From;
 b=HEvETNeI5iJk2EJU/N7Qlaf2v1/h156eJQP6ULDQzOGbRePZbF81nIIEIp9MMm7qO
 JeS/Ch2ocBUFL+oTwLTloI+YwkrSCU2CKhGW8zJ85m5Jl212KzzqxmRrZ83r7T+sSJ
 dQ8ETaAUdVZ1LRPOkUEJOEqFsqFGqQnnSu41vkxamgRTFcYzPf6md7ccczOVyPdpda
 VVX75kFKtUamF92GMWPOmpepFcjz6iap1BeT6YVZ5DM0EN+eLf52+GTn/ySXBt0PVs
 aIHWEmNC9ntsDSF7vsWJeosBo+WloqCCel5SyK9SxXaR/nnCRbGJkGPImfl9qeIMF3
 kLl6U8nQIWOZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HEvETNeI
Subject: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: fix kernel hash
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

Commit 75320f567d "configs/imx6ulz_bsh_smm_m2: bump U-Boot to 2024.10
and Linux to 6.1.120" updated the kernel from 6.1.68 to 6.1.120 but
forgot to update its per-config kernel hash file.

The defconfig fails with the error:

    ERROR: No hash found for linux-6.1.120.tar.xz

This failure happen since commit 07149e5f30 "{linux, linux-headers}:
bump 5.{4, 10, 15}.x / 6.{1, 6, 12}.x series" which updated the
Buildroot 6.1 kernel series from 6.1.120 to 6.1.122.

This commit fixes the issue by updating the hash.

While at it, it also changes the "Locally computed" comment
by the upstream link to hashes.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983243

Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
index 25e4464adb..6d69eabbd6 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  365ff26a30e206de9b18489f45d38582a0a61b7c5919f8ab89295a47316784e1  linux-6.1.68.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  61c997b8acbbb8ab184565e96f476ecbb7e773cb35b98a1a4c832d809b2bf719  linux-6.1.120.tar.xz
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
