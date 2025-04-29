Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA599C369CB
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 07:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F9AF40725;
	Tue, 29 Apr 2025 07:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JchQPiylf0xk; Tue, 29 Apr 2025 07:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACED840907
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACED840907;
	Tue, 29 Apr 2025 07:14:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE3EF1C4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 07:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF8F540907
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 07:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uzr16MYDGY2 for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 07:14:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1CEBF40725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CEBF40725
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CEBF40725
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 07:14:21 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a0d:e487:32f:55cf:6429:fefc:6f89:8359])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 01CC613F8BA;
 Tue, 29 Apr 2025 09:14:17 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Vincent Jardin <vjardin@free.fr>
Date: Tue, 29 Apr 2025 09:14:10 +0200
Message-ID: <20250429071410.66339-1-vjardin@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745910860;
 bh=EsqmeCGZ6kDd3BeCse3aJGtq29tCyiM1C7vUjsllyHo=;
 h=From:To:Cc:Subject:Date:From;
 b=DXiYjSWzszxLSD4GkNQxQ0ZjkDMkcbFhPgvfNNcZyMIua7iUSp4jvx5mTf+fi5i7Y
 Aml+ExWgFqckeCEcGcE7vMGLpvT0XB5fO9Nsf5WHTQQPgXjyxIUql0hH42rWv++N4e
 KlF6o3wpAtD9owZEszlFdmU6Py8Ccbkp37DSSJdRraIstY8TmpKDfnOccRfvGH6pTV
 aFaoB2/HzYG9+lPHkZ7mbltXgKVQm+lB3SHmDuwFN+2rxdy4QdVI6jCbg5FQZe/cSs
 dBqcfTAnHIZuyCKWeECpjaLBZ77vq5rNJ5VPGvtB9kF+I136sxjM8gQ/dO0fQYqLYq
 Q6HErpeu34vRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DXiYjSWz
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: qoriq-ddr-phy-binary
 dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DDR firmware for the training is needed when the ATF is built.
Let's fix this dependency. ATF will fail building without this path.

Fix: 9fe5ac03c0bd (package/qoriq-ddr-phy-binary: new package)

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index dca16d3960..a6c2bf8153 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -147,6 +147,12 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
 endif
 
+# This firmware is designed only for the lx2160a targets
+ifeq ($(BR2_PACKAGE_QORIQ_DDR_PHY_BINARY),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += DDR_PHY_BIN_PATH=$(QORIQ_DDR_PHY_BINARY_DIR)/lx2160a
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += qoriq-ddr-phy-binary
+endif
+
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
