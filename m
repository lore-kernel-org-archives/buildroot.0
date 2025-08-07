Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7038CC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DFAB405C3;
	Thu,  7 Aug 2025 18:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xw2PVQnh7GEX; Thu,  7 Aug 2025 18:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A3AD40563
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A3AD40563;
	Thu,  7 Aug 2025 18:25:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E9FA4C6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84CF240590
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUfNnPouNosC for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B5D040595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B5D040595
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B5D040595
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:35 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b79bdc9a7dso727594f8f.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591074; x=1755195874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=An6BA/G9Oemsys5lCPRz7unYBgjx8HMKsiasB68DsYk=;
 b=vO1lN7UTW7f5XrCXjttqbaauiPZUQRNFs1o8zsQBhZexe53MxbQZHwFpcPziOdjgnS
 K3Q1zOluOQ94Z2fGDOkcCPiSlqE6uqoX4PiFq9tuwvVbMuJCS/lXp9QIQX28GS7I+inl
 PpRAyLA42Qkb3LHOPNpQJmTj/HdtKL4csOtMjCuAnOjceLFKGayXw7AsK78iIPKQTdx0
 ZXyyEp1876HShPm/ydNp+P3B6KVqY9+Hzeh5zvKQAZ1yPRWS+T2pYpv5WSdu50ttSrqu
 fyv3IE3/uWQqYebpeKnKYrXc7Xlls90mBfqHsUVSPD2uRl1KpQePQVuGj2kx2LdYL2Xe
 gPBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1BZmtePc6VAurrKAZL01WoFen8jC/WxKPK5ysex5/5AZuT8QRbwjSaVs48tO/cTpYqLJN6cyUVDQ=@buildroot.org
X-Gm-Message-State: AOJu0YzTUeLwOJfsUSoB1W5pKAO4UXm8Mvu4c1+L2JQzSxgtLBWfWTO1
 R9Zy5dG/9cAVRERX6uH/lyUFndEFHSqNE6h9XRg1iPrNTDX1p7Lj0KoPPaXmaedKiC4=
X-Gm-Gg: ASbGncvCnKpowbV7KgZjuTf+xl9qMpBjcObyn0+d8u/uo/IwfU5HI4Ou3d/4deO989u
 EoG966kOafvx+SUrbZ0Xm0k2nSk5T36Mc69vEP+Qqa7ZtDC/foaeOT5qnRQYfxddKqA+M+bQrNi
 rIVKL3//sHwe4ckOniZNTz/YetlOGj8QuK3QO7K5j+HevXrA79/+l0MKOwMNhvMcOw8aarA14fn
 RhrtxpNQ1MJUL7bpSoCxYJGD7rrxXStqUU9+qkMfFTczhaKF65M4UCMQ75QXTxGxcIcUa0LTIl+
 t+qBQp4g3ec8eiOvmSkVe6kt5i7AgGNiVoO7HH0hkqBYNqHkfbx/nqCSpxpfSpkdmhRqs5znyJI
 aOkplANDpPGu/3peWoh0QD2iW
X-Google-Smtp-Source: AGHT+IGj9YI4juRSoAupo1DVEtvoX5zUJiqqCNokoAChNu1qmFFTPNW0DW6pEzyQCRc8RG02Gtj6ng==
X-Received: by 2002:a05:6000:2287:b0:3b8:f2f1:728c with SMTP id
 ffacd0b85a97d-3b900b74b3dmr185694f8f.34.1754591073636; 
 Thu, 07 Aug 2025 11:24:33 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dc7e1ddesm181590935e9.27.2025.08.07.11.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:33 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:33 +0200
Message-ID: <20250807182433.725625-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726055908.3395125-3-bernd@kuhls.net>
References: <20250726055908.3395125-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591074; x=1755195874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=An6BA/G9Oemsys5lCPRz7unYBgjx8HMKsiasB68DsYk=;
 b=GBHdGWzpQIVdALApZgqPFSLtkfCVx3iVKGtdLWNEAaw8DHlpW8ObBwZlR9CYN0M0Fc
 YQ2XZIjjlgc+zJYISuvAuDI+UnpJ/gMBvDjb2MMyi5rajTa7JeS6OU0/Q9M9ko/gCHT7
 /tzWQMsJ07YK9OaTY3D7bR5ByRJGdVMbvNKMEBCze4XD0NQDDQ8uQtjDmTiJN0yluo+m
 SL8tujYcrchAKQynMi1xVYdaE4eHXhSACsoiC1ZuRfVMhu5AIsZnnNbkNMAKjAVqYJ0f
 /BNGS7l/HFpFcPPhKY9/j+QcJ8mxjWTdVPoxBCgGEVr1FOouMp7THQpWwlPi3vz2IGxY
 4aXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GBHdGWzp
Subject: Re: [Buildroot] [PATCH 3/3] package/libcurl: bump version to 8.15.0
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
> Upstream removed optional BearSSL support:
> https://github.com/curl/curl/commit/08a3e8e19a59d1530bfb208e187ac7c34c978dfd
> 
> Changelog: https://curl.se/ch/8.15.0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  Config.in.legacy             | 6 ++++++
>  package/libcurl/Config.in    | 4 ----
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 9 +--------
>  4 files changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 4bc917ce00..efb59dc535 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>  
>  comment "Legacy options removed in 2025.08"
>  
> +config BR2_PACKAGE_LIBCURL_BEARSSL
> +	bool "libcurl removed BearSSL support"
> +	select BR2_LEGACY
> +	help
> +	  Libcurl removed optional BearSSL support.
> +
>  config BR2_PACKAGE_LIBOLM
>  	bool "libolm has been removed"
>  	select BR2_LEGACY
> diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
> index 0e52bc69c2..b86f98262c 100644
> --- a/package/libcurl/Config.in
> +++ b/package/libcurl/Config.in
> @@ -63,10 +63,6 @@ config BR2_PACKAGE_LIBCURL_OPENSSL
>  	bool "OpenSSL"
>  	depends on BR2_PACKAGE_OPENSSL
>  
> -config BR2_PACKAGE_LIBCURL_BEARSSL
> -	bool "BearSSL"
> -	depends on BR2_PACKAGE_BEARSSL
> -
>  config BR2_PACKAGE_LIBCURL_GNUTLS
>  	bool "GnuTLS"
>  	depends on BR2_PACKAGE_GNUTLS
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index a463e1db4e..2e36917382 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.14.1.tar.xz.asc
> +# https://curl.se/download/curl-8.15.0.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  f4619a1e2474c4bbfedc88a7c2191209c8334b48fa1f4e53fd584cc12e9120dd  curl-8.14.1.tar.xz
> +sha256  6cd0a8a5b126ddfda61c94dc2c3fc53481ba7a35461cf7c5ab66aa9d6775b609  curl-8.15.0.tar.xz
>  sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 51716cd45b..1cfdda27d2 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 8.14.1
> +LIBCURL_VERSION = 8.15.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
> @@ -67,13 +67,6 @@ else
>  LIBCURL_CONF_OPTS += --without-openssl
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBCURL_BEARSSL),y)
> -LIBCURL_CONF_OPTS += --with-bearssl=$(STAGING_DIR)/usr
> -LIBCURL_DEPENDENCIES += bearssl
> -else
> -LIBCURL_CONF_OPTS += --without-bearssl
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
>  LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr \
>  	--with-ca-fallback
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
