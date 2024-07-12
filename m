Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FA2C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5555D41108;
	Fri, 12 Jul 2024 15:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcHiR4HfLvJP; Fri, 12 Jul 2024 15:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDDF641203
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDDF641203;
	Fri, 12 Jul 2024 15:35:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5982C1BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 466FF41203
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vv-0ppv6beg8 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:35:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6928D41108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6928D41108
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6928D41108
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:35:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DBF0C0005;
 Fri, 12 Jul 2024 15:35:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 17:35:05 +0200
Message-Id: <20240712153509.2583089-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720798511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=K5/c/qLQAos4nME1BpxVwfzLIIm6V7noZ9j6ExuZT38=;
 b=Y2Z5tv6vog11DUTuF2VterK2VS4DSX4GpcyvidFgqePU1VMgvXutP9nK6QJayptbe7QoGz
 TMNWoghGTyYx5U4uhECBC5cRKsUv8uNjbAxAhqh0TAgcJ00SO1sevw3tnNOXS5EiOCqag0
 JTkBt8dO09Syx59Ull7AO9MtMf5wFkdfPlx2ZJ4ZjMSKn6rR2zlEyDnvO+FRX6jFm1cBEi
 oqX0svyKEsgYpH7NLXkzEZcXGdVteXdrfq1oB36xpUMXkwFHPANwt3Ck5GqLw11E7NAry5
 jjNyeaft0QkzbIKzVVRsRC0sYC9nwJ3OTnuD1/HlsK1BhlKewVOi6DMhOarrvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y2Z5tv6v
Subject: [Buildroot] [PATCH v4 0/4] Adds support for TrustedFirmware-M
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

Changes in v4:
- Fix a recursive dependency loop issue.

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
 boot/trusted-firmware-m/Config.in             | 102 +++++++++++++++
 boot/trusted-firmware-m/tfm-3rdparty.mk       |   7 +
 boot/trusted-firmware-m/tfm-cmsis/Config.in   |  10 ++
 .../tfm-cmsis/tfm-cmsis.hash                  |   3 +
 .../trusted-firmware-m/tfm-cmsis/tfm-cmsis.mk |  23 ++++
 boot/trusted-firmware-m/tfm-mbedtls/Config.in |  10 ++
 .../tfm-mbedtls/tfm-mbedtls.hash              |   3 +
 .../tfm-mbedtls/tfm-mbedtls.mk                |  24 ++++
 boot/trusted-firmware-m/tfm-mcuboot/Config.in |  10 ++
 .../tfm-mcuboot/tfm-mcuboot.hash              |   3 +
 .../tfm-mcuboot/tfm-mcuboot.mk                |  23 ++++
 boot/trusted-firmware-m/tfm-qcbor/Config.in   |  10 ++
 .../tfm-qcbor/tfm-qcbor.hash                  |   3 +
 .../trusted-firmware-m/tfm-qcbor/tfm-qcbor.mk |  23 ++++
 boot/trusted-firmware-m/tfm-tests/Config.in   |  10 ++
 .../tfm-tests/tfm-tests.hash                  |   3 +
 .../trusted-firmware-m/tfm-tests/tfm-tests.mk |  24 ++++
 .../trusted-firmware-m.hash                   |   3 +
 boot/trusted-firmware-m/trusted-firmware-m.mk | 120 ++++++++++++++++++
 package/python-cbor2/python-cbor2.mk          |   3 +
 package/python-click/python-click.mk          |   1 +
 package/python-intelhex/python-intelhex.mk    |   1 +
 support/testing/tests/boot/test_tfm.py        |  12 ++
 25 files changed, 433 insertions(+)
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
