Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE56C25B0E
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3058941B5F;
	Thu, 18 Aug 2022 06:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3058941B5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIMghJYFo0LX; Thu, 18 Aug 2022 06:30:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02669419FF;
	Thu, 18 Aug 2022 06:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02669419FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA07C1C11A0
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5A33610EB
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5A33610EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KecOTZ0CcEY7 for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:30:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3D8160C30
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3D8160C30
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6CAC48796F; Thu, 18 Aug 2022 06:16:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 08:24:33 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a8e5283c49bdf9e882b978e02ce7af2aa41c0649
X-Git-Newrev: 865f317e6f9ff1754539d8947fb5d4df3d2caf7e
X-Patchwork-Hint: ignore
Message-Id: <20220818061603.6CAC48796F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] toolchain: introduce
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

commit: https://git.buildroot.net/buildroot/commit/?id=865f317e6f9ff1754539d8947fb5d4df3d2caf7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 0e9b2503c1..86d1bbb2e7 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -220,6 +220,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
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
