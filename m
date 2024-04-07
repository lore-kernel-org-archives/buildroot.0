Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA31CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 211BB4080E;
	Sun,  7 Apr 2024 15:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pI68bsLJdBia; Sun,  7 Apr 2024 15:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91C8B40801
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91C8B40801;
	Sun,  7 Apr 2024 15:31:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEDEC1BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B731740104
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ex_NG5mMJDF5 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE77E401AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE77E401AD
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:31:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D84C481266; Sun,  7 Apr 2024 15:31:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:28:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 109362c90418d9595e3bab0c9ab6d1c8a24f01db
X-Git-Newrev: 345ccb523e412b390d42073cd976a3288b0733c1
X-Patchwork-Hint: ignore
Message-Id: <20240407153141.D84C481266@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-bootlin: bump to 2024.02
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=345ccb523e412b390d42073cd976a3288b0733c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

2024.02 Bootlin toolchains have been released, so let's update the
support in Buildroot. Notable changes:

- Bleeding edge toolchains now use binutils 2.42, and stable
  toolchains use binutils 2.41. This fixes binutils bug 27597
  for both.

- glibc has been updated to 2.39

- musl has been updated to 1.2.5, which brings 32-bit RISC-V
  support. Due to this, 2 new toolchain variants are added: 32-bit
  RISC-V stable, 32-bit RISC-V bleeding edge.

- Bleeding edge toolchains now use 5.15 kernel headers, and stable
  toolchains now use 4.19 kernel headers

- Fortran support has been disabled on Microblaze, as the libgfortran
  build at -O2 causes an internal compiler error.

All runtime tests are passing, except the ones for the new RISC-V
32-bit musl toolchain, for which Busybox fails to build due to an
interaction between musl-specific code in Busybox and musl. This issue
has been reported:

  https://www.openwall.com/lists/musl/2024/03/03/2

The runtime tests are nevertheless included, with the hope that this
issue will reasonably quickly be resolved.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../tests/toolchain/test_external_bootlin.py       |  34 +
 .../toolchain-external-bootlin/Config.in.options   | 896 +++++++++++----------
 .../toolchain-external-bootlin.hash                | 828 +++++++++----------
 .../toolchain-external-bootlin.mk                  | 424 +++++-----
 4 files changed, 1138 insertions(+), 1044 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
