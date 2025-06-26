Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642E7C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BA95406FA;
	Thu, 26 Jun 2025 19:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GK8U-icgvXh6; Thu, 26 Jun 2025 19:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 734754198E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 734754198E;
	Thu, 26 Jun 2025 19:53:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D146154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 833B880D40
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlvJ5A-qQUd4 for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:53:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A970780C9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A970780C9A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A970780C9A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:19 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4538a2fc7ffso8616505e9.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967598; x=1751572398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ilRh0lHA3z2pOZsLbbhDNHapy1fiN4hwcEHFW7F90r4=;
 b=q8xiXb27A38GnO8wltM7X2CryXOU/cDF92SpyEr7/ngV23ZrmWE8Jtq9speNGsrtqL
 gOMEWrbti5/qRxCnfZsfMwAkgYaY6RSLVZt23zHJnht0icbQjxtpi8m9XEgtqnBMHjXI
 wxIGIpjTDj3nCZ8KKgg5IXMb1ML6/gIHLn2XaAcANge6RtV1+M84C9BeBd5G7KoVOnvR
 yxoCUYpUamLSZKPUMfLsKheuRfbCex/8RE1aeY1SuLCpZKoq7elh32JGVgJx8TtxnlgP
 FbUS3bembVl1oltivm02La0ebWiHTbSG2mjv32LfUX9GiMvMriLpZlQ+DoWdrLirUjDB
 yrNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAahr4NWwDQGVToTn6IOE6gukrp7BjxYBNv7Nz92GCMSKPlfx4k/AWZ8lwVyrt9J6s9lMOHYv1gIY=@buildroot.org
X-Gm-Message-State: AOJu0YwwCQr/WjVH4sZ+5kgZrcRKsrVbcqmRROVJ0VlLD6qkvtVJ8soL
 3/Zxb2mqHQZXinTCt3/khaH1GB8B/CP7pqM8KlOA1K6QUDyO4WmwmxcIiqCOZk6mG9g=
X-Gm-Gg: ASbGncuHIUx2XwfsWpvyKFAbhloDkTXvkOr43XVWh+hKuO8O60shdKa5vohVQh4t7yz
 vxgL016GDN8i8pabADVA+Vw/rDb27BNihiCXFfQ+blBAUm0M2YGKOmOyPNCfw1hfKRE4SnyJsUa
 V3z1FnG1rWhTt0KLl8NWBkX67ht9AooLr/GMKINMdhycD3Fncfwe8d2L/VvzO/Q1jn7z/HSqgNz
 b7Rx4z6Uhq9U/xbZ9LFJixes0yoENUepORa83L7UonZRDqfEimap4hj6yCma+yobL7Elnsd8K1g
 RtSjMss2SbqWXN4r1GPKBYw/X9/Fm+8PxB213h9G4Uf3jG2XdxD0y3BnfomrfmXiAeAAo/OaR+d
 2fxy5hXBil6NOdLQrsBIStJpSAVCqEPK3
X-Google-Smtp-Source: AGHT+IGbr/bEnKvTNchAbw/4gexKqB5opNpw0v/tDCC9HhanryjUlCx8UMv4+PAT/eYV+wVm+OhQmg==
X-Received: by 2002:a05:600c:45d1:b0:451:df07:d8e0 with SMTP id
 5b1f17b1804b1-4538f2f8bb4mr2664725e9.11.1750967597761; 
 Thu, 26 Jun 2025 12:53:17 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a390bf8sm29129135e9.4.2025.06.26.12.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:53:17 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:53:08 +0200
Message-ID: <20250626195308.15038-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614094822.56877-1-bernd@kuhls.net>
References: <20250614094822.56877-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967598; x=1751572398; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ilRh0lHA3z2pOZsLbbhDNHapy1fiN4hwcEHFW7F90r4=;
 b=JEJ0tI6fXpmVE3+pqYbDu7FuKDge6uzkX/6Au//edJ6LFx7k+A+9N/lNKcxYSeimM+
 BAQ1WO+qVIUMimNCp9siD3kprtR5nBv91T1q6B9El46Psfz2BB8UvWOfDfNkJNvT7Ftn
 yA2HGvno3ZqMdZ80HVXjxtCTLbY2M8D843IVjtXkxkWNslDySmx0W11a2vpO+qi1y8aK
 tjHbaHspkY+ZwQ1G3SPozCJJpQWbhEp4dHhvMezH6KbXaG+synV6kYYMB+bidYpBM8w+
 gPNzcdMo88cshzblHGTeb5yC9r1SWIIwKhdiiaJ2AAoXLKB/5U2rYr5hiWiH2RtFYbWu
 WT1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JEJ0tI6f
Subject: Re: [Buildroot] [PATCH 1/1] package/bcg729: bump version
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
> This bump includes three patches which were added since version 1.1.1
> to the cmake files:
> https://github.com/BelledonneCommunications/bcg729/commits/master/
> 
> One of them fixes build errors with cmake 4.x:
> https://github.com/BelledonneCommunications/bcg729/commit/e29952e7ceff64de6fc6f8db43e3b326481280be#diff-1e7de1ae2d059d21e1dd75d5812d5a34b0222cef273b7c3a2af62eb747f9d20aL23-L81
> 
> Fixes:
> https://autobuild.buildroot.net/results/118/118349d20eae2dccdadab949065f6bc6471c825e/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.05.x. Thanks

> ---
>  package/bcg729/bcg729.hash | 2 +-
>  package/bcg729/bcg729.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bcg729/bcg729.hash b/package/bcg729/bcg729.hash
> index 2eb80a0407..13edabe99b 100644
> --- a/package/bcg729/bcg729.hash
> +++ b/package/bcg729/bcg729.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  68599a850535d1b182932b3f86558ac8a76d4b899a548183b062956c5fdc916d  bcg729-1.1.1.tar.gz
> +sha256  62812779c776620f8fa005fc7c6ae14039d7b2efce66cf9af69c426393b5d062  bcg729-8bec1e5fc072f3669e435edd137eb3da6da2eef7.tar.gz
>  sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
> diff --git a/package/bcg729/bcg729.mk b/package/bcg729/bcg729.mk
> index f89e535546..d7608447ee 100644
> --- a/package/bcg729/bcg729.mk
> +++ b/package/bcg729/bcg729.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BCG729_VERSION = 1.1.1
> +BCG729_VERSION = 8bec1e5fc072f3669e435edd137eb3da6da2eef7
>  BCG729_SITE = $(call github,BelledonneCommunications,bcg729,$(BCG729_VERSION))
>  BCG729_LICENSE = GPL-3.0+
>  BCG729_LICENSE_FILES = LICENSE.txt
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
