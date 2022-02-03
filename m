Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4FFC433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 23:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2ABB60D4E;
	Thu,  3 Feb 2022 23:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4pSlM0R7W7D; Thu,  3 Feb 2022 23:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15ED460AFD;
	Thu,  3 Feb 2022 23:00:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EFDB1BF34A
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B41141713
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FD6bwSkrndHr for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 23:00:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3F394170F
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 23:00:00 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fl55nOQm70FuyFl55nQUJ2; Thu, 03 Feb 2022 23:59:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643929199; bh=6mGbm9XMQJ2XW3mq8HpJsjjazdr03o3R9r/VnLFb91U=;
 h=From:To:Subject:Date:MIME-Version;
 b=K2FGATKX3SYPeBQdXTCPpBkzj9uBbYI9dhNNOi2MPR+H682JPKgjPv5oYHFFdUGA5
 R4Cn5kzLNmVmsSoDp6AnBCzACxbqXuUXGrPvzLLduEn4/JK0zVa/vT3JkkeaGgbuIZ
 QuSkgxSWoMpQ3HPh/e8nF0GD80Val+xBo+vJkCUBEOkxON0OH+pZi2gbsMT2rgzxDL
 nsUA4EySbn5tpCtoTk9TSSVl9a5fWoOWZV2VDarLLT2WsGfMnIPVGDTMyhTmZOjlg+
 onqcJaU/8Ajkkgsnt2LwKTvihOGAn4aHW4ib00dBoGlZgGijiBEqYFAsu9jTpmjFdX
 4/JvWM2E0v54Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 23:59:52 +0100
Message-Id: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBcJCWvfiqgQd/amkcUjT3CI70M/E/AROfyc34rMO+dpr99Ks1z0aHY007DA+AOJvKlvGcVUXpMaWiA3KHbdfI0d41kzqKiLTnznhslVOfNMBz3JPNSc
 th8LZWkO6iANp2RUOQjGRLp0CxPuRv8dBt5gYzT36ZuCfbKxsljgKJNbEp5arzoJD1il/4oXaxTMB9n713xbXgvCMR0L2TbSgudL3TNpYpA4YFfHBVjERe9M
 WF6JHjbKcMVsu6lwXbwLWVQ/eGAnVMWkJNqcPTjlHtReCrcKjE2RKzSbaNY5DDpwh+IGFNCdWrS9kYxB7GW4v+drLLWYNQYFiuSb4ehVZHtQAP5C5oy+mNxS
 o1s175kcCGh0CHEtGciYhL1A4BsE1w==
Subject: [Buildroot] [PATCH 0/5] Fix genimage build failure on Gitlab-CI
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio Benetti (5):
  board/friendlyarm/nanopc-t4:use partition-type-uuid for genimage-15
  board/friendlyarm/nanopi-m4:use partition-type-uuid for genimage-15
  board/pine64/rockpro64:use partition-type-uuid for genimage-15
  board/radxa/rockpi-4:use partition-type-uuid for genimage-15
  board/radxa/rockpi-n10:use partition-type-uuid for genimage-15

 board/friendlyarm/nanopc-t4/genimage.cfg | 4 ++--
 board/friendlyarm/nanopi-m4/genimage.cfg | 4 ++--
 board/pine64/rockpro64/genimage.cfg      | 4 ++--
 board/radxa/rockpi-4/genimage.cfg        | 4 ++--
 board/radxa/rockpi-n10/genimage.cfg      | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
