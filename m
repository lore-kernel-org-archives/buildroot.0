Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5587BC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C2B6607C9;
	Fri, 11 Jul 2025 10:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtvEzaiMOOYh; Fri, 11 Jul 2025 10:45:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B537E61599
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B537E61599;
	Fri, 11 Jul 2025 10:45:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B587B199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A47F340549
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcJ8X7N0JkEA for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB2A8404CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB2A8404CA
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB2A8404CA
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:12 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-453643020bdso14947775e9.1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230711; x=1752835511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+PbhvpI2mfLb5v6DO8qY+G/KOfTMDzjLGh2uApg9v74=;
 b=h3SN8cs9HqjlcnVxFvFSOawuqI1ez0n1LUHjmfqrB+PICWV4VhCMYIxMzK5FEcbP+P
 bib09uoBqzMakCwmm7RKx4w9Yl/FUYnwXPFSp8WFjaL2ZzXuxSUi7G7xckV3hBKDaPFs
 kreWIQJssOdXQrajTD6Z5x/IoT301O65ES/LZiFiufK/IPYcBXWGqI2lg1n3JJR61nuQ
 FPZ6GhOZ6DQEY0HKPHgWWd1BgRH5MACqMJlocaPDAb7S945f8lR6VDhs62Q47GxHzdgm
 Wx1drTkmZhHdixZSwyCNfzPhW3PgDNABMAqGilVkA88RQYW3Gp8eUVBeBA59brid7pJz
 ISzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJWjdE8KODdBXGUe9NXoTq4qakj1lRSIq5UyvzRWE8hWUA7B0FKOAzR1FXJil7FlJukTokbW0wAYU=@buildroot.org
X-Gm-Message-State: AOJu0YwcCClMnJrZYD0WVHkhWHeISW/xeAcBKdTkLK3QCAP8VadRTtGF
 y0kftI4XcjRYEq0m8yIbcrBlrAxhoQTcRuq2ECB8M2lIuTAJFxv4EWwxYC7OXetyGpw=
X-Gm-Gg: ASbGnctNaNrQ1ilNcwJ9bQXlKZX23vQRzsbk0pE7xGURPjWLDThNVTIdH2hOIsgHaml
 2OoQJZb/eD1zAmDScJN8b0ol/80M5FcwZ0M5TTvUhbF9ypAKt/PbqGawerN9uRpdeU8/aYziXdD
 Yr5b17ZGcVYwQqt4ooLtVuNHnEmmCtzYikhbSXA6T6IOG1DYHkVs71yuT5IqVBI+SPzOJmNxG5A
 U31bCmFOmpUgS0BDLxK0evKQJrqh/qULeGBpz11BEMp9i4FH6JpFAw9QjIMgWbXtBhQAHKV/deX
 /EMAcD2YUHJ7qp35DjMmLQjAK3bAyKHVI/7xDbF7VEQ+sA4TpDU3V29gYBKKiclcUooAMDkCCwG
 Di6qx+rl5K8muSw==
X-Google-Smtp-Source: AGHT+IErI1yfeZ99UXeH4CAgJwJ2dG9cMvnd05t0rIhX4LHuUO+bm0Ebgsyggb5SMwNiWPRsayoOYA==
X-Received: by 2002:a05:600c:1e8a:b0:43d:94:2d1e with SMTP id
 5b1f17b1804b1-454f42844b4mr25004465e9.13.1752230710760; 
 Fri, 11 Jul 2025 03:45:10 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d77asm4205277f8f.58.2025.07.11.03.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:45:10 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:45:09 +0200
Message-ID: <20250711104509.824778-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250704232447.2963667-1-ju.o@free.fr>
References: <20250704232447.2963667-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230711; x=1752835511; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+PbhvpI2mfLb5v6DO8qY+G/KOfTMDzjLGh2uApg9v74=;
 b=JIYsrUt4JsaNTTDI3r3ybcyuifGyGtsXwIbHguh7V+SeLMVZ5+qNlG4wKhG3vCkTwA
 PpVzAga/MenXVbZc/TCxplKeC9bIuAD7cYldkHQqHgKpTAkimR72Obl3aEETHNnKs9V1
 JyLUvd1KN7qEgRy5+gbKKmrXc5LGreQZIfryfhdIywBKjzgrL4R6wB9bAftLrkLxl5IN
 q7yRl94t53ahX79YXOPPJHCsSQkaQkWFCSt2YAx2sGR0kIJQf2GR5zksWwGVQjkMkK+7
 ccNaqgAKa3LvQi+AOB9R5UP5HudbEih/emVO5v+qCgBSWoMBr9bypPDz1f5awbQpd/yG
 AM7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JIYsrUt4
Subject: Re: [Buildroot] [PATCH 1/1] boot/shim: bump to version 16.0
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
> For release note, see:
> https://github.com/rhboot/shim/releases/tag/16.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  boot/shim/shim.hash | 2 +-
>  boot/shim/shim.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/shim/shim.hash b/boot/shim/shim.hash
> index 5aa4ca06e8..14b0aa64cf 100644
> --- a/boot/shim/shim.hash
> +++ b/boot/shim/shim.hash
> @@ -1,3 +1,3 @@
>  # locally computed hash
> -sha256  a79f0a9b89f3681ab384865b1a46ab3f79d88b11b4ca59aa040ab03fffae80a9  shim-15.8.tar.bz2
> +sha256  d503f778dc75895d3130da07e2ff23d2393862f95b6cd3d24b10cbd4af847217  shim-16.0.tar.bz2
>  sha256  15edf527919ddcb2f514ab9d16ad07ef219e4bb490e0b79560be510f0c159cc2  COPYRIGHT
> diff --git a/boot/shim/shim.mk b/boot/shim/shim.mk
> index f5b3d1cee6..0e5698b432 100644
> --- a/boot/shim/shim.mk
> +++ b/boot/shim/shim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SHIM_VERSION = 15.8
> +SHIM_VERSION = 16.0
>  SHIM_SITE = https://github.com/rhboot/shim/releases/download/$(SHIM_VERSION)
>  SHIM_SOURCE = shim-$(SHIM_VERSION).tar.bz2
>  SHIM_LICENSE = BSD-2-Clause
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
