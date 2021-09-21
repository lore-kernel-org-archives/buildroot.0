Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FACAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 00:00:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CAE56101C
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 23:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CAE56101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355EB40695;
	Tue, 21 Sep 2021 23:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1KtoFrqnJi-C; Tue, 21 Sep 2021 23:59:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F484068E;
	Tue, 21 Sep 2021 23:59:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1F651BF2B6
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 23:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B34F1403F9
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 23:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlzQEXQpRJFr for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 23:59:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67A6D40017
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 23:59:54 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SpfzmxW6InxSqSpg0mPcEP; Wed, 22 Sep 2021 01:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632268792; bh=mmUtGdU0XVurmu7KPFeUp7ssV1FY1wHlJ8tiWznNWcc=;
 h=From:To:Subject:Date:MIME-Version;
 b=Vcs5478CS7xAjR0w62pZZgINDxOP6NUn0eJjY3iWSnA82wmERk/PtcZtj2pE0MNju
 xkV3vIRnZV1M+Ixkve4DqFBRQdTFMKC5DWEd3Oo5yXIrTlhdtsFW8BR1bhUAJ9Muix
 4ZNXwx03Fo69EsByitgz3azQ6QVHrvn24yrJwxxGdMbT/3WkaM4SEeL+yeMtQMmFZj
 mIkvEBvK7RlNNrsf9LfuostcZR1H1VjzRV80tUSy0T6Km5C6wH7fD5OUfo9nS0HQ61
 3YbStHqCoz6+L5iMyB4DbRiawq8vNrYX6ml3LzLAFj7YuISO2wUSd8QLI4ONlE64lj
 iDlnynUh+64/g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 01:59:50 +0200
Message-Id: <20210921235951.805592-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfErVAxk3ZlJ8oKHAVc8glviiKtV4bGnZqw8MgLc7zD9ADZaBpoRBDrJ52fGFneXl4kgJT/uVYrgz2dSO17ewc5C6QBShbpb46W/mjUO4BmvMHmvqxXG8
 hLrNuvPWsox5X1UWL+lEKCoe+p+QgFVOyK0sQ/kLTaEp5WyTUvyDwJjdFqKwNl59j4b9UXT5IfhYZxpxy72KYSwoR3jKfYRnEAT/aw+SsGuxdnWBSFfVNtAm
 pJx2Sr7SFKWJpHYuLG4UVA0s2qpxqDCedWQzPWhikvrFq56ErzRpz5PyyRDL6tBL
Subject: [Buildroot] [PATCH 0/1] Fix libnss parallel build failure
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

I ask to accept this patch even if I couldn't test it. Unfortunately I
can't reproduce the build failure but as explained in commit log that
should be the way. Only this libnss parallel build bug is left and it's
only a bunch of symlink creation, it's not compiling/linking related.
Any further suggestion is accepted anyway.

Best regards

Giulio Benetti (1):
  package/libnss: fix parallel build failure

 ...31911-Fix-nsinstall-parallel-failure.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
