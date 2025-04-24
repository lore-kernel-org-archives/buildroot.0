Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285ACC369D1
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 07:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E914E81F72;
	Thu, 24 Apr 2025 07:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7ubmOUZ_Alo; Thu, 24 Apr 2025 07:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B39481F7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B39481F7B;
	Thu, 24 Apr 2025 07:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AC6719F
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 07:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3354781FB6
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 07:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECXvJSdSAveu for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 07:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8114481F7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8114481F7B
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8114481F7B
 for <buildroot@busybox.net>; Thu, 24 Apr 2025 07:38:20 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so5493625e9.3
 for <buildroot@busybox.net>; Thu, 24 Apr 2025 00:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745480298; x=1746085098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ul87wzERAGqU8+x11rROhRO4tLl1efLmsexIXXGq9E0=;
 b=vWQ3qw+NoSpoH0cjJUx6LEVh5RapMa3S31GT+aYWXwar3Xf/gt6ptZWSgcb13sWCNc
 EuwQ7Lj0xf+r7Kst4j8eqq2fdkOPANo5tFl9pjWQzthe7W4A0IBuQELTszpWjN4FkeW5
 19Ymuz+qXb6GzjXQHNAqurpCsXxBNTHtebTp9+5b7TOqhNyOjvy8/AP1/EtnEBuBSZ2Y
 hqEeKT+W9/pFDPr7J7D0UxTyB6lYZAWNfqfQS11LCsztP/6WyZCnJ8O/ew5qa3pY9p/f
 ziqyuLB0gbLp2Z8w/+Q/Cfgdkna7r3aTHn5qsUoSITWAPX4/PkgYHZmIA8dFzSSNauGF
 akNg==
X-Gm-Message-State: AOJu0Yx8ZqBFr/23rby7jgzLh3h1kIGyG9+ZzVxwtDvr/Y1pdXhMXYIx
 Hbxlu9YgYddgpIJymx9oh++lk7A6qPD2w5hcbBJu+3x+7p0+TIEP0QB/DMBGLOpOEapmq/dVvGM
 ihg==
X-Gm-Gg: ASbGnctWTL0+o6Jh0/RGXFDl+squQIwymTmaoX/n7EqPvO7cr0U9fd4hyPYPyMSX3gO
 njdZv/z+g0a2pCXwHV4g/JsgICfGdnuOVaX+B/1Wwkvz4NZZxTZrLLxo9BWnKOsHUO/+P9KdgNq
 l8d/w1H82eC0yZLwDUZfv9rJhhlLnczvFvVgpYIIhDfJUStbmAom9FEZLGH07yDUQ07zig0AMe/
 A5rZoHN2tzi/16MAycHe8h1KtBmLKkpfOBQF6EcqNVc6hy54HSu4ApUOW/UIZceFwQs6rSLlI6F
 5V8ftKMUg6i3vpFeBcOGLlc1Tmc/BnX89amGFz3CSXtOzKmHCtFAfFeifgelkWP2FlaJ4Y0nVox
 dkZGbkz7V7bI+
X-Google-Smtp-Source: AGHT+IGadTt7LZ/rqAiGrqV0Kwk1TNhCxZH6PXj82ANfpa5kKa0//SLum64TMHlZSbEXZqrOYKpzwQ==
X-Received: by 2002:a05:600c:a405:b0:43c:fda5:41e9 with SMTP id
 5b1f17b1804b1-4409d1e67a6mr9799915e9.31.1745480298515; 
 Thu, 24 Apr 2025 00:38:18 -0700 (PDT)
Received: from vm-2404.. (151.187.66.37.rev.sfr.net. [37.66.187.151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2a2e43sm9509335e9.10.2025.04.24.00.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 00:38:18 -0700 (PDT)
To: buildroot@busybox.net
Date: Thu, 24 Apr 2025 09:38:14 +0200
Message-ID: <20250424073814.1880903-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424073814.1880903-1-francois.perrad@gadz.org>
References: <20250424073814.1880903-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1745480298; x=1746085098; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ul87wzERAGqU8+x11rROhRO4tLl1efLmsexIXXGq9E0=;
 b=QzdUSdkwcr5byV7+gJ3ykDhyTkeb4g2JtT/mTV0ExLLd3Q8iiK7yi5Wia55NL+WNB5
 YOYW3LEQwmWZkAhqVD/GoM+5BWLnueytWgLjqzqdxcShwOPSTcEI6qPWFGiPq16PgzEe
 ksHWpjWT89Oj2uqq5y99outm7SxSrOQ3huQt0K63LOpvbCfZrLeCT4WEALu+nXpQpYw8
 fxrPh5NPsTF/pqBCVTUaLOrmez0ZwYCP2CpdZaWNT+CdzgZgZB8yzXDQ2Cpfthndru29
 UDtwi3fG91z59jEQuP+ZEGMhv3ed9SmXpP2RXlOGzH+JY+jhby+9dyZ0CX0bEK+Ry2Pl
 mUKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=QzdUSdkw
Subject: [Buildroot] [PATCH 2/2] configs/olimex_stmp157: switch to Bootlin
 glibc stable toolchain
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_stmp157_olinuxino_lime_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index efd267fcb..29381ec20 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/olimex/stmp1_olinuxino/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="stmp1-olinuxino"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
