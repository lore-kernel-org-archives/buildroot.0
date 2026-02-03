Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44429E8783D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06EB9405C9;
	Tue,  3 Feb 2026 15:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4A7myLWWpL95; Tue,  3 Feb 2026 15:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17E8B405E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770132990;
	bh=fqFl/2NJdtuSs/hP5qY4UPwyjo5/GIC/ZqA1xnZNKV8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DsR9/vBbaZgC6DtTMrdDfApN3OaOWaIDgSpMfSLjS0G19LqpuLHGVkQRKYpeBvTh/
	 4n+gJNqs9gw0pqERnYHxLL0Rk7ieNUM6OcxOz+FDDutdVWS4HU/mIP46chPW298BIY
	 5ieP0/pYS94zRogCC0kfqrFVDvWOyKk2kg24gZGUbkoXrlMGo3j8vPxBlDtfEMkM07
	 iQPdHwvj+DUVXJgxUMsxNi6x3cibx/Tc6DGaLNdxYqnMBrz8cAbt4iW1LSYDfrlEpy
	 QubWCNsJ4FKsFeBoKQiCLOtZoqEGJRStpdjDCEOnn3HXVHhW4Y0ftvQ6cpchMTxS/B
	 h2TFMcfJpihAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17E8B405E9;
	Tue,  3 Feb 2026 15:36:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 082B013D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE1F540497
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A07qhN1MKchL for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CDC8540487
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDC8540487
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDC8540487
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so42459145e9.3
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 07:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770132985; x=1770737785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NPjZFiTOfFLpNyh3IzPtb5XquyzQNAZMrFMtB+tgoCc=;
 b=m18ziURYbzLfKqVQcHKt2TQd8HQtbiAkOrGMucS3N6URS+CCOf1YHMijr4b/zqmZET
 RNm9BhgqsKF89lTYISVO2j8hm09lJHQaqIFGFRLYWFmuYyuGH2g9jWIKNmSZGR769zBy
 2sCFanY7yYwelD8r5Fz1VOu51ygaIkkN3ywfMJTfwLYnrMa7rLcklzFOq53033Mu/UAr
 zMQPPjgTgUoHbNjUpO55KrfihDf/O0uhFKlFtDjdsn/jHjTDbz3eZNek4uIdqz82Wm42
 5oO65GsMv5L/MAEOH/3oaRF8+yQxLWfXEauAz8Nd3BZmUlcLlQkGC+qzO5YwXoezhqS5
 24qw==
X-Gm-Message-State: AOJu0YzL5IyZV//Z2eazxVTEz04TCot4GQRtm1qJIRfNuUvYnImaI9ne
 uxrFPYH5ACkGTF44/mExNRkyBgXsHXqTtM2z17nkfn5T+ach6ozmLV/9Yoe4k7PA
X-Gm-Gg: AZuq6aJK6WK5Xqt05iZjppaWjLCJl8yAILGopr2dwav01lNDzF0drmvAIZPkPdGq5Gu
 B7p+wwS2ilbTLzseoCitHjJemByrQJLESZXipy7TKDjt3QXNSFU+IlGg5K6483nwG6u3pcrTWvS
 qqp5u3VV91UrXxOSA+uu4mfx7EAxl3jhklaCDP+SxEpocRIghx0hPRCjnZ6yXjaJkQiIGpN6ez9
 VE4d4KKZ7H+7jMmhBXrgqtJMaAlFDsbnSQ8PUM03rs5b3hLXXKi9+5+sA98ty0iyszZA3aYvNZ1
 Hja1zEexSnE/lRhKaHYPeJK4jNRyKhHPTD/WW+cDiHuEftnOsJhih50B97Qq0qYY6YQlxHAMVVd
 /gmEpa3Fj/qtASDHIlYWUEh1rACWW4yT4JT+UuB/CTj+Ckqlm7SaCv7GLqXg79CXTc6nmTNWaIJ
 DlMRuVYAV2uJUvwkzuSwzyQMBngf8bBhPSsLsNjw==
X-Received: by 2002:a05:600c:1e2a:b0:477:9dc1:b706 with SMTP id
 5b1f17b1804b1-4830e988efdmr394885e9.19.1770132985288; 
 Tue, 03 Feb 2026 07:36:25 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305161534sm62812055e9.12.2026.02.03.07.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:36:24 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 07:36:07 -0800
Message-ID: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770132985; x=1770737785; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NPjZFiTOfFLpNyh3IzPtb5XquyzQNAZMrFMtB+tgoCc=;
 b=QY91bvwrdmpHdLWF4oRNl08arTo22lsPAQm82tcQhc0K5i7PKQhGOsP8vsi9J2Pzbr
 G+PCSLH4VJfF2PDSooOEbWI+e6fx63rivybjI3xT34N22G/0hlzS6CyJg1Qk1r31bgd9
 EpXg0DkA7CwTvuS3bp+mKzJz3iBTCqKxsQou1MFFjjkOvjmC7Qf2Xisc/CKYrSW9zhVS
 fEmYChVa930wKPEnd345kJwEutXbGDHdVxIiIyOvJy1xAzd0aRIDwywIhO1ByCip1pip
 qUg+6KvQfJISHc0hPyraomdRFLKSPjhaRAVcH17mqkuJ3NLCd4YbeRkw2UV0p17sfncw
 iPXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QY91bvwr
Subject: [Buildroot] [PATCH 00/10] Add support for IMX95-15x15-FRDM board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

This series introduces support for NXP's IMX95-15x15-FRDM board.

So, a little bit about the board: as of today, the board hasn't been
officially launched, but, as far as I was told, this should happen in this
quarter. Because of this, we still have some gaps to fill in the
documentation (see missing links from the board's readme.txt).

Some hardware-related information for the board (not exhaustive):

  1) Based on MX95 15x15 B0 silicon.
  2) 8GB LPDDR4X DRAM
  3) 32GB eMMC
  4) 2 x ENET 1GBs

Some comments regarding the changes introduced by this series:

  1) imx-mkimage version bump was done because the board didn't seem
  to be able to boot using the previous version.

  2) firmware-ele-imx version bump was done because previous version
  didn't include the firmware for B0 revision (it only seemed to include
  the one for A0).

  3) MX95 series (as well as MX94) requires system manager (SM) and DDR
  OEI (perhaps even the TCM one if older silicon revision, but we don't
  handle that yet), which is why we have 2 new packages.

  4) LPDDR4x DDR FW handling seems to differ a bit from previous
  versions, thus the changes to the firmware-imx package.

Other than this, we have the DTS support already merged in linux-next via
[1] so hopefully we'll be able to transition to an upstream kernel soon.

[1]: https://lore.kernel.org/linux-devicetree/20260116-127-v3-0-3dc49545a745@nxp.com/

Thanks,
Laurentiu

Laurentiu Mihalcea (10):
  package/freescale-imx: add i.MX95 support
  board/freescale/common/imx/post-image.sh: add i.MX95 support
  package/freescale-imx/imx-sm: add SM package
  package/freescale-imx/imx-oei: add OEI package
  package/freescale-imx/firmware-ele-imx: bump to version 2.0.4
  package/freescale-imx/firmware-ele-imx: add i.MX95 B0 support
  package/freescale-imx/firmware-imx: support i.MX95's LPDDR4x FW
  package/imx-mkimage: bump to version lf-6.12.49-2.2.0
  board/freescale: add i.MX95 support
  configs/freescale_imx95_15x15_frdm: new defconfig

 DEVELOPERS                                    |  4 ++
 .../common/imx/imx95-bootloader-prepare.sh    | 60 ++++++++++++++++++
 board/freescale/common/imx/post-image.sh      |  2 +
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../imx95-15x15-frdm/patches/linux/linux.hash |  2 +
 .../imx95-15x15-frdm/patches/uboot/uboot.hash |  2 +
 board/freescale/imx95-15x15-frdm/readme.txt   | 63 +++++++++++++++++++
 configs/freescale_imx95_15x15_frdm_defconfig  | 37 +++++++++++
 package/freescale-imx/Config.in               | 23 ++++++-
 .../freescale-imx/firmware-ele-imx/Config.in  |  1 +
 .../firmware-ele-imx/firmware-ele-imx.hash    |  6 +-
 .../firmware-ele-imx/firmware-ele-imx.mk      |  4 +-
 package/freescale-imx/firmware-imx/Config.in  | 13 +++-
 .../firmware-imx/firmware-imx.mk              | 39 ++++++++++++
 package/freescale-imx/imx-oei/Config.in       | 21 +++++++
 package/freescale-imx/imx-oei/imx-oei.hash    |  4 ++
 package/freescale-imx/imx-oei/imx-oei.mk      | 29 +++++++++
 package/freescale-imx/imx-sm/Config.in        | 15 +++++
 package/freescale-imx/imx-sm/imx-sm.hash      |  4 ++
 package/freescale-imx/imx-sm/imx-sm.mk        | 33 ++++++++++
 package/imx-mkimage/imx-mkimage.hash          |  2 +-
 package/imx-mkimage/imx-mkimage.mk            |  2 +-
 23 files changed, 360 insertions(+), 9 deletions(-)
 create mode 100755 board/freescale/common/imx/imx95-bootloader-prepare.sh
 create mode 100644 board/freescale/imx95-15x15-frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/imx95-15x15-frdm/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx95-15x15-frdm/patches/linux/linux.hash
 create mode 100644 board/freescale/imx95-15x15-frdm/patches/uboot/uboot.hash
 create mode 100644 board/freescale/imx95-15x15-frdm/readme.txt
 create mode 100644 configs/freescale_imx95_15x15_frdm_defconfig
 create mode 100644 package/freescale-imx/imx-oei/Config.in
 create mode 100644 package/freescale-imx/imx-oei/imx-oei.hash
 create mode 100644 package/freescale-imx/imx-oei/imx-oei.mk
 create mode 100644 package/freescale-imx/imx-sm/Config.in
 create mode 100644 package/freescale-imx/imx-sm/imx-sm.hash
 create mode 100644 package/freescale-imx/imx-sm/imx-sm.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
