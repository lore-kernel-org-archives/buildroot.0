Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8F9CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D9DE61678;
	Fri, 15 May 2026 13:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1kUSBFiV4Z2; Fri, 15 May 2026 13:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 672E56157E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852080;
	bh=B3u+rgmOevSuikUzcuqzDstPhEhQm215My7k0e5TBd4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fC0GFZehHhnN4ukRX8zexOvb4aqgWKNPzL8v6/ojZUxrmFsyNmQTFy4Ef9oK3BroK
	 qh2HpHXi1bOdU5ve0YIQ0zYUUmzIEBGV7yiEuRa1B+IEjPNIOpcdRmq7UfatvnP5bf
	 Tccl2XVJMgmcB4SrQirXl5bYqb/hjFuGTS9T7++5NjBXVAIcJDEyeJCqDwVM7KJYpJ
	 rSlWKyjGE/M6NXWQc0xJOqoGnyDe1nfTfXYca/a7TLP/Ho38s6x9cOPBCNkFo9/Kaq
	 opEJK+5mrScyFXipjd8+TBDcIG8TKVEs9NLS9dY0pTj22+uQw1VHzOsgwwVJNUyRIZ
	 VuC74mwNZPQvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 672E56157E;
	Fri, 15 May 2026 13:34:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 517B536F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 428F440E9E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mshadOtv3I0J for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6FD2C41570
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FD2C41570
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FD2C41570
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso62849425e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852065; x=1779456865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OJBGSD6lzB5CWKXpEcQZDaRhbYaAuqSc9nfaRV3oybw=;
 b=OuPK2klJgFPOZqMeARVVKcpv9DSGztk6/dVsuy7rAVRIS/mP0NiyfjE5AVZ+aOa9gn
 +Hswcv4stKOMTOnqAKPUVa9EXEnhqZB5EbTJrCynoLOL+ur/vRIOdaCDWcDva/7+8yq1
 5eKQ4Cq3TuGseTKYHZxqud2rvyhSTHlclDLNKLw4atDAaHnb/eTsbEHMut+L/NuU5Qkg
 aMUUpr5soBBbK9BGqeUeWy4KZ0LtjjtkZtnZaRNchjUqXmscyL7/xiaLL0sPnDoTikke
 PX4RhAehz3t3qVsM3vwBgpRrmBtS5z962oi0gV/PTYeRaVvY6pMfVV2r+gq0/JqS2qjH
 WCHA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9sYG/sYnMg4VdETaGAduayW5otnxAJ0a6XCXl7MHM9OZto23+lsERSzn8tJVGqB0WBQ3JmTHodS5c=@buildroot.org
X-Gm-Message-State: AOJu0YyJtrpWzXWwIoF8XDU3ZSEhsYJ3vLw4bVulHfqF61JmjtmqJFVO
 uFdcYgfiQUS2+xm8dBnrzYNUoGjCEGJrv/MRd5AQVOca0EvFj1FmVva3ODBhhCzl6kLNVnF0uys
 v4PWl
X-Gm-Gg: Acq92OHPbIf7U+TfZZTVJ2mvqKTGycGdr7j/ThMz9VEv2xR8lv5uvc7A/DTQ7tOTQWJ
 vwPiXjOruOMvdQDn4lC2CUF/si2roDE7SHLtaUQMzE0gQBiBbDCf63Azgw/Pu4ChBqipF7CuaRv
 jxCLwF4RnE7CXWTmh63X8GQVz4Gk5EDhdQK7fIFuDryoVHYblVBM4+uJ0E8iXabKJ3GjOBqWy/5
 BOFNZV0GjP5QwgYacV7ExREKBdgl3QGfz5F8aKqiY3x2tLJxfrqd5O7NwRVZRxK7c037++sNI4V
 ty8sqwTGs52URc5yVz5PEhA0/lTjdgtV1i3U98mX5+nvURlwaDZE+DBAg/ZEcKIk6um75WRJD1q
 T6zd62oVW3Tmzk0QD4lNqvulrclaJ+6pUdykTHhAd3oHQYQfM0sNYr4iKHL9ZGcWSJj2UBqWdYP
 bK2VFa89X2EtcJdyBPO8XCGXH4sCg3/xbtEwh64TNSMXllcuycsyZtb3Y=
X-Received: by 2002:a05:600c:c096:b0:48a:563c:c8d6 with SMTP id
 5b1f17b1804b1-48fe5fd4b51mr40671565e9.7.1778852065511; 
 Fri, 15 May 2026 06:34:25 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe537720esm70963855e9.9.2026.05.15.06.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:25 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:24 +0200
Message-ID: <20260515133424.317261-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503060906.600090-1-bernd@kuhls.net>
References: <20260503060906.600090-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852065; x=1779456865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJBGSD6lzB5CWKXpEcQZDaRhbYaAuqSc9nfaRV3oybw=;
 b=D/Wpx377mWPw9vhXq2HUc5xZpJj0lyFR8RKIEtWy78v8856KBqq6ysh5v2sg64uhbt
 bYUDvLNFPDE5Zk8ldV8OLcMy+selCe0QLqLwCThqspbtoyw3hLsm3abyZ9IrEeOmsUwO
 quCkHM6eoqVI4LMILikrHk+tu1H+C4mW9EWXihhqvCr085WaJLMTAWSF2ILU/Y7H9hby
 Rx6aPUQNhSB80npCwJ+MaQIzdEGNWo9rSoV3hcQVCs7LiDp1B+scwLMc8IZ/gttHM9Ju
 DOuWfQHYlQo+KADTvaqAPkvYu6W04tJ9s2dd4ntG0FXyiCIa7Tc3CnECEdmQQpxnGKRg
 ZBDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D/Wpx377
Subject: Re: [Buildroot] [PATCH 1/1] package/libsodium: security bump
 version to 1.0.22
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
> https://github.com/jedisct1/libsodium/releases/tag/1.0.22-RELEASE
> https://github.com/jedisct1/libsodium/releases/tag/1.0.21-RELEASE
> 
> Updated license hash due to copyright year bump:
> https://github.com/jedisct1/libsodium/commit/80c6bab4518aecd197d830c145b5d23e9b932ea3
> 
> Switched to bz2 tarball provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libsodium/libsodium.hash | 6 +++---
>  package/libsodium/libsodium.mk   | 3 ++-
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
> index ae4765a2ab..ef982ea759 100644
> --- a/package/libsodium/libsodium.hash
> +++ b/package/libsodium/libsodium.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking Minisign signature
> -# https://download.libsodium.org/libsodium/releases/libsodium-1.0.20.tar.gz.minisig
> -sha256  ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19  libsodium-1.0.20.tar.gz
> -sha256  43964d976a6db3fb986af689d05f8ca0e9971878bccae709750dac8fdc4a99cf  LICENSE
> +# https://download.libsodium.org/libsodium/releases/libsodium-1.0.22.tar.bz2.minisig
> +sha256  51b93737bf62e8549b0e94dce0fba92169e31c8ecc160883460a9bdaa6d2c298  libsodium-1.0.22.tar.bz2
> +sha256  508a76d186356c0dd807a670ef510964f8724557024796a2c426c6c0e19ab683  LICENSE
> diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
> index 7dd763e145..5f62a66246 100644
> --- a/package/libsodium/libsodium.mk
> +++ b/package/libsodium/libsodium.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -LIBSODIUM_VERSION = 1.0.20
> +LIBSODIUM_VERSION = 1.0.22
>  LIBSODIUM_SITE = https://download.libsodium.org/libsodium/releases
> +LIBSODIUM_SOURCE = libsodium-$(LIBSODIUM_VERSION).tar.bz2
>  LIBSODIUM_LICENSE = ISC
>  LIBSODIUM_LICENSE_FILES = LICENSE
>  LIBSODIUM_INSTALL_STAGING = YES
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
