Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D9CC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:51:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E769A60F42
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E769A60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A35C482974;
	Thu, 26 Aug 2021 21:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSkGnwlI64Tp; Thu, 26 Aug 2021 21:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 197BD82965;
	Thu, 26 Aug 2021 21:51:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D03B81BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCBBC42682
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72_RrAsCyBFe for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 21:50:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E28B142628
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 21:50:57 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id lc21so9380370ejc.7
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 14:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Mau8cOgndTADmodvQlGU5bomPs9XqMLik80v8ym1yQ=;
 b=NuDijzCdONxxQ3OaGQjYkL7ku6kIbUVU2B+3zWugiTUCviEeIBgXRZZW03FTFrYwpK
 lqIf8/BlAw5vapbaitGVhsYpnePwve466uIupxw7z5it52bh1ffnXbUrVeq7cUvZp8T3
 CmbEl0X3zT/EMUrDwxSoeI/9hhBcOBT3CO3GiI8JsDFsacTdbGx1zXziDjtKyHAhFFBA
 ujFutij0biBYwLDfW9oTEzpAYtbr/zw4g20H/juA6Uv+Cy7VFFLmlHFDCgxCZ0j/6Y5Y
 b1sPlquyJnCnMDU3x4/Zicy5Rkw8zcl+RkvKQRn72Zzyl3hLU3Ok3sy7ZPdiSrwvXyPf
 RpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7Mau8cOgndTADmodvQlGU5bomPs9XqMLik80v8ym1yQ=;
 b=VTla+v7iW3CrC3EB7ovfFc6GY3KeztDO3Tx1oazEsrzYBmf/Sv3H8mTJvBVhIVZrPt
 RlGOCMJYETjUIYkQDpQsp0/KKtqiIWI79eHxHbi0+Fc8MeXBHkdSFODHc7/lqmxZSBG/
 Meitp3eZPXoEFhfxez26jaG3Ly3loNBVvSF/AWtCtWtmAG8kNt+pTsQgOwD2AdNgkm2C
 CVp9/9q8y4IpAVVubTOD7HNy17OLxCn+DXDz9eDXdXFPiM8iO5PLcapdO0OHmQEkvgcp
 toHd3aGkAQG3tV1f4aLbK99PrOEKZPVa0U3XkElmIegfq7q83X8kaeaqc/T5qEFtjD3z
 rThw==
X-Gm-Message-State: AOAM531sRad3MxKuNeFORNe+zTriK2erYFdBekUgXGVejZtbY+aRvwc9
 zUHYBrmtzMqs41LDafarhRM6cA==
X-Google-Smtp-Source: ABdhPJwHeGHYlE3mVyrrQkHxekLCPgr2o+UTtq3uHc19KXDa6cQu8eXKiCxA0c9TwHauX2Zw/ZkrfA==
X-Received: by 2002:a17:907:174b:: with SMTP id
 lf11mr6531520ejc.35.1630014656119; 
 Thu, 26 Aug 2021 14:50:56 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c6sm1894240eje.105.2021.08.26.14.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 14:50:55 -0700 (PDT)
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20210822190251.280313-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <72a78669-86f7-f796-f53a-92ed5978be40@mind.be>
Date: Thu, 26 Aug 2021 23:50:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822190251.280313-1-petr.vorel@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/2] package/glibc: bump version to
 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 22/08/2021 21:02, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

 Both applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v1->v2:
> * update to 2.34-9 from 2.34-5.
> 
>  .../glibc.hash                                                  | 2 +-
>  package/glibc/glibc.mk                                          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/glibc/{2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f => 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4}/glibc.hash (70%)
> 
> diff --git a/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash b/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/glibc.hash
> similarity index 70%
> rename from package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
> rename to package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/glibc.hash
> index 4b8d8297ec..595de95a58 100644
> --- a/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
> +++ b/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  3e2004b16ec6b79a19a88ed4736719ef9e419f9d8e7013faced654c0339e23dc  glibc-2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f.tar.gz
> +sha256  1c7ed0f69ed268bd66f9754d0cb8fb65e0dafc1f9a1048ea50d1e96d60399686  glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 1eff245588..c911c29554 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -11,7 +11,7 @@ else
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
> +GLIBC_VERSION = 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
>  # sometimes the connection times out. So use an unofficial github mirror.
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
