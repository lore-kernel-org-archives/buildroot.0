Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962A2C3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 21:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9238060749;
	Sat, 10 Aug 2024 21:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jj3riwtwrPk3; Sat, 10 Aug 2024 21:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5454160745
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5454160745;
	Sat, 10 Aug 2024 21:56:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96DB91BF2C4
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 21:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83847401B3
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 21:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYdTbujmGP8w for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 21:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F021F4010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F021F4010C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F021F4010C
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 21:56:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0B08AFF802;
 Sat, 10 Aug 2024 21:56:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 23:56:14 +0200
Message-ID: <20240810215624.482529-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723326990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=adALT+1ZgZ91o1jB2sY15KbFAO9ISSvQ8NIE0ibe6ZE=;
 b=L9EnEHyFs86xWtnVQy/dN7lRNsmVo+Ilmau+ZZwT1btaZeV4norPV6MicCESz5EeDG5iOu
 m/V/0Ki4uu/tf9EsJtBWkFXK+2j7IYq+Zutiiw9MPoV1EX+JTGB2r4izRHcxETsajPM7fy
 c961yvc9bh5KDv0s2I+4uM4gTbQt3fwNgOctMADYqvNdR2dYR4E7yH6uPIrqdPWZD+wXft
 jfpi9e62prv3w8iFpXwURw6G6KVTFAHvHPb8oVAPGPDcFQs7EaO/LuG37PxLM1mKdfFZ31
 ysdIFgBvFyiFngUo8t/UU2zMGNe17twKOrg8+F6mmeonPOpav1y03r1WZaH0aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L9EnEHyF
Subject: [Buildroot] [PATCH next 0/7] Update some external toolchains
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This series updates the ARM external toolchains (ARM, AArch64 and
AArch64 BE) as well as the Synopsys toolchains.

While at it, it adds some basic tests that at least ensure a minimal
Buildroot build works with each of those toolchain variants. All tests
are successful:

23:41:27 TestExternalToolchainSynopsysArcHSuClibcLE Starting
23:41:28 TestExternalToolchainSynopsysArcHSuClibcLE Building
23:42:23 TestExternalToolchainSynopsysArcHSuClibcLE Building done
23:42:23 TestExternalToolchainSynopsysArcHSuClibcLE Cleaning up
.23:42:23 TestExternalToolchainSynopsysArcHSuClibcBE Starting
23:42:24 TestExternalToolchainSynopsysArcHSuClibcBE Building
23:43:18 TestExternalToolchainSynopsysArcHSuClibcBE Building done
23:43:18 TestExternalToolchainSynopsysArcHSuClibcBE Cleaning up
.23:43:18 TestExternalToolchainSynopsysArcHSGlibcLE Starting
23:43:19 TestExternalToolchainSynopsysArcHSGlibcLE Building
23:44:16 TestExternalToolchainSynopsysArcHSGlibcLE Building done
23:44:16 TestExternalToolchainSynopsysArcHSGlibcLE Cleaning up
.23:44:16 TestExternalToolchainSynopsysArcHSGlibcBE Starting
23:44:16 TestExternalToolchainSynopsysArcHSGlibcBE Building
23:45:13 TestExternalToolchainSynopsysArcHSGlibcBE Building done
23:45:13 TestExternalToolchainSynopsysArcHSGlibcBE Cleaning up
.23:45:13 TestExternalToolchainSynopsysArc700LE    Starting
23:45:14 TestExternalToolchainSynopsysArc700LE    Building
23:46:01 TestExternalToolchainSynopsysArc700LE    Building done
23:46:01 TestExternalToolchainSynopsysArc700LE    Cleaning up
.23:46:01 TestExternalToolchainSynopsysArc700BE    Starting
23:46:02 TestExternalToolchainSynopsysArc700BE    Building
23:46:49 TestExternalToolchainSynopsysArc700BE    Building done
23:46:49 TestExternalToolchainSynopsysArc700BE    Cleaning up
.23:46:49 TestExternalToolchainArmArm              Starting
23:46:50 TestExternalToolchainArmArm              Building
23:47:39 TestExternalToolchainArmArm              Building done
23:47:39 TestExternalToolchainArmArm              Cleaning up
.23:47:39 TestExternalToolchainArmAarch64Be        Starting
23:47:39 TestExternalToolchainArmAarch64Be        Building
23:48:30 TestExternalToolchainArmAarch64Be        Building done
23:48:30 TestExternalToolchainArmAarch64Be        Cleaning up
.23:48:30 TestExternalToolchainArmAarch64          Starting
23:48:31 TestExternalToolchainArmAarch64          Building
23:49:21 TestExternalToolchainArmAarch64          Building done
23:49:21 TestExternalToolchainArmAarch64          Cleaning up
.
----------------------------------------------------------------------
Ran 9 tests in 474.019s

OK

Thomas Petazzoni (7):
  arch/Config.in: introduce BR2_ARCH_NEEDS_GCC_AT_LEAST_15
  toolchain/toolchain-external/toolchain-external-arm-arm: bump to
    13.3.rel1
  toolchain/toolchain-external/toolchain-external-arm-aarch64: bump to
    13.3.rel1
  toolchain/toolchain-external/toolchain-external-arm-aarch64-be: bump
    to 13.3.rel1
  toolchain/toolchain-external/toolchain-external-synopsys-arc: bump to
    2024.06
  support/testing/tests/toolchain/test_external_arm.py: new test
  support/testing/tests/toolchain/test_external_synopsys.py: new test

 DEVELOPERS                                    |  2 +
 arch/Config.in                                |  4 +
 .../tests/toolchain/test_external_arm.py      | 41 +++++++++
 .../tests/toolchain/test_external_synopsys.py | 91 +++++++++++++++++++
 .../Config.in                                 |  2 +-
 .../toolchain-external-arm-aarch64-be.hash    |  4 +-
 .../toolchain-external-arm-aarch64-be.mk      |  2 +-
 .../toolchain-external-arm-aarch64/Config.in  |  2 +-
 .../toolchain-external-arm-aarch64.hash       |  4 +-
 .../toolchain-external-arm-aarch64.mk         |  2 +-
 .../toolchain-external-arm-arm/Config.in      |  6 +-
 .../toolchain-external-arm-arm.hash           |  8 +-
 .../toolchain-external-arm-arm.mk             |  2 +-
 .../toolchain-external-synopsys-arc/Config.in | 13 +--
 .../Config.in.options                         | 32 +++++++
 .../toolchain-external-synopsys-arc.hash      | 12 ++-
 .../toolchain-external-synopsys-arc.mk        | 13 ++-
 17 files changed, 206 insertions(+), 34 deletions(-)
 create mode 100644 support/testing/tests/toolchain/test_external_arm.py
 create mode 100644 support/testing/tests/toolchain/test_external_synopsys.py

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
