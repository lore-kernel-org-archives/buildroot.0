Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C118BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:46:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E7460724
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1E7460724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C40C401FB;
	Sat, 30 Oct 2021 23:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id In_-yvMCBQjq; Sat, 30 Oct 2021 23:46:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF5EB40200;
	Sat, 30 Oct 2021 23:46:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF5D1BF48D
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FF874021B
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zUG2UzSdvvAb for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 23:46:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F04840203
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 23:46:53 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gy3mmpNlsrIRlgy3nm79lu; Sun, 31 Oct 2021 01:46:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635637611; bh=SJ1KQ1UUofSIN8PiU4GUK9U8PL+W/fdda44YE254rtA=;
 h=From:To:Subject:Date:MIME-Version;
 b=kMSGaaLXbXU63+8AfS9QRbL5qm3Mmxc3t+IaoOooj821DcrzncqIZf9Dk4bIGmv4t
 OTveAxyRC4vuN5mljn/f45hBBHj/6ya1qAqhSBHNWONSVoZhWVhiJDU6yVqnA6n51i
 Vu9Xc7XDZYFlnHvVa407KHALhvOI91LOCLad5hpIaCkufggaljKsGy8hc3yrSsRBsf
 rTQGmz6kGHbdrBpCobUw7UbPuKpsbclxJKM51ts5foD5Hj6I4OVXhjYGTXNknsrhuP
 SkO6mnI0vDmz3aKbX7mvUUMVGABuLuKgB7U0TwsznjR+MO5NnnDz0JV6IqHkTQm+d4
 61lNiBR7CHueg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 01:46:44 +0200
Message-Id: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHYySGkJtiSyaX9+dd4NNFb6JwMbFEyQ4Z0UQCs4+NbiP08A0LpkFVKBStb52hCSykZO3f299W1OZ4QkByRMBUHMSsKkjhNQafl5mS+pUtY6pUMdAbee
 mk3Ei5FTbdZIpp9zTsuLqMdB3vlDvpJ+pbNBKmYs4Z3z8TmLBuTCEseTFH4a6cOv1dRU5HcfNB1ymO7KCVgT5wT43ckyA+fLy1rflZJhs1CoAgcCMNKnLp0s
 KwjVKpm+FxedRD/5yaBRVMuyr7pobbVKCLrs174lH6+CSNxIrLupDNsOrA7SKhvjcHDwffGbO24wvYhH5StF4wskTjL/6sTiKGWdO1wIvY17QkSytrMewWnT
 ceZgFUKi9dL8qjy7xe+bSeOVT9r+D/wOTp46CLw4zWexGxEhLPRyYt+YhvD42D+00gV1Ostm
Subject: [Buildroot] [PATCH 0/6] configs/olimex_*: fix uboot build failure
 on gitlab jobs
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Leon Anavi <leon.anavi@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Unfortunately before sending the patchset to update Linux and u-boot for
almost all Olimex Olinuxino boards I didn't try to build all those boards'
defconfigs inside the latest official Buildroot Docker. This lead to build
failure in case host doesnd't provide openssl, python3 and pylibfdt.
So this patchset fix those build failure and end up uniforming all the
BR2_TARGET_UBOOT_NEEDS_* since all are based on sunxi SoCs and share the
same board.c. Anyway everything I've added is required.

Best regards
---
Giulio Benetti
Benetti Engineering sas

Giulio Benetti (6):
  configs/olimex_a10_olinuxino: uboot 2021.10 needs openssl and python3
  configs/olimex_a13_olinuxino: uboot 2021.10 needs openssl, pylibfdt
    and python3
  configs/olimex_a20_olinuxino_lime2: uboot 2021.10 needs openssl
  configs/olimex_a20_olinuxino_lime: uboot 2021.10 needs openssl
  configs/olimex_a20_olinuxino_micro: uboot 2021.10 needs openssl,
    pylibfdt and python3
  configs/olimex_a33_olinuxino: uboot 2021.10 needs openssl and python3

 configs/olimex_a10_olinuxino_lime_defconfig  | 2 ++
 configs/olimex_a13_olinuxino_defconfig       | 3 +++
 configs/olimex_a20_olinuxino_lime2_defconfig | 3 ++-
 configs/olimex_a20_olinuxino_lime_defconfig  | 3 ++-
 configs/olimex_a20_olinuxino_micro_defconfig | 3 +++
 configs/olimex_a33_olinuxino_defconfig       | 2 ++
 6 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
