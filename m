Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74009C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20D6140C3F;
	Wed, 23 Nov 2022 19:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20D6140C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAg-7YWmI5sh; Wed, 23 Nov 2022 19:59:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 564B540C28;
	Wed, 23 Nov 2022 19:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 564B540C28
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F3981BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B78E60A4F
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B78E60A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKOQ8DZNw8eS for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:58:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD30960BB5
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD30960BB5
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:58:28 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id v3so17652021pgh.4
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:58:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGpigAdmVTYKVejpj/CNqb+Epqd94DCPbztInEPIt1E=;
 b=uRSw5l/+YSMZ/0bZI3ZLNBzH33pdbXuffWM4yCce0FVRzOn23yMXawN7oB1LEUkN0I
 QjO670TX41b3a3cdmWT67Fvrs/sPEhWR8WUCSw6/CMZG1TEePCopT42UmfQc6xV8m8g8
 z/M0XDpVIOcgBwJ7FSOqbLK/AwikrPyyHt4ZVESz4VkR4naJQKIOhTaPeqI1nqhh5/Z1
 lx8T193kYv1Pqel18BtwMUr1HFz2cHKhss21Z6O+fnYKiUqI1hIK97goJG0UVuF1vymP
 BnktPcIBAveetsQW9ObQH6FXxL2P5muMjU7vFrnblOP/yeFLBTaJpg70oeYlSi79CWFU
 sPnQ==
X-Gm-Message-State: ANoB5pnPVUZUHG9n8/u3jiUVurZpn4H+gIC+88UlLWTbsFtC9vB7nc4V
 hM9IjIyaZTU1Ydkr2wg9w2OM9FlQdxR9qQ==
X-Google-Smtp-Source: AA0mqf4QCrV2xZ9OveA4UY7qH6l4+NTjMQ1l1Odd3vhvn1TJEfEhBuvf1jScPw1+iHhR3eeXMTzbbA==
X-Received: by 2002:a63:1a07:0:b0:477:cb5a:ad48 with SMTP id
 a7-20020a631a07000000b00477cb5aad48mr652632pga.63.1669233507828; 
 Wed, 23 Nov 2022 11:58:27 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 q15-20020aa7842f000000b0056b9df2a15esm13124508pfn.62.2022.11.23.11.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:58:27 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:58:12 -0800
Message-Id: <20221123195815.1583545-3-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195815.1583545-1-chris.dimich@boundarydevices.com>
References: <20221123195815.1583545-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dGpigAdmVTYKVejpj/CNqb+Epqd94DCPbztInEPIt1E=;
 b=iExQSfzzEBIj/UK0EP4Z0IcDKSE/CWta4p81pZFQRczvS7hNBA0fGNZ31QHgpTVBbk
 7n4U0245jtU+IXDrdZpm9wjq13HYqBEykpbnK/z11mF0ZVkuiEWc1njSkg+Az+riw517
 arR7NX7/fHi/GPacaUWWvapeB0req7fVuTAuw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=iExQSfzz
Subject: [Buildroot] [PATCH 3/3] configs/nitrogen8*: bump arm trusted
 firmware revision
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Bump ATF to boundary-lf-5.15.52-2.1.0.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 configs/nitrogen8m_defconfig  | 4 ++--
 configs/nitrogen8mm_defconfig | 4 ++--
 configs/nitrogen8mn_defconfig | 4 ++--
 configs/nitrogen8mp_defconfig | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 41e2ddb79d..be2ce0cb3c 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -28,8 +28,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_5.4.70_2.3.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/9f6114fd.tar.gz"
+# Latest revision of branch boundary-lf-5.15.52-2.1.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index c20c64b121..e0a7552e94 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -28,8 +28,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_5.4.70_2.3.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/9f6114fd.tar.gz"
+# Latest revision of branch boundary-lf-5.15.52-2.1.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 5a78df3865..e2a36c0c75 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -28,8 +28,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_5.4.70_2.3.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/9f6114fd.tar.gz"
+# Latest revision of branch boundary-lf-5.15.52-2.1.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 078476b004..3e275f101e 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -28,8 +28,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_5.4.70_2.3.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/9f6114fd.tar.gz"
+# Latest revision of branch boundary-lf-5.15.52-2.1.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
