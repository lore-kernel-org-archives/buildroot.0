Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04D6C433FE
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99A9E41C98;
	Wed, 18 May 2022 19:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dXQFRsvolvG; Wed, 18 May 2022 19:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41DB241C92;
	Wed, 18 May 2022 19:23:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 254631BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71A0841029
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 69RsZyEuyepw for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F0A44104F
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1AD0186069; Wed, 18 May 2022 19:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 21:16:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 541e794a959914d1189570c3674908eb5db08ce8
X-Git-Newrev: e59b3acc3603e55fbaec25406258ec9ca9623564
X-Patchwork-Hint: ignore
Message-Id: <20220518190953.1AD0186069@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/glibc: Restrict ppc64le support
 to power8
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

commit: https://git.buildroot.net/buildroot/commit/?id=e59b3acc3603e55fbaec25406258ec9ca9623564
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Glibc restricts ppc64le support to Power8 (or later):

 https://sourceware.org/git/?p=glibc.git;a=commit;h=a27d2c19355a15569dfcdd5da741b57acf1a106a

The autobuilder has been attempting combiations of BR2_powerpc64le,
BR2_TOOLCHAIN_USES_GLIBC and

BR2_powerpc_970:

 http://autobuild.buildroot.net/results/89eae4c6e28658444ca5bc67caa2644358de97b7

BR2_powerpc_power6:

 http://autobuild.buildroot.net/results/bee990c9c34d391cfc4a351a30abc1a0a53a2415

BR2_powerpc_620:

 http://autobuild.buildroot.net/results/a0557172757d3bba2b5fc6244c7b9b17ef6be0db

When Power9, Power10, etc support is added to buildroot we may require a
BR2_PPC64LE_AT_LEAST_POWER8 or similar.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 8d9cf4cc68..559c254622 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -46,7 +46,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
 		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
 		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
-		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
+		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc_power8 || \
 		   BR2_riscv       || BR2_s390x      || BR2_sh          || \
 		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
 		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
