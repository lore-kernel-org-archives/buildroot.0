Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE11CC43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 07:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FD6D41914;
	Wed,  8 Jun 2022 07:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvUcANv4PA60; Wed,  8 Jun 2022 07:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4749B410C8;
	Wed,  8 Jun 2022 07:10:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89E1C1BF3D2
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7452F404A9
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3FqCh3FH0eX for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 07:10:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FB0440363
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 07:10:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id EE618FF804;
 Wed,  8 Jun 2022 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654672229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=azBwNbnLWZ0OkiZhCOLA7vxFpIv/IWpGqCTZjUOFUqQ=;
 b=kxSk8X3pSozjHLvJQF5XRUwCjaQ3+9/kQlF2Zqqk6Zlf71AqJ9k22/EIZ6lvSsrOlaYOaS
 uyBGE2GKuUb0E5GgK5ih2f4kzKb+Hah6OBRImXCrBZxHMHVmc3ixEXAZQRMycBwfJyCZH4
 4pSN0t2A9m82T945xgtFoYmR7TotsKJlT0UI4k3lLn3Q0xiBFDbX4srKI6gNIRAhZShlzw
 TlBYdAshHhRpWsjNPfc92CllCI+aA4ykSNYg+4qpM7xCotgORoCEJ8DsmykdgiYt0gufjX
 pHMqGlYv9Z1nlHbiqo0ry/9Wj9UmnrtRr10U603I+uYr+KS+mMKAvG07uQjQZQ==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed,  8 Jun 2022 09:10:12 +0200
Message-Id: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 00/14] Another set of Bootlin toolchain
 integration improvements
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Overall summary
===============

Patches 1 to 12 in this series are fixes for autobuilder
issues. Patches 13 and 14 are improvements.

Patches 1 and 2 fix the issue of RISC-V 64-bit toolchains being
available on MMU-less architectures, even though they are not
supported by the toolchain.

Patches 3 and 4 fix the issue of ARM little endian toolchains being
selectable for ARM big endian architectures.

Patches 5 and 6 fix the issue of i686 toolchains being used for < i686
platforms.

Patches 7, 8 and 9 fix the issue of an error when trying to copy
gdbserver, with toolchains that don't have gdbserver.

Patches 10, 11 and 12 fix the issue of the "mips64" Bootlin toolchains
being obsolete, but the gen-bootlin-toolchains still thinking they
were available. This caused some mips64 n64 configurations to be
thought of having Bootlin toolchains available, but in fact no such
toolchains were provided. We fix this by making sure we check if an
architecture has valid toolchains, and erroring out if not. And of
course, we remove the "mips64" toolchain config.

Patches 13 and 14 add support for the ARMv7 big-endian toolchains
provided by toolchains.bootlin.com.

Changes since v1
================

 - Patches 10, 11 and 12 added to fix the "mips64" issue.

Thomas

Thomas Petazzoni (14):
  support/scripts/gen-bootlin-toolchains: fix RISC-V 64-bit toolchain
    description
  support/testing,toolchain/toolchain-external/toolchain-external-bootlin:
    regenerate with latest gen-bootlin-toolchains script
  support/scripts/gen-bootlin-toolchains: improve dependencies of ARM
    toolchains
  toolchain/toolchain-external/toolchain-external-bootlin: regenerate
    with BR2_ARM dependency
  support/scripts/gen-bootlin-toolchains: adjust dependencies of i686
    toolchains
  toolchain/toolchain-external/toolchain-external-bootlin: regenerate
    after i686 toolchain dependency fixes
  toolchain/toolchain-external: add
    BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER option
  support/scripts/gen-bootlin-toolchains: make use of
    BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
  toolchain/toolchain-external/toolchain-external-bootlin: regenerate
    with BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
  support/scripts/gen-bootlin-toolchains: check that toolchains exists
    for a certain arch
  support/scripts/gen-bootlin-toolchains: drop "mips64" architecture
    variant
  toolchain/toolchain-external/toolchain-external-bootlin: regenerate
    after mips64 toolchain removal
  support/scripts/gen-bootlin-toolchains: add support for ARMv7 big
    endian toolchain
  support/testing,toolchain/toolchain-external/toolchain-external-bootlin:
    regenerate with ARMv7 big endian toolchain

 support/scripts/gen-bootlin-toolchains        |  44 +++-
 .../tests/toolchain/test_external_bootlin.py  | 102 ++++++++
 toolchain/toolchain-external/Config.in        |   4 +
 .../Config.in.options                         | 234 +++++++++++++++++-
 .../toolchain-external-bootlin.hash           |  12 +
 .../toolchain-external-bootlin.mk             |  36 +++
 6 files changed, 412 insertions(+), 20 deletions(-)

-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
