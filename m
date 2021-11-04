Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E83C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 17:23:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 031B561058
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 17:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 031B561058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 561FB40415;
	Thu,  4 Nov 2021 17:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sETXOKfY-UB; Thu,  4 Nov 2021 17:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 099DF40412;
	Thu,  4 Nov 2021 17:23:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B3791BF32B
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 17:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69D344040A
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 17:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GbtHQFKGBOv1 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 17:23:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C01A403FB
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 17:23:06 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id igS7mR6BOsfk3igS8mICuU; Thu, 04 Nov 2021 18:23:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636046584; bh=j0ZfNmCEt26j+LBu9G8syUo9+PytDSNF9I3sWXBEBH8=;
 h=From:To:Subject:Date:MIME-Version;
 b=KU+K2Grhe445ZZudiMDXYB2L+EK7unXCkNhXNaZT5PyfrxnsBkfNBNgMNo9josnLY
 6xrbHm2NFol0WMFU7Nu2DN+tABAu6TBNxOGyn++HFiUAqQ3mVP4X2+7kBIXrRaxpGY
 sm6Wzmq66y6a6H/ODiQaif3Fl7gdFNfztqZ9BDDKxvLVNwUV3xmqNPN2M0Z/DGucH8
 pQ4SlKdQbSORj/L2BJGqXD7/XiG1HxZHknLUOAKkZeUhiKKlodWlLb3yS5zi4WULCH
 WFuYI29LEnWoBcRmFTPKY26OXzkL/p1tYeW1u1cwowaXccJ2tJUe4fnenbus4ZwznW
 +1i3m8NBmO0MA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  4 Nov 2021 18:23:01 +0100
Message-Id: <20211104172303.731813-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fcc23c74-070b-12cc-3d77-48bc2fcf5eb4@lucaceresoli.net>
References: <fcc23c74-070b-12cc-3d77-48bc2fcf5eb4@lucaceresoli.net>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOOxNsomFlBZ0dLrH/UMFulULhqbkfMwYiHxki9CEDqgQ41O+5YQUQUShCyP0yscaHBzG2S+UInXQB028IQnKgds4SikiG4GbzomTjhIOAqTKRc9AZK0
 tXVA11Me+ZiLtYXpMBZKNZiAAg+hG3rWv+FkBac1AX5HO4rNIC3jX0qPzNfd+18ECSjutMA8x/3+PQ5bhuNY0XkwGPRBs6jWP6YKIpPwmFxl7T8hVKFKV0WK
 nosDZRUF7dMtfhOdV1lz9YzS14HsZ4266cP1igUdTKV5B7+s/mvumVBhKQX/KTtCrW+5SxNsy48iGFPjxmLO9Cw44Cn8GdEKgl7xVBW5+cyg9kvddr3vbmEY
 qp8UlzRKo0zslXhMRYIdifuLvzvbcO71Pjf9ewrTW5QPW9hXCYW4rzpef7N4rKfD4+YwslrC7uZ9lI6HDj1B6kqfkLP+KZB7QzOMJvK8W5bfDlw8gSfbo/2y
 uEQSGernl4ilWFTqvFaWvP8XUPHJtZYOeK+73Q==
Subject: [Buildroot] [PATCH v2 0/2] Rename sunxi-mali-mainline* to
 sunxi-mali-utgard*
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this patchset I re-spin a part of a pending patchset[1] to rename
sunxi-mali-mainline* packages to sunxi-mali-utgard*. This clarifies which
kind of Allwinner(sunxi) Mali driver/blob we're dealing with and for the
future it makes more clear adding Rockchip Mali present in the same [1]
patchset I will take care of.

[1]: https://patchwork.ozlabs.org/project/buildroot/list/?series=162754

V1->V2:
* fix defconfig comment on patch [1/2]

Miquel Raynal (2):
  package/sunxi-mali-utgard: rename from sunxi-mali-mainline
  package/sunxi-mali-utgard-driver: rename from
    sunxi-mali-mainline-driver

 Config.in.legacy                              | 42 ++++++++++++++++
 DEVELOPERS                                    |  4 +-
 configs/olimex_a20_olinuxino_lime2_defconfig  |  6 +--
 configs/olimex_a20_olinuxino_lime_defconfig   |  6 +--
 docs/manual/adding-packages-virtual.txt       |  2 +-
 package/Config.in                             |  4 +-
 package/glslsandbox-player/Config.in          |  4 +-
 .../glslsandbox-player/glslsandbox-player.mk  |  2 +-
 package/qt5/qt5base/qt5base.mk                |  2 +-
 .../sunxi-mali-mainline-driver.mk             | 41 ----------------
 package/sunxi-mali-mainline/Config.in         | 42 ----------------
 .../sunxi-mali-mainline.mk                    | 49 -------------------
 .../Config.in                                 | 20 ++++----
 .../sunxi-mali-utgard-driver.hash}            |  2 +-
 .../sunxi-mali-utgard-driver.mk               | 41 ++++++++++++++++
 package/sunxi-mali-utgard/Config.in           | 43 ++++++++++++++++
 .../egl.pc                                    |  0
 .../glesv2.pc                                 |  0
 .../sunxi-mali-utgard.hash}                   |  2 +-
 .../sunxi-mali-utgard/sunxi-mali-utgard.mk    | 49 +++++++++++++++++++
 20 files changed, 202 insertions(+), 159 deletions(-)
 delete mode 100644 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
 delete mode 100644 package/sunxi-mali-mainline/Config.in
 delete mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.mk
 rename package/{sunxi-mali-mainline-driver => sunxi-mali-utgard-driver}/Config.in (60%)
 rename package/{sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash => sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash} (66%)
 create mode 100644 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
 create mode 100644 package/sunxi-mali-utgard/Config.in
 rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/egl.pc (100%)
 rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/glesv2.pc (100%)
 rename package/{sunxi-mali-mainline/sunxi-mali-mainline.hash => sunxi-mali-utgard/sunxi-mali-utgard.hash} (70%)
 create mode 100644 package/sunxi-mali-utgard/sunxi-mali-utgard.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
