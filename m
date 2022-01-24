Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC6BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 23:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CBCD84BAD;
	Mon, 24 Jan 2022 23:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EKKWdD5Tpo3l; Mon, 24 Jan 2022 23:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5300584BA2;
	Mon, 24 Jan 2022 23:01:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34FC61BF3EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 239C1414C3
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G09vCmcmo9yj for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 23:01:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 119A9414C2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 23:01:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 54C1740006;
 Mon, 24 Jan 2022 23:01:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Tue, 25 Jan 2022 00:00:58 +0100
Message-Id: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 00/16] Bootlin toolchain updates and x86 updates
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This series:

 - Updates the OpenRISC Bootlin toolchains recently rebuilt with the
   _REENTRANT fix (PATCH 1)

 - Adds support for the new Bootlin toolchains targetting the x86-64,
   x86-64-v2, x86-64-v3 and x86-64-v4 CPU variants (PATCH 2 and 3)

 - Simplifies the definition of BR2_ARCH in arch/Config.in.x86 in
   preparation for the addition of many Intel CPU variants (PATCH 4)

 - Syncs up the list of Intel CPU variants supported by gcc up to the
   point where AVX512 is introduced (PATCH 5, 6, 7, 8)

 - Uses the new BR2_X86_CPU_HAS_AVX512 in the definition of x86-64-v4,
   and also in the Bootlin toolchains script, and the files it
   generates (PATCH 9, 10, 11)

 - Adds all remaining Intel CPU variants supported by gcc up to gcc
   11.x (PATCH 12, 13, 14, 15)

 - Documents how the arch/Config.in.x86 is ordered (PATCH 16)

Note that I have left aside the "knl" and "knm" architectures as it
seems they have been used much. But if for completeness reasons we
want to add them, it can certainly be done.

Thanks in advance for your review. Note that I mostly interested in
the patches up to 11. The remaining patches are less relevant to me
directly, so if you don't feel like we should add all those CPU
variants, I'm fine if patches 12, 13, 14 and 15 are rejected.

Best regards,

Thomas

Thomas Petazzoni (16):
  toolchain/toolchain-external/toolchain-external-bootlin: re-update
    OpenRISC toolchains
  support/scripts/gen-bootlin-toolchains: add support for new x86-64
    toolchains
  toolchain/toolchain-external/toolchain-external-bootlin: update with
    new x86-64 toolchains
  arch/Config.in.x86: drastically simplify the BR2_ARCH definition
  arch/Config.in.x86: add "newer" names for several Intel x86 CPU
    variants
  arch/Config.in.x86: westmere and silvermont were added in gcc 4.9
  arch/Config.in.x86: add broadwell Intel CPU variant
  arch/Config.in.x86: add skylake CPU variants
  arch/Config.in.x86: x86-64-v4 implies AVX512
  support/scripts/gen-bootlin-toolchains: add missing
    BR2_X86_CPU_HAS_AVX512 condition for x86-64-v4
  toolchain/toolchain-external/toolchain-external-bootlin: regenerate
    with AVX512 condition for x86-64-v4 toolchain
  arch/Config.in.x86: add cannonlake, icelake-client, icelake-server CPU
    variants
  arch/Config.in.x86: add goldmont, goldmont-plus, tremont, cascadelake,
    tigerlake CPU variants
  arch/Config.in.x86: add cooperlake CPU variant
  arch/Config.in.x86: add sapphirerapids, alderlake, rocketlake
  arch/Config.in.x86: indicate how the CPU variants are ordered

 arch/Config.in.x86                            | 294 ++++++++++-
 support/scripts/gen-bootlin-toolchains        |  49 ++
 .../tests/toolchain/test_external_bootlin.py  | 225 +++++++++
 .../Config.in.options                         | 457 +++++++++++++++++-
 .../toolchain-external-bootlin.hash           |  46 +-
 .../toolchain-external-bootlin.mk             |  98 +++-
 6 files changed, 1129 insertions(+), 40 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
