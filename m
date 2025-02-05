Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E5DC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 08:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 726278374F;
	Wed,  5 Feb 2025 08:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zy5bbukwj9TT; Wed,  5 Feb 2025 08:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 663FF80E08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 663FF80E08;
	Wed,  5 Feb 2025 08:51:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4518612F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2897B4168C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcNjE2YsSd1j for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 08:51:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0004341690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0004341690
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0004341690
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:51:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43635796b48so3498085e9.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 00:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738745509; x=1739350309;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/n9Fh5179gYNCfKSw2rA4TgSdXm2wEJWs1bbmGjWPCc=;
 b=uJzsVWwuylfSgl6cHKMUNB62dvLOTMIkiPsWOhYyjHaEzPzT/LQz5odOsmf18d+CJX
 h5Km/qgbZqJLQoUMoiXDgI6BOSsNYOVUHDLr9vK3o998Lyz7q4WB3QzqUaXNFdhpV3FO
 aMmPDt+psGnt318T0LoBzHFioGDWm7AYu9V1UnVfumCDKtUB4LFI6ifUyJ7KcjdDvyM6
 Smu3SeLoe3p98Z4KrXae9DdkJAQwhJ0r/C/+irefREMiNx+VGFqpnh9m6afM7gNKD08e
 tWIDY3MJU3pKp6lElpTQa39u2wwMpegnw/ZZ+QYS2OLI97fQ+PueUvb6ERj0VEB40J3X
 KDew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIf9gov2V9DFlGCzW+Ei+C9diV20MKp//R9YzhWrHm/Uf+GBQTlXzkJVs9bQUT5P2Iu8Rha9EFOtY=@buildroot.org
X-Gm-Message-State: AOJu0YxSBowClI4yZuWQ0DIK6mdU90gr9bOpvL1gBgcM7jvEmV8Yy/7o
 iKpbrQbPSSX2BCsHkJtue88z+fUPsyvWSwdveF+MiQHpSfQYXixnr+F/iE/t5o0=
X-Gm-Gg: ASbGncvaehzpTzGSopcUKGVr3UGB3bNMjWYCksOjTttiIP8Rz1iP8XqhPKLjbGUsGNw
 5zYRj0PTRdkZlsNyP1sz0v+1dbKIOOo7CmL5hm074j47IQsl7t8R0l1hBrci0IQm5eKHyE3t9Qq
 PpQ9sC1WPlJ2vXK7fYTb5tHjrX/YoQcFU+gnKreRJ6TxBH42llv4g/gzEUm7JfTjtWKljpRIBl4
 9OPvYlg44595hpGFBFnHcTRkoPA5mYPafNvlV8KV88iVyEsphp4kTNCR4rfFRg/Mh2Rq5qL+0e7
 8dRh2tk5Tigd5FQMtMugQO7ANvMydxRHTwhYeaywOcLRZsY=
X-Google-Smtp-Source: AGHT+IGfybTkXY5QRTYNSGKq6dMvh7q8r5MMBXkUvWKhK3emBTMk6YXYceb55SwTZviR4qLrV7dsxw==
X-Received: by 2002:a05:600c:4513:b0:436:1b86:f05 with SMTP id
 5b1f17b1804b1-4390cfabc7fmr14071035e9.11.1738745508559; 
 Wed, 05 Feb 2025 00:51:48 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0ec7aasm18042777f8f.5.2025.02.05.00.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 00:51:48 -0800 (PST)
Message-ID: <54979566-2f3c-44e4-bc5d-9b343e7729fe@mind.be>
Date: Wed, 5 Feb 2025 09:51:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>
References: <20250106203459.2875914-1-troglobit@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250106203459.2875914-1-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738745509; x=1739350309; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/n9Fh5179gYNCfKSw2rA4TgSdXm2wEJWs1bbmGjWPCc=;
 b=gRS+rIMQWaHtGWUvoP5y/LnNffj0iHY6iLWbqsVFpniCuNnYhL6mXn5a5QY3Kzz/zM
 obfZ8s1Kz2UULRKJdtcbPPb4oeacrBVCeNjPv18zrUqVTDPQPKphvPvZJPXFkO6T/pB3
 zBz7l4NFX9xLd7VUvX/bzBAY2cdHNMQHqE++UItps8Wa/mroUKhdBJZmOh7Tfuir0nWe
 f2ppn+u/PsE8GPa53w9by+cYmTpgYGkRcEa05J2G93KreLvhXgOoESl5rtV94mOH8Yal
 gsf/CcLjPCLel6Bc7XfNeH6H6OPXZY/hCe6Tp1iDt0n/3no4OH8KMUHo8kPb+jl6KLBF
 itow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gRS+rIMQ
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: make vtysh group
 configurable
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/01/2025 21:34, Joachim Wiberg wrote:
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

  After some back-and-forth we didn't reach find the use case compelling enough, 
so I've marked this patch as Rejected.

  BTW in the future, please make sure to include in the commit message an 
explanation _why_ this patch is needed (unless it's obvious, like for version 
bumps, new packages, or fixes).

  Regards,
  Arnout

> ---
>   package/frr/Config.in | 8 ++++++++
>   package/frr/frr.mk    | 7 ++++---
>   2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/package/frr/Config.in b/package/frr/Config.in
> index c26b160b2a..9b9ad6f331 100644
> --- a/package/frr/Config.in
> +++ b/package/frr/Config.in
> @@ -24,6 +24,14 @@ config BR2_PACKAGE_FRR
>   
>   if BR2_PACKAGE_FRR
>   
> +config BR2_PACKAGE_FRR_VTYSH_GROUP
> +	string "FRR vtysh group, default: frrvty"
> +	default "frrvty"
> +	help
> +	  This setting controls the group a user must be member of to connect
> +	  to vtysh.  E.g., on systems with an admin user, which may be member
> +	  of the 'wheel' group, it may make more sense to use 'wheel' here.
> +
>   config BR2_PACKAGE_FRR_BMP
>   	bool "BMP protocol"
>   	select BR2_PACKAGE_C_ARES
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index 921ef99665..9ec4d3af4f 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -37,6 +37,7 @@ FRR_CONF_ENV = \
>   
>   # Do not enable -fplugin=frr-format for production, see doc/developer/workflow.rst,
>   # it is only intended for FRR's developments
> +FRR_VTYSH_GROUP=$(call qstrip,$(BR2_PACKAGE_FRR_VTYSH_GROUP))
>   FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
>   	--sysconfdir=/etc/frr \
>   	--localstatedir=/var/run/frr \
> @@ -48,7 +49,7 @@ FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
>   	--enable-shell-access \
>   	--enable-user=frr \
>   	--enable-group=frr \
> -	--enable-vty-group=frrvty \
> +	--enable-vty-group=$(FRR_VTYSH_GROUP) \
>   	--enable-fpm
>   
>   HOST_FRR_CONF_OPTS = --enable-clippy-only
> @@ -107,12 +108,12 @@ define FRR_PERMISSIONS
>   	/etc/frr/daemons f 640 frr frr - - - - -
>   	/etc/frr/daemons.conf f 640 frr frr - - - - -
>   	/etc/frr/frr.conf f 640 frr frr - - - - -
> -	/etc/frr/vtysh.conf f 640 frr frrvty - - - - -
> +	/etc/frr/vtysh.conf f 640 frr $(FRR_VTYSH_GROUP) - - - - -
>   	/etc/frr/support_bundle_commands.conf f 640 frr frr
>   endef
>   
>   define FRR_USERS
> -	frr -1 frr -1 * /var/run/frr - frrvty FRR user priv
> +	frr -1 frr -1 * /var/run/frr - $(FRR_VTYSH_GROUP) FRR user priv
>   endef
>   
>   define FRR_INSTALL_INIT_SYSV

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
