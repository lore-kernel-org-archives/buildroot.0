Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09FCC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:18:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 299236115B
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 299236115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1B2540136;
	Tue,  9 Nov 2021 10:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2LgbLy7FgBn; Tue,  9 Nov 2021 10:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B7B140113;
	Tue,  9 Nov 2021 10:18:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 714B81BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 601AE40113
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UX2FVbMaRn8v for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:18:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTP id 971DC40109
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:18:52 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kODFmziIdyoivkODGmOZc4; Tue, 09 Nov 2021 11:18:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636453130; bh=/frf80MZLzZo5qwM7y/nZG6mkXO5n/e7WxfOobs0MKg=;
 h=From:To:Subject:Date:MIME-Version;
 b=c7GJbrxg8kNtsufQRyIbLWm6VWFkxt/9pX3WPGVMu/xxnD2Ufn4RWaN50J+LGCjgA
 fo8g6Y4nuxsB6pfrbXDEU1PZgTWbm6ySPNWWaqWX8GPzY7MuMH8idQ/x0wuhq1mSeJ
 DrF2UkyBI1+SPOaVKDEHMXrN2dsWMXcma3OxPKdtZq7v9Q1AdWZj390pEpYm9i2AEG
 kNo1891XPUza06JQ28xqgv85pxChPKt3Ci40xtgFhDSzaCyA0I6HmNBPj+a8tZnjjn
 UgAapz4rE6mL04/9W1XCxqO3iR/LikGC5jqzzoAb23T9IGwOe6mVTNLsJa2+NR+Ivl
 yEKTJeMYSYeMg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 11:18:35 +0100
Message-Id: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfK+mqQJ1+R9yOYXOYcExd/Ve8lCAOMVlbNWr1ZowCoeVV0mEt0o5PEUS/+TcHycuk1FAGVRGPWeKTEJvcwve9lxpWgOP52aLHNUZ1+ESEjoTHbd/49Xe
 BcoUe9vkudZenWW5vUXMnOz/f6c5gPzaUFQdn7jRS2IZDiKAMkd0yHaAJG+9Q7j0uf8EQ4uqPl7+EU/bA7g01Jc/48XcOJoFZ1uoH6BZiBO/pb8AlnGk470h
 OPUXG96T5IxufV3LV86JKYpfcE/IS6SsvBY2P+tVHkBxyeJWXEAuc0Ws63BbS+EjCBIGXw34QtL89tcV7rexAZCj6RO5s4ifPBPU77royZum4NNHRPx01RGD
 bWgXw2sAcfSX249rVuYbC98hCQ0RfoIwFeXbn+FiHfUC9gt1yOBcrUdtLObc+5fCzY8AtS/2rvUG7+o4i2XQbft4ykmcN/nXuU7TPsr3cFb9tQdMCe62ThmS
 ZugtJMfXwEq0taV6T/o/Gl4gYyaPhEkwJh9ORsFxwHpGoVmGrfJ0vPcMVbF5vjIw8g0FsR4Zf8sj5Lu20RkcCAdWGXrOk69UqemSYtUmCdolq9/5sUP2k2hI
 agA=
Subject: [Buildroot] [PATCH v2 0/9] Post genimage.cfg beautify
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
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>, Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset contains other code style fixes and an integration to the
Buildroot manual regarding the values suffix notation.

Best regards
Giulio Benetti
Benetti Engineering sas

Giulio Benetti (9):
  board/olimex/a20_olinuxino/genimage.cfg: fix option suffix
  board/altera/socrates_cyclone5/genimage.cfg: fix offset suffix
  board/friendlyarm/nanopi-neo2/genimage.cfg: fix comment
  board/orangepi/orangepi-pc2/genimage.cfg: fix comment
  board/minnowboard/genimage.cfg: fix option assignment spaces
  board/kontron/pitx-imx8m/genimage.cfg: fix option suffix
  board/kontron/smarc-sal28/genimage.cfg: fix option suffix
  docs/manual: add allowed notations section for genimage.cfg files
  board/nezha/genimage.cfg: fix offset value notation

 board/altera/socrates_cyclone5/genimage.cfg | 2 +-
 board/friendlyarm/nanopi-neo2/genimage.cfg  | 2 +-
 board/kontron/pitx-imx8m/genimage.cfg       | 2 +-
 board/kontron/smarc-sal28/genimage.cfg      | 2 +-
 board/minnowboard/genimage.cfg              | 2 +-
 board/nezha/genimage.cfg                    | 2 +-
 board/olimex/a20_olinuxino/genimage.cfg     | 2 +-
 board/orangepi/orangepi-pc2/genimage.cfg    | 2 +-
 docs/manual/writing-rules.txt               | 5 +++++
 9 files changed, 13 insertions(+), 8 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
