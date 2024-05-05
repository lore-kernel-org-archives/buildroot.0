Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A448EC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 19:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57BC74068F;
	Sun,  5 May 2024 19:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lga071p7eyWA; Sun,  5 May 2024 19:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DDEA40694
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DDEA40694;
	Sun,  5 May 2024 19:59:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D856D1BF286
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 19:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C508060789
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 19:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-zsV89cd_hb for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 19:59:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1EFD0605EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EFD0605EC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EFD0605EC
 for <buildroot@buildroot.org>; Sun,  5 May 2024 19:59:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15875240005;
 Sun,  5 May 2024 19:59:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1s3i1Q-000jyN-1F;
 Sun, 05 May 2024 21:59:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  5 May 2024 21:59:43 +0200
Message-Id: <20240505195943.176708-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] configs/sheevaplug_defconfig: bump Linux to fix
 binutils 2.41 build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770801

The Linux kernel fails to build since commit e88225ed882 (package/binutils:
make 2.41 the default version):

arch/arm/mm/proc-feroceon.S: Assembler messages:
arch/arm/mm/proc-feroceon.S:587: Error: junk at end of line, first unrecognized character is `#'
make[3]: *** [scripts/Makefile.build:430: arch/arm/mm/proc-feroceon.o] Error 1
make[3]: *** Waiting for unfinished jobs....

Fix the build by bumping the kernel to 4.14.336, which includes commit
3ab03df64f77 (ARM: 8933/1: replace Sun/Solaris style flag on section
directive):

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.14.y&id=3ab03df64f7754728a2257c47775a70a88428331

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sheevaplug_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 7f186df22c..0879f17071 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -27,7 +27,7 @@ BR2_TARGET_UBOOT_FORMAT_KWB=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.253"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.336"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
