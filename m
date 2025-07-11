Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6DEC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2289360EFB;
	Fri, 11 Jul 2025 10:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxYYiOPVrx83; Fri, 11 Jul 2025 10:45:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE9F561540
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE9F561540;
	Fri, 11 Jul 2025 10:45:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0D171E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2C3240510
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3N9Ib20iLfrm for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C15F240094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C15F240094
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C15F240094
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so1821288f8f.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230707; x=1752835507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O98UiT+a6RMvwMnTcDANFQTURsthzYEeGRNQ4HA+S+g=;
 b=V2WosxfFxSokuJCUYFVzDXpXoyfrP7SgKlHiyn97+7JJu5p8VC6ZzTorbTXpjiVnbJ
 MIVtYLFGLTlbyVhgKaUaWMyHhY11SP4cdEVYT9Nl3lV7585rSqUqXuEUvTw0Sg0HAJiQ
 G65LBT6ZM2ZbFoPbchhMOOYi5dCNGDOl2OlucTdmyhnG0MnOstGo6a5N7ZurHCMlcPgp
 0vWMZt2y5MjYuf2Dfm70t+UlAzeex3rRn63UL66nRqLhHcxRWSYmnf0Gp2t3WXgMkI2F
 NubgsqAft4NJPqgmryqdYiN5F8p8VBW0geF+fEDIvbUlmxY+AM7h7lrIZBek4z92kXH1
 qbYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKQQ2n2g74UTCHRb4THgQV8lFQvkcyocRKfJJweR7ZNYBaVuwFfb3iLFoVOyxL5U408XLQBFgCG8E=@buildroot.org
X-Gm-Message-State: AOJu0YzjAOuUUJ2qyNKM+hMfn0yF88OTmkHwcDNL3vLG8t96Xtg7RuZq
 3a1nHFGnjdW0ZsXxUJ3CRsvSeVnHMV3Htkpc/+Buehei71KM9V+RBOdlnuIuxcVKfyQ=
X-Gm-Gg: ASbGncsGt5upMcdWBAAC9jE/ZiW/yeueTSabJUJcO1YLNzuIPWy5UJDcASNPK0Znzk/
 VouEx7BKLjWg45l3QBqpP5zd+DFpj20NW5MyEcXncK5rvFRRM6+KOGYN4IXKeqGwCoQmBCSGF20
 n2Er006ZV1krBUm55hnyKj2qpc5tBHfWHL6/qNMFsMKwJvceHczTGUSUPAVTiPVLnUY6a5+pxdq
 z5TfcwYVkeq4NjbozFtDxhhcWxueCVwmO8QcYZHR/+JGLJ8hL74lE03aWuyvUarHwGlYj42oOBt
 9QUu2NuPzLX4X8IWcrTFBlzdAepvMz2l8jD53EEBHKHQf3KqFyQz9SC4Qo0/PFwv6QQIBCfwOUb
 etEwFLVCNsoB0siXYMsATZTRb
X-Google-Smtp-Source: AGHT+IF7uhPiMDvMcnivbM2ZrTXw4dmWe4I8c3X3oHSh//OuSDGwifVVHnMob//ywxEpMQnh7jjZqQ==
X-Received: by 2002:a05:6000:2d03:b0:3a5:3062:793a with SMTP id
 ffacd0b85a97d-3b5f188ea4cmr2161535f8f.33.1752230706878; 
 Fri, 11 Jul 2025 03:45:06 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1736sm4180737f8f.15.2025.07.11.03.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:45:06 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:45:05 +0200
Message-ID: <20250711104505.824628-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250704165437.3687660-1-bernd@kuhls.net>
References: <20250704165437.3687660-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230707; x=1752835507; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O98UiT+a6RMvwMnTcDANFQTURsthzYEeGRNQ4HA+S+g=;
 b=N1ONOEHkduUQUds+9mB50kbVSJZeLtNTCXzNXxSAMZpNkw83yd3EJX/r66UyoUdQ2z
 t01P/TrulkABH9e2ZpKHnsiEB/D9LkcCCfh2i/0BcjzU8Zl97z1OT636VNzYsYhlq5ku
 Zs8JKC8VyZR8pZ5ULH5NhcPXRh46A6Zd2SbCC+hAgO3Xh78K2DzXvrFiA783Dvz/ICeB
 JKDSB+4Mre9GU+cHofiI6U0Jpizsnb4WN+KJoB/c57kHgT4bn36PRgqp8g6F/Fd+sBCq
 Zg0xlUCkgkhSMKCBJcq5gkkoQj8YtmN89435ZFp5Y9MrNQ9EhXBpAfewtk3mrVVK5aKw
 NiZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=N1ONOEHk
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump
 version to 3.5.1
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
> Fixes CVE-2025-4575:
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 9f8b23005a..1675d72fb2 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.5.0/openssl-3.5.0.tar.gz.sha256
> -sha256  344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0  openssl-3.5.0.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.1/openssl-3.5.1.tar.gz.sha256
> +sha256  529043b15cffa5f36077a4d0af83f3de399807181d607441d734196d889b641f  openssl-3.5.1.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 5e785e1bf0..f3521b3cf3 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.5.0
> +LIBOPENSSL_VERSION = 3.5.1
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
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
