Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE9BC25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 19:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9221081497;
	Wed, 22 May 2024 19:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzaSvO6j8kAz; Wed, 22 May 2024 19:46:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 994F88216D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 994F88216D;
	Wed, 22 May 2024 19:46:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B63461C5F05
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 19:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F03D40103
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 19:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lmjox39EE5AH for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 19:46:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.72;
 helo=smtpcmd0872.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7BA8400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7BA8400BA
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7BA8400BA
 for <buildroot@buildroot.org>; Wed, 22 May 2024 19:46:15 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9rudsYT57qLIy9rudsk5tH; Wed, 22 May 2024 21:46:11 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 21:46:10 +0200
Message-Id: <20240522194610.2553161-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfH49zcoPWGWL3sAl8bGWY7/+XS+0bm7czi+2vHlRK29V6BQjc3jOuz77cMRHqt3lo5rhmO1JqA6T+2D3T7SZjkbbQOSx11Ygwe3j6NJ/LJzePPvHStjT
 Z8hamt3s0k7p0AIZlrP7tg7Gw9m6Lzn+kw7+eWdAT3FvCU74Jw6syYPWyN/Ji5k6NojKYG/8c5CZlOROyD+Fx5/F44GE0OOf0ih7N+ipStoy55nD1Wqs6Dg4
 vs3tsZu4Lf6CznPbBMQYLwx/3HdLf+j//fiBiJVrZm+KAsS6AsWBsSRSLsFzRAMo8VpcwBTYy3OByfLgQrrFww==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1716407171; bh=x5Y6xMxssrcyAhaxvz1L7+TbLilx5FCsLb9Xe+HJ6ds=;
 h=From:To:Subject:Date:MIME-Version;
 b=PBk9Jn8lkDmlBRngGXg6siTDLOgShmQfgRRT6gv7pMo08ec+hF30YdJ8JX6fJfLZS
 H/O6GF+SAy4i/HUYEob8xiOG2K8uSBZesuvUAAVBPED4lw73V42jljypoLUMwk0jc3
 J5NvabQRhp7g9J76Ls4Tk7osU0/BMXPnsDw9S/maqlSHYaMKFsE76h81IRuxe/1XiR
 DuanRVau4P01hILEOYPYFBEAK4uCJKJMPAv3SUBnpnGt+G00QMB4Oc7G7CWegHseYL
 rgIMOrGHmIPAxmB+ze5569U8dcR+4T3W2Q310w1A3jqYLBAAd4QI4/7L6xp4vFS2+c
 NhQyOY/dXX0bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=PBk9Jn8l
Subject: [Buildroot] [PATCH v2] configs/amarula_vyasa_rk3288_defconfig: bump
 to Linux version 6.1.91
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build fails with gcc 13 with:
drivers/ata/libahci.c: In function 'ahci_led_store':
././include/linux/compiler_types.h:357:45: error: call to
'__compiletime_assert_302' declared with attribute error: BUILD_BUG_ON failed:
sizeof(_s) > sizeof(long)
  357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)

As explained in Linux commit[0] that fixes the build, sizeof() of enum
like '(1<<31)' translate to a 64-bit type, but we expect a 32-bit type.
So commit[0] makes sure the data type to be 32-bits wide by using BIT()
macro.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596548

[0]:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=97e28deab8bfe70d5687650f94484f8f9101e566

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* improve commit log as requested by Romain Naour
---
 configs/amarula_vyasa_rk3288_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 7976537225..0dd47f498f 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.91"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
