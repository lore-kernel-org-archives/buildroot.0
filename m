Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC981C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 12:15:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EA2561268
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 12:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EA2561268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23F6D80CE5;
	Thu, 11 Nov 2021 12:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyT7BLynYnNf; Thu, 11 Nov 2021 12:15:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84A9E80D11;
	Thu, 11 Nov 2021 12:15:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 572491BF4E5
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 12:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 544F680D11
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 12:15:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Ac1XSk6CxgP for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 12:15:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA03080CE5
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 12:15:02 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id l8ypmcI5aqi9il8yqmnEiP; Thu, 11 Nov 2021 13:15:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636632900; bh=26CQVw3NXPMXEnRIOTHvgWifNOj8XoLdD1zkaHCIfW0=;
 h=From:To:Subject:Date:MIME-Version;
 b=HovLb8enjnzxn2tI7q/jjy8IMjqolislhAViveutns8hdEFriroJiOp+28D7/K9xD
 5yFPfmsYTEHH/SXUoSHJYDjDoz+wYqe4bJLDMefOV1mT1X9lKiN6/Q2XRepbrO8aCj
 M5zs/3yNzYURt90d1BDsGCIwlZGRqr8Udxak7bZ7WOYJxGpqhI+LY8zGFVF0bibuzt
 Y7DUgsJtD2XsMsKzuWGl47+xe8t0ad4zrCf7BJM29wIf0oWok+E254l4i6xBFE3ls1
 gbck7thVQUFfKNfX/yoyvuyAnuCRW/9gnmBeJhSfuWc96hQL72Txa/2kLuzWQl0PDJ
 t63k8IHe9p6yA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 13:14:57 +0100
Message-Id: <20211111121458.2336802-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLLa+pc9jOXnrEA6ZKulXO7axF2NgEymNSNlplx5sjIFQxbhRKFd6N5Aa6qG5UVG4lGD5w3ulGE6Gpnhs300hNMqnKV+DsipKsIPBoSqQIuUiHZ6V+Nz
 eKQ/weqzHQMTMt+BzRFz5nwOOvQPqT34ZMmJIfbzQEscrtSdEguXhQ/7bZCeuEiyEYDcsFp2D78PNA4dERAqnauGOLKmehyygqxsLXMCKCaoZg0rlyrUmBCH
 v6xSRcG3ZCt9IKf/10BZQFD3DdEqHTu8UZSKR6c7GfxVBnl87Zz7F9Eu5f1aLhkTqNnfxBbUHiT1DhQqdeLK2g==
Subject: [Buildroot] [PATCH 0/1] olimex_a64_olinuxino: bump and help to test
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
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Unfortunately my olinuxino a64 board is broken and I can't order it in
any place. So the patch that follows looks good and fixes gitlab build
failure but it's not tested. Can anyone give a try please and add a
Tested-by:?

Thanks in advance
Giulio Benetti
Benetti Engineering sas

Giulio Benetti (1):
  configs/olimex_a64_olinuxino: bump to Linux kernel 5.15.1, u-boot
    2021.10 and ATF v2.5

 board/olimex/a64-olinuxino/genimage.cfg | 10 ++--------
 configs/olimex_a64_olinuxino_defconfig  | 22 +++++++++++-----------
 2 files changed, 13 insertions(+), 19 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
