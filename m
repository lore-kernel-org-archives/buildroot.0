Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E170C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A387961BA9;
	Tue, 26 Jul 2022 15:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A387961BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Gph3RPuxF6w; Tue, 26 Jul 2022 15:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9360761B8F;
	Tue, 26 Jul 2022 15:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9360761B8F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B93EC1BF5A2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 930716108A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 930716108A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yodu9wfb84NX for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:15:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB2E16063B
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB2E16063B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DD7DB85EF0; Tue, 26 Jul 2022 15:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 17:12:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca881f183dff08f77c4932e86b878109e86e1a4b
X-Git-Newrev: 7b6bdf6bcb5f96128d52ea0f159ccaab9fc8da67
X-Patchwork-Hint: ignore
Message-Id: <20220726150119.DD7DB85EF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: introduce
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b6bdf6bcb5f96128d52ea0f159ccaab9fc8da67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sg3_utils package fails to build for the M68K architecture with optimization
enabled with gcc = 10.3.0 and it's still present in gcc = 11.1.0:
http://autobuild.buildroot.net/results/c49300d12a209b18f41d389f092324592b881277/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 414c3eb275..e6fabbfc74 100644
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
