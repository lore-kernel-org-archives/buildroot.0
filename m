Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD455E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 08:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 431D0812AB;
	Thu,  9 Jan 2025 08:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imsl5nniyIXo; Thu,  9 Jan 2025 08:00:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2250482DD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2250482DD9;
	Thu,  9 Jan 2025 08:00:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5145942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7755E40B12
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1JpRcaKaDCl for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 08:00:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4321140025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4321140025
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4321140025
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:00:02 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-216401de828so8571435ad.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 00:00:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736409601; x=1737014401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+QGSxzw5lfypoXOrThHSjI4kh+tejP3Qqz6WuDCIyaI=;
 b=qbrQtSdCYiqPeDFPZP+T6/qSF552OzYdnZHHg+Lxt1at/zbmIA/6oaBkT2t/S0BktQ
 PICOW2gXDxxi3PTFYNBhR/6jxE5ordLBQrYCqQncCXuexcZmq9EmN9f87F8JiqTyjLPD
 CEVV81u+KX6DfijyDDxVjUnpkabs+8LJ2ZF+ihXROPOl998bOL633J5k+MD90/BMU1yf
 baI64Tug/9YYfGqiBBYocjLwaFxhgvW6OvylzpU1w5kRUnmVUKfTrwdXAFA7rXl3/ss1
 uVV8nEUvWouR3EDVp8rns9X6FZLshtQMnJsPvBWFyEJaLlvSmmRUA+O+k2xUJj6Vs9NJ
 VwUw==
X-Gm-Message-State: AOJu0YwjofThhoFDOBcHHxq4E2dkoLeSC50eIwdZ/K9PJRtva3tL+4Um
 AFSpjhN3p1t0QAkva+nDFRmSkeL/YEjjiOsAzmlYm1EUZ7g/LGXY/hvhb3ec
X-Gm-Gg: ASbGncvjI8t7NdtxYsAEovmKQ1PkN0ssT55w2ZRIgQKr6VWRlC4+YInVwzkYC1FBLfQ
 9BZfiaLsl8QrKeNfL6Dhg4rmWPblGfRFFB3RzopiAp6MsFcc9VzQ/hA/CVfItXVGVp68b74+WIg
 YHg5eGqjaarHR8CPpruCcra9wCWa/HGCjAjNg9ZGUloObivNCPKCvbZXRR9vEHzOSjFmVwQIiKM
 NtSyAtuwepVVmGHbEee6/HT8IZ+xVUeZu59U7KoJ1d7jLqroHFG7jaJSuasy+uu9vfNGe1vZHot
 UxX/WzKUtj9O3IL1HZnMr5mnJRECQcuRWRlQBx1j
X-Google-Smtp-Source: AGHT+IGKPKiNQfe8pVc/wsukna02Vlf2mNHiZJko9oOHpteMeXrk+PhA2aDhEWgJcYrwQ1S0TmZdrg==
X-Received: by 2002:a05:6a21:1807:b0:1e1:cd09:e08d with SMTP id
 adf61e73a8af0-1e88cfa6b83mr9442793637.11.1736409601175; 
 Thu, 09 Jan 2025 00:00:01 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-a317a07cc09sm710640a12.5.2025.01.09.00.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 00:00:00 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Wed,  8 Jan 2025 23:59:57 -0800
Message-Id: <20250109075957.758942-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736409601; x=1737014401; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+QGSxzw5lfypoXOrThHSjI4kh+tejP3Qqz6WuDCIyaI=;
 b=j+YYgl9X1fmcC2IeAU0a09gXqs/tAFkcS2uUx9OqBbiXeBZuj0q4M7Gd+dmQtZNGJM
 ufCJ5P5x4xe8iJRJh8QklsIj1rI859geTcuiq+kFWKkZcJY0nFfQiUslND5RvG5Vd5vq
 9c4iuESAVlCOPsiMjL12852ijzYUdLe4BLxqpo7X8EG0M2noflfZ4r/stc7yLZEe+epr
 IFzpGUcWVp1cV6vODGV2pfxp+ziSTHFnNQVbJdLGgQ14EDgYem7PRqYlC1YkPoyWcDLq
 fFDuMHEpxv08RXrq5cQI6CetxFO/VMGuMDtvHgSzLgyDQr79uuTYjSLaU+AwJFlNS8Ga
 REiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j+YYgl9X
Subject: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2025.01
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

Release announcement:
https://lists.denx.de/pipermail/u-boot/2025-January/576668.html

Changelog:
https://github.com/u-boot/u-boot/compare/v2024.10...v2025.01

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 boot/uboot/Config.in  | 6 +++---
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f6823d537b..b6ac2f9380 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2024.10"
+	bool "2025.01"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2024.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2025.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -339,7 +339,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2024.10/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2025.01/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index af025a583e..b619a70423 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
