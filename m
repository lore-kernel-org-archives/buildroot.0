Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAA7C7EE33
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8D3E6128A;
	Thu, 26 Jun 2025 19:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTRLulJ1oVdJ; Thu, 26 Jun 2025 19:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0A596126F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0A596126F;
	Thu, 26 Jun 2025 19:56:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6115A154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46DCA612A0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdkJAS3VGsdV for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:56:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FDD861220
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FDD861220
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FDD861220
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:56:21 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-453608ed113so13661855e9.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967779; x=1751572579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vI5wt8yBS0wGCKLCQd8JAAzHbyCe83UC7n0LeXOFD0=;
 b=e+W0oDcGad6tHlHKNjF156IaF68EFQ5G+oArCjg7in563I4MB9K641Cd7YLk7lMjnr
 wq8/jJwMpkxd9IBwkiLl66c0bvj1XAYTVdwp4SSj2yDrGTHQqd9W+c8G3a6nHM3HnJKT
 mWi/mn1r8H7fSP+ALfrDPGQBdNFnoZrNwhn9Oj4MK+LphgtIwYyEsvWNlI9EF4+hrD2S
 B3K1RjNYOlZSzptMBR55eeKDt6fPRu979Qemv6kD1ZEax3xRUn2HCRhXicQ2i+q2xbe4
 qGPlhW1s2DoOM3uX+GA2t+XUpmKPYZCOAP4xqhCnXEp3QrZ/2NAUcANadRdTRmEyNK2g
 Sj2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5GOv8vFlHC69D121vXAnkaBrgG5MsXdANulHM/mi/son9I74qupZH1O4DkVvXyhHLXmsZee5/8BM=@buildroot.org
X-Gm-Message-State: AOJu0YzTbfg9329A4uraBOygUW0vBiGgtRJjv7zUOWgNP2DqWpH+wV1H
 y6xk/srHDppooSZHAemd+T1VE6SwFpDZQgbS9VFi5/aK5cyyFqgRGiwvnBg/Tz/N3ew=
X-Gm-Gg: ASbGncvc9YJ+EVzp2gBt99Gl+z9MzfSNWjEtm7cA286JT+beGLhHF6XFZuoArY+rgR2
 0tTLPvCDA3S84PmpoAlV68Lhz37c+FUSVwgfbQCH+6nkGwPjGeyoAUzTxQMBl5HCUsIkyOt/j8u
 LAXVtRj6ogyrE7OFvt8jDKrEgF//L0Kn6NlhJk4ZHf1q07cbnQAaWE4JgY1hj0rn2vhm6sLK3JL
 ppaiU7mHkav+EblvkNG8cnHaHwWXobLUDwmBHMFyQKzWxZZokpgXdByVXi3T+jUr6LV4BT/+dwC
 IzLIvgEtVjIrN5hPucEGZbqP+jExvwjdZx6spdRuDd7Z4jAg3vv8LBmRQeWgAiQnt+F8cMxf6/B
 Yw6dEnx56BYoHn72upcm+oBKscmMq8G22u0oYtq+kfKA=
X-Google-Smtp-Source: AGHT+IErLdsW30aKuljBfLHDw8ATM3JxZpnQ6BuBk9NemEoCFcoms2YNBcXZ+SVTrESO4J1Xku6zUw==
X-Received: by 2002:a05:6000:25ca:b0:3a4:f744:e00e with SMTP id
 ffacd0b85a97d-3a8f4548f84mr773877f8f.4.1750967779362; 
 Thu, 26 Jun 2025 12:56:19 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fa750sm737062f8f.25.2025.06.26.12.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:56:19 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:56:10 +0200
Message-ID: <20250626195610.16374-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250622100333.3836532-1-bernd@kuhls.net>
References: <20250622100333.3836532-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967779; x=1751572579; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vI5wt8yBS0wGCKLCQd8JAAzHbyCe83UC7n0LeXOFD0=;
 b=S5EKwUFabfN4511+iSu8kcNdr4SVvM8E7/WCNXsoZxOfFxoB3LzB5TKZzYJGZSGmdv
 AYzLIgIH0D4B5+icHddN6iV6AtNHJAND5rH42ONKfr0RUgynR2uA87Ugnq35jnAEws/b
 /6M6X7P6fnxtJWNNjXqJwC9IcgAn7HwP3Ru9G7BydXslBimSfcc4+McAvvkmpAfwI4Wr
 JpAOBTFINwDZfyMfB5bOpI33wmlC+HwR8z2A9X6J46IlvrVtVnInRMCGvjylzTsgVFCI
 v5P2e7fVpzFN4DbqMcY5m2pGzqQkCxY19qaNii8bhhIOq8LY5LDRX6rv1qmuVRlr8Iom
 iklw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S5EKwUFa
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump to 3.13.5
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
> 3.13.4 fixes CVE 2024-12718, CVE 2025-4138, CVE 2025-4330, CVE 2025-4435
> and CVE 2025-4517 but introduced some regressions fixed in 3.13.5.
> 
> Release notes:
> https://www.python.org/downloads/release/python-3135/
> https://www.python.org/downloads/release/python-3134/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.05.x. Thanks

> ---
>  package/python3/python3.hash | 6 +++---
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index b13f5cc742..2ca8ad4930 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,5 +1,5 @@
> -# From https://www.python.org/downloads/release/python-3133/
> -md5  8bb5f0b8c9d9d7b87d7d98510e8d58e5  Python-3.13.3.tar.xz
> +# From https://www.python.org/downloads/release/python-3135/
> +md5  dbaa8833aa736eddbb18a6a6ae0c10fa  Python-3.13.5.tar.xz
>  # Locally computed
> -sha256  40f868bcbdeb8149a3149580bb9bfd407b3321cd48f0be631af955ac92c0e041  Python-3.13.3.tar.xz
> +sha256  93e583f243454e6e9e4588ca2c2662206ad961659863277afcdb96801647d640  Python-3.13.5.tar.xz
>  sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 3e6273a773..ec210ccac8 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.13
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
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
