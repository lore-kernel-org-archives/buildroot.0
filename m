Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229F3C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:54:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3FE86056B
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3FE86056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFA09608B4;
	Tue,  3 Aug 2021 22:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tbSLcCduCKaC; Tue,  3 Aug 2021 22:54:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB91605BF;
	Tue,  3 Aug 2021 22:54:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1126E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED72D405F6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewNo_ePxF-w4 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5B16405F3
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 16B7785F62; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Jun 2021 22:32:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dc34fa5c6cd99ae748a18e2ce0467ac6e117f8eb
X-Git-Newrev: 34173da168f300b58957abb53c8f5fcaf8d8e605
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.16B7785F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/unscd: disable on
 riscv32
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

commit: https://git.buildroot.net/buildroot/commit/?id=34173da168f300b58957abb53c8f5fcaf8d8e605
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

unscd unconditionally uses __NR_clock_gettime which will raise the
following build failure on riscv32:

nscd-0.54.c:339:14: error: '__NR_clock_gettime' undeclared (first use in this function); did you mean 'clock_gettime'?
  339 |  if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, &ts))
      |              ^~~~~~~~~~~~~~~~~~
      |              clock_gettime

Fixes:
 - http://autobuild.buildroot.org/results/eb77b18f268d8e59c407f757662117a33d3f9ee3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/unscd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/unscd/Config.in b/package/unscd/Config.in
index 23cc5a4fcb..88f1062103 100644
--- a/package/unscd/Config.in
+++ b/package/unscd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_UNSCD
 	bool "unscd"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Micro Name Service Caching Daemon
@@ -22,4 +23,5 @@ config BR2_PACKAGE_UNSCD
 	  http://busybox.net/~vda/unscd
 
 comment "unscd needs a glibc toolchain"
+	depends on !BR2_RISCV_32
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
