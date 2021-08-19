Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CC0C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:15:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD7C60FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABD7C60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C108614C1;
	Thu, 26 Aug 2021 22:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPyw_YCLY4iV; Thu, 26 Aug 2021 22:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18529614C6;
	Thu, 26 Aug 2021 22:15:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEDF71BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B500682BC8
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7YY9y08nBgAI for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5199C82ADD
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A07CE8DC52; Thu, 26 Aug 2021 22:01:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:41:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8d0fcab12831140a409971d7cb4ecf95c874a5f9
X-Git-Newrev: b8417ceee078df531be2ec3555f60b0a07ae4a0c
X-Patchwork-Hint: ignore
Message-Id: <20210826220131.A07CE8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_101952
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8417ceee078df531be2ec3555f60b0a07ae4a0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

bullet package fails to build for the SH4 architecture with optimization
enabled with gcc = 11.1.0:
http://autobuild.buildroot.net/results/32b/32bfaf0aae57ed18c18e82a72a958af9b3e1b241/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101952

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index d5f1176178..01d93517bd 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -183,6 +183,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
 	bool
 	default y if BR2_sh4
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101952
+# ICE: on SH4: unaligned opcodes detected in executable segment.
+# This bug still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
+	bool
+	default y if BR2_sh4
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
