Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5DEC433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 13:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CE534174C;
	Wed,  9 Nov 2022 13:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CE534174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g97Mo63AwYqs; Wed,  9 Nov 2022 13:29:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54E72416F9;
	Wed,  9 Nov 2022 13:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54E72416F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C5C51BF3CB
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 13:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 077B8416F9
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 13:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 077B8416F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZRUO6TiR47L for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 13:29:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AD78416E2
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 13:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AD78416E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA102824EE; Wed,  9 Nov 2022 13:29:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 9 Nov 2022 14:22:48 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: b46ec8cc56861039da0df33152a18b8f3edc9d5b
X-Git-Newrev: 73e41cd6739b3afb54073733e7818c03ae72be3b
X-Patchwork-Hint: ignore
Message-Id: <20221109132933.EA102824EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/nodejs: drop
 support for the MIPS architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=73e41cd6739b3afb54073733e7818c03ae72be3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit 69d311687abd005dddf3621b7b52a397e75ad8ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
