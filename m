Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90878C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 06:38:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7684A61208
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 06:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7684A61208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E705260811;
	Thu,  4 Nov 2021 06:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SueJW2sGrEmc; Thu,  4 Nov 2021 06:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 451656064B;
	Thu,  4 Nov 2021 06:38:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B74001BF3F7
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 06:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F7A26064B
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 06:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOLjbDs9oxgu for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 06:38:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DD056062A
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 06:38:12 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id iWO0mF3Xmsfk3iWO0m7Xjd; Thu, 04 Nov 2021 07:38:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636007890; bh=zZY2r1gK8iXsSqvqJm58xSmKXyzmW5tKCH+o1eBt6u4=;
 h=From:To:Subject:Date:MIME-Version;
 b=SLttVm9Jul9S16eaiJNh/fMuKxC7tD7414s0zmN0ab1VhinwJes6CbVzfpGMHZw9w
 nOlxvmiLrpG4/qaStNxTpopso3yj4N3OUHyxAqx9BwzahudfQrpDp4aJG7JJvxH42Q
 XEx72f21Uc67Qb0AYikkWPu7BPoUcGfV4Y/6waU8V1cnnE7BT/vdq16RYr1qgYVXzJ
 xBjQzdzy0PlJHtk/dOQLl0dqwOwm2Y9DpYTUmWg2vsusr6WMg0TZfAFtR0+0ikj8a1
 uWbUfB3FrVAQ40xT/FeGytaWYv7R8BP1YlVZkqzEvs7UaeJVCy/POChK9R6GSN+rEO
 HG//IvcB9MUqQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  4 Nov 2021 07:38:05 +0100
Message-Id: <20211104063807.139604-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfF+MReJVDE1+AMcCea2nbrJDpEDkrZYJxl81S6fyatZKo+WDKdZnYWDIZHasmIpvONB6KB77IYxHOR7P36N0QsUKNMYkZfpH89+Aatoso6xQlSH5hj5C
 UDXhNZ8G+KYtsC0ct5NbvMd/sfdmppMvrUlPbt1hvVyEAN0u+JKRXoUf8375nbkfnz3auOjYMlXGY4GIXa7xfQgjvT8zZUTUy7xvkA7QM4sOCCaYYEaG7Ls5
 IZLN+m0YdzcVfZ8Cs81/utq5YVcZjW3YVzgWweN3qm7T6EqSIQ192qyjN+YxNx/ND/AjbH8MQbMJ1FhnnXbRx2JSki3TwX9j2nftb5mJaBRlTV8BRETU4vad
 Ya4aKGYM/TgZwrUOosi/yppXnADkfFNsKyYG00eG5qu/vMyALb5okZP0GlX4MUkamudGPoa+JmzMREwPR5Hv4E4hhjdycczUQtN9vWKj63lMfUPd2lHtN6MZ
 q0tAORk6LPO46fQe44ygn88f+mFvn2gZQoHuWg==
Subject: [Buildroot] [PATCH 0/2] Rename sunxi-mali-mainline* to
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

Miquel Raynal (2):
  package/sunxi-mali-utgard: rename from sunxi-mali-mainline
  package/sunxi-mali-utgard-driver: rename from
    sunxi-mali-mainline-driver

 Config.in.legacy                              | 42 ++++++++++++++++
 DEVELOPERS                                    |  4 +-
 configs/olimex_a20_olinuxino_lime2_defconfig  |  4 +-
 configs/olimex_a20_olinuxino_lime_defconfig   |  4 +-
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
 20 files changed, 200 insertions(+), 157 deletions(-)
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
