Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F04C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:34:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3905360FE6
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3905360FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA3342637;
	Thu, 26 Aug 2021 22:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95-ZPFdODPK6; Thu, 26 Aug 2021 22:34:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7028E426BD;
	Thu, 26 Aug 2021 22:34:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 040B71BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99850407BD
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6FhuYRM-Yud for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9025D407CC
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F1A798DC50; Thu, 26 Aug 2021 22:01:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 23 Aug 2021 23:08:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 181a5e229b347c1996eeca7d7727ee66bc566f01
X-Git-Newrev: 2e94aeed1a97f5b66b9a8dc4f0133451b7b7b34f
X-Patchwork-Hint: ignore
Message-Id: <20210826220132.F1A798DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Config.in: disable Fortify
 Source for microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e94aeed1a97f5b66b9a8dc4f0133451b7b7b34f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
---
 Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Config.in b/Config.in
index 2ef5d407e4..3db2c8dcab 100644
--- a/Config.in
+++ b/Config.in
@@ -853,9 +853,16 @@ endchoice
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
@@ -896,6 +903,7 @@ config BR2_FORTIFY_SOURCE_2
 endchoice
 
 comment "Fortify Source needs a glibc toolchain and optimization"
+	depends on BR2_FORTIFY_SOURCE_ARCH_SUPPORTS
 	depends on (!BR2_TOOLCHAIN_USES_GLIBC || BR2_OPTIMIZE_0)
 endmenu
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
