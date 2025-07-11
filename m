Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FBCC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 697BF80EA8;
	Fri, 11 Jul 2025 10:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ScitpeS7TtyS; Fri, 11 Jul 2025 10:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69DB083CE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69DB083CE8;
	Fri, 11 Jul 2025 10:45:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2159199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACC0B614EF
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3RtMovJpdUK for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52D5D6145F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52D5D6145F
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52D5D6145F
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a510432236so1466128f8f.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230703; x=1752835503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rYYAg2OAqXOk2bDHztDdcp0G5WMKnpBFBRuerGSOanE=;
 b=qtG29TvEkMPL38gRHszbmcp0k09pJoRIMvVzmS6O7HNgTK5hDe9VffoWgMnG2JBOKs
 dr+pHqfileOwNf4xK4dQ1IzsR47F+/FFUYW10f2RHj1eji/CsPz5ov6wNtZ/I8WJDNmY
 7TR9HKw91e3NbU+EgxZAcPuF6rghbVcf2hSYv5oyuhTLiWav4zl/fU/sspZ7Za9oJHSN
 1OmsF/8blkdrtJbN1Rp90Yt6ViHwzU4Ts7ceMyHt+2BPu3sQSMnqgTnrUuMuepuUWSui
 56xedIsjdxjMmSKVjqg+SE9ubTkeUg+JMNWRe5Id19jLinRF/HYkLF6Ar1Le0yo1V2X1
 rcdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJIyjLiJdkposRZ/d9H6mOr1UhjzMkV1zyqIuAfzb3tiKP+fRp2MEW2JdcKFUZNPpI+Uw1ZFEOuFk=@buildroot.org
X-Gm-Message-State: AOJu0Yw3QgF/FQ2BM4tNsdKK+dfDjrs40VU2lPRn1vmX6LAdVqhv0a3f
 dSx42nzyWC0UL5+ANY5Uk5zfIbVDvSd1Zb6clWOYRgZ+F0Yd5wAoroqc8SaoIfB9XVcb2/XqhEI
 Ma9uc
X-Gm-Gg: ASbGncv/e3aGp9bAleJ6CJw7fbioukYlCOok0EYCBpsjDmxn6W77TokUdgzdg5wBfdr
 6DF7vtLVkjKz6dD4PO9n/h8RY12hvlSnZWRag4DK+IKMge1XnKVLbN5uj9XGyoS8FPuY1LSOYP6
 Ev5/VJYbDunGKVfxewApuQ60fajxSTEvovSpsSzP8Efs8E/90qAibdg1HiK/6Wv808S9xTB0Lyr
 G8qgU8S05KNUqGsz/LgDF+AXxsORKt/EQRCwOI7sS/qf+T81WsZw+ExEW3aoH3bKx8O4ygHY7xG
 XZawt4YyFneXWTsQMDz1A2BWLByOVFMDPYjrUs2pTzpV/Dgz88R9CdeEUa7kNrjmnG+zQxiiWoG
 uEUivlG9KEL3OFQ==
X-Google-Smtp-Source: AGHT+IEkd2NSimhs+cyz9qzHq6q9Ai1Qx9BAEs4gUn9PchWUw8Pn5adR3HgtECbvvaoQbR/BTy7QZA==
X-Received: by 2002:a5d:5f95:0:b0:3a5:2cb5:63fd with SMTP id
 ffacd0b85a97d-3b5f2dac47fmr1886391f8f.10.1752230703406; 
 Fri, 11 Jul 2025 03:45:03 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5032e9esm82083105e9.3.2025.07.11.03.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:45:03 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:45:02 +0200
Message-ID: <20250711104502.824463-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703141331.1844027-1-titouan.christophe@mind.be>
References: <20250703141331.1844027-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230703; x=1752835503; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rYYAg2OAqXOk2bDHztDdcp0G5WMKnpBFBRuerGSOanE=;
 b=M4qoRctFfhbHlLui7ig+2GmtkNu8cr4x+C5/0KLJy/1K0u0MJ3z/GqAk6TsRhF5DZi
 IZ+Ub6fltv5cHW/aArenq9wG8/GWym1dLRmD3vmXUuYLgOrNN4sbio1jJNCMgumK4MyI
 uN1IuurwF066yHWsPs3XJ+rJ+M0JkMdcoWgmi3EaZSJ7vOJl/AtWXCSuNI/Y3itLcyg7
 j7KC2vmOgaWIRiag4iKwbrm4gDp15IblqDpvt/zS4dJqFQbKvjp3HgQalGeU1sYFEu+r
 0qgu6DGPNsk1qTFBrsZR+vKWMW8FdUYIZENVb5u3+B0YYwBwLcSSctUJAZnk8fPJnHec
 dfWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M4qoRctF
Subject: Re: [Buildroot] [PATCH] package/tailscale: add CPE_ID_VENDOR
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This gives a proper cpe-id string to the tailscale buildroot package
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/tailscale/tailscale.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
> index 7019b9afc9..c63710c131 100644
> --- a/package/tailscale/tailscale.mk
> +++ b/package/tailscale/tailscale.mk
> @@ -9,6 +9,7 @@ TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
>  TAILSCALE_LICENSE = BSD-3-Clause
>  TAILSCALE_LICENSE_FILES = LICENSE
>  TAILSCALE_GOMOD = tailscale.com
> +TAILSCALE_CPE_ID_VENDOR = tailscale
>  TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
>  TAILSCALE_INSTALL_BINS = tailscale tailscaled
>  TAILSCALE_LDFLAGS = \
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
