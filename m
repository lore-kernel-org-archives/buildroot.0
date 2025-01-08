Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8323BE77199
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4789880DE9;
	Wed,  8 Jan 2025 23:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTBLj0Kgsd6X; Wed,  8 Jan 2025 23:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8279C80E1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8279C80E1E;
	Wed,  8 Jan 2025 23:05:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2D221FF9
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 818FB405AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYwJJ6HR_ttr for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 23:05:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8BADA4059B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BADA4059B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BADA4059B
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361c705434so2699665e9.3
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 15:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736377528; x=1736982328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IYj9uLWmTRAqNGFOYNVW+HkkKeXOYPCJ5dl+x3TpTH4=;
 b=NYk7uQXjwaB/jwMB9ZhQ7LiTdXPkVMEEblqrsZlj63OFUqCpwxQkhomVqWx3xIbcsP
 b+acSSIflFOvsPFD+uGO00wISfBF8rjSoH4ye1U6Xz23l3KTOZdcGmBU2Gfl1gRM5Mlz
 Cb70SFZaZDjs5bp5714kkmnI/7qWUJDRo6Ojh9u//t2VkG88l/li2cCp06nkM8rKwOF8
 0EbCr2GSuUj+/XAwUH9/1EJujs1Hxc18W+bNKlQ0XiHiWvr+XV9CcWY0LMqShJk6KOFT
 8yLDGq0VUnGQuxYQraWMRkCuksjzSFAasgLdfumr0O+gXaRs1wCRQhXE8rtWEL7iVYC0
 bbtQ==
X-Gm-Message-State: AOJu0YzbQ+ZvcFyLD5dR/95aWSn8vPprb2yf1DYzrsPWMT3+Os6sYAx9
 nNggvGdppBY1aOOMsFet3p5UmJRGFlP2fYlTLqhz29+QyoKy4jlwurgm+M/fG7lLsNS4V52HoDI
 r
X-Gm-Gg: ASbGnct+rXwdjLUSYlyMXOHgyD9B3c9aFgyVymeBAy4RhhBgUX/+iyQB+i2QtWBI7KG
 ynw572ZVv6dpyV2/7/JSLgn+EaGmqDmaa4ufqL4jGbjIoszZO1AUpppBIJBJeNrNRg35DJSSvQt
 U1828PPjfBFoqaKOqqMCs8jFgeIg2lB3362vmJuKUfqn67ePKKciixl0ZsdCaXaWHonBXH14eTs
 XrgDkIPtU9+Zbslzz4Fm7FCokusRiMiFDlO0DGGP10uJ/2lBuswOEpvWk/iFAyFHS5aOsrhYipU
 qld1VLUDD8zXMO6v+d9lY+zhyIYfmF21hUkzWZIO0oJ2Ah980keMnw==
X-Google-Smtp-Source: AGHT+IG/Y6gVQOtTsae38NkdhWbzrGlaVoB16PH031BDI/jNFKlVrt9cgt/Ff+cvSCqCKYfgnR/9fA==
X-Received: by 2002:a05:600c:3584:b0:434:f871:1b96 with SMTP id
 5b1f17b1804b1-436e26f4ef4mr36425995e9.29.1736377528499; 
 Wed, 08 Jan 2025 15:05:28 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03ffcsm1059745e9.20.2025.01.08.15.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 15:05:28 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu,  9 Jan 2025 00:05:14 +0100
Message-ID: <20250108230521.1345210-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108230521.1345210-1-romain.naour@smile.fr>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736377528; x=1736982328; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYj9uLWmTRAqNGFOYNVW+HkkKeXOYPCJ5dl+x3TpTH4=;
 b=Agmuo+tukEu2tpf5hzUbFdmZ6qmFjf3Fg8QFPBWmy87Qz5Iiay/P7UXoSi5LXKxeIb
 vU6jP1IoUZ9OxeBHssCNiAVk3AIMiEkUZfccbJoqay0peWw3uyLCgDUHCBeL9jmt4jgy
 Rzsp6xDD2XzU6IAmsRxpLe+AjyAqrg4MjdgWU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Agmuo+tu
Subject: [Buildroot] [PATCH 05/12] package/gcc: remove nios2 handling
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

Buildroot internal toolchain backend for nios2 was removed, so
remove nios2 handling for gcc package.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gcc/gcc.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b39ca8566d..658f5a6b4f 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -293,11 +293,6 @@ HOST_GCC_COMMON_CONF_OPTS += \
 	--with-long-double-128
 endif
 
-# allow to build gcc 14.x
-ifeq ($(BR2_nios2),y)
-HOST_GCC_COMMON_CONF_OPTS += --enable-obsolete
-endif
-
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
 
 # For gcc-initial, we need to tell gcc that the C library will be
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
