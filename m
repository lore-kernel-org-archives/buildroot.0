Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F2CFD45EE
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 20:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7997440719;
	Wed, 25 Feb 2026 20:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VA0Ah8SrUciE; Wed, 25 Feb 2026 20:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B08640760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772050629;
	bh=t9YF0wVj/uPNde529ZmXQ/c86+1nS6ZYvO7ZOWmGEQ0=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DNkpC5HxlhEloOCMzhg3jJMqKpcjI59kMTP6kwBN8zIhpUQJvEWFA/gmRpq7HNp11
	 GDboTSLT9gny7KR9HT8W6PMG04gDse7hPlP7BAYMzNCT0aa0E7KIAU93jcfLFie94O
	 iSNQUKQgVZgImSPUloLQ7vsqa8rKzXz2+QKWVCnqcc0Y3a6jXTFkqWef8ISU71W2b2
	 RuRULb7YE2kymxdjXCrFk919296XSx8KRUyAMou6RlBPvigVbxo4iFZv5Ue1m4rkMl
	 xz01VJ9dmDbHT+cSft/43wWeAOgYlF4snoEI2pJittVy/g5UurdSpSyqwffomhwNwR
	 RUda8TLlC9/Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B08640760;
	Wed, 25 Feb 2026 20:17:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A51F224E
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2A6960BA8
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDQXxWr29KCZ for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 20:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A29A160B11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A29A160B11
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A29A160B11
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:17:06 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-824af5e5c81so178144b3a.0
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 12:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772050626; x=1772655426;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=USOwJpaEbmkvgRkw7+HaFoxX3L7uN3RmQI/2DuAp8ys=;
 b=tsXS0mDmbhWtEdfIWzdnjvaf/+gDzkW/lk0C0xbTKvq2z8NNFQs85xbPTbS8fMst9g
 UDZxvv6gSdfXDGGxR+Z9jdBrbB9guyxqCCWCoazTGRO2VSlrVrVi92jDlAqTVYDktaJL
 qCqLX9Z/GqflDqni65V1iFvvV62rPJfhKgL5rLM+ga0j1E3xI/b6eZQRaDhxcJGC+PMR
 TxyqdW2X0Ga5ZiInIkxpdrPWTPqaF6mxauxB6/CbkOwsWHAETA995Oum+mm51cPl1iYe
 80KeB3mT4oJVsSUdfjgxSJN/YYSV58mIkrORbjrT+0OpRzMBfssRAwLy4StqfWPC0C9e
 r9CA==
X-Gm-Message-State: AOJu0YyTW6JyBXJkiaHgadUrk384dG9enaaTA2+ACSu1uYCC7wLHImzn
 XWfv35Gd+0JxXLfN9d9LLM0X0FvH7YjPRtRj37aRifJ8Mvlgp4JV4jULsin94IouIe0=
X-Gm-Gg: ATEYQzwLfzx0DGFl1GOmBKclZ6zIRt/cfGG3V6R3gQvH21kkchrrIf9iMyeiCmE1+6y
 xqF51bpbux8ZIE0PM8Bc7S2+rRKM3XM8nmY+/lLoJyTkVuULnJTBw50OhczKp6d0fY3Yl4s64Ho
 dBIib6xKEwo3i4M/+RT28mTdzSjoCNyiASbyfbNopEz/ArohEbnnukOSiwh2NR5fZb4YmbyTt7Y
 LpX30lNKCS5PcfF9+4sqtjq6OMVz8d3VTRkctbDEU8Jq0F+NdaIvNQZq0znAWXUo6mmB6oXWlAz
 ZucilSyv6+5pE+xEB4nC1GiEVod7cPFa7n6NLfsgGQuUM/6M39GUhTMcAt5UXlyJoXJrNyASCmz
 pbFwhQoPdBXLJnoiWdTbnMjBMHgODyyTwldo0Somk5G98gAXCzus0a7xG6tpbZO9XWq6jtI6OwX
 8kYiVwhX0zEha6AkMrAKEG
X-Received: by 2002:a05:6a20:94c9:b0:394:f4fd:b744 with SMTP id
 adf61e73a8af0-39545f8d7a9mr15856474637.36.1772050625728; 
 Wed, 25 Feb 2026 12:17:05 -0800 (PST)
Received: from wash-8.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70b71839e1sm14232894a12.7.2026.02.25.12.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 12:17:05 -0800 (PST)
From: Joseph Kogut <joseph@anodize.com>
Date: Wed, 25 Feb 2026 12:16:52 -0800
MIME-Version: 1.0
Message-Id: <20260225-mesa3d-panfrost-v1-1-46dd7621ac79@anodize.com>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Bernd Kuhls <bernd@kuhls.net>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772050624; l=3701;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=OznsRjBHrytkYW7GuGxa2FyPQBIJXd92+Rqi4DCZQLY=;
 b=q8PlFDUJJu9TYcyt4WPtLhdhgJ4yXZTx9Ec3kxbiwgFxzJMRloG1I35gGEnDIZizn9R6IrY/y
 eD1QJqsPNlSDS8lAYRN2KJTHy5S264+04OICKbNlo3Cip0uNkcnhhT/
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1772050626; x=1772655426; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=USOwJpaEbmkvgRkw7+HaFoxX3L7uN3RmQI/2DuAp8ys=;
 b=VT9+R/vINn+HnCGpNl2DGKV34IlpDpVwjZ1QLHFUuKmolfJVOFLfMt75zn5r1YYVHA
 Uxr15Uv1XsSEHOYoVn+CibUE7pVrbDu3TNWDGMc+lfDa3hrjIFqOrXG+QK0YakYIG9V4
 BmnZaE3XKVB0xQbWTMfYfeLi+YLWjMs7gpP67f8ks5iS2Hky047D11i1/vr+YIg5Hotb
 U/JWGNgzwd81J+D05yC6wzXOctWZ1KbpFuAjTV56lYOUwlMUix8tG4zie2XlKrwTY0lo
 Ay7kIQWo65s4zdhVIWtXnHCeG7NQe8iIe1uzTT8znUOGWXPcbklXzO3IyCFWjwz4LYPV
 sl7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=VT9+R/vI
Subject: [Buildroot] [PATCH RESEND] package/mesa3d: add panfrost vulkan
 driver config
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
This patch adds a config to mesa3d to enable the panfrost vulkan driver,
which Collabora [0] has reported on as being vulkan 1.1 conformant, and
recently advertising support for vulkan 1.4, without full conformance.

Note this patch is sent from my work email. I've cc'ed my personal
email, which I monitor more closely, and I've made numerous previous
buildroot contributions from.

[0] https://www.collabora.com/news-and-blog/news-and-events/panvk-now-supports-vulkan-1.4.html
---
 package/mesa3d/Config.in | 14 ++++++++++++++
 package/mesa3d/mesa3d.mk |  6 ++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e1faea95d5..b5e30a0f7d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -59,6 +59,7 @@ menuconfig BR2_PACKAGE_MESA3D_OPENCL
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST || \
 		(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
 		 BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER)
 	select BR2_PACKAGE_LLVM_RTTI
@@ -365,6 +366,19 @@ comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST
+	bool "Vulkan panfrost driver"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_LLVM_RTTI if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan panfrost driver.
+
+comment "panfrost vulkan needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
 	bool "Vulkan swrast driver"
 	depends on BR2_PACKAGE_MESA3D_LLVM
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 42693ce928..027ddf5133 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -131,6 +131,8 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST) += panfrost
+HOST_MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST) += panfrost
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST) += swrast
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO) += virtio
 
@@ -284,7 +286,7 @@ else
 MESA3D_CONF_OPTS += -Dglvnd=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
+ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST)$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST),)
 HOST_MESA3D_TOOLS += panfrost
 endif
 
@@ -315,7 +317,7 @@ HOST_MESA3D_DEPENDENCIES = \
 	host-python-pyyaml \
 	host-spirv-tools
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
+ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST)$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST),)
 HOST_MESA3D_INSTALL_PANFROST_COMPILE = \
 	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/panfrost/clc/panfrost_compile $(HOST_DIR)/bin/panfrost_compile
 endif

---
base-commit: 664daf6459fd0a867948ac78da3037386a2f5233
change-id: 20260225-mesa3d-panfrost-d981d5c49774

Best regards,
-- 
Joseph Kogut <joseph@anodize.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
