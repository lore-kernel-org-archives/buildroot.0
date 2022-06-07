Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53724C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 20:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2D5D40598;
	Tue,  7 Jun 2022 20:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UiHgFljiF1Ub; Tue,  7 Jun 2022 20:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1EFE40374;
	Tue,  7 Jun 2022 20:36:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFE4E1BF25B
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA92D60B60
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B2-OVXYQc6I7 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 20:36:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E4A460A9B
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 20:36:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 2459B240006;
 Tue,  7 Jun 2022 20:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654634165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=u5/FPveLK8d2DVb/uG1yZLWtgIrGVa3MYMcspE95zsM=;
 b=WjwFzLoFZmLvpyiuGZj2D0pM9Zc5/6EGMSDjrb+on5VcLK+9BTNQCih7XwuZ8isY/ejnBd
 f9egjWiDIibNJfTWbJHmYTb6x7eqi7FGRapdQbpSi1sxO9qns1QXsItwmAH5MkCf/GbLQe
 9kITYzW+q9SCGYvtc/SZCDrOTqyJHfYEGRTj3Sj2Be2LJnyagdfPKDh2oZ15FgfsxnxIS6
 UU6z3V8oCBMDB52mBBhQfS6ZUzbBfybsjIYnO7mQR+Pu56uvcFUdaG2voYXsv0osBWH7ZQ
 tLp6Egr7MBZw7oJbFcbWP+wOYcI8CGtPdYdpNhK9CX2IJwd3GdkX77G++WzC5w==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Tue,  7 Jun 2022 22:35:41 +0200
Message-Id: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 00/11] Another set of Bootlin toolchain
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

Patches 1 to 9 in this series are fixes for autobuilder
issues. Patches 10 and 11 are improvements.

Patches 1 and 2 fix the issue of RISC-V 64-bit toolchains being
available on MMU-less architectures, even though they are not
supported by the toolchain.

Patches 3 and 4 fix the issue of ARM little endian toolchains being
selectable for ARM big endian architectures.

Patches 5 and 6 fix the issue of i686 toolchains being used for < i686
platforms.

Patches 7, 8 and 9 fix the issue of an error when trying to copy
gdbserver, with toolchains that don't have gdbserver.

Patches 10 and 11 add support for the ARMv7 big-endian toolchains
provided by toolchains.bootlin.com.

Thanks!

Thomas

Thomas Petazzoni (11):
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
  support/scripts/gen-bootlin-toolchains: add support for ARMv7 big
    endian toolchain
  support/testing,toolchain/toolchain-external/toolchain-external-bootlin:
    regenerate with ARMv7 big endian toolchain

 support/scripts/gen-bootlin-toolchains        |  34 ++-
 .../tests/toolchain/test_external_bootlin.py  | 102 ++++++++
 toolchain/toolchain-external/Config.in        |   4 +
 .../Config.in.options                         | 233 +++++++++++++++++-
 .../toolchain-external-bootlin.hash           |  12 +
 .../toolchain-external-bootlin.mk             |  36 +++
 6 files changed, 407 insertions(+), 14 deletions(-)

-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
