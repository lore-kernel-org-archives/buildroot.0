Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81102C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 19:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 016536063F;
	Mon, 22 Jul 2024 19:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKfkKadet9sL; Mon, 22 Jul 2024 19:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7646260785
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7646260785;
	Mon, 22 Jul 2024 19:18:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31C2B1BF281
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ADE640206
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfImwgvOWpVf for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 19:17:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C56740200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C56740200
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C56740200
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 19:17:57 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46MJHrZa095013;
 Mon, 22 Jul 2024 14:17:53 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46MJHriX121488
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Jul 2024 14:17:53 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jul 2024 14:17:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jul 2024 14:17:53 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46MJHq8Y103397;
 Mon, 22 Jul 2024 14:17:52 -0500
Date: Mon, 22 Jul 2024 14:17:39 -0500
MIME-Version: 1.0
Message-ID: <20240722-tfa-src-update-v1-3-e68bba62f146@ti.com>
References: <20240722-tfa-src-update-v1-0-e68bba62f146@ti.com>
In-Reply-To: <20240722-tfa-src-update-v1-0-e68bba62f146@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2391; i=bb@ti.com;
 h=from:subject:message-id; bh=09NDEVwFHd74L1DEBCFtQWhJ+5vfH3OUUl47GrSOcQU=;
 b=owNCWmg5MUFZJlNZxq456AAAaf///vbPz79n/Drd////fTt6mNL+972tv1t733jO/9zhvm6wA
 RswjtRoBoGjQA0aA00BoAaA00GjRoGgAANAGmjQaDQNAAaZD1D0npBiGmE2p+k1EGhkPUxGjTQx
 AZAaNANGJoDINBoAGmTTQaaaaDIwmNTQ0GmgyaDTEMQAyBkAOTT0g0aGmhiYjTTQMgNGAgMjQAa
 aMjIBoyMgGjAgAaaBgRhNABoyAAAACyDKLWGTgRnLcBxAz7oKZ1LhvZluixmyILSciCkAW5CK5j
 gCHJaADQ/CufQ/uTmcmzgAIRcClmQ9P7C23T7gYx/edpZoVe8r8bqz3GGA56oKSiaZEvw0uwcsT
 J2GExulWfpxsDbMwTSJekj0DViMYGCQfaM3BcS6QNXY1oa7erL/OGI00ki/BTDA75i5IRnp8UKf
 SOP9k8imkzSUNqMFm6qi2HTK05dP7MSqzibcynzlhAIKwbKX4/d285grE3ng/GwYvxysllPU0Jq
 o5O9b63QaY+YWlhV3QS/AyiVCoOE1wg4q95GrosIDokEvyR3dFyVW0+t6VoPXoy7uitjRTbbCs0
 auG927Bq447NP+kP5zc/kASRmQyCGBpl0bQyhA1anRgAHCPDiJSymYIcEYVUZJmw154h40GAUOi
 O4niGoLKVdIf8XckU4UJDGrjnoA
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721675873;
 bh=RES7GF5vkxAVaN7NaqV4tsC+8UuM7NkfYrpuXV26Gr8=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=sooWpdgyLaIADYX5V8X49lRaDG9+8/cw4/+/pGpvz8myPOjzr+PyXNAX9YR6PO6RP
 JxUzV5G+ojY0wmXr9R0VMc+VE928+lsyb1UD8cGnUSVc6P7p4EvNK8ZjAyhPmLV7/G
 mHNo0oHyvtnqKe2cHCZb+ixTNnW95Ma6xE8QPpN4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=sooWpdgy
Subject: [Buildroot] [PATCH 3/3] boot/arm-trusted-firmware: bump latest v2.8
 version
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

The lts-v2.8.20 tag was published on June 28th. Bump
arm-trusted-firmware to this latest release.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/arm-trusted-firmware/Config.in                                     | 2 +-
 boot/arm-trusted-firmware/arm-trusted-firmware.hash                     | 2 +-
 .../0001-build-tools-avoid-unnecessary-link.patch                       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)

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
index a09a7e1945a79..d5b954e4f1e5b 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
 sha256  a362d89884a96ad1815fda64db17776ac1b10e5398940a28c37fdeda2c62e6f5  arm-trusted-firmware-v2.11.tar.gz
-sha256  24b530f15cd714fa82cd8b80fbde0c18b8b8ea33778104532185ad67cb364bf9  arm-trusted-firmware-lts-v2.8.13.tar.gz
+sha256  a8d82dde1efc3de3c2752e15318e0445418019fc20a1208064f98edc7288fd5d  arm-trusted-firmware-lts-v2.8.20.tar.gz
 sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst
diff --git a/boot/arm-trusted-firmware/lts-v2.8.13/0001-build-tools-avoid-unnecessary-link.patch b/boot/arm-trusted-firmware/lts-v2.8.20/0001-build-tools-avoid-unnecessary-link.patch
similarity index 100%
rename from boot/arm-trusted-firmware/lts-v2.8.13/0001-build-tools-avoid-unnecessary-link.patch
rename to boot/arm-trusted-firmware/lts-v2.8.20/0001-build-tools-avoid-unnecessary-link.patch

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
