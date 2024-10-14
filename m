Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15155D16278
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 14:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2088110E;
	Mon, 14 Oct 2024 14:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hx7PekpXjOr1; Mon, 14 Oct 2024 14:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 775898112E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 775898112E;
	Mon, 14 Oct 2024 14:31:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19DC51BF2BA
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 14:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A0EF810A4
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 14:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AL191dALzdd for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 14:31:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDB50810B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB50810B5
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDB50810B5
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 14:31:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id E3B77C3129
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 14:29:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC8C124000D;
 Mon, 14 Oct 2024 14:29:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 14:29:19 +0000
Message-Id: <20241014142923.246809-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728916170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4OLlbLz+TkOGMY+dUfJx07AH9M9ymXmG4CAuplKnlpg=;
 b=eWzaL1r//MAUqTfGtoG9+ojSGAHUV3OUecCeJavzSql7sZdx4QSvFzO+fSb/pMwy5WYgLU
 1iUvk38lWGR18TMZQIJeOBFqBfkY7LlrLbGsseH1xHBRwQD02zULvO7FH1SLQ847tdobFe
 q/AgjCIH8omgvBAtA79slf0kng8hCZRHnqF8S8ZfZuvZsiM0ZtxMcxenIv8kv4hj+OcTnq
 2aMs9vYY4+IOaA40PpTpnxd9uMhn14H5YcibI5mRXCCJzFaoOu9Vk5Ij1IRNmPGOxgvT9Y
 wFwkc14kjgzQRFM/gWDh2397dj1M4dpp+fP37dHRF3FbIFZWVtqq/LLjwf1WnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eWzaL1r/
Subject: [Buildroot] [PATCH v6 0/3] Adds support for TrustedFirmware-M
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

Patches 1-2: Address host Python package dependencies.
Patch 3: Add support for TF-M.

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
 boot/tf-m/Config.in                        |  95 ++++++++++++++++
 boot/tf-m/tf-m.hash                        |  11 ++
 boot/tf-m/tf-m.mk                          | 126 +++++++++++++++++++++
 package/python-click/python-click.mk       |   1 +
 package/python-intelhex/python-intelhex.mk |   1 +
 utils/genrandconfig                        |   3 +
 8 files changed, 239 insertions(+)
 create mode 100644 boot/tf-m/Config.in
 create mode 100644 boot/tf-m/tf-m.hash
 create mode 100644 boot/tf-m/tf-m.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
