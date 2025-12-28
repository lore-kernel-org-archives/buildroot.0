Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F86AE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 382E880CD7;
	Sun, 28 Dec 2025 21:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpYmSnEDsw2g; Sun, 28 Dec 2025 21:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EC6480F7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766957840;
	bh=Nz1JKiHhu/6jH75DJAVy2B1gwy2+a1t9Qel8hkPzvwA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YrCS0CPNZPY+fpvhZvEscZc4uyyXaATOISnLk98kixCdDryWbCXHGoSfZGrIlUiPm
	 jKTp85ek0EAKP4GxbY3Nv4RjlzTsxfsz37mpHZmD8m8FMkC8ti1jtpet6uFtpnoIoT
	 tZHB4ifP720TVa+Zs+v7ClT5Jk08rRLQJduzd2d1isoKgFfN8pF+X1soQWvCluKoGa
	 aPLSg+Mt/3iHNQMJCzliIBvgOefIwf9Psh66KrBb+/ujhJQk1Ozc9UQppknxU62pKc
	 Rv0022WGunbHIKlz0HsVXrPopwUXHjA4zU8pc3JcEV7jJkfQ9QcVHcoqMhC2nFygJu
	 GoEi/H+0tw+SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EC6480F7B;
	Sun, 28 Dec 2025 21:37:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC77BD8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEB544016B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOB56L9eTMLQ for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:37:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C842740055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C842740055
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C842740055
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:37:16 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-459a258561cso2045266b6e.0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:37:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766957835; x=1767562635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uUTD4jo2VItWK43iJZ16uRmBPmzA82Rye52udyk3l44=;
 b=dlOGmoYzUtS90l52kQIbKhpVO4pVd9KYSRzIZp1sDPH/d8ACYGeeoSNFmh2HGeEHY+
 oiC022gIUzXdZp3qdI3+4VzgVnnikgeEDdqYi6J7p2Tr/afhMvR6l3V0HERFzEE1V3KV
 uOsItXKHVTFpb+GIiVnBqq4WjrBYMLTdxWpdSAvLltFJGvUMvG4uMa7bL1h4WL150WxZ
 rNy2y/pzYXimzJ+PzUJVevNQYIKv5/KYMMaxIKalx7HWAHnATvho3H7x6UULkVx2n+Ap
 MOLD/li4PkSxiTrJNdgUmCbQ0DTLRuAGF+yiQQLvklR7trpTuB7WFtqDlzSAuhhwIyne
 CpXQ==
X-Gm-Message-State: AOJu0YxTomktPlJyoWhgJV5jUe4kB2/0dLBAFF4Fssf4/GngiPuaygcd
 YPhsKrWh/EO7Ksr2ifIAdxxHMFS83S5Im3VKEG7KM4aKMeN/A7Mi/MwoEfkWlabYLes=
X-Gm-Gg: AY/fxX6h0Alk+ohBlJtBoOMq7INuAKUhk3eFHkptDItfNlD6miYiLuCDFb1AEKZj0Mg
 UpoqxD3+9rv2X7cuqvh/f9UfuvPDpS2FwuzW2COCjOdqFC3H6bslLlYZclClVbF+7zG4fPToqf8
 dgdXbayiBDPFN+G8c/mUM3o27bAYRHhdnVdjcX4lx2QqwOXbq7CincOdYB5/nKNVvETnRLuluor
 aAnOhjPtFtyYU+IIeNh6lNhz6FXWN+QNS7T3qe1cPh43hL0uGzgPGAcv6YlXH8WBzReEAAFd0JO
 Gquqwo5k0AeOr+tF39EWVeR8Ps773T4ed3DtZrB3ml2tibZZ5TVMEuGEOOl5deWOGu2j5reh0IT
 DNFvj5t4ikHMsFVw6ffRyz5tw6+KPNQlUv4XQe+MqXkbKRM03lRACryUajbA2QeWmKUw0K8ecVD
 hPzLR0Im72XK9b3N74DtLyUGgRAoqAKCFzRl+fSM3E444JaeubZbJDIXUpeFt9+fCvirozhVAbG
 hurIWjz6aijw50pZHfzixNycqKTu7ZonD1NpvV/BH7YJ3wckw9QibFXTcItM80Kag==
X-Google-Smtp-Source: AGHT+IGVFW4n8RBAaEUlPuj4r7OoNaqmK9PAAep8F05nz6WYaXLK7MUN4A+JRx+rnO81dk0VzTPBqQ==
X-Received: by 2002:a05:6808:1527:b0:453:7429:108d with SMTP id
 5614622812f47-457a292b1bdmr15312223b6e.20.1766957835449; 
 Sun, 28 Dec 2025 13:37:15 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6680358asm20003855a34.30.2025.12.28.13.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 13:37:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 28 Dec 2025 14:37:09 -0700
Message-ID: <20251228213710.2591716-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251228213710.2591716-1-james.hilliard1@gmail.com>
References: <20251228213710.2591716-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766957835; x=1767562635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUTD4jo2VItWK43iJZ16uRmBPmzA82Rye52udyk3l44=;
 b=RMJyv//symUsKYiZh15pnjDwPrxJQPs/RXgDbiZHPU2233Eo1khzIG+6OFcrOZyMJz
 EWgPZW0ogW76BycDMAdb0dJx2fgQQ7ZiGDiXzGZJNk9f3YV0kaLGip0MHAgoSJ18cvPZ
 DJiqczGTRXuL62kxsmRvqH/BXJFGd6fvwRz6FntyWmLQEJR2VDmOtiWdonosK58ZZL8z
 XC+0fCnB5/IhkiP+NiQQwvyYggkZSE8DMBddYx8Vqn50XvM7M1CwvTuZLYXaDvrQrSVe
 JcJ0QpODVoy4b/AY0IeNzYbMsG6IiVADIgwut19lO0AFD5di693iY5fPbhdYflhI/GMg
 Ciww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RMJyv//s
Subject: [Buildroot] [PATCH v6 2/3] package/pkg-golang.mk: make GOPROXY
 configurable
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

BR2_GOPROXY now configures the Go module proxy URL used to download Go modules
specified in project go.mod and go.sum files. By default, it uses Google's
official Go module mirror at proxy.golang.org, falling back to direct downloads
if the module is not found in the mirror.

The default value from the toolchain can be read with "go env GOPROXY"

We rely on package developers to audit their dependencies in go.mod and go.sum.

The value can be configured to:
- A comma-separated list of proxy URLs
- "off" to disable all downloads
- "direct" to download directly from source repositories

For more details on Go module proxies:
https://go.dev/ref/mod#module-proxy

Discussion:
https://lore.kernel.org/all/CADvTj4pXO2rwJ8oCzzGNY+OxLuo3uJnDT2PAxbyquw0L6dhfiA@mail.gmail.com/T/#t

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Christian Stewart <christian@aperture.us>
---
v1 -> v2:

 - added more context and links
 - renamed to GOPROXY instead of GOPROXY_LIST
 - moved into the !BR2_PRIMARY_SITE_ONLY section

v2 -> v3:
 - split out GOPROXY default change

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 Config.in             | 16 ++++++++++++++++
 package/pkg-golang.mk |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index d730f2034b..23717f3f97 100644
--- a/Config.in
+++ b/Config.in
@@ -335,6 +335,22 @@ config BR2_LUAROCKS_MIRROR
 
 	  See http://luarocks.org
 
+config BR2_GOPROXY
+	string "Go module proxy"
+	default "https://proxy.golang.org,direct"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  The Go module proxy URL used to download Go modules. By
+	  default, it uses the official Go module mirror, falling back
+	  to direct downloads if the module is not found in the mirror.
+
+	  The value can be one of:
+	    - Comma-separated list of proxy URLs
+	    - "off" to disable all downloads
+	    - "direct" to download directly from source repositories
+
+	  See https://go.dev/ref/mod#module-proxy
+
 config BR2_CPAN_MIRROR
 	string "CPAN mirror (Perl packages)"
 	default "https://cpan.metacpan.org"
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 26da7be71b..3e388cb257 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY="https://proxy.golang.org,direct" \
+	GOPROXY=$$(call qstrip,$$(BR2_GOPROXY)) \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
