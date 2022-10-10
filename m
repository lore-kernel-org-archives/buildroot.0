Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079B8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Oct 2022 03:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57DB360BAD;
	Mon, 10 Oct 2022 03:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57DB360BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNmpJDD9LJP7; Mon, 10 Oct 2022 03:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81AF660DCA;
	Mon, 10 Oct 2022 03:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81AF660DCA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD8E01BF9AF
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 03:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFF65405FD
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 03:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFF65405FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sKyWjUHcb9jj for <buildroot@lists.busybox.net>;
 Mon, 10 Oct 2022 03:10:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A15B4049E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A15B4049E
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 03:10:04 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown [74.59.143.17])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7E39E13F85F;
 Mon, 10 Oct 2022 05:09:59 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 23:09:37 -0400
Message-Id: <20221010030937.6432-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665371401;
 bh=2ftE3ZC4gyyA/8PLHVeWFAThyqw5DjULv7oNvzLc8f8=;
 h=From:To:Cc:Subject:Date:From;
 b=EhUwFuD0AhGXSGg3xg6y5bBMxbKMrgyDoCNpXj2tw5K/Hw1iWW4ccxP1BP6MxXAwS
 +IduoMO/7nDQypETot/mp/e0eMvVIPednA1+GdOH20SRccJppyHB0qhTzuY3XBZr0t
 SCdxCv6jTk4gvnkrb6lwd+Lfvfz7j48GDlCDAJMRkCYTsTD+e2sfbXy1StqppipeqL
 m7rAFgdN2DgMXzk0YQDcL+F4xL+Exl6ccfuyXOBQSRy//byGKM5mq5SfP38ZYjJhX1
 gnT+HL7P7kEJc7xyk5nigfQyPRfEE8bi9YeoGQDIdPSc9iLzO697v+HPSyPBzISf51
 IcNIGouHL3N+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EhUwFuD0
Subject: [Buildroot] [PATCH 1/1] support/config-fragments/autobuild: fix
 bootlin-xtensa-uclibc.config
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4cbf7336914f25478aea943456ba7dc3c892c21a
"arch/xtensa: custom configuration requires an overlay"
added an error message if BR2_XTENSA_CUSTOM is set and
BR_ARCH_XTENSA_OVERLAY_FILE is unset.

When testing a package with the command:

    ./utils/test-pkg --all --package somepackage

bootlin-xtensa-uclibc toolchain is always failing with error in the logfile:

    arch/arch.mk.xtensa:4: *** No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting.  Stop.

This commit fixes the toolchain config fragment by adding the same overlay
file found in qemu_xtensa_lx60_defconfig.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/config-fragments/autobuild/bootlin-xtensa-uclibc.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config b/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
index c44525b203..780a41df47 100644
--- a/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
+++ b/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
@@ -1,5 +1,6 @@
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_LITTLE_ENDIAN=y
+BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE=y
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
