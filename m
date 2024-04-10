Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7211CD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 17:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6307660619;
	Wed, 10 Apr 2024 17:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgNISWM2Hw64; Wed, 10 Apr 2024 17:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 736B1605E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 736B1605E8;
	Wed, 10 Apr 2024 17:19:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4101BF32A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 17:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0728C605E8
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 17:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEPoL57aOPvL for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 17:19:08 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=217.70.178.240; helo=mslow1.mail.gandi.net;
 envelope-from=jeanmichel.hautbois@yoseli.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF58B605DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF58B605DE
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF58B605DE
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 17:19:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9263FC414D
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 17:12:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5549940005;
 Wed, 10 Apr 2024 17:12:17 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 19:12:08 +0200
Message-Id: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1712769137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7SRC9hp6te+7JaxuHA3jXUY8jFUGauow6v+4u59txa8=;
 b=QhFFUFYs43cvcl4R2hLLPTY2RLExlIhoRoWtojL0IXLIJZAiyLcGJpEIHUSRfsG9k4NN9C
 Y3wNoKBwrVm4AUZ+kKS6HWtdSpaQ2k2/KBEudWvFXIOAs/hnOwOXkxyCeYndK5ssMs1Epc
 B8eM5O+nt4bfq4IBNXG3GxjMQyWLWSX4V3CU7YxWe1pUWc4lhy6I1pqH4jYDBu88CSq622
 S6f9Yv3qgVaWCx8R3qRdvkeZXa+7hLOnxcc+7xanlE2XWYJX/ASGfTsGG8DM3DxQyXeL0G
 apc2nsJLWf0hAn/9ar4ilXoFH9T6VzeTetPgfnhQLaW+lq9ul14t/JUyaPWXlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=QhFFUFYs
Subject: [Buildroot] [PATCH v2 0/3] Add support for the MCF5441x Coldfire
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi !

I have a custom board which uses a MCF54418 and I want it to use an
upstream buildroot (for all the good reasons ;-)).
From what I can tell the only Coldfire processor currently supported is
the MCF5208 which does not have a MMU.

While trying to add the processor support, I faced an issue during the
host-gcc build when the MMU configuration is selected, because it makes
it compile the multilib part.

Sadly, a commit [1] removed the GCC ARCH configuration which was used to
determine if the architecture is "m68k" or "cf". I have re-introduced
this configuration here, only for the MCF5441x case for now.

Changes in v2:
- Use a more global family than only mcf54418 (as in Linux)
- Add glibc support
- Tested as an external toolchain so far so good

[1]: eda11417be m68k: remove BR2_GCC_TARGET_ARCH

Jean-Michel Hautbois (3):
  arch: add support for mcf5441x Colfdire
  board: add the qemu board support for mcf54418
  package/glibc: enable for coldfire with MMU

 arch/Config.in.m68k                   | 10 ++++++++++
 board/qemu/m68k-mcf54418/linux.config | 23 +++++++++++++++++++++++
 configs/qemu_m68k_mcf5441x_defconfig  | 19 +++++++++++++++++++
 package/glibc/Config.in               |  1 +
 toolchain/Config.in                   |  1 +
 5 files changed, 54 insertions(+)
 create mode 100644 board/qemu/m68k-mcf54418/linux.config
 create mode 100644 configs/qemu_m68k_mcf5441x_defconfig

-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
