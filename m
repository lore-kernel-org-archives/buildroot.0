Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C85AC4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 21:52:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABDC860C3F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 21:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABDC860C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C52EC40178;
	Sat, 14 Aug 2021 21:52:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_TgmGoMF5LN; Sat, 14 Aug 2021 21:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72AE1401F0;
	Sat, 14 Aug 2021 21:52:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2071BF350
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 21:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA06B60631
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 21:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGNCEHPccdYD for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 21:52:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7714F60626
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 21:52:11 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.135.234])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F1ZYm4rarxC2nF1ZYme37M; Sat, 14 Aug 2021 23:52:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628977929; bh=vGv86pw+5hqnyOht4T81o/tkaJ5s+SzKMsYDEwnyQNk=;
 h=From:To:Subject:Date:MIME-Version;
 b=HC93l0IiPxmedQ0qfW9azaKQK3tZoBP/YYJ8zP79C202O/btjUr0X4pXbQdXbqoMK
 qvEjiPlQn8/Xs83SDVUK0fcbf+do38YFPnzjl9/W7eWKCWQFL0vVI/v5XMAEmJw5jY
 VKJ6mVl12RGxTexR/nrEw0QIh4pSzjdBh1vn/LTzCqIdS2FSW5F473QVJ+20xYAEu/
 SYTqll7sJwVO4y0TorjfhZ/dKc1dWXKogTidV2NKtnFzRJQgTIhdetau+KEfwc4f6j
 KKNP8v49rVuPG2lrY96+tQivg2wgquFNnL1f6o68d+i+/caBeAWikv4WZMhloWSlBu
 ZOKLm26PFp+pg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 23:52:05 +0200
Message-Id: <20210814215207.251908-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIw8mY9mHwXfOq0m0ehM0fWJdyKwkb3odVtmxVR4wu5NYdBfdo4CEG4mh5CvOYca4c9xsYw/Bff6mshds0J/VubkpYJYissyBo4yu8/XP8KHptC6GGdy
 M/PB7rsGtRhdjjKBvJsTJVP1o719w3USTWHzvB0BMkOWslXgGQvNJmL2UuaWPIcPrBpcEsKHEPH8RZAr3gLVPAtkYPWegdIoa0avTfKle7qp/c46G8MO8mOT
 q99A7gZouLfLYrkTZBlUdaV2eDFQ0uGonXKGaEZfgMJRil+MjH3rgo49FdD21U/lA1N11fciRY8/vFesm3q9gRg8BoYFHWcdi1wFm7z1FonqLWo/1qOlxX2i
 xfKNShyyenz3Er8exhDiylXbN6L5hhPCqQkRDn4f5qgngsu8VNY=
Subject: [Buildroot] [PATCH 0/2] Introduce and work-around bug 101915 on
 lmbench
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patchset introduce gcc bug 101915 and reference to it in lmbench to work
it around by disabling optimization(-O0).

Giulio Benetti (2):
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_101915
  package/lmbench: fix build failure due to gcc bug 101915

 package/lmbench/lmbench.mk | 4 ++++
 toolchain/Config.in        | 7 +++++++
 2 files changed, 11 insertions(+)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
