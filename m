Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06311CD11DF
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 18:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A414760D66;
	Thu, 28 Mar 2024 18:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3mLHL0lYEkA; Thu, 28 Mar 2024 18:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACB3760E7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACB3760E7B;
	Thu, 28 Mar 2024 18:13:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4201BF284
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 18:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08AEA60E8B
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 18:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbbSt1xO89z9 for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 18:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A5EC60D66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A5EC60D66
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A5EC60D66
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 18:13:02 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41488f9708fso8580155e9.3
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 11:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711649580; x=1712254380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n5kg7zN3j8a1VU/XhkoZwC3HjzZffXX0pSqmbVdp0ZA=;
 b=X4Eibma0pGNTvBEPevxSswHVawAEiBBBN/4qC1mqsZwrUlUrC5fMf/0xfYr7Byt6+X
 qrJUOccuacL1nQrSTocaX+/bhU10QdU9tbTDaY2njO2HFgbnAbOw9LkFq1oomLbhELQv
 DMBGmTHSbTm3bjjkiVtMCEjE2mHldbLCgCkynFNEZbMrmj6YFpNdxhhovbQnrP18TS6C
 HgjDqrwC13Rlk+V3NhSAuaVI9+ZaA/O2XRhGLTy43LHtUaMFC2wVZduhF1+jex372mu0
 3thQ7vFc5LQFrNfgkqXOBYlEXsH8gyJsGhrgpAzNCsWk06NZdGMqEdVKE7trkcsoZCB4
 WKFQ==
X-Gm-Message-State: AOJu0Yzb5sh1gvW457kZofng4DaDYQ25KuZTK3Wj+boeeXUFXrtb7/7i
 hCoIj/WkfIzLObHkjI7PbobZmsDdBfkm2RVj8ka6evkn7of1J7k4rghlMdkOkittwRi37hQ5MM7
 gmvg=
X-Google-Smtp-Source: AGHT+IHOlOVwwkntdkcfoZaVezwicI4LPDhj8ia2s0N0vwpqBl72bnyxysz4hSI/fzysJHmeIMKsMg==
X-Received: by 2002:a05:600c:1d29:b0:414:8a28:6c82 with SMTP id
 l41-20020a05600c1d2900b004148a286c82mr88445wms.2.1711649580529; 
 Thu, 28 Mar 2024 11:13:00 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:8b20:c100:2e31:96e9:7843:4bd2])
 by smtp.gmail.com with ESMTPSA id
 p34-20020a05600c1da200b0041480a1b8f7sm3038732wms.4.2024.03.28.11.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 11:12:59 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 19:12:47 +0100
Message-ID: <20240328181247.3009506-1-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1711649580; x=1712254380; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n5kg7zN3j8a1VU/XhkoZwC3HjzZffXX0pSqmbVdp0ZA=;
 b=bF7WNsZxwlC4QIUZY52Ku3Ljf7fx2TkbxPT8/xSvyzAImi2NwaJZ2+PUZA1SQK6cwG
 Oq6hW0gqRzxdk4Io/MLMa3QJeCppJp1vJ5dDzpIBkDMMHXanbX9oQisQaOaQcQ8rKKfS
 9dFkpsfANs1ecVXesxBa33S8ZRXQrx6Mk9yjXTtWWT4ZKT3IynZ8FDlWsQCD2Ni1TjPG
 IeLrcsGTkF56oqVEQt3HoFY6O7Kwg6xMHGXlN66BMbpKNmIMag1KneWTNPeZo/h3G+PQ
 wAGBtpwkzug1NeVQJcLgyxCt0ORUWBhSK07swleiRP8qFQ7dHV8Lw5277PoEB7fqAYjt
 zKZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=bF7WNsZx
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add trusted boot
 option
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
From: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Reply-To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the required fields to enable Trusted Board Boot in
TF-A. The users should provide ROT_KEY private key to build the TF-A in
this mode. The ROT_KEY is used to sign the FIP image during the TF-A
build. Furthermore, the source code of the mbedTLS is also used during
the build process.

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
---
 boot/arm-trusted-firmware/Config.in           | 22 +++++++++++++++++++
 .../arm-trusted-firmware.mk                   | 16 ++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 2fe3dd1146..b90fca8191 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -45,6 +45,28 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 	string "ATF version"
 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT
+	bool "Enable Trusted Boot build"
+	select BR2_PACKAGE_MBEDTLS
+	help
+	  This option enables the Trusted Board Boot for TF-A.
+	  It is an authentication framework that uses a defined
+	  Chain of Trust (CoT) based on Arm TBBR requirements to
+	  achieve a secure boot.
+
+	  https://trustedfirmware-a.readthedocs.io/en/latest/design/trusted-board-boot.html
+
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ROT_KEY
+	string "Path to the ROT private key"
+	help
+	  The ROT_KEY private key is used to sign FIP image during
+	  TF-A build. It specifies a file that contains the ROT
+	  private key in PEM format or a PKCS11 URI and enforces
+	  public key hash generation. To generate by OpenSSL:
+	  openssl genrsa -out key.pem 2048
+endif
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
 	default "v2.10"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 2d554c1da8..49ebd29b93 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -58,6 +58,16 @@ ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/rele
 endif
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT),y)
+ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT_ROT_KEY = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ROT_KEY))
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	TRUSTED_BOARD_BOOT=1 \
+	MBEDTLS_DIR=$(MBEDTLS_SRCDIR) \
+	GENERATE_COT=1 \
+	ROT_KEY=$(ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT_ROT_KEY)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mbedtls
+endif
+
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	BUILD_STRING=$(ARM_TRUSTED_FIRMWARE_VERSION) \
@@ -224,6 +234,12 @@ $(error No repository specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CU
 endif
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT),y)
+ifeq ($(ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT_ROT_KEY),)
+$(error No ROT_KEY specified for TF-A. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_ROT_KEY)
+endif
+endif
+
 endif
 
 $(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
