Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E83C27C78
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 826ED60A8B;
	Tue, 11 Jun 2024 18:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbMzyqmwKep0; Tue, 11 Jun 2024 18:00:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1E2960875
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E2960875;
	Tue, 11 Jun 2024 18:00:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF4021BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A93360A3A
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocKBfG1nAzJe for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44E5B60885
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44E5B60885
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44E5B60885
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:44 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-704261a1f67so1498997b3a.3
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128843; x=1718733643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qdgCHW1AOQ1zHuN9vmXou8z2QixOs8qIFe2V/dhd30=;
 b=Klp8zW6TlEKpUIKO71slyUi3cmC/FGY3isZkNKxaQ6zQhMzOx9g6cZQYfjC2XA7jfY
 d6OJoNaZfLn8uqFnr5KSf9WzT3ijda9We2jRSrKgdRrRR4MykQNlrlj2xv23Eix+ZRzX
 zJ7BkQO3o2J7oZ/B9qB0dmpMK2iOo7fLq31N1LGzMZdW7ytJFSKgo5rz0nz0x7qjR0pk
 WXNJn1sA4QIVWuIsXg+GgaZitzb0Q9eBuzWFsmqKjkds2VjLBQloKe3AJedOaJ6gA4af
 eysUpLXkJIuLddkMK34swNjzUYPgt1IOxMUh5FaXOfqGqZDRtbt64HOUkV8F6+seLSIQ
 dG7A==
X-Gm-Message-State: AOJu0YxKap/fZPR7zV7n1rf/RdsNuCZqwp2QzYTtQXnOOZQ/zWJjiplE
 nF6gpd/FPya5ZGwcLYo/Vk3sLxFwNrPBKQ4K0O/wZ69SJpaK5rhANMQvtzau
X-Google-Smtp-Source: AGHT+IFaB0dWrpkqTBPMT7ZufuzrtKc+k+Y9r5aKIEvGSaKkHA5uALa7DySNmVgb9SgxJKuxuYAcnQ==
X-Received: by 2002:a05:6a00:cc5:b0:705:964e:d9f3 with SMTP id
 d2e1a72fcca58-705964ee540mr7317206b3a.11.1718128843339; 
 Tue, 11 Jun 2024 11:00:43 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:42 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 10:59:58 -0700
Message-ID: <20240611180007.2127244-4-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128843; x=1718733643; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qdgCHW1AOQ1zHuN9vmXou8z2QixOs8qIFe2V/dhd30=;
 b=VCEy9n8NEsLcYZ3AoBr0L+ngldKchPcbXzkEB25jNkouFPhM791QOPHDXBhIVf+BIW
 SafNoWbQk7yfAxEMbvwB6QC24CX1UCuUqRnCEB4U9yrHfK/7mdkYz/ToZV0KwIyHwvRJ
 64XdvbJyjBDE7jAH3CWdoWRu+BErmEc+G3/26gynLLrD0i+I/1ueM15PbCzp5E+nGoAi
 yXWxeFM4pScF+RoPbvDGzD0gzFQcVuFw+t+MhYqiBbqln3PEQybfZ5z37SeDFFVSSTzo
 RNzgshvaggaPSFIQGHwpr5QveBj9OT+tYrVy72x19FaOlGaZpVj9qkquwUz4lVwgJUp2
 GAEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VCEy9n8N
Subject: [Buildroot] [PATCH 03/12] package/freescale-imx/imx-gpu-g2d: bump
 to version 6.4.11.p2.2
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- To match NXP 6.1.55-2.2.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v49.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 580b31e453..d15287ebc7 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1ed29a4818161198b658ffc428dff7c154c38f5ba48d7358ed9b0be261d72b99  imx-gpu-g2d-6.4.11.p1.2-arm.bin
-sha256  cdf096c9b15c773ad600b24ec8888c1c4a33711c195c655e9411d4b66a992c25  imx-gpu-g2d-6.4.11.p1.2-aarch64.bin
-sha256  913ba38d4be97361c3d0fa9bf2f6dbe7b1c0c41213dd268fb6738db9704dbe32  COPYING
-sha256  4fd8bb45a2ec22117d20cfea84370e2a3a2cd99e8e177138bed0938137b1aeb3  EULA
+sha256  bc168b19096a997251e7137f82ffcff404c61709cf5f227c53a099f631569f76  imx-gpu-g2d-6.4.11.p2.2-arm-fd0148d.bin
+sha256  1cedc606be965b01300613ccea81b4fd589d940306bb1caa30a37c41928616ec  imx-gpu-g2d-6.4.11.p2.2-aarch64-fd0148d.bin
+sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84  COPYING
+sha256  3282d88fad766897f93b0827297a70c2707d9358db24cccd5777abf7c997da77  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 87fe08ebe3..51a49b6972 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.11.p1.2-aarch64
+IMX_GPU_G2D_VERSION = 6.4.11.p2.2-aarch64-fd0148d
 else
-IMX_GPU_G2D_VERSION = 6.4.11.p1.2-arm
+IMX_GPU_G2D_VERSION = 6.4.11.p2.2-arm-fd0148d
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
