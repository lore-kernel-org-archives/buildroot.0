Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB278107BCE2
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86CB440EC8;
	Fri, 13 Mar 2026 21:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynK01rf9Y32N; Fri, 13 Mar 2026 21:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3E0040E98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773438666;
	bh=/gc5RjLaA/e7sUftzGlnDdGkTBZYwSWctbW3z2E3ctU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ZB27ghpUjts3sGGJTDJIgJtyYo1tX1L6Nd2jot8utxlmCRcrkv0Q2zzop5q0r+7g5
	 dcbDazHfDj+FnP8cfYvzzz1ILaB8gLIhD16x2k/fZ5DDJRtFTnnI384/5Rkgdiu3sf
	 Bi7HaIJLuRxznRsxX03W8O8YrU5Z9Vlcz6FWD4kEOJcoOpYFv6oH7/VXvi5kU5/EF4
	 AmglRkweJsiAIh+i6Wbl8rvxu2QVAHwY8pbnPkwbUFJPh4H+XzppxKdy6ANG6n1TCj
	 4dDLQIeuqCqFa9Ebte++Rr+luMvqs0jjRlVzsMAUjRF4BuS4MNaGrxvmcIodOCIDMR
	 PPR1wYlt+M1Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3E0040E98;
	Fri, 13 Mar 2026 21:51:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B117A786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2BE3405D8
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wtsqjei_8H7Z for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:51:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 711D24005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 711D24005A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 711D24005A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 459FA19F593;
 Fri, 13 Mar 2026 22:50:54 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Mar 2026 22:50:37 +0100
Message-ID: <20260313215044.2406044-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773438660;
 bh=CGhP64XYJ708sCOz+0lR/tTkTR2OC2IdEkiuWdv7iUk=;
 h=From:To:Cc:Subject:Date:From;
 b=u6G57E6FZRuDi8jcsfK0TkHR9rXxcFrqu/mA8Bz2kG34wJMTY4sUjbHgn5YspiLUQ
 IK5jmFEmM5P2fnRhhRbz4jZKD99dyMNfVIIZIPCg0AS/SraLzlM1IOzNGfFnY7QQT8
 5KaZqeUg6CUpp6/n5+JR3OHC4NGT2f4ulvTFDAnwN65xhv+SDXkdN6JzN7MT8GHqvt
 UNUtLsUqGA4duD1lbovWvuyDXDRT6JL9FZAga/fLQVNNwDufwHuEtJFr9uhz7vtfhJ
 TOowZj+zdnUJoExov3RSilXeYA1ShlaXaEkXimZp7udQXknhv5zvoffzo8DCThq+7Y
 3creUB+A7CtNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u6G57E6F
Subject: [Buildroot] [PATCH v2 1/7] support/testing: test_xfsprogs: use
 bootlin toolchain, update kernel
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit updates the test configuration to switch to a Bootlin
external toolchain. This is needed to get newer toolchain kernel
headers required by newer xfsprogs versions.

xfsprogs upstream commit [1] (included in v6.15) introduced a usage
of the "capacity" field of zoned block devices, introduced in Kernel
commit [2], first included in v5.9.

This commit also updates the runtime test Kernel version
to the LTS 6.18.18. This is because the default filesystem options
of mkfs.xfs were updated in upstream commit [3] to include new
features supported in the new Kernel 6.18.y LTS series. The commit [3]
is included in xfsprogs v6.18.

[1] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=48ccc2459039309cfbaf358febea53a86f07827c
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=82394db7383d33641f3f565bd79792fb41b1741f
[3] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=54aad16b4b9b923442b4042afaba4438ca1aa868

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes:
v1-> v2:
- new patch, separated from the xfsprogs bump in v1
- kernel updated from 6.18.9 to 6.18.18
---
 support/testing/tests/package/test_xfsprogs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_xfsprogs.py b/support/testing/tests/package/test_xfsprogs.py
index a3a4bd27d8..03191aa22b 100644
--- a/support/testing/tests/package/test_xfsprogs.py
+++ b/support/testing/tests/package/test_xfsprogs.py
@@ -12,10 +12,11 @@ class TestXfsProgs(infra.basetest.BRTest):
         f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.37"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
