Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A3CC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C2458133E;
	Sun, 30 Oct 2022 11:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C2458133E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-kfAFijKH3R; Sun, 30 Oct 2022 11:14:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5C6C8133C;
	Sun, 30 Oct 2022 11:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5C6C8133C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 141F31BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3DF04034E
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3DF04034E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRjOKtp6R70U for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:10:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06E1040103
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06E1040103
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8FE487482; Sun, 30 Oct 2022 11:10:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 12:10:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ee966794a5ab3adfc192525fe07945b671760d2
X-Git-Newrev: 69d311687abd005dddf3621b7b52a397e75ad8ab
X-Patchwork-Hint: ignore
Message-Id: <20221030111047.E8FE487482@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: drop support for the MIPS
 architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=69d311687abd005dddf3621b7b52a397e75ad8ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of NodeJS fails on mipsel due to an issue in the V8 code:

../../deps/v8/src/compiler/backend/mips/code-generator-mips.cc:4106:48: error: call of overloaded 'Operand(int64_t)' is ambiguous
 4106 |                 Operand(static_cast<int64_t>(0)));

There is apparently a lack of maintenance of the MIPS port of V8, as
is discussed in the Github issue at
https://github.com/nodejs/node/issues/26179.

Until this get improved/fixed, our best option is to drop support for
MIPS in our NodeJS package.

Fixes:

  http://autobuild.buildroot.net/results/0e6ee80c77bcb77afe18410e8d9da93b738cb0a4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 5375dfeacd..1489306be0 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	bool
 	# On ARM, at least ARMv6+ with VFPv2+ is needed
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
-	default y if BR2_mipsel && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_aarch64 || BR2_i386 || BR2_x86_64
 	# libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
