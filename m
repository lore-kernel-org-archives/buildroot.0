Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782C0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:47:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B630A610CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B630A610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EE146076F;
	Mon, 13 Sep 2021 17:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZctgrcH2BW2j; Mon, 13 Sep 2021 17:47:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2CBB6074E;
	Mon, 13 Sep 2021 17:47:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E717A1BF342
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E364F80E74
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qL3jKvk4mGR6 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 17:47:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEDBC80E32
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 17:47:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C8C998A52B; Mon, 13 Sep 2021 17:45:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 19:25:03 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 20df88372e8f127b9e93df05fd98383b5c166734
X-Git-Newrev: 8c14a7171a12b72e0899f2f1fe8e5424c017c14d
X-Patchwork-Hint: ignore
Message-Id: <20210913174527.C8C998A52B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] toolchain: introduce
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c14a7171a12b72e0899f2f1fe8e5424c017c14d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

ruby package fails to build for the SH4 architecture with optimization
enabled with gcc = 9.3.0:
http://autobuild.buildroot.net/results/f57/f5742e7fb6e8142bcdb53b7f4f5e9c1bea3558cd/

It's already been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143

Anyway let's assume all SuperH(BR2_sh) have this bug according to:
http://lists.busybox.net/pipermail/buildroot/2021-August/621906.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 949a66e660b29917e5890e3ea07dd7c10095f00c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index af21959eff..3ea3fbb097 100644
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
