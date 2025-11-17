Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32231CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 21:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9972413D5;
	Mon, 17 Nov 2025 21:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsCPQLlkQ9wX; Mon, 17 Nov 2025 21:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96C34413D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C34413D7;
	Mon, 17 Nov 2025 21:14:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 450AED5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FD3E400A2
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaBpvQBxWKll for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 21:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51FE440095
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51FE440095
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51FE440095
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:14:23 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-43377ee4825so24383275ab.2
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 13:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763414062; x=1764018862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uUTD4jo2VItWK43iJZ16uRmBPmzA82Rye52udyk3l44=;
 b=CShTuCeWDgegtzIW3Fjxl/Ksqqc+IOZAlxYcZS4pQFNfMEyeEpyKDS8z1HA48FTony
 o9dBXKubV5d1jVWzKvZweBvSgAzn+SkQ25NUym0bnrrPu7suULQ9AKvbTQhArLIoetKl
 JGoqmlH9VLsiOVsPFKZ54Ylp7WqaOPKhvoGCTwkhjRmzM+04W9sL4wTp2JAjhNE3fAIc
 UbZ6jiV+ESLM5mWA8xoknKUj6wuI3wYpOK4Lhv9pq5X6prCmduFE/qFmqBvFvTvJnDMD
 I92DPZIiMMn13cg79RDhgOxTLAVtSKRBeSUTkHcWWsZTgP6W08jS9LB+WDRnaVAnF8FW
 ciAg==
X-Gm-Message-State: AOJu0YwocuqQFT10Fq1Ijik7UAGqwtQF2OmIqUHKcxhKvC9LfzL8zDVE
 cAspgPKdc/o+VBu7oj5FMjZ5o6FqNY38CvQ89MIX8ei3qI4GNlPpC11NvO10nBsvLVA=
X-Gm-Gg: ASbGnctcYngqVfSjXb2DJyDE/yOqVTTB5XkFq4uNtcO1UceJYDmcWUNSS7qS093laKg
 BhHH35W6QCi7XjGKja2R4e4J067e8nLsRviFIBildTPdgUsuZrRro1UKJ5g0ccASVpJaQvdUR71
 g+pjLE6H2jJbXbIoQpOkoue3WtTzkP7YNUWp2emIDvrj5/rjU58uSQrwoD7Zwr1UTqH1geMxEkv
 yUGw4sE4yZLreX9EXtcHcb/KaBjVSsTd3ambJQWkwwIWpC3c9/xCSxspU7AfUuB4FGbkhKmlHS4
 Ji+OFIjVGLyhQYpYk81WYrBXumkItQfxc9cWZwNBg96jq46hnzJ/NjptNugwESgXaOfUCKoszD3
 Mzv6kfBchWr/er10sDk7usZGGWsrnJlZq37jibHXOb8x/RI0nofM8U3gO1yPV4sKuKzLhYUvanT
 vvMtKqYZgCIZeIhcvfx4UnhLt02Q+ZGy1kN9yg9hQKAgB96c+UAGmlj3SE5mJt7kWnFBcIOFE=
X-Google-Smtp-Source: AGHT+IHIUGpgqE26S6tqNVRFi4UchXPX5Nl1EHBQsIoDyz2TOf0jzJZdajjmZW/jA3yqDo2FvG/jNA==
X-Received: by 2002:a05:6e02:1685:b0:433:78dd:18ed with SMTP id
 e9e14a558f8ab-4348c93d1dcmr160048255ab.26.1763414061889; 
 Mon, 17 Nov 2025 13:14:21 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-218-112-180.hlrn.qwest.net.
 [71.218.112.180]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-434833c5357sm75265425ab.2.2025.11.17.13.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 13:14:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 17 Nov 2025 14:14:11 -0700
Message-ID: <20251117211412.2491717-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117211412.2491717-1-james.hilliard1@gmail.com>
References: <20251117211412.2491717-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763414062; x=1764018862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUTD4jo2VItWK43iJZ16uRmBPmzA82Rye52udyk3l44=;
 b=Adz9ipeCDm7FSuikBKOshEaKJlCVSK+2PyA5pshHfS/hkjVnwi3zLSNVWxGcGqXtcX
 1FyrP8aaQ+IDWSupe83f6Bb6EE6QV16EMpuWrLNENWcRoJgTLKUCYfZuOivLsph/l51p
 uNWmYleeixkO5vVlVk5ImYL28IwmNkLHHgeg+Rpjg+GkDE0Zqfl21ziasaJqUPJ/XWRd
 xCcpY7rjC5b2mypfoEFWtU/ZDR+5YjmQMCqmuSHLGqO04t4bHnJfOUB8GUf3MuLxMc7K
 yedvv/FLku6d9bQAbcrbqjO6QAxOZetZXS0xOPbe/ioTrSkXjW34EY12lUxQzIK7ncnF
 tJfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Adz9ipeC
Subject: [Buildroot] [PATCH v4 2/3] package/pkg-golang.mk: make GOPROXY
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
