Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9AAC982E6
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 165D940BAB;
	Sun, 20 Sep 2026 12:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RY4ciyTLn88v; Sun, 20 Sep 2026 12:30:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3715640BA1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907419;
	b=d2SGiCqa8Ir0O0xyckSrgmab63EszrPsjU6r6fWcpBS8JoFPMAqmuAq5+Zw1jY6HKYyq
	 CLCUHJ51IHmw6v+d7txTCOaIJLlV1HmOEasDGrd25HnmPgErbvsBLNvu/HeAvj+gDSEi/
	 nOILOXdzgWvSqtQoJ+G/4pmWjIyuiBQSDliju0SNMNDev2UAX7MWlhf5Di8ky2me1EPDo
	 VuXbTie8s8qbSjfxUtqTtps6b5Abi5PYAYL3+DxhvWOV5cfnXlJBfuGO3rpT1oTDg1nX8
	 vuwmxWx3En22VFuV5rrtn06no31FLIhtNMtmdR8J0QdPhQiUtT12nCiZLdq5/V+nntA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=d2hYiV/t6x7GJqFMKhTEH9qfNqH75GzD90lfq1ULMfU=;
	b=JbgZqqvTaS+GXa/tdNEOMEWmTMKHnA+2DijHX/x8Rx2a07huyWdBWEI9rbAU5u0T8s0X
	 zPQDd9bmGMNkqQYDcskZvGMT3K2vqIa6TNWV90j97PqBRDOEjJVNJntkt9dlTJuD7rE/R
	 1Jogse5QvCIXw6JlHBYLrQt3AT6u3JekEiYTEy8+2yuA/clM9OgvcPa6HBTEL3XBPDIgB
	 7gSpkXiKX30lkZGAiCSaGrDiWkdRH8ENYCSBE1tnLdHtfGXkM3tNhEQcrSmoVUrKlM9bV
	 X6Ie7cztYoh60Je4zv9e90YSM2+OstgeAjxLTamY3hVgYH/xx17K7k+P/PLDRDJwWAg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907419;
	bh=d2hYiV/t6x7GJqFMKhTEH9qfNqH75GzD90lfq1ULMfU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jQ7+ThepcqgZhW6JLZ2VtVptzrGvkoRe9Xy2BVc8M25OYDxP6CMD2URw7anNcdCCZ
	 E8lfjou/H0bW/HoIkGk90VPM3QHEp/gYon1nB4jadGdbaAdYKXJB9i2BH9b6uxb87K
	 Y3jaOB9yOYgvPgAnFlQxz/hj2Skj6Ob4s+4rrzbkRloQTiwjY6qwrIgTus1StUdqsn
	 X6xgwOh2xTcl8Epqx7JliSTzxxF3smJ1UmKhLnbgOj7w/+rPhAfImevItjoh3AexT9
	 vbsFc+drPUtHOWTldGwwyTbdekGwSQOzdHt+CdXy747iwW86Hgh1RFxNnkM16QTeuY
	 ogsyy51O0o2Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3715640BA1;
	Sun, 20 Sep 2026 12:30:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B9E371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A678C80F10
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vshe038o3tvC for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:30:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0417F80F11
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907415;
 b=Vnal5fduT70/lziaUudf16PgtHIgtvtFVerV7+raSHGl/f9suwAocMGow1l3Kk+SgPLz
 MvTmHp4QPnaptl392UvIRy4+Ymd3zIfaaMxz9acMFfjRFjNKBHD9Gx8JsAMhN2JtCM1Sc
 CP6Utd7GzrDhzH+vQ1lAhGIE/jftYUFbbg/4hXf+4C1wz90CuAcknFpCdECFolcYoDiG8
 tnAzidTQj/aSheeJkInNX2+ZMJTmf4uWkSp9l+FgR4IeZ5GtjpB8k0coYrhyjj+/8vuUo
 aCwtvX0JnTrAFkPhbfkT3WZHSPHPDszFRf1jndw7hQePdVHNlaQN9nPLceNd/HJYj+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907415;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LB+Zd3urrRHvf53vv0GHyVSPhbAM9nP7k10YE4FDsK4=;
 b=nOjo5tzH1cxyA2l1Iu9BSzNHeM2SMBSGR1xoZ3zBEi6fbl9Phv7NPCfDIOUN2+Dxx9Lt
 8hKPQaSPb1bL1agi+oDUrdEdPICzfMJ9hYwTvY2gD2HpFmFq54Tb1B9vFJbGdcfZ5D6uX
 KQ+gJTYOq4jsuvhHNIgJfQUR5nrMDaonYuc0uJEWGydYQlw1eA5gm0xKT2lkX+8sOlEHb
 7aWVE/8zCwV/ev9y5kvCV0Rcs8fDCwGg2zmxICj/PSMUgyf1zdMzZy0mqvETw38ibPPM3
 avgVyrbTQ3GZv0Nr9ZpqrlBIciAn8O3KgLExCg728/nWRibplRrhmhe56veykDT3a2w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0417F80F11
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 933608DB46; Sun, 20 Sep 2026 12:29:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 14:29:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98aa14a186e1fa29fd059775d218f076fea40584
X-Git-Newrev: 0df986a59bf9a71986ff6a8d7faabdec4f4300ac
X-Patchwork-Hint: ignore
Message-Id: <20260920122906.933608DB46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/visionfive2,
 configs/visionfive2: add support for v1.2a board
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0df986a59bf9a71986ff6a8d7faabdec4f4300ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

There are two revisions of the VisionFive 2: v1.2a and v1.3b. The main
difference between them is that v1.2a has one Gigabit Ethernet port and
one Fast Ethernet port, while v1.3b has two Gigabit Ethernet ports.

Unless explicitly set, U-Boot automatically sets $fdtfile based on the
EEPROM product data during initialization, enabling <fdtdir>/<fdtfile>
to be loaded via extlinux.conf.

Additionally, since $fdtfile contains the directory name, preserve the
directory structure of the DTBs when copying them to the target
directory.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/visionfive2/overlay/boot/extlinux/extlinux.conf | 2 +-
 configs/visionfive2_defconfig                         | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/visionfive2/overlay/boot/extlinux/extlinux.conf b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
index 7934d70e15..6c290f519c 100644
--- a/board/visionfive2/overlay/boot/extlinux/extlinux.conf
+++ b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label linux
   kernel /boot/Image
-  devicetree /boot/jh7110-starfive-visionfive-2-v1.3b.dtb
+  fdtdir /boot
   append console=ttyS0,115200 root=/dev/mmcblk1p1 rootwait
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 3e30c0649c..7ce605b84b 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -11,7 +11,8 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.51"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/visionfive2/linux_defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-starfive-visionfive-2-v1.3b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-starfive-visionfive-2-v1.2a starfive/jh7110-starfive-visionfive-2-v1.3b"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
