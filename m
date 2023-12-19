Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55F6C46CA2
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 17:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E40E82A2D;
	Tue, 19 Dec 2023 17:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E40E82A2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2Caya3WQ5Hf; Tue, 19 Dec 2023 17:24:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCCD482871;
	Tue, 19 Dec 2023 17:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCCD482871
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E45F1BF390
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 028ED6149C
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 028ED6149C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFZH-47MaCb8 for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 17:24:50 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56C7161496
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 17:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56C7161496
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d3c93fadc4so14208845ad.3
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 09:24:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703006689; x=1703611489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9gyoGr7m2R4I4bOa0e2nLm9V341UKprl2xgfw9yNQ8=;
 b=XYrCthkomkSR5NlarPVd1KnQf0/Aaz30maGGbOMyBcqRpd9OHViWR/ryEQe/wHJLXN
 0EsOZLwQDlZqpa9n34bC+fA0BJj+05SictL+Flume5Pw92fvCUuClEvS7p7KiByKZZva
 FPBqK2vZW3eCDxX3I4onRiKVdscVZUn1CxD3q8CeUjoMEaNjIykeO4jkN+x0DvVvL9pZ
 hcEGWgSqHJN6oSRh6YMfcqXvEE1F2d28am02UPvaOBoZ/I7PP2gvm6blpAIjNY83SoaX
 w/dOf6YLlcwYxovDfJQTOvcQ3D7kHHg8sxlC69ktXmLzrA/2rKN9RAabwjy/SrxW26bU
 3DKw==
X-Gm-Message-State: AOJu0Yz0knRgdung5lf+rCJ/Lfr7Gh5HYhuBGshLwdi6GvL/dmmER2xy
 o8iPpDJtil3AIo0cihXrcrUSmEQLTvyitss9h94=
X-Google-Smtp-Source: AGHT+IGnj9J8AVCUCCQe9CsLnIRyfCvuNYFrLxnzJEBEv+0DyjT+JrfEY5MYQgHxXdBgnxCtOMKAJQ==
X-Received: by 2002:a17:903:25cd:b0:1d3:bb5b:c4f with SMTP id
 jc13-20020a17090325cd00b001d3bb5b0c4fmr2048363plb.35.1703006689293; 
 Tue, 19 Dec 2023 09:24:49 -0800 (PST)
Received: from fedora.. ([75.174.143.7]) by smtp.gmail.com with ESMTPSA id
 g192-20020a636bc9000000b0058901200bbbsm19910829pgc.40.2023.12.19.09.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:24:48 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 10:24:41 -0700
Message-ID: <20231219172446.498409-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703006689; x=1703611489;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V9gyoGr7m2R4I4bOa0e2nLm9V341UKprl2xgfw9yNQ8=;
 b=qDhOJPV2OVyCS750YHq/KNsB+9YJ80Lxidl4pK2vH+OfBxP/qTgouZ4QkprVhZnXMK
 aT/gF3t+sTgpioQMOF42qw1Lo/cxtWzmswmk/LdMmBwVKvuGy5BoGI3woJx88vkKIy5J
 pbcpr7GMYWojUZI0DbgGUoT+/Sb9C85au2bYM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qDhOJPV2
Subject: [Buildroot] [PATCH v3 1/6] configs/mender_x86_64_efi_defconfig:
 Update kernel to latest LTS version
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

5.18 is not a LTS version. Let's update the kernel to use the LTS 6.1 kernel.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3: Update BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_18 -> 6_1 [Thomas]

 configs/mender_x86_64_efi_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 25a463abb3..57bfc15d01 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -2,7 +2,7 @@
 BR2_x86_64=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_18=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -39,7 +39,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.68"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
