Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA96FC3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6735843A8;
	Mon, 15 Jan 2024 21:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6735843A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dx3E8EbmCf0; Mon, 15 Jan 2024 21:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECC8A83DE5;
	Mon, 15 Jan 2024 21:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECC8A83DE5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9919B1BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F6E9614D1
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F6E9614D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ux-_PCEpTRBg for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:41:48 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66C0E6147A
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66C0E6147A
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso21000015e9.3
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 13:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705354906; x=1705959706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VbanFeW/ynn6CmJLASfxdB8NyY6o/lyyTLTOPmuXLAU=;
 b=CkAGU+MLSjQ0PDuTgwTV2XWdS8ZcD2Dcmea6JBZaPsUGl0p3F0mESwCbPISHEu4w+3
 JKqOTKNBURStV0WpNNUGw2HhbDAmlTwCL0t29HHUYT11v2TiTtKtl39XweBvofaXq0gi
 ohvWD6LyutAq9Y59YtQjgucUElu3EgLFMtK9hcyv5c/2E4FqEZWXKXi5wGwi39a0r9Eo
 Xvh4b/Ldci2YDtd6AvrLOOQMgyAR+jBmjRaV5fgTmcVjmWWm9c/iP1AyBr39Vu8+mNyr
 zz1x4AF4aoidjMvZJd7nikND9Unj6MrL9Y7eJP7vwW9SZ0ydCcKbORSRHD8vtVr0EtTh
 4nkQ==
X-Gm-Message-State: AOJu0Yx3hjaoBeQHd81ZAkIODc+YyXh2TlP1vYA+vlbnaOxCGRxecT4b
 bNPFWE3n0oK6ALAyjrMYMnP6PVUfPzU=
X-Google-Smtp-Source: AGHT+IFWwGoi6rPy90h6IJK3UUk/9Y3+EVUTa/KT0VhIDk7TnTL15ow7eTie1g/m/XN3juXVmnCQ8g==
X-Received: by 2002:a05:600c:474c:b0:40e:4cc6:9fe5 with SMTP id
 w12-20020a05600c474c00b0040e4cc69fe5mr2100051wmo.141.1705354906061; 
 Mon, 15 Jan 2024 13:41:46 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 dj15-20020a05640231af00b0055845b1b318sm5927402edb.65.2024.01.15.13.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 13:41:45 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 22:41:37 +0100
Message-ID: <20240115214137.2350453-4-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115214137.2350453-1-petr.vorel@gmail.com>
References: <20240115214137.2350453-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705354906; x=1705959706; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VbanFeW/ynn6CmJLASfxdB8NyY6o/lyyTLTOPmuXLAU=;
 b=csKZNw9pQgZEDZfqCdofPbv5/issUFBlNuNR55CMDtjJ9ttNr6kJEn7IsfbocQvrRn
 qgW9I3H61ItQ58/iDTQv3SB0tpam6BoYlYjJSAnYdq14qEaFh+hSWz/Lz10UxBDv2Bsk
 7qzKxO4nJ7cQhq3rlXJzxni5TgHQI+DiSSITRMN9zZov/2QJ8YxWYBIXvKNxwtzVbJ/e
 YmHPgIF80dYAtwhzwAdlGCY9TuFfYapvSjhpp8umeDmjV0qN7ASL3LK+vhQBJTWtNgBp
 3R1p071VbfSwWarvBsmfRa1K+3h+cKqIAHQ67828/a4pKG12eLVtawan9ZTU93n8mgnl
 y9DA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=csKZNw9p
Subject: [Buildroot] [PATCH 3/3] linux: bump 5.10 CIP kernel versions
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Bernd Kuhls <bernd@kuhls.net>, Petr Vorel <petr.vorel@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump CIP to 5.10.205-cip42, CIP RT to 5.10.201-cip41-rt17.
Use sha256sums.asc from kernel.org.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4528d8eacc..36649d3391 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -32,7 +32,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.162-cip24)"
+	bool "Latest CIP SLTS version (5.10.205-cip42)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  CIP launched in the spring of 2016 to address the needs of
@@ -52,7 +52,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.162-cip24-rt10)"
+	bool "Latest CIP RT SLTS version (5.10.201-cip41-rt17)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
diff --git a/linux/linux.hash b/linux/linux.hash
index efd0dac4cf..6e75e017d3 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -7,9 +7,9 @@ sha256  9025147a09547f28ec8f496c12efc30bd2fc03b2824a668e8636b2ca0ef1fb6e  linux-
 sha256  42d28def2cc1502251edbfeaca3b25ee764ad1e471b6c703ccb2267f38471c43  linux-5.4.267.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  da82425c7410623dfb2405915347ee9617fc0e33a63ca821c33aeed160cddae8  linux-4.19.305.tar.xz
-# Locally computed
-sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
-sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
+# From https://www.kernel.org/pub/linux/kernel/projects/cip/5.10/sha256sums.asc
+sha256  b4734a7a22a30f3c20f9437c366bde0dd584bebe836d1ef622d4c1d7205e6f54  linux-cip-5.10.205-cip42.tar.xz
+sha256  b1dc1779a9b8e05c1b547c2b3f2b19c5829504431f09c1a82e24b98d1395c4a8  linux-cip-5.10.201-cip41-rt17.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
