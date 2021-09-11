Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2FEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 08:47:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EF5C611BF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 08:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EF5C611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3215E40163;
	Sat, 11 Sep 2021 08:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4Z5DVDlMm0w; Sat, 11 Sep 2021 08:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AEC0400A8;
	Sat, 11 Sep 2021 08:47:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F29591BF3C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 08:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E169860654
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 08:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrC-OxtWBo3h for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 08:47:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C22BE605BD
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631350026;
 bh=BytOZUO4y2KEq2x9s4f5WdD1O3wy+ylPiqjZUbjepsU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=IkDaASX6WEXMU0fOuljFPsQzDNufIr0Rju5ikTBQwSDlRPv0CVp+xtuszOXipWJXc
 vy7zMMbJIw4N321QhYYIyVdsytj8X8L6iekHoqMOTSINii/7zyBobOgYTDzpBLEjcp
 Pna0Ald/axLqAx2P9EZiDD1f+HfdqUj7gsZIdNTk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from NCC-5001D.lan ([83.130.82.162]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MnJhU-1moNib3EIe-00jLPK for
 <buildroot@buildroot.org>; Sat, 11 Sep 2021 10:42:05 +0200
From: Dagg Stompler <daggs@gmx.com>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 11:42:04 +0300
Message-Id: <20210911084204.22150-1-daggs@gmx.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:O6MZlLOSYFgT/9Vo+oLPzmK/HZiOomTEirp7m4XlqK1tC6GrqUt
 17ZwW7hhgE4zN0pNIW1KBYkaWZdZs6sKxDD712KwcaR4MP18x+mCUoPpo4vZ9ooQzX89f7T
 4oSZPwKExyDfibAyNCVwXF9bcCO0/CWqlKKgCtgmtNDxUR+XXW4Ahp7gUFs65aZSRJXkUsB
 tSh4hn2/WdFPy1HEJUWUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aWxi8P87c7w=:aZCEoqzLysuu8IwPaG5y88
 d/xBkC4emRo8FZ62+sRUbIM9WYSmMWYrQ3GrXzT9XzPWnz/+w9MhIuCezLMPAdbaozNgz5Vla
 B3ZkbxC4dEaZM6eWgvDEVQbbEYBoHfDOsfWAVLpoevQ0ex3bntJxb/yJ0eoS6RAS5QjoGw4ih
 9tMsQz6MFtXCXve2WmxlKClFTg6n/GvL7t9ndezLlcgPE4MkCY3hr8g/RTp/AsUfO43Bu27Vb
 D3OzYTogMGc/hKY3uQnyaDx16QN+y+WfYDMdeI/2UjcMq14rl+IUrTjcDTjMFv0t9WqDfRr0+
 LuLbF7QUDjyl89Lzw7VD2DpmM9oYg5OR71OJSt0TQU+283N2GCTuhlY3XE41QCJCrWbeaF+N3
 HdxUXbPH31fAfHJvww5hsXEsRiMXWUtygFmOVx/XBem9h2eAnqeVqfHKgwyPQcCQEJHDxd8iH
 4DDAB0ksjgr1iN+h0a1hKyBYLlBDPUzxeOEOq3GLkLzM+r34ZbynU+PoxO9GlPMom4LRiLqYw
 xjhS2vG4YxKbmSNeAyor8X6TH+WlmLEtJbVIv3emEkeStp2EBM03M+tqnwZM/D9QHGnaSXNsH
 Zo7hgiTB50ZDZ+ahXA+PRiaCTeUNV21RwH9pZpu+54xJH2PI0MW8q80Z5n6wZMV1HNIyC4sIH
 haHc33A9U37RbQTVEMhqE8Hfr9FeRlUSDhQnYqdwL4nCfxLGTwJZdicsr5CBwKahFlXdV6oIu
 ENDRjVuqvIQFRlmqEULobA2WuoIbORMCoWUeESTPY+BujqpBNOp/xTJCj9aWqBFMpsqwQ6WUD
 HIFIaGblxm5ejUx5sPXD0OWS3kNcFs2wLLPebCrIYTNrX7dlju09GhfgnNHE6DvReq+TBm0cI
 Gl1b8L4uQDHrGdMAkLVN1VWaGf9luEvCjY/PBW+ygofVYcZk+AjNljFpq3DWCbDx0UzztG4Of
 nme6Kam9Yfbrf6gOuxFrhTnx6b1yEO6uns2CXOSgWNzBOXR1FNR+hWESkh/xRPYQW7BA79Zfy
 OIe/FnVb2yhmyD/UER8gMyAST2gYotGZA9AStAlGB6ZzmTMZUy7Dhn+FhXFOkhIll1xeNF7cg
 OT5km2rD7J845w=
Subject: [Buildroot] [PATCH] configs/ordeidc2: increase image size to 256M
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

following Commit 9f127cc4, the resulting image is bigger than possible.
so BR2_TARGET_ROOTFS_EXT2_SIZE set to 256M is required.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071376

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 configs/odroidc2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 5f97fc3dd8..daa818e036 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -10,6 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAML0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_ROOTFS_OVERLAY="board/hardkernel/odroidc2/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"

--
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
