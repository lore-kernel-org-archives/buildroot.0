Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A83DC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 676E94044A;
	Wed, 19 Jun 2024 20:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0XzTOEYkrnN; Wed, 19 Jun 2024 20:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E72E41563
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E72E41563;
	Wed, 19 Jun 2024 20:11:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 586691BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4320581BC0
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIz0M2rdvEND for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:11:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2777881B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2777881B9A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2777881B9A
 for <buildroot@busybox.net>; Wed, 19 Jun 2024 20:11:09 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4217d451f69so1783295e9.0
 for <buildroot@busybox.net>; Wed, 19 Jun 2024 13:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718827867; x=1719432667;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/CzjJjB0ujokBeAhKOMu9IvoQ199jTMYeZ7SdHzVwxE=;
 b=JGE4BygTm+QhgSH6v25mYiakt6Y7Jt6rhCSrzyLW55/kOu0HXXWdMsu/4jQVvFWZXy
 aI+W/Nk7Ux+TdLVThMfRgHw5wE7DhbdDCnY0GNgFMn7zoK7omBN78tiT3etMfj5/9Api
 G+vZVPK3TZFiUu7Mcgw08RWVbb5T2izUtw/xM+SM/6V4GxupM9s6K3G2OzvYzpdfpMkS
 lwGIgB0a407NjQhHgeeSpcmuChVa3uel+UY7n2O2mMMoH9GeFLkTSr8dmcNhIkyZ/0e1
 aNfrILl6PMHaN32QpgDfgqzOTy3Lu1Q1KauCOKHsXPUOAodM3H2DRq62m2UaWOTPBiYm
 4TUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsbBWIHQBVgKccmnJJxqMlQBE074htqgCTx9DYygu+L2iQqXfMOkJOBgvNVhTB6v3EJ2M7xGeWIO948n5HnCNBlCD4Lic=
X-Gm-Message-State: AOJu0YwknsWgU4Nzko0xV3Ofl2mSVKRE+S7qQxkBeWQ/xsnK2w3aS9v/
 0Vd+EwOWy6apglHDBbN8HFgxCvEW0I330BJDtKg8RsJGlka6EcLCjeVqEUz41xU=
X-Google-Smtp-Source: AGHT+IFATMAXD/NmkXx5OdwOoh0HrxYChsJmMkr/ClLr7MsZ4iCIuZtnPpLDxi+QDxHzOpFTx/bd4A==
X-Received: by 2002:a05:6000:104:b0:35f:ece:3f63 with SMTP id
 ffacd0b85a97d-363192d007fmr2488386f8f.46.1718827867077; 
 Wed, 19 Jun 2024 13:11:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-363d64e69efsm2059623f8f.69.2024.06.19.13.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:11:06 -0700 (PDT)
Message-ID: <83c84c29-ac31-4d27-9c74-27b4f7829eea@mind.be>
Date: Wed, 19 Jun 2024 22:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20240604112453.1097708-1-francois.perrad@gadz.org>
Content-Language: en-GB
In-Reply-To: <20240604112453.1097708-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718827867; x=1719432667; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/CzjJjB0ujokBeAhKOMu9IvoQ199jTMYeZ7SdHzVwxE=;
 b=N6zXr6eYEGlz8kA5QbzXkZNl5TavS6J/sqO+z/ogj1CG1VsKauvfRPgb7Nd4II/NG9
 dG7bGGc1tpi2j3JbO5cYu9FXH2jUPmzjbyTSOEbxVpBr3kdQ6drfFzWphZZeDKg5X6rY
 E1o7obnCH019DIJZ4MgXeh/bET6XXW3Eup84KwGdU1uvcCHAU8ou1nu6xFIs4ZC0bF/m
 qCleMK1dRL0zx4DDd5Vv3ACCrWDl0672Qv/A3tFoh7E6GVEwyQ4VZ9TyZdrs+SvdYBRE
 geSPjHiOZWkHTy7i5FvNMGHRQn4ocHKU2hPQXzUfU8ccAvaMOnBkGrXpAcQyRg82WVKJ
 kE8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=N6zXr6eY
Subject: Re: [Buildroot] [PATCH] package/libcap: bump to version 2.70
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/06/2024 13:24, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcap/libcap.hash | 2 +-
>   package/libcap/libcap.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
> index 0f1501d31..dd9bc75a0 100644
> --- a/package/libcap/libcap.hash
> +++ b/package/libcap/libcap.hash
> @@ -1,5 +1,5 @@
>   # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
> -sha256  f311f8f3dad84699d0566d1d6f7ec943a9298b28f714cae3c931dfd57492d7eb  libcap-2.69.tar.xz
> +sha256  23a6ef8aadaf1e3e875f633bb2d116cfef8952dba7bc7c569b13458e1952b30f  libcap-2.70.tar.xz
>   
>   # Hash for license file:
>   sha256  68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  License
> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> index fe2f24ad8..a1b2636c5 100644
> --- a/package/libcap/libcap.mk
> +++ b/package/libcap/libcap.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBCAP_VERSION = 2.69
> +LIBCAP_VERSION = 2.70
>   LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
>   LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
>   LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
