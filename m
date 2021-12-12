Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D65C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 247278547D;
	Sun, 12 Dec 2021 15:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AaWFGrMCfzSv; Sun, 12 Dec 2021 15:13:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ECC085453;
	Sun, 12 Dec 2021 15:13:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41E381BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AF9B42375
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-neraUksZM4 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:13:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82B4B404FD
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:13:08 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w1so44354423edc.6
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 07:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UkpZgWlouk3yMR6rcR3ON09UmF2Vm9PEZfVaFs4RyPs=;
 b=Vc7uGXR2dI6ijaRy5UuD8KLbCl0vhhzCXd0Adj9GmyreIfRH02wS9n18ko/DkrdzOr
 /Q5MVH3OjnRr1UpjWaOksoUepYRVeWafg3cFgs0HIpaIjxPzIBeMIoP3ZfKUYi+FrhnQ
 P+bis5mVlCJW4hUOypkDUcdillnN47RDw1fuRXvLm4F6A0ds19qx/kWmSi7oRDNfTlQk
 LZuasffo8Ym2Fwoqb5A99Fjfa7R3+xtZRUJfNmldesA1dKo0FtWvOplxLacXsPdCQljb
 4QTWuxMlDuB/tNQ1gviyzrv4nFm9ZCqAKfWyc+K5Py/FpjM4nuCCmbtpvg/4V5COCHoS
 SUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UkpZgWlouk3yMR6rcR3ON09UmF2Vm9PEZfVaFs4RyPs=;
 b=f1RugIsfrtYCbZYE+1RVC7VpmR3b2vgcTHLBqhGAH2v3MVJd1t10rVdbfnI0+85sSf
 Izqk83ekuc4Pf1Qs+IvCeQFnFJp+PMgQoQLW/wD+tO7u7+g3Z3Ad3w923j7zDonkVXS0
 W6PuTdL2g+rnrFYBDGzxgFzMj0ZMTguo4ApPgqdUNuhi2VWEaUOOksV4NxIZqRVzWi2+
 RE+8SZpH5wKPY9H2vK+ZYuY5sl5yQzSc4fzzH/e+iidnks7XtkCpC/flVdeZELAmk6Uu
 PdaXmGMY+ehai47D5ekigMAJ1eGs5zhtEPdnbSCHYuX5cf5Q1hlVQIf2qUJzjlHdd/I6
 W5jQ==
X-Gm-Message-State: AOAM532N1VBERqQWJg+zfWWWCpguwes90rjOsttBi14YW4AdTBrspB3U
 jZbzeSTfCapYsbuBMATarhXKcQ==
X-Google-Smtp-Source: ABdhPJya7lreE1hg7DxGZgjHRfKXcDXseyIh9L/ZhxQlLk6F6Xr59qWXGQ4M7HvYYDW1OlQaw938TA==
X-Received: by 2002:a17:907:7f8f:: with SMTP id
 qk15mr35886277ejc.455.1639321986762; 
 Sun, 12 Dec 2021 07:13:06 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p19sm4452950ejn.97.2021.12.12.07.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 07:13:06 -0800 (PST)
Message-ID: <a230c701-8409-71bc-bb41-e48627160adc@mind.be>
Date: Sun, 12 Dec 2021 16:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20211212090107.2975294-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212090107.2975294-1-christian@paral.in>
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to 1.17.5
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/12/2021 10:01, Christian Stewart via buildroot wrote:
> go1.17.4 (released 2021-12-02) includes fixes to the compiler, linker, runtime,
> and the go/types, net/http, and time packages.
> 
> go1.17.5 (released 2021-12-09) includes security fixes to the syscall and
> net/http packages:
> 
>   - CVE-2021-44716
>   - CVE-2021-44717
> 
> https://go.dev/doc/devel/release#go1.17
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/go/go.hash | 2 +-
>   package/go/go.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 9031c33d8a..39f8226aae 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,3 +1,3 @@
>   # From https://golang.org/dl/
> -sha256  705c64251e5b25d5d55ede1039c6aa22bea40a7a931d14c370339853643c3df0  go1.17.3.src.tar.gz
> +sha256  3defb9a09bed042403195e872dcbc8c6fae1485963332279668ec52e80a95a2d  go1.17.5.src.tar.gz
>   sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 59177e54db..0d9ceab2bb 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GO_VERSION = 1.17.3
> +GO_VERSION = 1.17.5
>   GO_SITE = https://storage.googleapis.com/golang
>   GO_SOURCE = go$(GO_VERSION).src.tar.gz
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
