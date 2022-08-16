Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F071BC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58EED41299;
	Tue, 16 Aug 2022 20:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58EED41299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LySg4p52Xdos; Tue, 16 Aug 2022 20:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 246944099D;
	Tue, 16 Aug 2022 20:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 246944099D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10C871BF39C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE11840423
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE11840423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vpz4TXG-Cug1 for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:50:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1B694010D
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1B694010D
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:50:19 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id o22so15010868edc.10
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 13:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=OKdff5iDjzj7oknZUQAze0DNqmM5MC9hdyCjZEShOFg=;
 b=RjgWS+aAt0StXG9c3li0rkwwEpU+pz6co+HDwcr1PuOlNJBbsVTDBxhAKoFSbcQMGQ
 aORBTanbOfujMiM0KYgtcTSq2jpKnHbhHAWPikQfF4itdrJAZjROso3Arv03ZRTTSO74
 x8FbLsP4+MFGCcgpPPcvYP45u3+S0viprwWH98ZxJaY5p39LsQ9J5VC7bA+azPNO4UWg
 Z7/rISC84BBKPcm5UqLy8/pz4BW6RcHGL3ZdSSoB1l3o/CgEcNu6lFsHAaHhcl9A83QO
 O0WBs/f9s8sBldzaVvWhdorKZiQ7RYGB4ZgScgiNxEnRcpUbJpzgorc9a9rQNbBaalMv
 wEgw==
X-Gm-Message-State: ACgBeo1fNpeSBJdUzPO2iVFbJfy5YT2F0lNRljzQthl3B/FrEUGwPUfY
 v2OXwicR5cj2WXrq+2Xs6lOVJg==
X-Google-Smtp-Source: AA6agR7weHTr4TVEZ4MThvJ+CNWw3gT1FnkBCTlHVYlw7/iReKVV1Hi5LbNIISX7juSJNLR5hpqzxQ==
X-Received: by 2002:a05:6402:e86:b0:440:d1be:20c7 with SMTP id
 h6-20020a0564020e8600b00440d1be20c7mr20480718eda.349.1660683018169; 
 Tue, 16 Aug 2022 13:50:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a056402194a00b0043ca6fb7e7dsm8894751edz.68.2022.08.16.13.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 13:50:17 -0700 (PDT)
Message-ID: <7de0d13b-cb37-2516-bc01-8188fab69e02@mind.be>
Date: Tue, 16 Aug 2022 22:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20220815202955.2216503-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220815202955.2216503-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=OKdff5iDjzj7oknZUQAze0DNqmM5MC9hdyCjZEShOFg=;
 b=KDpUOa9oWrEU+c2j2LU7W7Ona9AXuXTIHTQK4YaPb6CYWrVRBDaMjiRylaOU03ARlo
 0ZVPthQcbFtYCYuyi9/8o7f4I6unRPQHxD4b6W92qRqRgva059vEShsoxh9X7ANkIlW5
 7jTkDErQ/prKA3Jpy1UZQtk2w6YI7XslcZiQ8WMnREUu0SlfUcJbKt07WpzPx3hBgX+s
 2LshM+AO1mRfNNmhELSzaxszYBV156jnq+YWSC+cB6g2Xloghu2eryVThE9XC/zsJOgB
 mCDVf+GzC5ShvgtFMCLHTPmAJsBqz6GRjjQaDlFVDp6CaPj5c+SlTHCZArD06BxT5SzS
 btgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KDpUOa9o
Subject: Re: [Buildroot] [PATCH next] toolchain/toolchain-buildroot: default
 to glibc as the C library
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/08/2022 22:29, Thomas Petazzoni wrote:
> This is perhaps the most controversial change for Buildroot that can
> be written in a two-liner.
> 
> Historically, we have used uClibc as our default C library, as
> Buildroot was created initially as a test-bed for uClibc, and also
> because uClibc made a lot of sense for embedded Linux systems, due to
> its smaller size and fine-grained configurability.
> 
> Since then, the landscape of embedded Linux systems has changed. Even
> though Buildroot happily supports really low-end devices, the vast
> majority of Buildroot users are quite certainly running the resulting
> system on a reasonably powerful platform, with significant amount of
> RAM and storage. In this context, the benefits of uClibc are no longer
> that much relevant, and glibc causes less "troubles". Therefore, this
> patch proposes to use glibc as our default C library when using the
> internal toolchain backend instead of uClibc.
> 
> Of course, we will keep the support for uClibc, which remains an
> important C library choice, for space-constrained systems, or simply
> for architectures that are not supported by glibc.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> ---
>   toolchain/toolchain-buildroot/Config.in | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 836af3b22a..9956dc4383 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -22,8 +22,7 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
>   
>   choice
>   	prompt "C library"
> -	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> -	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64
> +	default BR2_TOOLCHAIN_BUILDROOT_GLIBC
>   
>   config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>   	bool "uClibc-ng"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
