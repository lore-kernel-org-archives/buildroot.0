Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656C4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0615B40323;
	Sun, 13 Feb 2022 22:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2K_jYa0Xq0h0; Sun, 13 Feb 2022 22:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34CFE402A4;
	Sun, 13 Feb 2022 22:54:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84D191BF95F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79CE2812CF
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v8FVlq_BzaGu for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:53:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id 338A0812CD
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:53:53 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNkdniVFUXmFAJNkenv7xS; Sun, 13 Feb 2022 23:53:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792832; bh=F4gi/tuNKiHLKV7dEx5HOWIVkVg8n8ydsf1o/dmAJh8=;
 h=From:To:Subject:Date:MIME-Version;
 b=hKf+BJBheAkrIOQdF/U2zjllquBr8YuqjinWT8cVTq2cu68MwmIJVa1qE8PrvoQ0e
 ffH757yPgmyPpAId9WwRc+Y+vpqtmEUDT2pbitbmXSzkghby3k9YB8cJhpDiq4l6jW
 72nIp4xmVarppQhu2IN2utyE18Dgnp5UwXL3jrO9sbGrEoyqh9DWMlmvAveyQ6awa2
 9sHpKY+pVzXM/JH1btmfOjnNxYxMmZpEhwF3ADhVbycSkJfNzwFuJ7kLSJX2zSLqg/
 LAEsouKglF3mitmunibHQ+cxexI0n3NebCqiXr4pdCcYMzNDF3HaO2MGAO7FLo695+
 SalfsjjqCTmLw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:53:34 +0100
Message-Id: <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
References: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJMs/ieuNu1TWK8NyoEMoXfUgkrH6YZ9bhgytrNNNlwSyeAEgJoq3zyPtG+x+GyIYFBJzHnFbHGVUyjpCs048mAHPCb/20qW7dv+kfK7K77q6cbO3r6K
 R6LRqEK9KXwntpSFIkD5KUAO8VHpHB8AMoR1naqz+pj9ff/A8PwIsoPg95XSX80K903eTJl7LtywBKD5y1AB9sP0NJh7gw38Qdi9OIpaQQEA7F4l/XexWPVQ
 G/A6xVfmTiGfKgxbZX+2/S7Xd3juGsEDQy5PQbWbHE7iCUz8bHfW4NsazOzeqqSJb0IN7OFDY3fO5W6NIEbzRMteMCV+QQmxWY8t9DcYnGzx7E84dmvCBgnD
 69FNZ7IvBOeTcg4m+2fN5hQ2WuQjmXOTkuNpBGFQA9X4fDJxs/og5sYvzMaEPDbNHnJRvyLlWJtpHlXYxv7cblhmo7eJy2PSQkpzno/QaMB3Segg2tYx/gHX
 mlc/o6YtgpAwQcOcJ7J6zSlOJ0y9Tz3KI+OB0IHxL0tWde03XagEG6HvV4+fh0AfjemLheAsrWOtUqmvY5N7dGFhXt/lesc09sYQ+xyOYXpWWpiYP1YIPpPS
 9elkE7dHV/lqLvnzIi3vwsyx8Vk5+yYKMnWdtjkD3ZMbOs5OlXjVy5xH6EiuEJVxKOOJaqH+0kxHzJOj7TW+O8tT
Subject: [Buildroot] [PATCH v2 00/16] Use single letter notation in
 genimage.cfg files for partition-type-uuid
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset convert partition-type-uuid to single letter notation
*without* "" and without L(rootfs) since it's the default value for
partition-type-uuid if it's not specified.

V1->V2:
* remove every partition-type-uuid = L as suggested by Arnout

Giulio Benetti (16):
  board/aarch64-efi/genimage-efi: convert partition-type-uuid to single
    letter notation
  board/beaglev/genimage-efi: remove partition-type-uuid since its
    default value is L(rootfs)
  board/friendlyarm/nanopc-t4/genimage: convert partition-type-uuid to
    single letter notation
  board/friendlyarm/nanopi-m4/genimage: convert partition-type-uuid to
    single letter notation
  board/orangepi/orangepi-pc-plus/genimage: keep partition-type-uuid
    without "" for consistency
  board/orangepi/orangepi-r1/genimage: fix partition-type-uuid for boot
    partition and remove "" for consistency
  board/orangepi/orangepi-zero-plus2/genimage: keep partition-type-uuid
    without "" for consistency
  board/pc/genimage-efi: convert partition-type-uuid to single letter
    notation
  board/pine64/rockpro64/genimage: convert partition-type-uuid to single
    letter notation
  board/qemu/aarch64-sbsa/genimage: convert partition-type-uuid to
    single letter notation
  board/radxa/rockpi-n4/genimage: convert partition-type-uuid to single
    letter notation
  board/radxa/rockpi-n10/genimage: convert partition-type-uuid to single
    letter notation
  board/radxa/rockpi-n8/genimage: convert partition-type-uuid to single
    letter notation
  board/sifive/hifive-unleashed/genimage_sdcard: remove
    partition-type-uuid since its default value is L(rootfs)
  board/sifive/hifive-unleashed/genimage_sdcard: add comments to
    particular partition-type-uuid parameters
  board/sifive/hifive-unleashed/genimage_spi-nor: add comments to
    particular partition-type-uuid parameters

 board/aarch64-efi/genimage-efi.cfg                 | 3 +--
 board/beaglev/genimage.cfg                         | 2 +-
 board/friendlyarm/nanopc-t4/genimage.cfg           | 3 +--
 board/friendlyarm/nanopi-m4/genimage.cfg           | 3 +--
 board/orangepi/orangepi-pc-plus/genimage.cfg       | 3 +--
 board/orangepi/orangepi-r1/genimage.cfg            | 3 +--
 board/orangepi/orangepi-zero-plus2/genimage.cfg    | 3 +--
 board/pc/genimage-efi.cfg                          | 3 +--
 board/pine64/rockpro64/genimage.cfg                | 3 +--
 board/qemu/aarch64-sbsa/genimage.cfg               | 3 +--
 board/radxa/rockpi-4/genimage.cfg                  | 3 +--
 board/radxa/rockpi-n10/genimage.cfg                | 3 +--
 board/radxa/rockpi-n8/genimage.cfg                 | 4 ++--
 board/sifive/hifive-unleashed/genimage_sdcard.cfg  | 3 ++-
 board/sifive/hifive-unleashed/genimage_spi-nor.cfg | 2 ++
 15 files changed, 18 insertions(+), 26 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
