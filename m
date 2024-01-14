Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B255C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 18:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B706082883;
	Sun, 14 Jan 2024 18:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B706082883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L19708eoOMZh; Sun, 14 Jan 2024 18:31:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19CFB82862;
	Sun, 14 Jan 2024 18:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19CFB82862
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 038E91BF593
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 18:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC09D40199
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 18:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC09D40199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3eRqsnm0zOMb for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 18:31:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8F1540181
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 18:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8F1540181
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4E948616A; Sun, 14 Jan 2024 18:31:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 19:28:45 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: e21749eae40cfc82e030cff34277d2592bc8aac4
X-Git-Newrev: c8d49d4960e6bd0d968e860d5f23f49e28b4f34a
X-Patchwork-Hint: ignore
Message-Id: <20240114183122.A4E948616A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/criu: disable mips
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8d49d4960e6bd0d968e860d5f23f49e28b4f34a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

mips raises the following build failure since the addition of the
package in commit 3e4b479f39c15ffdf307ec8395d856680c727204:

compel/arch/mips/plugins/std/memcpy.S:7: Error: opcode not supported on this processor: mips32 (mips32) `dadd $2,$0,$4'
compel/arch/mips/plugins/std/memcpy.S:8: Error: opcode not supported on this processor: mips32 (mips32) `daddiu $13,$0,0'

Indeed, dadd and daddiu are specific to mips64

Building on mips64 doesn't work either as it raises the following build
failure:

/tmp/ccArXSfi.s:305: Error: opcode not supported on this processor: mips64 (mips64) `rdhwr $2,$29'

Fixes:
 - http://autobuild.buildroot.org/results/b0341d0654e66bdac2c91d5949be3810a961d9da
 - http://autobuild.buildroot.org/results/b7b8860476de04980bd8c7241d3dd5a01a0251c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3865d88423c18f28f74efd9878a386db9491246f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/criu/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index b3bb830768..fc0da823b3 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	default y if BR2_ARM_CPU_ARMV7M
 	default y if BR2_ARM_CPU_ARMV8A
 	default y if BR2_aarch64
-	default y if BR2_mips
 	default y if BR2_x86_64
 	default y if BR2_powerpc64le # Only support powerpc64 with LE
 	# CRIU has "some" support for s390 but it is not included due to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
