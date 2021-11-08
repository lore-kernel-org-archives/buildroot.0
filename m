Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9A5C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 19:51:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD946619E1
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 19:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD946619E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B8BA40336;
	Mon,  8 Nov 2021 19:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-3Bv5Kkf-f6; Mon,  8 Nov 2021 19:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B821F4032F;
	Mon,  8 Nov 2021 19:51:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 652D31BF311
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 19:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 521E7400C8
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 19:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJ0nDqXQEsq0 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 19:51:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81D5540003
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 19:51:33 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kAfzmJLboueW5kAfzmM3Zd; Mon, 08 Nov 2021 20:51:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636401092; bh=eZrcPS/lSQQnhv4TyIOBou+S6UpN/cbfeqxKlFkSfrk=;
 h=From:To:Subject:Date:MIME-Version;
 b=EmySWkc7HPoT1bcCxnaIIb217Akhoiq+JxyMDg1G8WiMdKW1KfdLzBcw+d1WnLQoo
 f4TyYfziEJBqwBbW/Wf3lUZl6LC1ArQw/71/nOSKNLgHgR6BkSMwy8uw2xYmjoCliW
 RtDKHQs39DKzSlOBt3qq0L0Ps00q6HRXH/jByGLRl6WmTCJ3I9xEhrVmuTY2srzb63
 /vKR1mbDQsaNkanQAoTGqCRW45q0MHNz5q7GRLNUGKt6veRTDZbVkuK3F+qbhmsc8I
 URvuZK//ro1vQmjot8zb4ywbUqZgth5cJIkXjAGONLeGFPoV2nzlMYBj+pRZrC16ct
 RDGRCU6O2agrg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 20:51:29 +0100
Message-Id: <20211108195130.2798450-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNg2hgAbbm9xn6R5SF5jjOhNNxeHkJe1ZZXooGSV4mLDnuLbjXSxENGHryJHDBY29KfpaCgBBiSAE29FbRKqHhiflV9OYM1VWD57KFksE/R30nsaLRVR
 8LS+5/Rs0bTNiXpaWZiOPmVU+353gapst3owCPuNhhPVp0KjEJRgb340VA3mPAHA9A0/sBD+K96USmxMLhWuaMoWerw+pLmwHPeCnt9RwLXfZpJ1RB7jDjv4
 z9T6RlMWQax8s++Uw4CkEBLm3jHq6iywxn5abIfCx7JQbQWE4B8Dtn3/5LJ6IbDjdMwwvSE1NrrwOVh1aT4Rojs+7v/zLgoNW9OLBb1/8hxTOFIQd+lGOj+j
 SOHOcCu0WGfXq0b1Ht4ysqayUHtuVeeLfnhhlMjExUbQ1TTWDpRlcOcLB5kAyL27C6EjiOUDob1Taf3IMSERhlaewJAhgjs7nvr7qmlyHKbeouXH//I=
Subject: [Buildroot] [PATCH 0/1] Add genimage.cfg coding style to Manual
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following my involuntary funny "beatify" :-) genimage patchset I send a
patch to add an entry for genimage files to Buildroot manual. A real
standard doesn't exist, so I've tried to invent one based on Linux C
coding style and on what I see around.

As correctly pointed by Yann[1] there is no Linter for this kind of file,
so this would lead to inconsistency again in the long time, so Arnout
suggested to hack check-package[2] and I'll do that.

[1]: https://lists.buildroot.org/pipermail/buildroot/2021-November/627885.html
[2]: https://lists.buildroot.org/pipermail/buildroot/2021-November/627929.html

Best regards
Giulio Benetti
Benetti Engineering sas

Giulio Benetti (1):
  docs/manual: add genimage.cfg file coding style standard

 docs/manual/writing-rules.txt | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
