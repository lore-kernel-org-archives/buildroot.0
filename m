Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB95CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B20C2401D1;
	Sun, 27 Mar 2022 16:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZleBbHDq6wB; Sun, 27 Mar 2022 16:08:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC34740246;
	Sun, 27 Mar 2022 16:08:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB75C1BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D772340136
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onmfiaFy0UZg for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:08:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8708F40104
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:08:04 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id c62so14387762edf.5
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=tzUEnlcpxili1p5LpjwtFWG/5CIOy+eF/+12YRg18OA=;
 b=HCm4H0mpOlAD3J24ek9t1gnQtjmvrPEfiJvI4aBu5DBjBXFmA1o4wtiJ4gtmchx8zX
 yRboRaG+xn9H1S3IvJpmZgVWOPj01xl8sFJzaBokEkhIOSTi4CcCYlo+C1IQjdY6d0N7
 Df3cmT2TAyr5BwFF2A4+yCpq28yuZmYxSLSuBrax4bAP5o8Na0yTN3GJAqHMP1z2CEdD
 iD7YuhlweIMAifYEIISl5Ereia6MgOjpuIHUnl2kaPpL1fLDIsTzaaH9RCezTPiUN/Dt
 CAc9DSLBVaTS9c8Hp/f8TcaNhXqx9GRTR6j+EAG4s8V5InePs9bD/Ddd65VqJ/fRfTdp
 LwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tzUEnlcpxili1p5LpjwtFWG/5CIOy+eF/+12YRg18OA=;
 b=iLejWJQJGYzXscRv/RegOeBgK1Q5lV9cyB7JVUlVCm4APGB9nrUKADTe+PcI4t20AA
 /suxCC1SxskZS/3AYGtN1chiSXavJ0bZm1SsB3OWVcPOvJz9G2n8uX2q+ZdqlFYspvcW
 ZiIK4W+l0A22KTXvf5SGYIIrgakOfzMtAN71VJbWHvsSWdd48nYmFRpZxQMQcKrMFbIP
 3Z2crawP8yjLM6g+rjz/KUo/4lPcXGBm3YuR9GiW95PKciNGJkG01JH5YTwmSzb9s2VI
 TiOMbIV54+Fl0+62L6FN9xT5O8863DrIDUzrgMBhkyxyCx4pax+F4KIWY6IZFPlAfOC9
 2p+w==
X-Gm-Message-State: AOAM532mOp2RrNPIiqHyZcShEJTPclBqNOXYxGn2gfo9Xp+UUNIP48Sj
 hVDZ9Lq1tjC0KREg4mO8BWSgkiwREYsEHw==
X-Google-Smtp-Source: ABdhPJwHTmPl5XIJ8Stc7fdr2x4goDA+ItZRyVBJdpblr5xnmolvcf5P7tPOuvVxTjzhx1RKZQoUeg==
X-Received: by 2002:a05:6402:5303:b0:416:13c0:3e75 with SMTP id
 eo3-20020a056402530300b0041613c03e75mr11056617edb.299.1648397282794; 
 Sun, 27 Mar 2022 09:08:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b006da6436819dsm4761224eje.173.2022.03.27.09.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:08:02 -0700 (PDT)
Message-ID: <b9b50da2-453b-bd4c-97c0-24a861ad7210@mind.be>
Date: Sun, 27 Mar 2022 18:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220321192947.20712-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220321192947.20712-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v3] package/wget: bump version to 1.21.3
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



On 21/03/2022 20:29, Peter Seiderer wrote:
> - bump version to 1.21.3 (for details see [1])
> 
> - remove legacy --with-libidn option (see [2]), replace with
>    --enable-iri option in case locale support and libidn2 are available
> 
> [1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00017.html
> [2] https://git.savannah.gnu.org/cgit/wget.git/commit/configure.ac?id=a24e67e239ef949cc77a4c4e5a0beb703026a296
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - split out from original patch
>    - fix iri option enable dependency
> 
> Changes v2 -> v3:
>    - fix libiconv handling
> ---
>   package/wget/wget.hash | 4 ++--
>   package/wget/wget.mk   | 9 +++++----
>   2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/package/wget/wget.hash b/package/wget/wget.hash
> index 7f89bedb88..22674650a2 100644
> --- a/package/wget/wget.hash
> +++ b/package/wget/wget.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/wget/wget-1.21.2.tar.lz.sig
> +# https://ftp.gnu.org/gnu/wget/wget-1.21.3.tar.lz.sig
>   # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
> -sha256  1727a330a86acacb3e57615ce268f5f29978bf7adec4abe6a30d370207bc91b3  wget-1.21.2.tar.lz
> +sha256  dbd2fb5e47149d4752d0eaa0dac68cc49cf20d46df4f8e326ffc8f18b2af4ea5  wget-1.21.3.tar.lz
>   # Locally calculated
>   sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index 8a73c33699..455faaed12 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WGET_VERSION = 1.21.2
> +WGET_VERSION = 1.21.3
>   WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
>   WGET_SITE = $(BR2_GNU_MIRROR)/wget
>   WGET_DEPENDENCIES = host-pkgconf
> @@ -33,11 +33,12 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
>   WGET_DEPENDENCIES += libiconv
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBIDN2),y)
> -WGET_CONF_OPTS += --with-libidn
> +# BR2_ENABLE_LOCALE and BR2_PACKAGE_LIBICONV are mutually exclusive
> +ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV)$(BR2_PACKAGE_LIBIDN2),yy)
> +WGET_CONF_OPTS += --enable-iri
>   WGET_DEPENDENCIES += libidn2
>   else
> -WGET_CONF_OPTS += --without-libidn
> +WGET_CONF_OPTS += --disable-iri
>   endif
>   
>   ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
