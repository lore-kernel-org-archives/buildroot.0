Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD013E7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AB4560E53;
	Fri, 10 Jan 2025 19:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFN_FoXdPchE; Fri, 10 Jan 2025 19:54:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B627660E68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B627660E68;
	Fri, 10 Jan 2025 19:54:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 824A9942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 635EC8372B
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKqT5vota7zm for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 19:54:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BBC183131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BBC183131
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BBC183131
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso23891835e9.2
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 11:54:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736538854; x=1737143654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X+ke+jaKba1dtljt1sbrlbwgKUHysjjTD4Gz/9OKlRI=;
 b=KFbcMn+pyPw/ZtxVcayyexxzSaXdQZPLPyhPSkl0KQ92+t3EYPkqVOGPZDTZH2kQ6U
 rxt4+D+T135GKld6kpXxrC8uDHoNKe0qFnBNw1Lfbv7/Buiijzlq9loI+AxUIdSGROsd
 8tZuxQuKjkQ5lWsuoJi7olCc/ZSM4z28i5gexJx5VOu/8+hsc42zoaRj7OoAiBKJTt6A
 REByr2gHFEzBg79skuZ5FTP6G+1yZaBARfGslHLjoRyLihV56mxjRck6Se/v6IKRWyu8
 tc/GTJGVttg+Hat2nvUZaIW+W+uUIu9GiPIRQh85pFocQOG9c2lYcCedZweJd/LrlRNq
 6ZNA==
X-Gm-Message-State: AOJu0Yzn5EG0aRVOEoqCLXD7785u5ikbW/YUZk08GxNhBhn6LZnoBuuY
 y9l4jJI4JSyDDt3ZRtBS7ZkFMdD4+NvsRZbhETcT3pARRx0F86TVblkbpsRqE6QBlyAG3mcFoPV
 r
X-Gm-Gg: ASbGncvVW3U3XtdL0u82LyYpYGqod+aDT3bQZUcoVsbvWgvrbpXMGh/Qff6/w4sRoxm
 yBotk81sUa0d0rrSYnEJ6HVLyTl75Mdb4cGRRq2jLx9MQN26W+GmlLLoueHEtROB9TS8iyj8rOf
 yyGpaD7jX2qy4ra2XI80iVbjXmB2zsHYKjivFVUIY64BPLCFWbHT5xtxqukL1ITa15pUXmuwSZw
 ptKBxF1CUVPRSSo14MIDtbxSPuquGRkTRLdp/yWi8Ng41XDDXIWgtWpQyaKllkWhoLnsI3P/rx0
 NLcPANu5sIwRIbLAmRQgg8Mc+dnJ88AJqZOyabt4A6f4ulZ2AudSnQ==
X-Google-Smtp-Source: AGHT+IFy0TVIk+9G9O/664ntKsHs+S09EZz4riuf64INZfPE7UjiIIEeJAyG+H5Q8R9CLdWGgyiM6w==
X-Received: by 2002:a05:600c:3b02:b0:435:1a2:2633 with SMTP id
 5b1f17b1804b1-436e26cf8a5mr76523605e9.15.1736538853715; 
 Fri, 10 Jan 2025 11:54:13 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm96439635e9.6.2025.01.10.11.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:54:13 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri, 10 Jan 2025 20:53:55 +0100
Message-ID: <20250110195359.3358022-8-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110195359.3358022-1-romain.naour@smile.fr>
References: <20250110195359.3358022-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736538854; x=1737143654; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X+ke+jaKba1dtljt1sbrlbwgKUHysjjTD4Gz/9OKlRI=;
 b=zaJH8jOe7s2M55Jdl08mfi5EyJZJ0V8VTzPH6bOLi1Z0UEDV6q894R6+HNghJPLTd5
 ovL8xULWfITk0okBG0qwwVdUQ7E77ppYu9iHpb3jT4RM+844jU1Ge3x5jSFvLzrAZYHZ
 nIKxB4wSm4QOsU8BVivAp9+QwZxWBG2kfrPFQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=zaJH8jOe
Subject: [Buildroot] [PATCH v2 08/12] linux: remove BR2_nios2 symbol
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 linux/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index aec6da6f7a..24f4d2622a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -33,8 +33,6 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	# nios2 always generates a U-Boot image
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_nios2
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
