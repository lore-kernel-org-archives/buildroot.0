Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D7BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0407E408A6;
	Tue, 15 Mar 2022 20:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UbgYzT_1waI; Tue, 15 Mar 2022 20:15:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C73734045C;
	Tue, 15 Mar 2022 20:15:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E40F1BF31E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B3A54045C
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fXbg6MbuxIcJ for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:15:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10270403CA
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:15:52 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id bg10so22622ejb.4
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 13:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kKrjv40vw0rjFktdFzZtOpbx/cedNdCByYJSavPb9iU=;
 b=iQm4awpcTtmHBJQz+lso7JZq4AsDiZ9bYGEADSka/LwvCC0yRXztIN+a5pJqpm5py1
 khgv9mx7p2AlVP4WLV7E+Vy+eBvqXGobVgYyiii+DJ+wZ5ZMFp8FwieiqMPiUMsakRsU
 sJggpTlZX8N/cRLE+SKmpxEedE7BqYSWSf/WvN1SGKNkHKavyXXFkIYothxNtPZogtRk
 NyioquvrJnnmqfqfKliKQvZJyfE37TqQ6+z9O8ekHiwhFZ/x8ZqG5Gj+ndOdj5GOttwZ
 q+GBaO+7ZfWCVHWbHDORIJwS+MJ11wM9IvZORHNgMd7BdV6Tnc0JCJL6+fDK3Axtl/Aj
 TIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kKrjv40vw0rjFktdFzZtOpbx/cedNdCByYJSavPb9iU=;
 b=t8G3mPktCkbRgZv9kZckBfH4Of+3pg9amsxRf2QJl+3Ld8Ihis5CqVIjKil17OQ6ZV
 ogsLai8h8K/1KYvyVOY04hP1/tXAeLPwuqBCGUJdBgb5gDdqmsUFUCm93YpjTVb8selT
 9gzdKrrGWqdAABk4pShaF+PWbUzmXTcw4UiToN/akPSH7zCvKamFS1hkD+Bz4dFAOhyr
 ev1vVQFtP5G/tY4M32UNLC/9V4BtewpfR8aAk6n7UbY6VzhlAFeF+t7WEcCB5/1hiLSX
 fNhMiK04nwTcX/gk6e4OlehcvxIq2IKN6mW/kWYIM13eGmPj1ZYlDjWYpt6x85ORw4El
 xAKQ==
X-Gm-Message-State: AOAM532y/I28TBXxqhQkNcoK81KeEm2emGL1IQGxOXA0cV4YnYOAX+b9
 K1uh9MaUFRjRTNGWrjwmYqTbGw==
X-Google-Smtp-Source: ABdhPJxGmhjMbCKK6IN8bNTYpdSNZNnbm/elfbVbvR6fqNaYqpKy6KkWyjXP1AB8Wwwf/d8g737C4A==
X-Received: by 2002:a17:906:4fd2:b0:6db:21ba:e434 with SMTP id
 i18-20020a1709064fd200b006db21bae434mr24486432ejw.714.1647375351345; 
 Tue, 15 Mar 2022 13:15:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm14565ejc.158.2022.03.15.13.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 13:15:50 -0700 (PDT)
Message-ID: <470a4f5c-1015-d48c-4a6d-5509194f5374@mind.be>
Date: Tue, 15 Mar 2022 21:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220226182356.3035297-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220226182356.3035297-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/cukinia: bump to version
 0.6.0
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
Cc: Shyam Saini <shyam.saini@savoirfairelinux.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/02/2022 19:23, Fabrice Fontaine wrote:
> https://github.com/savoirfairelinux/cukinia/compare/v0.5.1...v0.6.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/cukinia/cukinia.hash | 2 +-
>   package/cukinia/cukinia.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cukinia/cukinia.hash b/package/cukinia/cukinia.hash
> index e6ae602011..6e76a6ab88 100644
> --- a/package/cukinia/cukinia.hash
> +++ b/package/cukinia/cukinia.hash
> @@ -1,4 +1,4 @@
>   # locally computed
> -sha256  b867ec63e448e7fa0a9276f6844a8b3a8f92d99e63e8518fe24e9debd32679b5  cukinia-0.5.1.tar.gz
> +sha256  79dc77c7b9f2784e7d22d961dd2c4ad9c78deebbc6e8f39df4fa214118682b40  cukinia-0.6.0.tar.gz
>   sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPLv3
> diff --git a/package/cukinia/cukinia.mk b/package/cukinia/cukinia.mk
> index 84d4e60ea8..798c199b67 100644
> --- a/package/cukinia/cukinia.mk
> +++ b/package/cukinia/cukinia.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CUKINIA_VERSION = 0.5.1
> +CUKINIA_VERSION = 0.6.0
>   CUKINIA_SITE = $(call github,savoirfairelinux,cukinia,v$(CUKINIA_VERSION))
>   CUKINIA_LICENSE = Apache-2.0 or GPL-3.0
>   CUKINIA_LICENSE_FILES = LICENSE LICENSE.GPLv3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
