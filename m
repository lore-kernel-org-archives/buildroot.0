Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C88BCD4F41
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 21:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7E640377;
	Thu, 14 May 2026 21:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSrwSL7znjxk; Thu, 14 May 2026 21:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12376403DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778795040;
	bh=nbc3cAk5eVjeoTQqiLjkNSpDcABXFgEnszyucnJpZyA=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mhOHph2z2QwB8Bmh8Z1rs2dxEDjciIPYGleWJiafflbCHClOgt/cXbXesnitB8ow0
	 B8pLhELcJAM9jaPbFNiPBGknDlpU5xWG4nHUcpov0gYGH2JjwZZ5XeC7nmRXSyys0c
	 VdSpcR8/3loRdoRssYHAf1dkSa8JnDBJSi+edMVwr9aW+PmrRdeBnhRIXCdWJghwbl
	 02A+nzEqzTn189LwRinCIakAo/VCm0tU/YISXaYU3UyRc/o+SMJ3OTJ+DixxuQgwQz
	 nYs08L30H8DH+6J9uwo2Pca3CWAuGHdXaPvfLwqZkIV6wdSUQTwfr+bI6YrHn5hBWh
	 vI/grTuiG+Xyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12376403DE;
	Thu, 14 May 2026 21:44:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D85D36F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A599560FD7
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9X4rT5DRiNo3 for <buildroot@buildroot.org>;
 Thu, 14 May 2026 21:43:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 103FC60FDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 103FC60FDA
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 103FC60FDA
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:55 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2baef9f5ecdso55455145ad.1
 for <buildroot@buildroot.org>; Thu, 14 May 2026 14:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778795035; x=1779399835;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ec5Iyw7LZ84Yd1sXAWhuGePm4+j/VBpqjXugHM6upOI=;
 b=HQoQLAf7odrX/DFDH/mhOVnX1njGLph6gO/ruBbV3n4NbR37yX5TS9RYwzjUZzu8d7
 W882r2pGQKpnKKOxDzTZ+S86Xh54e2M7wpcOipIqFwzhf+ybCjG+g/WPAKoZhlhCxj31
 XZHP0dS3GMtNEaY69FfbXVn6n7t+b2eOJU0GNec9xtaZTPPh+Y2vdgPRmGnm0vJagvRU
 eJxeUrI5WPXdWmbNqPqeq1/JaPUwSHEr7pxAr1qgb2YvwXnQN8q726I92Evf2uzZnPJa
 b1DkLO5xH6G9St9BDLyDG1iNJFxUa1wlVgOkTmH4sa5omMlQRjDJAgffCuyT83qhAfp8
 xxeg==
X-Gm-Message-State: AOJu0YxGZMuz+VwGtJijLvDz4vINKkpXqGDy6SB2J7lYiSZAMYGuIug6
 i9suRxU0J3+JX92UKpdkgmrYPkSOXOSIlEUB461BTKWfQLSECp5m2vX5qMXarJwXt/Q=
X-Gm-Gg: Acq92OGj2vAG/WTjJaduJfRER0+Fhipxrb9L1hrnIqCTprO11HT6m+/7XVl3wx5x6tM
 SttFfq/ac6yKylvhY99zpWo7k8P1ez7tVdZwukZhcoEEyXacmYLBUOXveRLTVCXsJP/CDZlWq1v
 0lQZEfmVrIORlEBZ4pzVLo6m9OR3SKv/ywYzQrdGQPq4K00ccwq7Dt2Q2AtYCdSrTYV5Dk9FXUb
 QtswI8EcMD1YKrFpjK5W4NuzVKVMvLyX1QPuTjpq59XkFzLYJ6tTFFdnNos6/odRA1hNtSba29w
 FSmzBcKOgwplXNjWfOGYjePjw8tERrWu7Ks/VxYnCrxkbMmDeYcvxTdfqgCcPtCgrcM6v4fw0va
 zlSD+HbxohG5KdI3o+njCSpERcLesvZtgYXDG0uJyLdy/8fEDySloExt4cPnvud8ld2YDoNNWY0
 3wVcoR4xutyd0wQeEdoS8=
X-Received: by 2002:a17:903:983:b0:2bd:8395:fed8 with SMTP id
 d9443c01a7336-2bd83960609mr4910705ad.27.1778795035240; 
 Thu, 14 May 2026 14:43:55 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c05f287sm49907305ad.24.2026.05.14.14.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 14:43:54 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Thu, 14 May 2026 14:43:38 -0700
MIME-Version: 1.0
Message-Id: <20260514-mesa3d-amdgpu-virtio-v3-2-dd75eca7fa50@anodize.com>
References: <20260514-mesa3d-amdgpu-virtio-v3-0-dd75eca7fa50@anodize.com>
In-Reply-To: <20260514-mesa3d-amdgpu-virtio-v3-0-dd75eca7fa50@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778795031; l=2169;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=rEXKjN+5qpTYLcgZbBztW6gU/7+VmR5jXQCpCJZ3obI=;
 b=T+WIT1SLHV8HpyxSv9A5Lf/3FiEUSAjoVqkZOcsbOKTOkfp2G01u+4JEj8F6R/6BtfVj/e3or
 +XpgrjFVcAcC3kqFfqqNb8V5cBa/8S5VtHe2F7wd7hhqbp0Job9QKIA
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778795035; x=1779399835; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ec5Iyw7LZ84Yd1sXAWhuGePm4+j/VBpqjXugHM6upOI=;
 b=UY7V3HT2CDZvsxCCjEjyOoAfQG5+wYb4ZqP2aeeJrqvc9/eQ+uF/zUawe5dd+pn3BX
 nYwRF0Frqjf4eIYLWWrqoUPseCm/o6JmHeXO83p23KG0Xh+oQVwa6XW8KWigNuUakzjL
 AchZscrTuWF0TFrumMtHJsgsmbIFmsz8LNKCXFL2XoUR2nb1J5meLT8NCOo5miqNS2oZ
 y0vRc0GNkkUdlI5XlAcGX/Ck88wG0to7v3xqo9iF72hUOtwjVtHC3nomJMqb1TL2jtRA
 H0oUSvNp+hutsU0ogA2E85Prwgh1oOrPEJjLd2PRhZpPoLFStOc0GmnH+1NPbmGc8rqt
 i5CQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=anodize.com header.i=@anodize.com
 header.a=rsa-sha256 header.s=google header.b=UY7V3HT2
Subject: [Buildroot] [PATCH v3 2/4] package/mesa3d: add freedreno-virtio
 config
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

Add a config for enabling the freedreno virtio KMD backend, in the same
pattern as amdgpu-virtio.

Signed-off-by: Joseph Kogut <joseph@anodize.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/Config.in | 11 +++++++++++
 package/mesa3d/mesa3d.mk | 10 ++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 633f9eec1f..82ef991595 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -150,6 +150,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	# the toolchain having sync4 primitives, which is always a given
 	# for arm/aarch64.
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_FREEDRENO
 	help
 	  Mesa driver for Freedreno GPUs.
@@ -428,6 +429,16 @@ config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU
 	  Select this when running Mesa inside a virtual machine
 	  with virtio-gpu host native context support.
 
+config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO
+	bool "freedreno-virtio"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	help
+	  Enable VirtIO support for freedreno native contexts
+	  used by the freedreno driver.
+
+	  Select this when running Mesa inside a virtual machine
+	  with virtio-gpu host native context support.
+
 config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	bool
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 34597966af..d9916ca359 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -157,6 +157,16 @@ else
 MESA3D_CONF_OPTS += -Damdgpu-virtio=false
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
+MESA3D_FREEDRENO_KMDS = msm
+ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO),y)
+MESA3D_FREEDRENO_KMDS += virtio
+endif
+
+MESA3D_CONF_OPTS += \
+	-Dfreedreno-kmds=$(subst $(space),$(comma),$(MESA3D_FREEDRENO_KMDS))
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
 MESA3D_DEPENDENCIES += host-python-ply
 endif

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
