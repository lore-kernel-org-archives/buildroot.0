Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EE1C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 08:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96CFE42EC5;
	Thu, 20 Jun 2024 08:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpSXv3R6TzPP; Thu, 20 Jun 2024 08:42:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 220AD42EDA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 220AD42EDA;
	Thu, 20 Jun 2024 08:42:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0C991BF488
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 08:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9EA342EC5
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 08:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M99Ov_rfCRCW for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 08:42:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BFF142EC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BFF142EC2
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BFF142EC2
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 08:42:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A3192C7A9A
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 08:39:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53B27240003;
 Thu, 20 Jun 2024 08:39:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 10:39:20 +0200
Message-Id: <20240620083924.2104785-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1718872768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DFNd+7V3yGGQ4APQwSD3vPGCUf5WdHVoXDzeuCVVFHY=;
 b=aPX8426JvkvimWXxe+60kGbj27s9LSiJphEtcisDlxWAwpxQyo0aW0bvqV9VywgAxBvJ/P
 K05464r3RWCM5n4kuUlFtatIA2JpxbDy12bztKoCbSbNvqE281w5D7ee6NWVypYUQrcFHU
 lWtfHc4MM7sOWYAseqxanoxcMbzDutUmoONNw/UcT2yDnTzDX7UJClekVo0AYXpQnJXQ88
 cIaGOsrsRdWV03Xq0irw4fpvPlW7QrlzSAMnC+BlYFSrf/uRaJqBW4cmOHLoJ6JsOhrPtU
 Hmt6p5G8PGPKuGk7W/4IBDPEvE5rKcMec8GyhIsP2RsIG3TIaPqPbNecjfEvEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aPX8426J
Subject: [Buildroot] [PATCH 0/4] Adds support for TrustedFirmware-M
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, thomas.petazzoni@bootlin.com,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds support for TrustedFirmware-M (TF-M).
Patches 1-3: Address host Python package dependencies.
Patch 4: Add support for TF-M.

Kory Maincent (4):
  package/python-intelhex: Add support for host package
  package/python-click: Add support for host package
  package/python-cbor2: Add support for host package
  boot: Add support for TrustedFirmware-M package

 boot/Config.in                                |   1 +
 boot/trusted-firmware-m/Config.in             | 101 +++++++++++++++++
 boot/trusted-firmware-m/tfm-3rdparty.mk       |   7 ++
 boot/trusted-firmware-m/tfm-cmsis/Config.in   |  10 ++
 .../tfm-cmsis/tfm-cmsis.hash                  |   3 +
 .../trusted-firmware-m/tfm-cmsis/tfm-cmsis.mk |  31 +++++
 boot/trusted-firmware-m/tfm-mbedtls/Config.in |  10 ++
 .../tfm-mbedtls/tfm-mbedtls.hash              |   3 +
 .../tfm-mbedtls/tfm-mbedtls.mk                |  30 +++++
 boot/trusted-firmware-m/tfm-mcuboot/Config.in |  10 ++
 .../tfm-mcuboot/tfm-mcuboot.hash              |   3 +
 .../tfm-mcuboot/tfm-mcuboot.mk                |  29 +++++
 boot/trusted-firmware-m/tfm-qcbor/Config.in   |  10 ++
 .../tfm-qcbor/tfm-qcbor.hash                  |   3 +
 .../trusted-firmware-m/tfm-qcbor/tfm-qcbor.mk |  29 +++++
 boot/trusted-firmware-m/tfm-tests/Config.in   |  10 ++
 .../tfm-tests/tfm-tests.hash                  |   3 +
 .../trusted-firmware-m/tfm-tests/tfm-tests.mk |  30 +++++
 .../trusted-firmware-m.hash                   |   3 +
 boot/trusted-firmware-m/trusted-firmware-m.mk | 107 ++++++++++++++++++
 package/python-cbor2/python-cbor2.mk          |   3 +
 package/python-click/python-click.mk          |   1 +
 package/python-intelhex/python-intelhex.mk    |   1 +
 support/testing/tests/boot/test_tfm.py        |  12 ++
 24 files changed, 450 insertions(+)
 create mode 100644 boot/trusted-firmware-m/Config.in
 create mode 100644 boot/trusted-firmware-m/tfm-3rdparty.mk
 create mode 100644 boot/trusted-firmware-m/tfm-cmsis/Config.in
 create mode 100644 boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.hash
 create mode 100644 boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.mk
 create mode 100644 boot/trusted-firmware-m/tfm-mbedtls/Config.in
 create mode 100644 boot/trusted-firmware-m/tfm-mbedtls/tfm-mbedtls.hash
 create mode 100644 boot/trusted-firmware-m/tfm-mbedtls/tfm-mbedtls.mk
 create mode 100644 boot/trusted-firmware-m/tfm-mcuboot/Config.in
 create mode 100644 boot/trusted-firmware-m/tfm-mcuboot/tfm-mcuboot.hash
 create mode 100644 boot/trusted-firmware-m/tfm-mcuboot/tfm-mcuboot.mk
 create mode 100644 boot/trusted-firmware-m/tfm-qcbor/Config.in
 create mode 100644 boot/trusted-firmware-m/tfm-qcbor/tfm-qcbor.hash
 create mode 100644 boot/trusted-firmware-m/tfm-qcbor/tfm-qcbor.mk
 create mode 100644 boot/trusted-firmware-m/tfm-tests/Config.in
 create mode 100644 boot/trusted-firmware-m/tfm-tests/tfm-tests.hash
 create mode 100644 boot/trusted-firmware-m/tfm-tests/tfm-tests.mk
 create mode 100644 boot/trusted-firmware-m/trusted-firmware-m.hash
 create mode 100644 boot/trusted-firmware-m/trusted-firmware-m.mk
 create mode 100644 support/testing/tests/boot/test_tfm.py

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
