Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CB0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D407408E5;
	Wed, 27 Apr 2022 17:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvKl-k6MZxri; Wed, 27 Apr 2022 17:14:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EBD24049B;
	Wed, 27 Apr 2022 17:14:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0849E1BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAD2682B1B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otXBDivvNWv1 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:14:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB81D82ACA
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:14:06 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y21so2730763edo.2
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 10:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=aa3Bywqu2ME3YSVVWlGamnM0YCBbwVlqaSoYCnRgeqw=;
 b=dYWrzYJgbeJuLUjnZ6KBmD0X7r+ziprF48ElWG4bbQaFk+HrGGUEQdnazDjUoiaETF
 VFJg/1Fl96CfMRLwZzYWsa/OiUDJEaL7iFrAY1suvxf9VEg3LdPJcPVT52POb/jxINl7
 1MXqRN1SLFpLzDtKDdS7dnczil5NwpJeaETQV7fGUb6CYUCcrmsFjZSdMUHsKjTXn20l
 nGlEN3uQYKe+VvstH2m31my5yKCg6Wee30H7zdynLDawYkgZhWo+OgFiC53ozBko/N9a
 8f97UmhIHpAiLJXjWP0wAOIwsrqNs5sYIJXyywZawXpxdUa3g6Fw3HSIfnOJSLwTIJjA
 ekcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aa3Bywqu2ME3YSVVWlGamnM0YCBbwVlqaSoYCnRgeqw=;
 b=T1KekZW92N+0DqOhD5YvBmmbWzNnT9fsWsXrEO9gKFvOwrQCl6s2W6+ehFeskwNNVZ
 a/p5jxiRaDEtbTMVdig/5O58FRYts0CLka2g4d9ZJgGgargYYV2OlLMA5EFWsh2mbHOC
 7KKmVhsRQry55gZbP0xKw4gqJkVqSNL4+NLhg4o57m9jmx9jV19uw6ztiHLbdioTzSWY
 kVwg6HztLQkIyJ+vEyJePofxhWM+RwTW6Zg1mIt1pJHPnz2jlFGU4F52IWZxhDq3L1pH
 AOmlM7FagX0d12JeB5FaNNSb91IwKNoqK89l48fSuIBklErbSvJnJvT3P311LXvj+krc
 g9Fg==
X-Gm-Message-State: AOAM530kc+M+TGW3Ovl+UOsAkLJVH9hw1qrPrAwk1ArO86EfxNzM9njY
 smLBPQzZRB2m/g4mV/IhmgSU/XuV4bY+sg==
X-Google-Smtp-Source: ABdhPJyp0G0IxiKXFumJ+iQqht/GMWp8FRxpktkDD6gu/cbU3DIt9QS/kzQWU2mrptM/VfwfT1tSPg==
X-Received: by 2002:a50:d585:0:b0:425:c9db:cf26 with SMTP id
 v5-20020a50d585000000b00425c9dbcf26mr25931764edi.222.1651079645044; 
 Wed, 27 Apr 2022 10:14:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a170906944e00b006f38c33b6e3sm5187900ejx.68.2022.04.27.10.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:14:04 -0700 (PDT)
Message-ID: <8296cf92-11ec-a2d4-c916-c47d7fbe5066@mind.be>
Date: Wed, 27 Apr 2022 19:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220424204656.3352319-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424204656.3352319-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/cairo: fix build with
 libexecinfo
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



On 24/04/2022 22:46, Fabrice Fontaine wrote:
> Fix the following build failure raised on uclibc and musl since the
> addition of libexecinfo package in commit
> eea8ba446c10701a273432552108d80fb2224ef4:
> 
> /home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libvcos.so: undefined reference to `backtrace_symbols'
> /home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libvcos.so: undefined reference to `backtrace'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/836348270d564a46cc9ee840cf87b2494cc82cec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/cairo/cairo.mk | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
> index 98f270442a..f479aa252a 100644
> --- a/package/cairo/cairo.mk
> +++ b/package/cairo/cairo.mk
> @@ -15,6 +15,8 @@ CAIRO_INSTALL_STAGING = YES
>   # 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
>   CAIRO_IGNORE_CVES += CVE-2018-19876
>   
> +CAIRO_CONF_ENV = LIBS="$(CAIRO_LIBS)"
> +
>   # relocation truncated to fit: R_68K_GOT16O
>   ifeq ($(BR2_m68k_cf),y)
>   CAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
> @@ -27,7 +29,7 @@ endif
>   # cairo can use C++11 atomics when available, so we need to link with
>   # libatomic for the architectures who need libatomic.
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -CAIRO_CONF_ENV += LIBS="-latomic"
> +CAIRO_LIBS += -latomic
>   endif
>   
>   CAIRO_CONF_OPTS = \
> @@ -81,6 +83,11 @@ else
>   CAIRO_CONF_OPTS += --disable-ft
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +CAIRO_DEPENDENCIES += libexecinfo
> +CAIRO_LIBS += -lexecinfo
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
>   CAIRO_CONF_OPTS += --enable-gobject
>   CAIRO_DEPENDENCIES += libglib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
