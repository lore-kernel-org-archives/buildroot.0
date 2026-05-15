Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58EDCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDD3084362;
	Fri, 15 May 2026 13:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXdqEwW-tshs; Fri, 15 May 2026 13:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF6B284364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852060;
	bh=UAPQIRgRzoc02TLZBj7prJsxuVNb9WD1nOLDJ1WQpeM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nX7AO+bQENijYptOsgmn4kM58vNhBtWBEAmESFTShE9ZjbfMJPDxBym8rr76En5B5
	 yT0fSK4nSe+/7YbIZtyUMO1I5aCsrrCfHDGuAqZbD1x0Ad6yjM53v6zID5iptoL0D8
	 9NSEKotJ3+CQn0y/bLnYpC97pkcJp2hsEiF7v9vHc5XPV7DZF0J5fJTuNQOGxg5rDU
	 k5y58WxE1etS6GimqSBeVDCjgmBRvRJBNZVqp2f+nTrFryLadCJd0r88jwFsE4jPvu
	 Qt/9k0lftuPuJlZAvU8rJWf7wLesK5XKjmqY3F/Cb4nChWddNpuGdMlbov34gctEop
	 Ezo7JOK/OanVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF6B284364;
	Fri, 15 May 2026 13:34:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 170EB36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F05C340E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpKuKSnbb1H6 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16BD640E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16BD640E23
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16BD640E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48a7fe4f40bso105509195e9.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852054; x=1779456854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eSx+7xWT/VHtBdbG/uGc4qMU5lvtBeKH40g1XnkgimI=;
 b=Rpe5UM9ItD73J1S2C3pR2EPX9Cd9KhAN6gSzohSBXndiZ84qTfvRdmENz8Ud6Q1DVl
 rP2jn5E82m3+eKlJammebkyTxDOyWnOH0udqsUgvSrNsn2KuDUXB46PGRUek/Vpq+tgu
 XndtJnUm97ju+CTtHnR50Rll5RJ/+3CevSQGrLNta5d50bKpZj7UIXCJFlph47fOMP+r
 f0W/ylTung2E4l/u4EdSAEwd/GCNwnR1m2ItlG7Nxo9FvqogPmHjC5spUXMNxYnn0pXt
 jJ77SVYrrsLp1o+FRoKJBE2u9GEbns+hfy7Um9uWOjhJqa0+cuwPnuh7TF9x3a1XxWWk
 YQ1A==
X-Forwarded-Encrypted: i=1;
 AFNElJ88YwStSPdprzIniINhQjGutNHcBCcMYngUY/n8KMcvy5xMSsVC6+LXDnZyzHyAH7RinM717UxHgNE=@buildroot.org
X-Gm-Message-State: AOJu0Yxyn9cCe8pYGCz3cKdhmK2T5/TVsHdJI3GNZTnUIPjXRePvkGmB
 11/FAQsc7pwLll7Qm/e9Bqs0hkAvU3sYx7SEA44sq9XNN3l/t/2X+mprDO0P4jAK4i4=
X-Gm-Gg: Acq92OGTIQCmUoWwS0LqHnwE6zNgw9WIhp0tBkB2X7T9IkqZea4259ZVyipuv9mFo7K
 qkUU69kLy0k56iABZlFgXBc5HOiKVfBWr4cj04tcIYAXUMzmIe5cAd0X3gIGxKWXvcrnDxxqTbG
 vekzJAuVaP8QccelMnu2RCZ7qVLlZwNs/Xp5IqeF3Tv0zWwA7oKwikxYg06mBbIS061lAiXMWlm
 Q894PLZRV6GD5BPzIr2pG/bKk/ri0Xzcs2FSFF5nXo52C74Z4QISvg0MDvkbPWyLHHpxksoLEVF
 c5XOXsrFsIk/SX/lovAtb5GCfEc47jh+Kn7a6DE9eZOVuqsSHZzQYzT7CIEK8ZeEcUCVF4sHdum
 q1G9UyIwIUhzm8ER/A4FVBOKIWwbsopfLVmibvJ9IXXpy3f0zmhNV4xV9FgOzegr68agcpimuvt
 PJYrL01uGxeN/isYjA7lse0653U/O39P5SIIxnP3hCcaVj
X-Received: by 2002:a05:600c:c10b:b0:48f:d612:3c59 with SMTP id
 5b1f17b1804b1-48fe60eb0f6mr38896315e9.9.1778852053873; 
 Fri, 15 May 2026 06:34:13 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feb00e5easm15494935e9.13.2026.05.15.06.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:13 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:12 +0200
Message-ID: <20260515133412.316558-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430045109.59810-1-bernd@kuhls.net>
References: <20260430045109.59810-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852054; x=1779456854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSx+7xWT/VHtBdbG/uGc4qMU5lvtBeKH40g1XnkgimI=;
 b=Nf75P1scoQnI0b1dN9FMNrvaovUHvdbbTKvxiwCHx+m4g+sw40U0/q3u3eeX2YbcCh
 8WWcTrbDet2MvD9r44enRYwjm/L2qg/aDw5GnVmo75byJKiJVeuHD9SunV9Yd0IGai6A
 9E/TNmiydnuPl7CR1zfJ+wQ3cPGQwLX2YNTXnWfkCNCJv5xqxUIoNXjtE0BDSrDq9LiG
 0om+XNTYIctWHEGnlFrrwn2nfwyoJZndzDWMLrr7s0OkpWWnAZicfHShgrMysfFvTGhf
 sDcL8Xhmz3CpGuU1BL8QcwNq35NgTPG63WQVZulFT9sIyg8YpI5rVnwpuSlInI9lTwlb
 UY+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Nf75P1sc
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: security bump to
 version 3.8.13
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
> https://lists.gnupg.org/pipermail/gnutls-help/2026-April/004922.html
> 
> Fixes the following CVEs:
> 
> CVE-2026-33845
> CVE-2026-33846
> CVE-2026-3832
> CVE-2026-3833
> CVE-2026-42009
> CVE-2026-42010
> CVE-2026-42011
> CVE-2026-42012
> CVE-2026-42013
> CVE-2026-42014
> CVE-2026-42015
> CVE-2026-5260
> CVE-2026-5419
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/gnutls/gnutls.hash | 4 ++--
>  package/gnutls/gnutls.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
> index 209b6aa220..99a721d208 100644
> --- a/package/gnutls/gnutls.hash
> +++ b/package/gnutls/gnutls.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.12.tar.xz.sig
> -sha256  a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51  gnutls-3.8.12.tar.xz
> +# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.13.tar.xz.sig
> +sha256  ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e  gnutls-3.8.13.tar.xz
>  # Locally calculated
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
>  sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 0844bfe50d..6411a7d621 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -6,7 +6,7 @@
>  
>  # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
>  GNUTLS_VERSION_MAJOR = 3.8
> -GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).12
> +GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
>  GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
>  GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
>  GNUTLS_LICENSE = LGPL-2.1+ (core library)
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
