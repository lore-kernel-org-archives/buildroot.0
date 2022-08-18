Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3C4C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC26641B5F;
	Thu, 18 Aug 2022 06:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC26641B5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I10IEd4A58dX; Thu, 18 Aug 2022 06:31:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 161AA41BBB;
	Thu, 18 Aug 2022 06:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 161AA41BBB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5401BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE504408F0
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE504408F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpiUMfydFHvh for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:31:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3ABA9408C3
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ABA9408C3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AB6F187990; Thu, 18 Aug 2022 06:16:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 08:24:54 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 507dcaa30d7c3252fc9c550147b352038c36f443
X-Git-Newrev: ef5d468a888c4c8dece719f10b893045480b8663
X-Patchwork-Hint: ignore
Message-Id: <20220818061635.AB6F187990@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_104028
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef5d468a888c4c8dece719f10b893045480b8663
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

sg3_utils package fails to build for the M68K architecture with optimization
enabled with gcc = 10.3.0 and it's still present in gcc = 11.1.0:
http://autobuild.buildroot.net/results/c49300d12a209b18f41d389f092324592b881277/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7b6bdf6bcb5f96128d52ea0f159ccaab9fc8da67)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index ea59ca2960..64714011e0 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -222,6 +222,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
 	bool
 	default y if BR2_sh4
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028
+# ICE: on M68K: Error: value -16034 out of range
+# This bug still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_104028
+	bool
+	default y if BR2_m68k
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
