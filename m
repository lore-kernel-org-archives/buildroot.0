Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679FFC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 15:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76F698203D;
	Wed, 10 Jul 2024 15:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8Uv_5hjQsQj; Wed, 10 Jul 2024 15:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B13A8206A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B13A8206A;
	Wed, 10 Jul 2024 15:26:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07F521BF5A7
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E781A413B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvPrc-tnRhh5 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 15:26:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83091413AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83091413AE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83091413AE
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 15:26:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE24EC0006;
 Wed, 10 Jul 2024 15:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 17:25:46 +0200
Message-Id: <20240710152551.332680-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720625165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mXIRKTk3N7/lI0XB+qaTr2d3AZjs3UH4BzBRZ1+rfGU=;
 b=U6CMw7JrQoE+ADEDf1OQR/5C6GBhNa2/xd2EhHFzNiyLWcpH0i1335RQC9J9jPtd1zdDf9
 VtTlxRMzRf77UhvcOiLvJJKpmtRfw8of9NQrIFiLtCxpEaXVbsN40z5VbiHr4k1AmhcrAm
 GkVLT067/zVAYhnwX9UF5ThLeg8IcyriWhNfN311RAlXQnh03LZ3QtvtKjyrb0BjXRUXlu
 5ov5UQtfBlEi4jBnH4EZWQfcixklGL9hntZG44izMucmSBEkeYKRc19qSCAGeFWjR8UEdx
 BkcT5ATaous60IdMAAefHPlsBEiTsWwUQ/8tuOfgBjD/hMoCFxNMgdhGimUVJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U6CMw7Jr
Subject: [Buildroot] [PATCH v3 0/4] Adds support for TrustedFirmware-M
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
https://trustedfirmware-m.readthedocs.io
https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git

Trusted Firmware-M implements the Secure Processing Environment (SPE)
for Armv8-M, Armv8.1-M architectures (e.g. the Cortex-M33, Cortex-M23,
Cortex-M55, Cortex-M85 processors) or dual-core platforms.

Patches 1-3: Address host Python package dependencies.
Patch 4: Add support for TF-M.

Changes in v3:
- Add select BR2_HOST_CMAKE_AT_LEAST_3_21 to avoid cmake configure error
  due to old cmake version.
- Fix a Kconfig warning.

Changes in v2:
- Add TF-M to DEVELOPERS file
- Fix few nit.

Kory Maincent (4):
  package/python-intelhex: Add support for host package
  package/python-click: Add support for host package
  package/python-cbor2: Add support for host package
  boot: Add support for TrustedFirmware-M package

 DEVELOPERS                                    |   1 +
 boot/Config.in                                |   1 +
 boot/trusted-firmware-m/Config.in             | 103 +++++++++++++++++
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
 25 files changed, 453 insertions(+)
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
