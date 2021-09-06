Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98158C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:42:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6787460F13
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6787460F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 246A1402EA;
	Mon,  6 Sep 2021 15:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pvf0Dc1xpsBZ; Mon,  6 Sep 2021 15:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 377354015C;
	Mon,  6 Sep 2021 15:42:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9061BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C0BB82499
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c58E9873oqTb for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:42:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C424582496
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 15:42:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 27F7C886E4; Mon,  6 Sep 2021 15:40:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 17:34:50 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: d9f5419d80e72e625f42cc957d0c717c61cca026
X-Git-Newrev: 6608f2a3c4f25a5e1fc506b19ecf74517b0b4dc8
X-Patchwork-Hint: ignore
Message-Id: <20210906154059.27F7C886E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] Config.in: disable
 Fortify Source for microblaze
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6608f2a3c4f25a5e1fc506b19ecf74517b0b4dc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

As reported by Toolchain-builder project [1], the microblaze glibc
toolchain creates a system that doesn't boot when FORTIFY_SOURCE is
enabled: the init process hangs.

Also, hardening features may not be wanted or possible for such
slow soft-core cpus [2].

Note: for completeness, BR2_RELRO_PARTIAL was manually tested and it
does boot.

[1] https://gitlab.com/bootlin/toolchains-builder/-/jobs/1467624500
[2] http://lists.busybox.net/pipermail/buildroot/2021-June/312416.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2e94aeed1a97f5b66b9a8dc4f0133451b7b7b34f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Config.in b/Config.in
index f0616098bf..2501658332 100644
--- a/Config.in
+++ b/Config.in
@@ -840,9 +840,16 @@ endchoice
 comment "RELocation Read Only (RELRO) needs shared libraries"
 	depends on !BR2_SHARED_LIBS
 
+config BR2_FORTIFY_SOURCE_ARCH_SUPPORTS
+	bool
+	default y
+	# Microblaze glibc toolchains don't work with Fortify Source enabled
+	depends on !BR2_microblaze
+
 choice
 	bool "Buffer-overflow Detection (FORTIFY_SOURCE)"
 	default BR2_FORTIFY_SOURCE_1
+	depends on BR2_FORTIFY_SOURCE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_OPTIMIZE_0
 	help
@@ -883,6 +890,7 @@ config BR2_FORTIFY_SOURCE_2
 endchoice
 
 comment "Fortify Source needs a glibc toolchain and optimization"
+	depends on BR2_FORTIFY_SOURCE_ARCH_SUPPORTS
 	depends on (!BR2_TOOLCHAIN_USES_GLIBC || BR2_OPTIMIZE_0)
 endmenu
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
