Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA08C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:08:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1225261004
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1225261004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA3C983A0A;
	Thu,  5 Aug 2021 11:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0homBkBPjE36; Thu,  5 Aug 2021 11:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 404AD83A89;
	Thu,  5 Aug 2021 11:08:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 144BA1BF844
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C709C605DB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H5it0v8-cSOU for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12B8B60609
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A08538B7EF; Thu,  5 Aug 2021 11:07:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 12:56:28 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 0f725b8f6c2853468b896d767ca4a98abe6691b0
X-Git-Newrev: 30e038f22e4ad18102ed779af103a72c5734286d
X-Patchwork-Hint: ignore
Message-Id: <20210805110700.A08538B7EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] Config.in: disable
 PIC/PIE for microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=30e038f22e4ad18102ed779af103a72c5734286d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
(cherry picked from commit d120f844604da2295bb7bd8fc6c1f4efbe8b5792)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Config.in b/Config.in
index be0da30c63..f0616098bf 100644
--- a/Config.in
+++ b/Config.in
@@ -716,6 +716,8 @@ comment "Security Hardening Options"
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
