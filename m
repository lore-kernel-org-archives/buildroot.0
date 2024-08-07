Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59133C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 17:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3703440656;
	Wed,  7 Aug 2024 17:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zstUP6FNs-KV; Wed,  7 Aug 2024 17:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCA9C4063A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCA9C4063A;
	Wed,  7 Aug 2024 17:48:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB62E1BF982
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 17:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1271404D6
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 17:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id If8m94WBah8S for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 17:48:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F5FE40336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F5FE40336
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F5FE40336
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 17:48:32 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 477HmR3H072077;
 Wed, 7 Aug 2024 12:48:27 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 477HmRiN030258
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 7 Aug 2024 12:48:27 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 12:48:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 12:48:27 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 477HmRMC068647;
 Wed, 7 Aug 2024 12:48:27 -0500
Date: Wed, 7 Aug 2024 12:48:21 -0500
MIME-Version: 1.0
Message-ID: <20240807-tfa-src-update-v2-3-f2cd6166db5f@ti.com>
References: <20240807-tfa-src-update-v2-0-f2cd6166db5f@ti.com>
In-Reply-To: <20240807-tfa-src-update-v2-0-f2cd6166db5f@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=bb@ti.com;
 h=from:subject:message-id; bh=hFtELIX+eTMWQWaUe9Z8xHU//HMW4p12D9KPnYHty5M=;
 b=owNCWmg5MUFZJlNZ6IKw/gAAYH//////Lr/hK2qmWs/qV3feTw8/+s7br+s/d9//7v777/2wA
 RmYGKaAADQ0GhoaADQDINNqAaGQ009RoAADRo00A0AAAAD1NDRkNDTyTJ6mTxRAaAGgyGgGBMQD
 TTTJoDTTTTI0aAAaD1DRiMTE0aAepkGjTTE0aaeppo0BoAGgCGRiD0JkNqZDTQYhoGmgZDQ0DAQ
 AZNNBpkAGQANAAAZGRtJk0AAHqGmQBQpEBSi/e0KCyM0Oo/kklHS/OZgk+bqmoQhvWpQF8oH1wI
 vZHxDCML8VLc9ojj2ZD4PTLTu/VQdOBEIu+6y6wKkXF11WV5QI3WZVJLQDNcS8yFfEGhVBBg6Qe
 QDcrgTf8wg69IiTNcKarkmUQgrrwnJfaZBjPRKfNDkKQtJzQPAKhjd0pILMerQwSXUycROEhj0C
 sg2vUTdTqmUAID2mXNdgC472O/+sgYZM4L47R0+SubDbYejj6610qxLjqkJK7Ixjtb2cpj36El2
 ArIBao+5YiYnGzOjRgGAN1OvVDh6oa1Se8R1cYyW38OdtA1nr9cy/8U32mE+zgwrBgoZ4mcMyFj
 fsADLPIPAE4EWFkDZQghHeZobn9uGlY1BSFn+LJfGyc0hNjjL01uQ0yolEVpEJQkHOmkgRP4uSU
 l1rZaaUNxkr/F3JFOFCQ6IKw/g=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1723052907;
 bh=QwX0r+ZknOw9oIkWm5tpGXUQUiwjbDNGoQbFdh6vGBY=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=Kx/82+5fDKlgPr4f9yDqwV7oMY3A6nayQpmm5g9Puy4XOI3Z/Yyx2PnRnf+fPGk8F
 Rve9WmYkLzGG166yDRXEs1UKBqtYw7ZHFZZD9iz+HZYFATrP7twFrL3sx1AdgdJffD
 aF2KQc8hpIeooRmzqzm1YobcZSSv+oOe7ihRNadc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Kx/82+5f
Subject: [Buildroot] [PATCH v2 3/4] boot/arm-trusted-firmware: bump lts-v2.8
 to v22.8.20
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bump the lts-v2.8.x branch to v2.8.20

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/arm-trusted-firmware/Config.in                 | 2 +-
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 60ecf419bc348..870db48c80b07 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -48,7 +48,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
 	default "v2.11"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
-	default "lts-v2.8.13"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
+	default "lts-v2.8.20"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 8d53c849ff7a7..6955743e42c2e 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
 sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
-sha256  695ae232fef6da931157e032b520f145b2c4cbe675d92b6a12222a332e960e89  arm-trusted-firmware-lts-v2.8.13-git4.tar.gz
+sha256  a90617cc2c1791c98d36b9e3d9a7f3f77029897e00c4279ff4ef559b769e9d7b  arm-trusted-firmware-lts-v2.8.20-git4.tar.gz
 sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
