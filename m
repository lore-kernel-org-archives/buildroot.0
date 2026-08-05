Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D437C55ABF
	for <buildroot@archiver.kernel.org>; Wed,  5 Aug 2026 12:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D5A4404C8;
	Wed,  5 Aug 2026 12:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7BtqvkSXoNL; Wed,  5 Aug 2026 12:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72B0F40606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785933791;
	bh=PLOKby3gUorsaaySSRnzNZyHJbB3vVIy5PFWYbIgtSo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TS1NhXNwxOCJFSGUR1L6qEJ6WpDF9cPjePGmNd+eDI0W+K5D4nXlFkpofUl+efDUA
	 YgUvY6tYQEW4ty7yA7HIUI0baB0EKdTIgzOlmMy0gDQ12vN28nJON3dOZzFgLP57ne
	 nGey+Hi6O8Eh2fUM8EE1odcx+IdxqPj5jgiW/pxRpVv9NKJIHL8B6HgDEciykghiGg
	 3iLJPqWEG6nqB9PJCyZHl08yUCmMwJRSb1FAYTbtAXFomO0F/mIG4ikZaqX4TbpzIo
	 p8G6UKSD2ooiq6y/p3eRi6QkxUJ6PDhk1l2jz03smQRrG7KpESXP5t+6zpYQRcvMnX
	 vpJ8duDv9z+qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72B0F40606;
	Wed,  5 Aug 2026 12:43:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8373810E
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 12:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69C7B607BC
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 12:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKIpBgjaHhLt for <buildroot@buildroot.org>;
 Wed,  5 Aug 2026 12:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7ABD1605D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ABD1605D9
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ABD1605D9
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 12:43:08 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so10725585e9.2
 for <buildroot@buildroot.org>; Wed, 05 Aug 2026 05:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785933786; x=1786538586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ULNtsy+Pslc4rc9bAC/KsDgTtJ2SNmqnGQj4P93o3Fo=;
 b=XYLRmLcODVwodeJZnUM/vVpMIoLlbf2Pno4KjHL5T0x+L0iqFzrGwJH6lbCKvSPIhU
 gj3g/8NZ1Ovm8AGc5rdBHvNSvnzRQACfyW/96MClSjmceQ/C+xug3JTk5D3E01bHzSXs
 GVt3em/F1pHbfxPkpkk5PhFKo0KxJyDfltjAcv7/vyEj/UbGUNsqE5uN6vAS7LcoFKty
 oBUnAAh5el39VtLmgIfBS/F4vf8Y6wJ2HnJTSKWmZXTsTCn0ER1ZRDjST8e3PWj9XlT1
 3eoD0lyzGw+deSTd+rEKSPDlTJrJSxVKVXsqxXzoy/qOBATWJHIF2aLfG8bhT0x/s95r
 vFzQ==
X-Gm-Message-State: AOJu0YzONSlQ6h7c6OGqSLzgUrTglRwMJdFNn22dGIylV1NW5XpWHduF
 1MolPJgntKIVE4riq7uFAgMxei0Sjn2E6TzhmG8f8bJNr5RwvP4NHwg5XmRdTjNbLG2hozTv2xN
 wBOuf
X-Gm-Gg: AR+sD12pX5buKP7cFHLMBUmRBY/ctwYJHAsGL5Msf7/c+t8qCJjLg/vTWGw2HpaCPaG
 SgBTu256K0YlUoZYCohvoaX35PdsR5iPvZ84tqTYlMdovguFER50V0rjW7Eh2s3CIPm+vK5xBww
 oRpLuO6fJJFiLtbP1c6Fria2jKWxGuZbUIYXskqR1aRLCAJ2XEg3BaTDfieXatDxdFgYnqm7Y+j
 g3lpcikRmgRPH+TYqLl8b/Y6IWR/wJpYoEqv4OOgko1nlHjWxzn8SmBLeXWs5V0BGdVP6bVkV01
 629TEAyrOhEnouDumzxN/GsjGN9aLFl3DYwSPfw0gVBTt4kh28jnR8g/T9k530xFO1UVE8JomNz
 S9D+Qqr6cSH3jDKjag/OxOY8EXMKgrnUB0C4jl6ABK4v6dalQMT7M5vy7MloCkrIo+H3/wXBsX+
 BJM0hGRvXqlUExGBUHxybY/QhxVfQpOC8bgzEEGl4qX0eF0L99W27IzHQATDaunosCGUyXmCcBs
 i8jJY5PV0SFXEb+5NFJuIu4AVbOC2H9ujM7nF/InZPsZ9wY2u0TngKqbg8+5EwM/B2vAk2xqBR2
 QSiSvkOoMH5l9tGIueju/miQwiZY7RWy5cD0Av5kzIn3HcqGIfcPo8/kRR6P8uBx0LEQOQ==
X-Received: by 2002:a05:600c:8b75:b0:495:4fd4:619b with SMTP id
 5b1f17b1804b1-4994e70a6eamr103284945e9.1.1785933786378; 
 Wed, 05 Aug 2026 05:43:06 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994e5192c5sm59685985e9.1.2026.08.05.05.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 05:43:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Wed,  5 Aug 2026 14:43:00 +0200
Message-ID: <20260805124300.1485387-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805124300.1485387-1-dario.binacchi@amarulasolutions.com>
References: <20260805124300.1485387-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1785933786; x=1786538586;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ULNtsy+Pslc4rc9bAC/KsDgTtJ2SNmqnGQj4P93o3Fo=;
 b=AJjehpAE0wSlmsPeKJY4CvILxwpe9N7alPGesiUM7BBlsQXkxYL5oC58khmaEWmj6n
 UGXKSQ+hDw6/TtP+6cGLwud82imvnVj89kPE3R7Jcu4zc3QiV16rkAKsBdaRfhl8brNq
 QBlaVNsxV2Qb1sHO5qvdCQyAtXM35vuXw9FrE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=AJjehpAE
Subject: [Buildroot] [PATCH 3/3] Revert "configs/stm32f429_disco_xip: fix
 boot failure after uClibc bump"
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

This reverts commit 72f7aa47e73e9a93dbfa3e4128c0d8e7932edb50.

The MALLOC_SIMPLE workaround is no longer needed: the root cause, a
zero _dl_pagesize on noMMU/FLAT targets, is fixed by commit
35d3927e8564 ("package/uclibc: fix for noMMU targets using FLAT
binaries").

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/common/stm32f4xx/uclibc-fragment.config  | 2 --
 configs/stm32f429_disco_xip_defconfig                           | 1 -
 2 files changed, 3 deletions(-)
 delete mode 100644 board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config

diff --git a/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config b/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config
deleted file mode 100644
index fb8fa9ee01c3..000000000000
--- a/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config
+++ /dev/null
@@ -1,2 +0,0 @@
-# MALLOC is not set
-MALLOC_SIMPLE=y
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 0c472a328bfd..40577a21a5ee 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
-BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
