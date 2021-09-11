Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2207EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:21:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7FE661209
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7FE661209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92509415C0;
	Sat, 11 Sep 2021 16:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x2riPYUg6GE9; Sat, 11 Sep 2021 16:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F097A415BF;
	Sat, 11 Sep 2021 16:20:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C68541BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5D2740CF6
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWx05UGKzmWn for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:20:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C99B740CF7
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:20:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7B930890B7; Sat, 11 Sep 2021 16:19:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 18:18:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35af76784f0720b0981bb0982f9a7e20b0ef2be1
X-Git-Newrev: 949a66e660b29917e5890e3ea07dd7c10095f00c
X-Patchwork-Hint: ignore
Message-Id: <20210911161901.7B930890B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_83143
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

commit: https://git.buildroot.net/buildroot/commit/?id=949a66e660b29917e5890e3ea07dd7c10095f00c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ruby package fails to build for the SH4 architecture with optimization
enabled with gcc = 9.3.0:
http://autobuild.buildroot.net/results/f57/f5742e7fb6e8142bcdb53b7f4f5e9c1bea3558cd/

It's already been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143

Anyway let's assume all SuperH(BR2_sh) have this bug according to:
http://lists.busybox.net/pipermail/buildroot/2021-August/621906.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index a78b884579..1223e95c9b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -139,6 +139,15 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 	bool
 	default y if BR2_microblaze
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143
+# Error: invalid operands (*UND* and .text sections) for `-' on sh4.
+# This bug no longer exists in gcc 10.x but reappeared on gcc 11.x and
+# it still not been fixed yet.
+config BR2_TOOLCHAIN_HAS_GCC_BUG_83143
+	bool
+	default y if BR2_sh
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
 # longer exists in gcc 8.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
