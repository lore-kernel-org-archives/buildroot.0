Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4F4C25B75
	for <buildroot@archiver.kernel.org>; Sun, 26 May 2024 17:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 512304011C;
	Sun, 26 May 2024 17:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Qvyg-3R4GeY; Sun, 26 May 2024 17:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58E9C40141
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58E9C40141;
	Sun, 26 May 2024 17:58:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6E1A1BF5DA
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 17:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D275E40299
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 17:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-nN1KGInsEi for <buildroot@lists.busybox.net>;
 Sun, 26 May 2024 17:58:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8FCA74027C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FCA74027C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FCA74027C
 for <buildroot@buildroot.org>; Sun, 26 May 2024 17:58:40 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A4996B00593;
 Sun, 26 May 2024 19:58:34 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 May 2024 19:58:28 +0200
Message-ID: <20240526175828.529726-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716746316;
 bh=m5K5PGeMBi9aHHQn7mcpokXrk7Nidn1ssO8nBl+YddA=;
 h=From:To:Cc:Subject:Date:From;
 b=R8ikSJdDRYepcKVyr3lWWR3NUw9kFgUoeuFnREC6hG63x/K2l73uQt8lW4XueXTsY
 bAG7ZrCvJxDfD0bE4BRFCLjhkN5xKV3iNuiQkmVZyICpxQEmWfVYWQBB/h0KFb92Fa
 OFHKiA8+d/bUAIIMSPu+hcXsjTd7uik2iMxuVvyoaLhQOpWfbBoNwWH5egAYTjGQF2
 rwaHdanVmcmf1Vbu4t8PEWoPE82RF+keqixjtpCa97iksDsXxQzJ6w2TH0DAaFZgJc
 QyrzYGo2u1Zj5Z+WKUsXtIyDGiGMfEZ3U6sBvIEbGewFwsAtOXeBxXsnvvofbwfDgn
 IMP+gY/U0uVrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R8ikSJdD
Subject: [Buildroot] [PATCH 1/1] configs/pine64_star64: uboot needs openssl
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
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The defconfig fails in uboot build, with output:

    In file included from tools/imagetool.c:10:
    include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
     1178 | #  include <openssl/evp.h>
          |            ^~~~~~~~~~~~~~~

This commit fixes the issue by adding
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y to the defconfig.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689164

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/pine64_star64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pine64_star64_defconfig b/configs/pine64_star64_defconfig
index 2c0c17ad62b..9852e6d82b3 100644
--- a/configs/pine64_star64_defconfig
+++ b/configs/pine64_star64_defconfig
@@ -24,6 +24,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Fishwaldo,u-boot,172b47f62039605d6806fa96bd403c21cda28996)/u-boot-172b47f62039605d6806fa96bd403c21cda28996.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pine64_star64"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
 # Misc
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
