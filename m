Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604C9CD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 20:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C7B8408A1;
	Tue,  2 Apr 2024 20:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4Yh4LvYubWf; Tue,  2 Apr 2024 20:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C64A540873
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C64A540873;
	Tue,  2 Apr 2024 20:02:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 598751BF369
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 20:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 539D341556
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 20:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlsxMokqFxvw for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 20:02:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DD2541576
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DD2541576
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DD2541576
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 20:02:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4161d73d873so6846565e9.0
 for <buildroot@buildroot.org>; Tue, 02 Apr 2024 13:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712088127; x=1712692927;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cjGJAlDoaNnigkvzUhvKLezmWPtn2WySB53oLLUnHXQ=;
 b=SfrSfDkYxrR6pulermTLQzlBPoW6REVo2jzF6bhnksLLPfOQdkkwiV2PRwIOVVYObl
 lLn+2u1K/kQoTRjj6K02w5iXafoHgiHHF8YP5XeBTUdDN9sT3RQkqJglgWHLxhC1loAx
 6Haf6nG1pI+wu6iOrl+9x4ihONuaXjZveveKpCyeKrZpye9QrPKuwrluSSvJx7XWV9J/
 ucd8NK13B/yeNuDE/QlVtnja6Z9HIayhOrLCBYmpRZFjuS1dARpFE9PaOdhucOWk5CRX
 Mwru0Hwx6BF2uoNzIP/qK+U+mZVaKs05Dy7HZoHKZRECgsQeiN8yGo2xGR9BEdpjktuq
 EUXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfnxuBO/Pjv+2Lsr2H2/+DWmzlEx1u1knGxusH6rM5Rw/7FBG1ygzYAy1p8qlxn+wZkRVXZKEytJZCo0xahnS/TNkveV983g==
X-Gm-Message-State: AOJu0Yyz6zG3tuItATQNIvvfbXbQEzPGCYtEKa4N3B23Qtf35qj0iXNR
 v1TUDQaR47NF4CWGviEw+jkl4c8qU+TzXZ4rJArYhxRwDa9G2FC0m8cipDTTvFW4c1HLrl3WCpU
 n
X-Google-Smtp-Source: AGHT+IF98blUD0VnNEPztMf16+pRFD3yEz7jKbkg8X0lC2e8F2ymXeKFWWuVwwFVC9F/6bLGiyvf4g==
X-Received: by 2002:a05:600c:19c6:b0:414:623:9c5f with SMTP id
 u6-20020a05600c19c600b0041406239c5fmr11490977wmq.15.1712088126919; 
 Tue, 02 Apr 2024 13:02:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c4f0d00b004161af729f4sm3219179wmq.31.2024.04.02.13.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 13:02:06 -0700 (PDT)
Message-ID: <8896acc8-de89-443e-9b24-fd832d85727a@mind.be>
Date: Tue, 2 Apr 2024 22:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <20240214203845.121720-1-thomas@devoogdt.com>
Content-Language: en-GB
In-Reply-To: <20240214203845.121720-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712088127; x=1712692927; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cjGJAlDoaNnigkvzUhvKLezmWPtn2WySB53oLLUnHXQ=;
 b=M+NN8aVPuhg/M+dHSVLpgpFaw0D6Kdu+r6fFuoknQifv6vR33AAbccFDyFilrNms3h
 x+rRrVoxQFxPE2AYVyFWfW71J2R+QiVyvbd27WLhJYoI94QDLxLnR5EkkaDOEdc8x445
 WluOpZ5lzzR3mlcH2832A3RA1dop5R0MCjAw0nXJivIlY1j4kDZhRWE/McMkiycEO8vl
 UyQ/ibRBwL67n17wJ2Ol/DQta28nqSKKyQ1lGP4ViWnuWzw0U1hv0MpN84ATBMU4eXoi
 NTt6YHjkLdv9QymaCn1ko1dim0PQr/W9RuyefM0e54XhyS+KxctgjlJUC28z9sABfhzx
 aDaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M+NN8aVP
Subject: Re: [Buildroot] [PATCH v2] package/weston: bump to 13.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/02/2024 21:38, Thomas Devoogdt wrote:
> Announce:
>    https://lists.freedesktop.org/archives/wayland-devel/2023-November/043326.html
> 
> Drop -Dlauncher-libseat=true, as it has been dropped upstream [1].
> 
> Also drop the BR2_PACKAGE_SEATD_DAEMON, which was added in
> commit 6d677931284d58ae0e8e001cfd990eafaee5cecc
>    "package/weston: select the seatd daemon", and
> commit 9d6f966f9ad012879bb472896eb35eeda5baa9ab
>    "package/weston: don't select seatd daemon if we have logind",
> as it is not strictly needed anymore.
> 
> In package/seatd/Config.in we have:
>      select BR2_PACKAGE_SEATD_BUILTIN \
>          if !BR2_PACKAGE_SYSTEMD_LOGIND && !BR2_PACKAGE_SEATD_DAEMON
> 
> Here we have:
>      select BR2_PACKAGE_SEATD_DAEMON if !BR2_PACKAGE_SYSTEMD_LOGIND
> 
> This makes it impossible to select BR2_PACKAGE_SEATD_BUILTIN as the -only-
> backend if not BR2_PACKAGE_SYSTEMD_LOGIND, so drop it altogether. This kind
> of logic should be selected in the device defconfigs or by packages that
> really need one specific backend.
> 
> [1]: https://gitlab.freedesktop.org/wayland/weston/-/commit/e3b6ed50f1c3c259c51274c78d08b58>
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v2: Combine and rework git message these two patches:
>   - [v1] package/weston: bump to 13.0.0
>     https://patchwork.ozlabs.org/project/buildroot/patch/20240214075445.1011185-1-thomas.devoogdt@barco.com/
>   - [v1] package/weston: fix auto seatd daemon selection
>     https://patchwork.ozlabs.org/project/buildroot/patch/20240214182931.116813-1-thomas@devoogdt.com/
> ---
>   package/weston/Config.in   | 1 -
>   package/weston/weston.hash | 6 +++---
>   package/weston/weston.mk   | 3 +--
>   3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index db6a78ee8a..1b282fb362 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -19,7 +19,6 @@ config BR2_PACKAGE_WESTON
>   	select BR2_PACKAGE_LIBINPUT
>   	select BR2_PACKAGE_LIBDRM
>   	select BR2_PACKAGE_SEATD
> -	select BR2_PACKAGE_SEATD_DAEMON if !BR2_PACKAGE_SYSTEMD_LOGIND
>   	# Runtime dependency
>   	select BR2_PACKAGE_XKEYBOARD_CONFIG
>   	select BR2_PACKAGE_WESTON_SHELL_DESKTOP if !BR2_PACKAGE_WESTON_HAS_SHELL
> diff --git a/package/weston/weston.hash b/package/weston/weston.hash
> index 0ecbaa4168..ded5d35275 100644
> --- a/package/weston/weston.hash
> +++ b/package/weston/weston.hash
> @@ -1,4 +1,4 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2023-May/042725.html
> -sha256  b18591eab278bc191720f6c09158040b795e7118af1d5ddca6acd9a8e2039535  weston-12.0.1.tar.xz
> -sha512  3dcfa1a2a6b9a605d3ecd597bf7ac0f87b0fd1971845b6e5c44b5e34296943ac146dae6e1cfea9be14ad7a9a8b6d30dc765f9289ef80920d7c516ebba1ba4688  weston-12.0.1.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2023-November/043326.html
> +sha256  52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a  weston-13.0.0.tar.xz
> +sha512  8c656cdf24ec9429c76c64ebd2d58351991f5990a6d4b5900ac913243ad8e2c9c0fb1a748f018d177fbfd7e0a8836d0434d97acec287a8f977d47335ae30eacc  weston-13.0.0.tar.xz
>   sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index b07e798765..5ae9c22973 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WESTON_VERSION = 12.0.1
> +WESTON_VERSION = 13.0.0
>   WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
>   WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
>   WESTON_LICENSE = MIT
> @@ -19,7 +19,6 @@ WESTON_CONF_OPTS = \
>   	-Ddoc=false \
>   	-Dremoting=false \
>   	-Dbackend-vnc=false \
> -	-Dlauncher-libseat=true \
>   	-Dtools=calibrator,debug,info,terminal,touch-calibrator
>   
>   ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
