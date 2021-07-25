Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B43FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:24:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4CA61029
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD4CA61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1BA08299E;
	Tue,  3 Aug 2021 22:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6pSrUsGcQmo; Tue,  3 Aug 2021 22:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB00782AEF;
	Tue,  3 Aug 2021 22:24:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D3DF1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EC384058D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wbr2avhtMM2k for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5808240585
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A1F3281F12; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:48:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e5637786be2d9ff6424fb902411750938cb1efd9
X-Git-Newrev: 70dd4bd156bac2bde07751dc3c4d5da9b14d7d7c
X-Patchwork-Hint: ignore
Message-Id: <20210803211017.A1F3281F12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Config.in: add
 BR2_PIC_PIE_ARCH_SUPPORTS hidden option
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=70dd4bd156bac2bde07751dc3c4d5da9b14d7d7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The nios2 architecture is already excluded from PIC/PIE due to issues,
and we're going to also exclude Microblaze, so let's introduce a
BR2_PIC_PIE_ARCH_SUPPORTS hidden boolean to facilitate adding this new
architecture exclusion.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Config.in b/Config.in
index c05485173b..a146ba0f43 100644
--- a/Config.in
+++ b/Config.in
@@ -726,11 +726,16 @@ endmenu
 
 comment "Security Hardening Options"
 
-config BR2_PIC_PIE
-	bool "Build code with PIC/PIE"
+config BR2_PIC_PIE_ARCH_SUPPORTS
+	bool
 	default y
 	# Nios2 toolchains produce non working binaries with -fPIC
 	depends on !BR2_nios2
+
+config BR2_PIC_PIE
+	bool "Build code with PIC/PIE"
+	default y
+	depends on BR2_PIC_PIE_ARCH_SUPPORTS
 	depends on BR2_SHARED_LIBS
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	help
@@ -738,7 +743,7 @@ config BR2_PIC_PIE
 	  Position-Independent Executables (PIE).
 
 comment "PIC/PIE needs a toolchain w/ PIE"
-	depends on !BR2_nios2
+	depends on BR2_PIC_PIE_ARCH_SUPPORTS
 	depends on BR2_SHARED_LIBS
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
 
@@ -829,7 +834,7 @@ config BR2_RELRO_PARTIAL
 
 config BR2_RELRO_FULL
 	bool "Full"
-	depends on !BR2_nios2 # BR2_PIC_PIE
+	depends on BR2_PIC_PIE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	select BR2_PIC_PIE
 	help
@@ -838,7 +843,7 @@ config BR2_RELRO_FULL
 	  program loading, i.e every time an executable is started.
 
 comment "RELRO Full needs a toolchain w/ PIE"
-	depends on !BR2_nios2
+	depends on BR2_PIC_PIE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
 
 endchoice
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
