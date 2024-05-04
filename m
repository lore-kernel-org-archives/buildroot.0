Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD01DC4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97BCA4173E;
	Sat,  4 May 2024 21:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_qDCpDv66V4; Sat,  4 May 2024 21:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08CD941EC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08CD941EC7;
	Sat,  4 May 2024 21:41:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDA1F1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5B7682CE4
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MP9oDXa8g179 for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBF0982CC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBF0982CC7
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBF0982CC7
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:37 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41b79450f8cso5012035e9.3
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858836; x=1715463636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PxHt0yexWTS7aCgX7I+XtDun3DuhYLlsv7SsSxBGvHQ=;
 b=KpAgoj8SS1UEh1sgBdycLIrj5uyUqchOf6HEsDxTV52tewT/dIukT5rGL1Na7XVOPv
 2ZQuxLq3lQKxIItxaVT3KoEKT5OR0c+gS32eCM8L89lYuIxbT5yWrfxpR7xKSkSQuUBZ
 wjJAjXHr1w838ZkvrMV8Urp/NfZvdTdFth7h5IdFt3RxAijv8e7BfiFPhGqbh69RmlZC
 wUXKwi8uZxNJ3Jjj45cgpRu5zlTdv8HWLKkTy91Fza4aDJBqK0bbyxrWe3gLe39h0IAC
 kcAYg9Y0XMkEsslubh5btIHx/YdTuuB2oumAXRNIhoPO4DdL5jB+dcYhozHTFSAdb5Wd
 JhVA==
X-Gm-Message-State: AOJu0Yzv23cQaotsSSCfnuaMBxflMyHI7jMJj9mx/q4/1CEA7XaDv3ok
 O41rws28kQi8addjPTgBYu9nbNbhNA5GG2sA6KmVIvw9oJKJ421sMEZ+Ig==
X-Google-Smtp-Source: AGHT+IHxXDIB32NXcPtmiBHNqfbATKDKyunjr+LM3TIi44wF4LbgIjdnnsH7+QVE/BgT6V3yXP/R4w==
X-Received: by 2002:a05:600c:4e56:b0:41b:163:1e6a with SMTP id
 e22-20020a05600c4e5600b0041b01631e6amr4498376wmq.10.1714858836066; 
 Sat, 04 May 2024 14:40:36 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:35 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:20 +0200
Message-ID: <56181e6f013cf1b94c6fac914aa499670ebfac6c.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858836; x=1715463636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PxHt0yexWTS7aCgX7I+XtDun3DuhYLlsv7SsSxBGvHQ=;
 b=Zc5RAVr+3EfU1xeUeA6YvjwzmiqzwRbff9A9VDBwFsq9n6uRcXZF2WAsvcv7cxh3HH
 WUl5L16goaWU+J00Yh0lmYneJNJNV4SRvoeTGRrqF4svwvl2p92TYo1iWVbWBiI5JJHt
 vzj1j/UVuKW4aJSN1+xzC3M091suHXmV/OP3bWzgC9jrrAZlr7i2nQLQxyfFbdaVIVCf
 cQiFINwukIYKx8gUAnkjyBdl2NCXogw/O2mgrxTMP1W/D+XcHgRdk5rPWkbjgWeAGPFN
 rwpUWcNu/Ib7l3K+0wd/9fp4kycuJY8c3GSowWma+HOscT2tAhz6ue9hgqTUvG/Ni93Z
 KRkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zc5RAVr+
Subject: [Buildroot] [PATCH 19/22 v3] board: update hashes for generated
 achives
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/radxa/rock5b/patches/linux/linux.hash        | 2 +-
 board/toradex/apalis-imx6/patches/linux/linux.hash | 2 +-
 board/toradex/apalis-imx6/patches/uboot/uboot.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
index 18074c0aee..7cf26c66d2 100644
--- a/board/radxa/rock5b/patches/linux/linux.hash
+++ b/board/radxa/rock5b/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  255961f7ea8ea82c42f19be049f94a690f9cb171fe8562ea87868ac5cabc3eb9  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-git3.tar.gz
+sha256  41c0ee93d8751e4bdb85fae24b3e84fc6904a6755c485244eff2e6f8ca38a0c7  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-git4.tar.gz
diff --git a/board/toradex/apalis-imx6/patches/linux/linux.hash b/board/toradex/apalis-imx6/patches/linux/linux.hash
index 277abc20aa..0697228724 100644
--- a/board/toradex/apalis-imx6/patches/linux/linux.hash
+++ b/board/toradex/apalis-imx6/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  41551a4f44bdfe18f68bedc0fd9c644d8657d2ee63215cc348a708cfd5b7e6f2  linux-d899927728beca8357a5b4120b690cb3c1d80844-git3.tar.gz
+sha256  722ece80ee8dbcc04309c89139da8b1df6974e1ab4bb66d04c1906a576fa46fa  linux-d899927728beca8357a5b4120b690cb3c1d80844-git4.tar.gz
diff --git a/board/toradex/apalis-imx6/patches/uboot/uboot.hash b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
index d451219cb4..6132435fed 100644
--- a/board/toradex/apalis-imx6/patches/uboot/uboot.hash
+++ b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2fa23d10559c17362ef92e5d7e636b388e9af3784c9b03e86c702a71df100f36  uboot-30a1208727729dae22cb42f9ba9ba17efe5e6f77-git3.tar.gz
+sha256  f8d3e45d7944c9620ecacbd8f8824db42134c70e3b55efd6dab127bf763e48c2  uboot-30a1208727729dae22cb42f9ba9ba17efe5e6f77-git4.tar.gz
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
