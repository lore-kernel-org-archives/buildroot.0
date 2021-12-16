Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49450C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8FA860D77;
	Thu, 16 Dec 2021 18:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTRp4CfyALg4; Thu, 16 Dec 2021 18:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D57F60FD6;
	Thu, 16 Dec 2021 18:22:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72D761BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 615CA83280
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:22:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gco1x0-FWAEP for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:22:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A71683143
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:22:24 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z9so34692283edb.5
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=04P/yl9F2zaIuJt0SlYYtKAte140A1cZ7qf1569RTdI=;
 b=fiI/kzX1biMz5XYw1Hk1cRQjwu0IU6PSzTEpn+uCSPka5cbsRKx/glJa0fqXipcYY4
 hzB2DPh3HWQ1ctDoQD/qKXIXDOc9Ueh65RhjhY+owKE2fqFoYfbZ2YBp223+JzR8igVW
 /QWp1az+2UuMGRNnzju5ezd2ILnmXZXL56n7pDSs6OgNvOQpZwssq8mMXnnzCaT34L0B
 BWatKv7aLyiQlTCryehAf7A9jYD0bDqbiydgeWBLTQVpMef0FBSc2lOc7P/zkvXhsu9n
 +BFwpIS/agVMqWlPVKFvSqfW0x6mQ3jZr47wGnQinaJRLB62TZhSEtQjV1EdAFlYV2RZ
 IpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=04P/yl9F2zaIuJt0SlYYtKAte140A1cZ7qf1569RTdI=;
 b=xFA42ZvQfPehy7aCl4cz6WHkRei63LVq5QFrrPIMiCydQ/DYoy12uuZb1ifxMaRPeu
 b5AOzDQkZbDY+bKdCEwGESvxplwYzeW/F6g8pbFrJR73KGhmAV+zZ0noV3YBjQr3VGnt
 tWUq41TBZWid8TOtavgAOjMuSjMJXwikoE00bad5/+KYhck8NDpFHXTdYoNvFGCLm5yc
 sstyepovBNysv7p8LJDAEotPCWqagiMjo+dRk+d6FABg5c62JUz//WPvpddPzjSY5dhO
 81M1kJwgpA4m66wSpapp6qVkpUQVAYXjZQl47BlPH0RSo4SNCFztFEyQXCr6FaKmWG8G
 aZXA==
X-Gm-Message-State: AOAM53211m7+B0MBwlGazc4mOG2ftVqQRgMQIWnDQ/LTGBwBQhc7qWbs
 SVAJNzNuxrNwq+00xjXQ0OCYyRML5PvftA==
X-Google-Smtp-Source: ABdhPJzNsZVHVio5iyXUJsaE6lcFn8+GZdz5/jSVIMVEo0sFQAJ3w5iYp0fOwu6NUhsftnFanwtAYg==
X-Received: by 2002:a17:906:388c:: with SMTP id
 q12mr17186986ejd.281.1639678942543; 
 Thu, 16 Dec 2021 10:22:22 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h10sm2736393edj.1.2021.12.16.10.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:22:22 -0800 (PST)
Message-ID: <9497a0ea-8e25-6153-9cf7-981afd7937f3@mind.be>
Date: Thu, 16 Dec 2021 19:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211214225958.3253335-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211214225958.3253335-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/guile: bump to version 3.0.7
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/12/2021 23:59, Fabrice Fontaine wrote:
> libtool is not a dependency since version 3.0.6 and
> https://git.savannah.gnu.org/cgit/guile.git/commit/?id=2e26538d6a51bdd6c2e68ad4539ab3750ef8670a
> 
> https://git.savannah.gnu.org/cgit/guile.git/tree/NEWS?h=v3.0.7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/guile/Config.in  | 1 -
>   package/guile/guile.hash | 2 +-
>   package/guile/guile.mk   | 5 ++---
>   3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/guile/Config.in b/package/guile/Config.in
> index c26c296e47..b1182a4cee 100644
> --- a/package/guile/Config.in
> +++ b/package/guile/Config.in
> @@ -9,7 +9,6 @@ config BR2_PACKAGE_GUILE
>   	select BR2_PACKAGE_LIBFFI
>   	select BR2_PACKAGE_GMP
>   	select BR2_PACKAGE_BDWGC
> -	select BR2_PACKAGE_LIBTOOL
>   	help
>   	  Guile is an interpreter and compiler for the Scheme
>   	  programming language, a clean and elegant dialect of Lisp.
> diff --git a/package/guile/guile.hash b/package/guile/guile.hash
> index a163f59fce..c2719fa7f2 100644
> --- a/package/guile/guile.hash
> +++ b/package/guile/guile.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -sha256  6b7947dc2e3d115983846a268b8f5753c12fd5547e42fbf2b97d75a3b79f0d31  guile-3.0.4.tar.xz
> +sha256  f57d86c70620271bfceb7a9be0c81744a033f08adc7ceba832c9917ab3e691b7  guile-3.0.7.tar.xz
>   # Locally computed
>   sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
> index b62d06e704..c74325252f 100644
> --- a/package/guile/guile.mk
> +++ b/package/guile/guile.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GUILE_VERSION = 3.0.4
> +GUILE_VERSION = 3.0.7
>   GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
>   GUILE_SITE = $(BR2_GNU_MIRROR)/guile
>   GUILE_INSTALL_STAGING = YES
> @@ -15,8 +15,7 @@ GUILE_LICENSE = LGPL-3.0+
>   GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
>   GUILE_CPE_ID_VENDOR = gnu
>   
> -# libtool dependency is needed because guile uses libltdl
> -GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf libtool
> +GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf
>   HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
>   
>   # The HAVE_GC* CFLAGS specify that we will use internal callbacks
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
