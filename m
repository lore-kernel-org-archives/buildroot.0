Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780A8CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4992660E37;
	Thu, 11 Sep 2025 19:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKHstM9-Mhn7; Thu, 11 Sep 2025 19:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C02C61CB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C02C61CB1;
	Thu, 11 Sep 2025 19:22:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA3AAE20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC4D340896
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b06rKXX--GK9 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:22:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7FCE41F17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7FCE41F17
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7FCE41F17
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:22:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b042cc3954fso206211766b.0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618546; x=1758223346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EO0EcInhM6eP1BTNtNi9x8BJiPYi6Muzz35hxK2pbS4=;
 b=czXdaczkTsM0Soo2DoUAOWyOP3nGdNnWM3QgFznP2+pp1VH2ir9ynUDfXlYjNw6q+u
 X2VFNy+FKqV9P6+9mxAZrX6+M5nmE2CDY4NsutiIC2UxjgMiD81ot4uqFgWbZv7gYiAi
 j48AE0/sYNGfPwB0RYxtucoXQEIuoGYMRv0hjiobkEYpIZQH9TDW/hDtN9nqCQ+tWMM9
 HhN/ptX602gD952EJhUWjHiFMHlAuemElAVs9AyK4fNN4dEBV+cp6a250eA8a7YxK07i
 BP1wCrn3EIUgpDX0AepxyLfNu4dtwUrwGgmUbjtEzlvVsTItMA0MdwaT7jf045aqBU/b
 XzcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8bOM9Ssql2fOosbYSOSJ/0FB5Jx8ukKDKgNEN4TQlXnUeDWLBh+GuiQj5l97QPWrk0ig5wWEbzBw=@buildroot.org
X-Gm-Message-State: AOJu0Yz8uTqJINvA0c315h8h10koFXpB3YOlST7jBBRJDGSIXrKwaIuP
 sQntpNdD7yNs8xrJ1jFh3hhIE4W7r2rTrgCImfFTg91yaTGenmw42jBj/0ygbk7zuH77u88ZPla
 JWmOXjiE=
X-Gm-Gg: ASbGnctcarPSqIgG7rVIVKuM/kFPK9QmoDx1f1zUb5Uq98BuwIUEUrGeaOKsyLXn13u
 9P90pdLSCdIZesPjDdFXakMy5Nlym+cz+J2REmOPTxCstv1sBYGFjpS/b8M1NLuJQPowmBYxYde
 btmsF8QBEudwspxmdZkhwSL8UOvwL61c/VEIcD15KZlRtIviDjZbOIO3iCXb3gQOBCU/NSVe4lb
 I62H+qyIfJIExu1GbHPdeWXlPgjF/tqs4KDm9jRzKzgrbISmIftxcjKC1qUH9tWV7SydnAsivQ5
 cVbAfnBLp4xiyDgYBfKlolY1YDv66VkLA0aKNRGB1uTvEWOLzFbmsTJ41zrpymPeQ6+yLzCfjLk
 es1230yxqc5TWlfLsFL2zsKpJHFaTQo2LOxsRNdRxee1r3jg=
X-Google-Smtp-Source: AGHT+IHS/Ve0h4UgwGr+X8AtD6QNE2wKUJ0WXsq/OY8DKeWXJI00ayc4xAbPol39EuJLsSKuCOiCRg==
X-Received: by 2002:a17:906:f5aa:b0:b04:5e64:d7db with SMTP id
 a640c23a62f3a-b07c3863514mr25565566b.54.1757618545371; 
 Thu, 11 Sep 2025 12:22:25 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dcf77sm189818566b.64.2025.09.11.12.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:22:25 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:22:02 +0200
Message-Id: <20250911192202.2671620-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829145902.3013340-1-peter@korsgaard.com>
References: <20250829145902.3013340-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618546; x=1758223346; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EO0EcInhM6eP1BTNtNi9x8BJiPYi6Muzz35hxK2pbS4=;
 b=S7mrckavddeYGsS+y5GEbwjTw7+brVp9Aa7Y45kOTdztUnxC5UwsxA18KIPudf8cL8
 aeZGsBP2hGCu6HXEFulioSmWKK9hkjI70rKOQMvj0+SbB1n/e5M9B2XIOfjfTmCM3EKR
 naszwllUg53axDVKz1lt7WJLjAvHVKIddqdBiGK1VRxej3S0zy0pu0hKyWJNFx+ZyVj8
 I+VkPQOOilPxdyhRpaB0fWGh/dYMCXJ3SF9XO7L/fbGXilfdYxnU6VA86+Xuq8Cw8o1J
 dgrP4csXVYuBsLE+EfGfINgf12JhKgb2H1GO/3ve0bMZGWvRqGNQDFcEwFsDKh+VWqth
 UKJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S7mrckav
Subject: Re: [Buildroot] [PATCH] package/netstat-nat: remove package
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
> Fixes http://autobuild.buildroot.net/results/bc52c072121286ddde3eee98ac28feb98f33dbbd/
> 
> The package has not been updated in 15 years (since commit 60ce1b0842de
> "Bump netstat-nat to 1.4.10"), the upstream URL is gone and the package
> fails to build on modern gcc versions because of missing prototypes, so drop
> it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  Config.in.legacy                     |  7 +++++++
>  package/Config.in                    |  1 -
>  package/netstat-nat/Config.in        |  6 ------
>  package/netstat-nat/netstat-nat.hash |  3 ---
>  package/netstat-nat/netstat-nat.mk   | 12 ------------
>  5 files changed, 7 insertions(+), 22 deletions(-)
>  delete mode 100644 package/netstat-nat/Config.in
>  delete mode 100644 package/netstat-nat/netstat-nat.hash
>  delete mode 100644 package/netstat-nat/netstat-nat.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index f761c9063a..19bd948e15 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2025.08"
>  
> +config BR2_PACKAGE_NETSTAT_NAT
> +	bool "netstat-nat has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The upstream URL is gone and netstat-nat has been removed
> +	  from Buildroot.
> +
>  config BR2_PACKAGE_THTTPD
>  	bool "thttpd has been removed"
>  	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index c22978408c..f2ca1cde7d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2597,7 +2597,6 @@ endif
>  	source "package/nethogs/Config.in"
>  	source "package/netplug/Config.in"
>  	source "package/netsnmp/Config.in"
> -	source "package/netstat-nat/Config.in"
>  	source "package/network-manager/Config.in"
>  	source "package/network-manager-openvpn/Config.in"
>  	source "package/networkd-dispatcher/Config.in"
> diff --git a/package/netstat-nat/Config.in b/package/netstat-nat/Config.in
> deleted file mode 100644
> index 6afcf89e3b..0000000000
> --- a/package/netstat-nat/Config.in
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -config BR2_PACKAGE_NETSTAT_NAT
> -	bool "netstat-nat"
> -	help
> -	  Displays NAT connections
> -
> -	  http://tweegy.nl/projects/netstat-nat/
> diff --git a/package/netstat-nat/netstat-nat.hash b/package/netstat-nat/netstat-nat.hash
> deleted file mode 100644
> index 7530b8a09f..0000000000
> --- a/package/netstat-nat/netstat-nat.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256  e945faa283a49f33af15de915a949c9273a230fc17154925364c547adab676ca  netstat-nat-1.4.10.tar.gz
> -sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
> diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
> deleted file mode 100644
> index 0d16579a6a..0000000000
> --- a/package/netstat-nat/netstat-nat.mk
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -################################################################################
> -#
> -# netstat-nat
> -#
> -################################################################################
> -
> -NETSTAT_NAT_VERSION = 1.4.10
> -NETSTAT_NAT_SITE = http://tweegy.nl/download
> -NETSTAT_NAT_LICENSE = GPL-2.0+
> -NETSTAT_NAT_LICENSE_FILES = COPYING
> -
> -$(eval $(autotools-package))
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
