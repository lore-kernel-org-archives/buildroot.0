Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3922FFD45F4
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 21:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06980817BD;
	Wed, 25 Feb 2026 21:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CbPBDgaV4Kam; Wed, 25 Feb 2026 21:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 202B7817EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772054555;
	bh=plRtAv/3xcBdUJlGpHkTrxlGoBVlhvSZqHF0gnLSyEE=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Su/bGb1Qh8rwSNlSoI6nRayFiosPua7wmEUxpoInoj9fDaHzxblPsJhc9OIqufd5t
	 8LS7c27b2n6mAK653YxA9ZyXZ9FtHsUaL/frqGd3E5jvoS+BUaYysrwBHreatQNnIQ
	 0hVqs3q+YAB43J5tQTNKR6nXxu+5zwzdHNMGd3cmGpWkoTom0ixXy8sCuncmR5VDnI
	 vBMdnxlzhctud72+qw9zsd/7XZTx/zdEdRJy5IFeIY36RlN0L8BgziuAPIIoegP3Pc
	 3URBs0ffVXN7SZEIn9MyUsyqfSE79Y1jzT2ORbeqL4/tGkcr9QLGBsfWup0WZUCTR5
	 upuUhnWP6o5ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 202B7817EB;
	Wed, 25 Feb 2026 21:22:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6E2623D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 21:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCDE3817EB
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 21:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZRvGys6zljo for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 21:22:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDF21817BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDF21817BD
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDF21817BD
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 21:22:31 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-8230c33f477so106222b3a.2
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 13:22:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772054551; x=1772659351;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Yc1IE6Y8Oc8YB95AakTBQnNt8BKq0HuLgKf199Svs8=;
 b=izfQAEzvMpMv/r6FdftKQjZHXRi3G9RVV4OZEu0gAXEGCBPy78sqw/flyjctut6C9h
 Qss7dWbJqwO8zqt4+oB8fiBDr/3X1CRmxRc0qfsHBMuwI7lzeFPCihyxMBCQxlRPcWE7
 f4utb2MJZvqJx2HxN+YVaKPfMz+597yrON8gwBN3TTrgIsVoZuROu45t2jqQMknpEC9L
 CBY+ELaynoWcvLxxTYtALSA6qD+UqqC8/IhKe58plUKBjrp6T0zi1wGddktKK2hyHZ4M
 soXBgH6tOf8UZ3DiDnLe9ecyZV/q08A9P2Bg9mAZRMFvmi14Bm0M98E9XOqZbm049IJL
 f4SA==
X-Gm-Message-State: AOJu0YwuEkeg8N1rmlqXnCqcIzkZ5rFGwJHs+GizX+rlQRny4aqRvMfT
 QQTWa4FD4WkWyNgXMhqH4HYw3kW1jay+mfc/lhmZJLuXpZTo+6lUQv5phJksyr3W0VU=
X-Gm-Gg: ATEYQzyH5Zm/jpGdCz8EAgn8C51RMPNs+jWbT0E+c376NynlAtTg+wwFJvPY+oLNKjT
 RYhFL2ZdeZ/F0x4UDORlqOYNyognxb1c2DiJHgThXtvkX2WgVMYwosfc8QTuq4on3wwgdjQPkcA
 8/KVUhCyxaNvK7NXKL7ciNvnyCCN9GN+Q1FC5GPEenI/3LoV6+GkrghJCw5WnaPCI6OfXfe9fT9
 9cn+WJsDp09UnKKqVcXlluE3/wFL3QdjySqmk5TJh4acDCdaHA4JYozKuGFBdF6d1Li4yBuo9/4
 VzuJiUaHo2/BAzd6nITub31T5Tkm+9zXjSymwf92FjT2NraI/wQTATUqFg/tx7vDdhb4c+e2VvQ
 26b4AmKdDxj1lkCNEkSFJFVNk4bVX6HqGmYDptaamRv5DSdzqBRzAx4SxC2Ju8fNSDSNIyZypd4
 sJu1OmrzNUb1v6rA9MOdqNkUkPI62yog4=
X-Received: by 2002:a05:6a00:2342:b0:823:3fc7:4c84 with SMTP id
 d2e1a72fcca58-826da7083e9mr15751437b3a.0.1772054550912; 
 Wed, 25 Feb 2026 13:22:30 -0800 (PST)
Received: from wash-8.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739d87e78sm197077b3a.17.2026.02.25.13.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 13:22:29 -0800 (PST)
From: Joseph Kogut <joseph@anodize.com>
Date: Wed, 25 Feb 2026 13:22:16 -0800
MIME-Version: 1.0
Message-Id: <20260225-mesa3d-vulkan-amd-v1-1-2a91cfb594a5@anodize.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCQAxA0auUrA2kI47gVcRFpok2aKNMtBRK7
 +7o8i3+XyG0mgacuhWqzhb29IZ+18Ewst8UTZohUcqU0gEnDd4Lzp/HnR15EhSiLMS5L8cCrXt
 Vvdryf54vzYVDsVT2YfydXJc3bNsXw8WSY3oAAAA=
X-Change-ID: 20260225-mesa3d-vulkan-amd-d006d0a61b7b
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Bernd Kuhls <bernd@kuhls.net>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772054549; l=2352;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=UUm5/QG3Ovx5pYFMo8muvKtZrrBiOzb3pHMbbPwGi0M=;
 b=48Xg7DlLrcJDT3J2hEhdUBr1/1vqSrwxzKG0HwWPX3v97AO+M4fPR+FhT2tYD0dWWTToYBthT
 1iopeIuq7H7COWw93dmqnLLpVMXNgbQ8a2C4gvC6capyXshK0TLsAnO
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1772054551; x=1772659351; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Yc1IE6Y8Oc8YB95AakTBQnNt8BKq0HuLgKf199Svs8=;
 b=nisXdtBRldSztG00APMVHUyuMhqjHBovf2PjTG/JMR8VRt6u1NqkzMsdYgyzWthYsa
 KALGcSkxn3xnDLmFa+dG3F/sdywyCEg2v/OdydUBXbKG6QA1lzuA8Mxv9KYH8jppfwwz
 0FjftdPxVfBWTpD+OwLsOYu5lHePTdA4RC2tyF5IEKA3vFZCmTJVB6StBwty2KBQoJkG
 KT7f5WAMOVaWaCzYJpaEVOvBEkzBkf2rr1SBHa0+bmBH+gmBIgjhqCDaSNiVj7Crf1X1
 t1zkPI2DuzPt5KkoUhXY0SkdCAdU7Y3YAvDyNqmyI/bULVeS6PHw7fJjg2AJJDmTmj/a
 B5xQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=nisXdtBR
Subject: [Buildroot] [PATCH] package/mesa3d: add amd vulkan driver config
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

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
 package/mesa3d/Config.in | 13 +++++++++++++
 package/mesa3d/mesa3d.mk |  1 +
 2 files changed, 14 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e1faea95d5..57c62745d8 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -57,6 +57,7 @@ menuconfig BR2_PACKAGE_MESA3D_OPENCL
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION || \
 		(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
@@ -325,6 +326,18 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK
 
 comment "Vulkan drivers"
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD
+	bool "Vulkan AMD driver (radv)"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
+	select BR2_PACKAGE_LIBDRM_AMDGPU
+	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  RADV is a userspace driver that implements the
+	  Vulkan API on most modern AMD GPUs.
+
+	  https://docs.mesa3d.org/drivers/radv.html
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 	bool "Vulkan broadcom driver"
 	depends on BR2_arm || BR2_aarch64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 42693ce928..9b81d1e619 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -128,6 +128,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 # Vulkan Drivers
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD) += amd
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel

---
base-commit: 664daf6459fd0a867948ac78da3037386a2f5233
change-id: 20260225-mesa3d-vulkan-amd-d006d0a61b7b

Best regards,
-- 
Joseph Kogut <joseph@anodize.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
