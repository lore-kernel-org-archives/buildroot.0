Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93276C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 09:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E2D41722;
	Mon,  6 Feb 2023 09:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21E2D41722
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_n8xwW-QfbF; Mon,  6 Feb 2023 09:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF7DB416C2;
	Mon,  6 Feb 2023 09:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF7DB416C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB2A31BF470
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 09:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 984B04171F
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 09:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 984B04171F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XS8zM3LY2lYp for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 09:29:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CC46416D2
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 09:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC46416D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 645F78397B; Mon,  6 Feb 2023 09:29:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 10:28:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbf8d89810479d2cc4777b84f3cc49bc3548d868
X-Git-Newrev: ee7cf14b5188aca5f17dd38ab0b6673d5789942b
X-Patchwork-Hint: ignore
Message-Id: <20230206092943.645F78397B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: extend gcc bug 43744
 to every sh architecture
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ee7cf14b5188aca5f17dd38ab0b6673d5789942b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gcc bug 43744 affects seems to affect all SH family because it already
affects:
1) sh4, here you can find a buildroot defconfig that fails to build:
http://autobuild.buildroot.net/results/1db/1db6c59c98e3c09fa13277076ee2fbe7967f1f6b/defconfig
2) sh4a, here you can find a buildroot defconfig that fails to build:
http://autobuild.buildroot.net/results/cf272cdc5be2faf4070de3d235ec7a0f7190867a/defconfig
Note also that gcc bugzilla entry reports the bug for SH and not for
sub-architectures:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744

So let's extend the bug to BR2_sh to match the entire SH architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 544b423001..01215e0e96 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -115,7 +115,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
-	depends on BR2_sh4
+	depends on BR2_sh
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
 # longer exists in gcc 8.x.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
