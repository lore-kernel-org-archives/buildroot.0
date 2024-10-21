Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB14FD15D8D
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 13:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40D6E403D0;
	Mon, 21 Oct 2024 13:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvEM65CLsqFS; Mon, 21 Oct 2024 13:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EBFD403B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EBFD403B4;
	Mon, 21 Oct 2024 13:26:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D17E27D7
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 13:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F4AD607AA
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 13:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpGZLzstjp4t for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 13:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D27EA607A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D27EA607A9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D27EA607A9
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 13:26:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AE3060008;
 Mon, 21 Oct 2024 13:26:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Oct 2024 13:26:31 +0000
Message-Id: <20241021132634.2435063-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729517200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PvoXZBsw1K1CudNXRbPufkH2/EaEm30zYx6AdmDAuVE=;
 b=K6zHdYWTfOLebCybMlcoixh0ZpIoFg2g7So3chWnic8Eh49pBg410O1uKjfmALTk7I6vsN
 Xyn/NUdh3G78IrOFbAPsA7dNgiKaDQACcyQuAdIaHM0yoZ5DWTjfZTyaumCvA1TmkZcPVH
 EGWvnfTy7zTE2PkfHxl3EkIGGu9uIAhvZssZ+Nb2L/f3Tx36/rw6NNVft8ANiid9+0qELb
 /YRlLWUkaKeloKWFPo5xCLVq1NyezWMIJPRLdrxINBVs/0ccKc+gsHG6WQuJ/W6H47wcee
 dvFCZG6sTkoBWz8o/CGE/m5ZcArIAYXJ3gUMfgJmyjLGh9Vqfdw9BdfNpmAJWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K6zHdYWT
Subject: [Buildroot] [PATCH v7 0/3] Adds support for TrustedFirmware-M
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

Patches 1-2: Address host Python package dependencies.
Patch 3: Add support for TF-M.

Changes in v7:
- Move back to 3rd parties managed by subpackages instead of EXTRA_DOWNLOAD
- Use git repo for 3rd parties instead of Github generated tarballs.

Changes in v5:
- Remove python-cbor2 host support dependency which is already merged
  mainline.
- Use EXTRA_DOWNLOAD instead of subpackages for 3rd parties.
- Remove TF-M tests 3rd parties.
- Made few Kconfig, and cmake changes.

Changes in v4:
- Fix a recursive dependency loop issue.

Changes in v3:
- Add select BR2_HOST_CMAKE_AT_LEAST_3_21 to avoid cmake configure error
  due to old cmake version.
- Fix a Kconfig warning.

Changes in v2:
- Add TF-M to DEVELOPERS file
- Fix few nit.

Kory Maincent (3):
  package/python-intelhex: Add support for host package
  package/python-click: Add support for host package
  boot: Add support for TrustedFirmware-M package

 DEVELOPERS                                 |   1 +
 boot/Config.in                             |   1 +
 boot/tf-m/Config.in                        |  80 +++++++++++++++
 boot/tf-m/tf-m.hash                        |   3 +
 boot/tf-m/tf-m.mk                          | 111 +++++++++++++++++++++
 boot/tf-m/tfm-cmsis/Config.in              |  12 +++
 boot/tf-m/tfm-cmsis/tfm-cmsis.hash         |   3 +
 boot/tf-m/tfm-cmsis/tfm-cmsis.mk           |  20 ++++
 boot/tf-m/tfm-mbedtls/Config.in            |  12 +++
 boot/tf-m/tfm-mbedtls/tfm-mbedtls.hash     |   3 +
 boot/tf-m/tfm-mbedtls/tfm-mbedtls.mk       |  21 ++++
 boot/tf-m/tfm-mcuboot/Config.in            |  12 +++
 boot/tf-m/tfm-mcuboot/tfm-mcuboot.hash     |   3 +
 boot/tf-m/tfm-mcuboot/tfm-mcuboot.mk       |  20 ++++
 boot/tf-m/tfm-qcbor/Config.in              |  12 +++
 boot/tf-m/tfm-qcbor/tfm-qcbor.hash         |   3 +
 boot/tf-m/tfm-qcbor/tfm-qcbor.mk           |  20 ++++
 package/python-click/python-click.mk       |   1 +
 package/python-intelhex/python-intelhex.mk |   1 +
 utils/genrandconfig                        |   3 +
 20 files changed, 342 insertions(+)
 create mode 100644 boot/tf-m/Config.in
 create mode 100644 boot/tf-m/tf-m.hash
 create mode 100644 boot/tf-m/tf-m.mk
 create mode 100644 boot/tf-m/tfm-cmsis/Config.in
 create mode 100644 boot/tf-m/tfm-cmsis/tfm-cmsis.hash
 create mode 100644 boot/tf-m/tfm-cmsis/tfm-cmsis.mk
 create mode 100644 boot/tf-m/tfm-mbedtls/Config.in
 create mode 100644 boot/tf-m/tfm-mbedtls/tfm-mbedtls.hash
 create mode 100644 boot/tf-m/tfm-mbedtls/tfm-mbedtls.mk
 create mode 100644 boot/tf-m/tfm-mcuboot/Config.in
 create mode 100644 boot/tf-m/tfm-mcuboot/tfm-mcuboot.hash
 create mode 100644 boot/tf-m/tfm-mcuboot/tfm-mcuboot.mk
 create mode 100644 boot/tf-m/tfm-qcbor/Config.in
 create mode 100644 boot/tf-m/tfm-qcbor/tfm-qcbor.hash
 create mode 100644 boot/tf-m/tfm-qcbor/tfm-qcbor.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
