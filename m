Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B92AC021A9
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 01:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4244B605EE;
	Tue, 18 Feb 2025 01:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rbXnAJAajjn; Tue, 18 Feb 2025 01:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 504FE60EFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 504FE60EFA;
	Tue, 18 Feb 2025 01:55:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E723C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DA4880DE4
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLZt1Xzzi8RO for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 01:55:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 720C180DBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 720C180DBF
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 720C180DBF
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:55:07 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-85521efa9b5so106706639f.3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 17:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739843706; x=1740448506;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=A4I87boaoW7l6/G8IpMiC7Nk5bLuGZM+MR4AjtRnCa0=;
 b=XXB38IeCBkQ3XKenkU8uBs2VPrxtveQSuDOGRYmE9lxNpGm5gAg8PUFcb4M7bxkKuM
 SUK29KWG6hSToAUMja8FhIrDvTjgCFIbu0fyhpOQ0nGvfDaQJ18vuvKwBe+qfipZ4mUK
 q59FsrsYUUVhweofBMfpCs/i3pauaMk1vbGODfSXq4B3+sPcpM5dRYR7glwDwC1eXsij
 l1daXzRPEfI6Rk8mZ0X6P/6NJhnVA9PggS77j8KiJUCi6O1nVzt55tGGANaYI+5VgqSj
 iXhxqKRvbf5A8JT0+De8bk8zV+ryd6rOL3RxuyShYmcze2+LMHCQQPRbhGIEAB1ju3Gq
 pTYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7p7zd2iuGszIiHfbV3ertPU2lsZjVmmPBdMZZPmlKtpOMzw4t+wkXgZjVf+kOqbFYhXgRIEc0yxg=@buildroot.org
X-Gm-Message-State: AOJu0Yzcdo8cCfkGQn89VE6DGbKCB1kbhlQEOHuNM8dgMTFl7v5mT+Ua
 l9zbro24Bq/wbzi4GrLl+RCZfzHyxxmZSXrGlywQ/SdZxcAj3aJa
X-Gm-Gg: ASbGncvliiDYaafnP85aVtNLRysyWsf5LFomgnHTpJ4wmn6WksUpkKQlZrN+FvcOdgV
 lNHEaxOkkyyn6sZRLmdf9M+BfoQMI27mj0Qk55xrH2/Fe0Ci3eO1JE6D5uMN8d3pKAuIPyE6rK4
 SdYhvaigayK9kBI0U/WemK2RHfJKH4SWQ0uWIShwvesaGCtYW+cDYVtOSd39wFER0nJf7nkjsjc
 2by7vg9jAphUy5E/x2eT5OnZoHJflwUxXquCbpV8DTomgdXD3I/CjbfARO35eHqjeD++JvCHRkJ
 blt6dnIi36UjVh5aEykVMXsKfcgYFusc+h1HRNfMuskiYC1mElo7ppeFuVn65f4okQ==
X-Google-Smtp-Source: AGHT+IGZMipYZ+RX6561UUor/ExGWJkd3AjmGBvYUZRlu1UBuLT0P1VCaHfrneHCqgTV8r8cOhr6UQ==
X-Received: by 2002:a05:6e02:20e1:b0:3d2:5a0a:7227 with SMTP id
 e9e14a558f8ab-3d2807b098fmr87401445ab.13.1739843706283; 
 Mon, 17 Feb 2025 17:55:06 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ee8e7db72esm1139443173.141.2025.02.17.17.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 17:55:06 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 17 Feb 2025 19:55:05 -0600
Message-Id: <D7V74BZJ2E1J.XKF0IKAROMKH@gmail.com>
Cc: "Brandon Maier" <brandon.maier@collins.com>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "Akhilesh Nema" <nemaakhilesh@gmail.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20250111063753.769689-1-nemaakhilesh@gmail.com>
 <20250111063753.769689-4-nemaakhilesh@gmail.com>
In-Reply-To: <20250111063753.769689-4-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739843706; x=1740448506; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A4I87boaoW7l6/G8IpMiC7Nk5bLuGZM+MR4AjtRnCa0=;
 b=cLJ8rrYbQBt+KmngdgLtNYY+VAPccM07R9YW+9zAaKAXlrC88UW2ldUukyt0xy91QK
 SFbtgC6AUj+bFLdZ9F/5HBf4ShkhTB8E76tJ1XG1lAMzN9PdTY5eEct+BiCzarLmEuXg
 ZB56bD867h2vXxagP6Bfo7TX8QC9xzGT2RnO5ZMT+TGDoTkC8SnWobkmtuaHvEiXl27j
 i69yvooLFxFf71keI6pjHaGf/m9zyzAjPFygnPfq0InEBer+LSCPIS0UFz71rjHsqiMg
 Pr9svgvp/9RfjEAwZajNpkOdMds3E0ZcEczwamsWOsWTQckZj15LY2Xh5YM63ajqJ+ya
 4Sxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cLJ8rrYb
Subject: Re: [Buildroot] [PATCH 4/5] package/fmc: bump version to
 lf-6.6.52-2.2.0
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

On Sat Jan 11, 2025 at 12:37 AM CST, Akhilesh Nema wrote:
> - The license file was renamed from COPYING to LICENSE.
>
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Reviewed-by: Brandon Maier <brandon.maier@gmail.com>

> ---
>  package/fmc/fmc.hash | 4 ++--
>  package/fmc/fmc.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
> index 961ce18ac7..8f59c94e6a 100644
> --- a/package/fmc/fmc.hash
> +++ b/package/fmc/fmc.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  a58514816108a16d07307f924ebceb67c7d61709e4449978763fc44ed6e1fc44  fmc-LSDK-21.08.tar.gz
> -sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  COPYING
> +sha256  13a5e327ef1d727946187fbd021513194981e42681c73e56933109af8a5889e7  fmc-lf-6.6.52-2.2.0.tar.gz
> +sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  LICENSE
> diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
> index 4f25545ffd..c6d36f14a0 100644
> --- a/package/fmc/fmc.mk
> +++ b/package/fmc/fmc.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>
> -FMC_VERSION = LSDK-21.08
> +FMC_VERSION = lf-6.6.52-2.2.0
>  FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
>  FMC_LICENSE = MIT
> -FMC_LICENSE_FILES = COPYING
> +FMC_LICENSE_FILES = LICENSE
>  FMC_DEPENDENCIES = libxml2 tclap fmlib
>
>  FMC_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
