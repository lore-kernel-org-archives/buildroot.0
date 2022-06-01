Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB06C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 16:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A6E540FC8;
	Wed,  1 Jun 2022 16:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-Cet2YGk6WP; Wed,  1 Jun 2022 16:15:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7574240FC6;
	Wed,  1 Jun 2022 16:15:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7E311BF573
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDD4E4092A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SV0_PO-G3iOf for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 16:14:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EBF540929
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 16:14:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 20074868BB; Wed,  1 Jun 2022 16:02:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 18:10:34 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 84bb483afba1f95de646f7a5c4b54849dcefe381
X-Git-Newrev: d22646e836bec85dabde33348af3eecda8b1a71e
X-Patchwork-Hint: ignore
Message-Id: <20220601160252.20074868BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] toolchain/glibc: Restrict
 ppc64le support to power8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d22646e836bec85dabde33348af3eecda8b1a71e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit e59b3acc3603e55fbaec25406258ec9ca9623564)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index be89f68ab5..280075b1a9 100644
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
 		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
