Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6687E1077612
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28D2A41776;
	Wed, 18 Mar 2026 20:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7gp2wLD-NYe; Wed, 18 Mar 2026 20:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39AD04177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773866316;
	bh=g6QE3eQTAr/WOEosLOXmtN/JsLY5ZczFHuADSG5/In8=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GBt6tBG4Lk7TUGTCSx0j4NYM+CoTAwPqs1+GO3bIiPgKNRL5GASEcbbCMRBJc40av
	 PCGabm+LJksgB3lVNuXLfRer3ZUiqoQhNHHiLPt467dYZlDzX6usqlhuZjFIkDTfZB
	 k5l3q5XxuvP8t/MMgChJ5ZVibrizx/KoMp+SUM97kEz6EwruPG9wRdIJRcaKQJBj+S
	 vjge3PHwqbWe9b4JtqrH1XNruBYDN5jRZKtFYUqjDWnkZQFQqXm7byyiNKQpAdz41M
	 J6mRTEwe58+WnwmZ5bKAncMc6G08bE1nuBX4AvV5ycWXOxdd9Us2GYojY85NK2I4Sg
	 xu7JBKSJ//D4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39AD04177F;
	Wed, 18 Mar 2026 20:38:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 160ED1BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B64940B8F
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHL1r02G2qZu for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E77C40A64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E77C40A64
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E77C40A64
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:29 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-82985f42664so243614b3a.0
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 13:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773866308; x=1774471108;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PniJoQt6PFBrGzIThlZRaRv/aNjgoG2T9+nM0GuteQo=;
 b=O7IU+oTMj/C9B2alHyqeQOhVWV0gxLEUBmyP0RHNDnukFJJohojqlGpeO8qYcBgKsp
 0KcdPBkTym6Z6UcG2YX1DxC8z1jVksEKb7K9VKksd77Q7EILw1Ln/ioQ07xSNoDXfpf/
 uro9G+8PRQFTqrYydcazF2fexF3GQf8VnrpFDHkLiPo2Q63hJ293I5WZRQ/i1OrOMz0o
 Db5CfSirRMVbwi1lLvbn6sZiZ4EsIQD2hQ/HB0RS38uWZJXj4XQp5pWua4//E8tbo69z
 l8jSfmPQ/me70xFwZNVSAb2blEVYTa+fDkalQAzcyEnfy3V8wdoba9i/EKjWj2Y0weYq
 LdOg==
X-Gm-Message-State: AOJu0YyyDb6YMRqCyvcbk6axeu89Lz9m0KIYKcbxbuJvn2MWZiNV0aWB
 WTKqvSkiWEApm8JcPuNdpAOgbE1YT7zXPdkXn4rTCJzmKidvEWedxbBp
X-Gm-Gg: ATEYQzzvzp/Yov9zhKN2UDx2PPuApk7ZSFCh0Qd2KaKuw/5pqi6yIfWEg8khgzw6GUi
 MZq6zzFwZkDMQ3Nxwqd2GFyE1EIUKlcnaftP1YpqPVtjfcsbXwd2XqIKOz7Cy1e15bEqIvNtyG3
 VKTUzMpNGMfyLsxPOz4hqFFsSpgax78alFw4S6z/GWaFiXKD5/jdYvVRoCpBnxi0d+SFrkZ784j
 nIoECR5jmkMGZhryG1seTGW4hPJEXc9rlNf9Ux+396FmBA0GGsX9VYDSRZkzZ93ASptxap8+fBy
 6gtmJjgPDIXmX6RfFQeP569Yw21adQmWF6E5dBnkO2SIo6oyoKw3e9OS6+slXuDxCPxzf7kRkIM
 v6TgOTDTRghD6bhIzoke+0whSosrCZJ+udvino76TcZBNuXN5W0fSDLu+PhA2DpSvqk39Gm3nW7
 61GboBXnuFLyCJPXt91iunHH2Yfwt6Cq+hMsFftA==
X-Received: by 2002:a05:6a00:32c7:b0:7f7:2f82:9904 with SMTP id
 d2e1a72fcca58-82a6ac92691mr4427612b3a.5.1773866308485; 
 Wed, 18 Mar 2026 13:38:28 -0700 (PDT)
Received: from wash-13.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a6b56ac50sm4636143b3a.16.2026.03.18.13.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 13:38:28 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 18 Mar 2026 13:38:01 -0700
MIME-Version: 1.0
Message-Id: <20260318-virglrenderer-v5-5-09a3274852d6@gmail.com>
References: <20260318-virglrenderer-v5-0-09a3274852d6@gmail.com>
In-Reply-To: <20260318-virglrenderer-v5-0-09a3274852d6@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773866304; l=1963;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=oXrfJJrLQt38G4PEoQkXW3ciA3iL7STlKnB2vQP4Tsk=;
 b=2SQH7tmR8GrkkGWnL63fLwH3RN0emD6kb5qpeRn22mRCqnuz/0TeadHEMSGz3UAOC0tAZpUVo
 juBGhdqS/cCC3O+GTUuk3fNdcW/4MdkGhWjXZOWZbgW6YCrUpFPIvs1
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773866308; x=1774471108; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PniJoQt6PFBrGzIThlZRaRv/aNjgoG2T9+nM0GuteQo=;
 b=nA1v27HJOniAKBoA6grMCksqfDfZaKcqQk7ecqzqx8O5p+8NqvqgSvQoRUcnPpQW0h
 0vUJmbTg0Ao1HvgJ7pYi741eTitpSH+V13yf1E0fVO3N2HR1migAUZ+cWON9NrsMYU1O
 tDR0BzP9MT6Y5YE/JV6xBqClQnOM7eXIlshPa+wgRXj7MrJ9Oh7w+/naCUL8m6XSLAic
 kL9MEv9gc3yKBxfVP1GKPbFZOZXcQcgtuaDr0OLDQMDunXxhWQazEBuevXzQdGypLMrD
 fXx7XjF/eDuh+OGVY9yhz8+0MKxdJlQ8u5hDX1XniDCH/+isOhKGkRz1ovqr5EL1moe6
 jlFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nA1v27HJ
Subject: [Buildroot] [PATCH v5 5/5] package/qemu: add virglrenderer support
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

Add optional virglrenderer support, along with enabling OpenGL when
necessary.

https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 17 +++++++++++++++++
 package/qemu/qemu.mk   |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e4e8eb3b63..599bcb11bb 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -130,6 +130,23 @@ config BR2_PACKAGE_QEMU_OPENGL
 comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
 	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 
+config BR2_PACKAGE_QEMU_VIRGLRENDERER
+	bool "Enable virglrenderer"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_QEMU_OPENGL
+	select BR2_PACKAGE_VIRGLRENDERER
+	help
+	  Say 'y' to enable virglrenderer, enabling GL and Vulkan
+	  passthrough from the host to the guest through virtio-gpu.
+	  This enables the guest to have accelerated GL and/or Vulkan.
+
+	  Run qemu with `-device virtio-gpu-gl`
+
+	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
+
+comment "virglrenderer needs OpenGL accelerated display frontend support"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9b780797fa..e250128dfa 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -281,6 +281,13 @@ else
 QEMU_OPTS += --disable-opengl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_VIRGLRENDERER),y)
+QEMU_OPTS += --enable-virglrenderer
+QEMU_DEPENDENCIES += virglrenderer
+else
+QEMU_OPTS += --disable-virglrenderer
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
