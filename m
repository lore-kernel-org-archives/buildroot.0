Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55ACC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:48:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5253A6056B
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5253A6056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 282814042F;
	Sun, 25 Jul 2021 13:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqCnwWWcjzpf; Sun, 25 Jul 2021 13:48:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 250104040D;
	Sun, 25 Jul 2021 13:48:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2C9E1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D90EE8308A
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esA5cWPuAbS9 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 13:48:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3476683096
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:48:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DDB3B8636F; Sun, 25 Jul 2021 13:13:50 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:48:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70dd4bd156bac2bde07751dc3c4d5da9b14d7d7c
X-Git-Newrev: d120f844604da2295bb7bd8fc6c1f4efbe8b5792
X-Patchwork-Hint: ignore
Message-Id: <20210725131350.DDB3B8636F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in: disable PIC/PIE for microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=d120f844604da2295bb7bd8fc6c1f4efbe8b5792
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Toolchain-builder project [1], the system doesn't
boot when PIC/PIE is enabled for glibc based toolchain (the init
process hang).

Also, hardening features may not be wanted or possible for such
slow soft-core cpus [2].

Like for NiosII, disable BR2_PIC_PIE.

[1] https://gitlab.com/bootlin/toolchains-builder/-/pipelines/318038406
[2] http://lists.busybox.net/pipermail/buildroot/2021-June/312416.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Config.in b/Config.in
index a146ba0f43..2ef5d407e4 100644
--- a/Config.in
+++ b/Config.in
@@ -729,6 +729,8 @@ comment "Security Hardening Options"
 config BR2_PIC_PIE_ARCH_SUPPORTS
 	bool
 	default y
+	# Microblaze glibc toolchains don't work with PIC/PIE enabled
+	depends on !BR2_microblaze
 	# Nios2 toolchains produce non working binaries with -fPIC
 	depends on !BR2_nios2
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
