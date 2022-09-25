Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A37C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 09:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 097EE40376;
	Sun, 25 Sep 2022 09:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 097EE40376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBsfGWBG7AF1; Sun, 25 Sep 2022 09:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A4CF40298;
	Sun, 25 Sep 2022 09:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A4CF40298
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25A371BF5A9
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDC5341758
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDC5341758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ktKt9rPBzlhp for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 09:09:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EA96408A6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EA96408A6
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 09:09:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 05E881BF205;
 Sun, 25 Sep 2022 09:09:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Sun, 25 Sep 2022 11:09:15 +0200
Message-Id: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664096962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WRse5SOW0//o1ORdbD7b//58k/Yv5mlUP4qWV2+RBmY=;
 b=eHSqaNCiHFSzvvfxOS9SPPdk+eHUPVhVj+qqe1oU+kRJdlS23CzxtyK5g1BXkk4ltuzQtE
 saIc7Hb8J9XLCJ3KxYocIC1O+yWinZEuNtC3cAAdQDhi7Yu731c7Qb9AHaJUOylb+Ljr22
 diZLWw424/Gl7ojmteJFYiYjkMtFb4xZo0dwP0FJP0v1/WXmFDwJ5eEi/Iksuf5FH2lq/H
 l/WhxMrZPRx9H29f9rBetMGVaPbz+AWvepSHtcsII1SgQqcZpewCC9K2GsDCkmIefjpeKW
 MjfXTmI4QO6qP6/DO9Yxcxh9tm2OjHAMQUztnnu27Tm6mi63kw6eL6/144HNPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eHSqaNCi
Subject: [Buildroot] [PATCH v2 0/5] Fixes/improvements in Xtensa handling
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This is a v2 of my patches to fix/improve xtensa handling.

The starting point is that commit
4cbf7336914f25478aea943456ba7dc3c892c21a ("arch/xtensa: custom
configuration requires an overlay") broke external Xtensa toolchain
configurations, which select a custom core. Indeed, this commit made
the assumption that it is not possible to have an empty overlay file
with a custom core, but that is not a correct assumption.

So instead, commit 1/5 in this series fixes the original issue
(autobuilders reporting problems of endianness) by making it not
possible to select "big endian" with internal toolchain when the
overlay file is empty. Indeed, with an empty overlay file, the CPU
will always be little endian.

We then revert commit 4cbf7336914f25478aea943456ba7dc3c892c21a in
PATCH 2/5, which allows two of the runtime tests to build again
properly.

In patch 3 to 5, we add explicit support for the DC233C Xtensa core.

Thomas

Thomas Petazzoni (5):
  arch/Config.in.xtensa: adjust endianness logic to avoid bogus
    configurations
  Revert "arch/xtensa: custom configuration requires an overlay"
  arch/Config.in.xtensa: use one line per case in BR2_ENDIAN definition
  arch/{Config.in,arch.mk}.xtensa: add explicit support for DC233C core
  configs/qemu_xtensa_lx60*: use new BR2_xtensa_dc233c option

 arch/Config.in.xtensa                    | 13 +++++++++++--
 arch/arch.mk.xtensa                      | 13 +++++++------
 configs/qemu_xtensa_lx60_defconfig       |  3 +--
 configs/qemu_xtensa_lx60_nommu_defconfig |  3 +--
 4 files changed, 20 insertions(+), 12 deletions(-)

-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
