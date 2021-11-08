Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7DCC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:05:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CBD0619BB
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CBD0619BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8123402ED;
	Mon,  8 Nov 2021 23:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ju_9jyWlsUEm; Mon,  8 Nov 2021 23:05:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F675402D5;
	Mon,  8 Nov 2021 23:05:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF6081BF2C4
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE2D44021B
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0_Yu39ZtWoS2 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 23:05:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E16140216
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 23:05:24 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kDhZmJJDJNGRPkDhZmjC97; Tue, 09 Nov 2021 00:05:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636412723; bh=32T0hPmm3pT7VewZ4+Kt/RGVczqMjzpJq4hwCUeVIWo=;
 h=From:To:Subject:Date:MIME-Version;
 b=Zjg0ilEIgPSw1+jO+Wr4x6DRt4NUZZ6VpUw7EzcJFS5idtlKZI2Np65m/bVltz90S
 FrF9jfk6d3706TFFSgXfLjUYEHAlu0hCpjE3oEsppsS6DkortcgsNY9kAqu/7rceAp
 8TSQCXyU3Y+Q9rZnkxyRhoHX45dlPVQrqE9u7He4xPW+wXC4sN2SgObIPEaOWcoPnn
 xqvPADImJQOjiJrufTxjIy6ex11Jig6gZv6QmchLyLpuuGvnaeEPI/YVyy1y8Wkc8J
 HmNFRcrPaGgUDyAdik2pS4KvHMUluTVEMSFN++dU6m0kLp/zjXtaolTc8mZVYIaWg+
 YJpkBvIqrCniA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 00:05:13 +0100
Message-Id: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBtIs2EWJQtNRWjj4Rwhw3C+KYiYK7Qe2E8SSIibpJARKlNhubeh3lOlwUa0pefCBRQb+/Vq86GEEeJnOBeiNoxvqUUlwVwXmCdGLhyFHUx7hxf5sY4F
 Z69ZSHxuJBELXiC9h8HIIWzKFt0yaBRk6cPCMxs1ixlyXqGc2yvRZCJ885gyW5zFC2a0urWLhRKKUaDzOAeGZRa92LzJiwcTY5pztxZKXfbaZAxilXTrcoVC
 sP01+kFfNJ2K5gCEe9FjUSKltO97VCSd3T3EytUMxZVXlg1TNOGakaIkNDmJJtPCZTkCloH9nYV1xsOmQ9rojvPdBfqvpyWDRHrNXZAtajNp61NmdFez23Ar
 1CptqvFDSEmBPlM+fTJoBsOfuj5Tft1KKxqHq31BRt3TddApy9OPa7A6g5xUSN6Y2M0qjI/BI9BzO6N5tQZSDYYNxffHun8RR0kXHiI7T/RtVRPt7j60xcKO
 W5ObmR6AiwmnuATbhmgx/rWTLWXgwtQRKwpecv2qDUyLGPw5CK3mNesIrWw+Ib/Z6FEkBPdTF4xSBf9t2ScHCOdFuLP0bKCrB6TpAw==
Subject: [Buildroot] [PATCH 0/7] Post genimage.cfg beautify
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset has a critical patch(a20_olinuxino) that prevents from
creating the image. While the rest is still code style related.

As promised I'm going to write the linter for genimage.cfg files.

Best regards
Giulio Benetti
Benetti Engineering sas

Giulio Benetti (7):
  board/olimex/a20_olinuxino/genimage.cfg: fix build failure due to
    wrong offset value suffix
  board/altera/socrates_cyclone5/genimage.cfg: fix offset suffix
  board/friendlyarm/nanopi-neo2/genimage.cfg: fix comment
  board/orangepi/orangepi-pc2/genimage.cfg: fix comment
  board/minnowboard/genimage.cfg: fix option assignment spaces
  board/kontron/pitx-imx8m/genimage.cfg: fix option suffix
  board/kontron/smarc-sal28/genimage.cfg: fix option suffix

 board/altera/socrates_cyclone5/genimage.cfg | 2 +-
 board/friendlyarm/nanopi-neo2/genimage.cfg  | 2 +-
 board/kontron/pitx-imx8m/genimage.cfg       | 2 +-
 board/kontron/smarc-sal28/genimage.cfg      | 2 +-
 board/minnowboard/genimage.cfg              | 2 +-
 board/olimex/a20_olinuxino/genimage.cfg     | 2 +-
 board/orangepi/orangepi-pc2/genimage.cfg    | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
