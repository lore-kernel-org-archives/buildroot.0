Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B84DCD343F
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 02:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5152842088;
	Sat, 16 May 2026 02:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRh-mBk4aTsO; Sat, 16 May 2026 02:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E67F42097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778897016;
	bh=EZ3TBfglZlDRxOIbeg+7+I67p4yztFnqgE/skDGC164=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hkbFYvVxetQD38vA5ElbQ9/MAj4dmyTR5vs4iToO6+Z3gOHvZox5XAIBjtC0EMqeO
	 aCdza55PGpoTFrYQNsvnYTNaIdzNJ7tA5shrv7g6q5saSHMVbwKiajYpSTznM6ILW2
	 olTVEPgMnUQilOYEHlidjNsNl66gZBryRBfrV82uzPE7dW2N+gcWk0PFfDa15qToP0
	 AhzBnh/oBzGq/W0OsQj1EntP9NUaTrPw/pr8NihD45hFkhS8t9WjFK+3HbKvVIB9nr
	 KL4uCC29GnAN5LLr5Yetq93IfDp3znXlCrWpNbKXfPRz/bpGgF7N5RP/b8CCPCo5XR
	 vQJ2+fO0cWO0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E67F42097;
	Sat, 16 May 2026 02:03:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D545F206
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAF0361B65
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsH2VnffpLsI for <buildroot@buildroot.org>;
 Sat, 16 May 2026 02:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F242B61B5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F242B61B5D
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F242B61B5D
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:32 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2ba0714574fso2675315ad.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 19:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778897012; x=1779501812;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2P9X5Pvg6FHzELmdGLTQnl30Qae+KdwHPQA3JLf48Aw=;
 b=G0MX3PjVi1nVYIuxD2L2TePZAEu15f8k481+N2VBtJq1V7pLv4selXfXAPwxlFOmvw
 ClsRjLf6Oa6rA7eVrVMJ2mGTuNMQ0MWsU61qSRjcf9+IbjpKmCVELA95vX3duJX6BEnt
 ekUy/P9LG0+z7DgvLeErbLn18jXiR7hYXpRUHzI3TJ0DkcxyO7L5uBUnAeskU5t87exz
 VSjHt3/IDmkIFzYPBiRBOAs+IJXA1vitQmrFWcklwbjB1pl0NJaBsSAE3aVfwK8hhpBe
 clfRYxpmhpYnmy6d1Y0Dw5IAVowFzv8kWAVhrTTJ7jTxoCqaOVu/I+JzMTija8lGSFT+
 rCDg==
X-Gm-Message-State: AOJu0YwRYulx1EkIdt+XfFZM9rXkUuDfN8RP3A9tfx6/gGYvMmgY7SkV
 rjrH2v3ELW4y3dcmBhQcr/5XC0H0aKLvCfhXLKEoq+e9thNOTgFqZbMkPrPjZdGkDrA=
X-Gm-Gg: Acq92OG/eXUAVdCEaLOU4wtrSlhoFonuxT2xGYPD2i3ZVZbHqxV0C7KlBA8+XNJ/90z
 DleHCEX/RCpRwWQkHtuoAs6CWHFghSKf07C2Q+EDJE+qApd0pVKjHaLQ4/utSb9+7gNFWkhUgs4
 P5smZEDqAK6yPOXCKFe7xIUJWh5jGgvEXTd2yGkowQ/zdF862fruyan21UYC1pj9B0/JRmUJhR5
 TVLCNgI1Wu0MRvNlJw34apFQ6RxYQJDLIq54UnsyPK6upLYUCVIrIqnC9dMJH74Dj9rTG5njm3H
 I/QRW6ScNd/nTQMosZ97fjWfX3QvRtNCThTQQU4HeqAXkOF3p7l8qdnwClIKqNJ2NZk+5xx95hq
 DvuTgWHqmCQcnS+dgOo8LNZ4YmpGOYmkpZtdcBGb0yQ7eTFRODNzTougF+y+csjY7IIspKXQTrn
 klBwMO7qrRita8FUbdWe1NMqE9
X-Received: by 2002:a17:902:fc84:b0:2b2:eb9d:1648 with SMTP id
 d9443c01a7336-2bd7e9a02e3mr67218195ad.37.1778897012241; 
 Fri, 15 May 2026 19:03:32 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c16ac4asm68201375ad.33.2026.05.15.19.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 19:03:31 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 19:03:16 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v7-7-1f1814b65ccd@gmail.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
In-Reply-To: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778897001; l=2147;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=WorTG7Cn1mk88oB/qqsExm51CAY8PoiqL55jhFOujcU=;
 b=Mb8RULVgccVeJacBzd2lP12wzUFyqCLJ4Z4ndoH9nD5XxHDMbaG4QucUQFAMOs4zKINVhXLJ1
 ROxC0AQ1xPABuVoZtqMsiKxJMcgfuVvw8ywiDVKn9CoqqwKgrt/dllC
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778897012; x=1779501812; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2P9X5Pvg6FHzELmdGLTQnl30Qae+KdwHPQA3JLf48Aw=;
 b=jw9ORKR1hYclBKdfTYmZa/c013JG/JMmrQOVFsGuByTkMT9NRZQrRXaLMt4nm0ZeJg
 m/3/2tXep4T1GoP2W63y0WVr3b+3C9N0UqeEQ95NAx3c7DLOZI3eTJFUiR843cmuBUGY
 CoRwYtJQ2W5fhzgI+kT67xhX1Fq6oMqkHWB9I8qsZ4hgey6kI25Uvoh8Igzfb331FiRK
 0b1DQMyfJ+ZlaqmSI4nm5o+hzeg6cF8GHdByQeDlwnPEWOhX5AkB95TsTn/KZsuZMU/9
 1CoOouID2Bc48WELjfzMrDanZI3nkHx7QE0Z1UnfJUj060x7wYl+Zxj5amsovoAYkU6U
 +9Mw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jw9ORKR1
Subject: [Buildroot] [PATCH v7 7/8] package/qemu: add virglrenderer
 integration
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

Add optional virglrenderer integration, along with enabling OpenGL when
necessary.

https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 21 +++++++++++++++++++++
 package/qemu/qemu.mk   |  7 +++++++
 2 files changed, 28 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index d4e4e37a3e..dbae7c4de4 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -126,6 +126,27 @@ config BR2_PACKAGE_QEMU_OPENGL
 comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
 	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 
+config BR2_PACKAGE_QEMU_VIRGLRENDERER
+	bool "Enable virglrenderer"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_QEMU_OPENGL
+	select BR2_PACKAGE_VIRGLRENDERER
+	help
+	  Say 'y' to enable qemu support for virglrenderer.
+	  virglrenderer backends such as virgl, venus, or DRM native
+	  context are configured under the virglrenderer package.
+
+	  Run qemu with `-device virtio-gpu-gl`
+
+	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
+
+comment "virglrenderer needs OpenGL accelerated display frontend support"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
+comment "virglrenderer needs virgl, venus, or a DRM backend for guest acceleration"
+	depends on BR2_PACKAGE_QEMU_VIRGLRENDERER
+	depends on !BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index aff1762fb9..4f4786532c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -279,6 +279,13 @@ else
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
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
