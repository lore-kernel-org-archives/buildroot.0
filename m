Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1915EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 20:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B23881971;
	Sun, 25 Jun 2023 20:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B23881971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2N6M-zMuxyou; Sun, 25 Jun 2023 20:04:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFF09818A1;
	Sun, 25 Jun 2023 20:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFF09818A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79AB41BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 20:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 531D0818A1
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 20:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 531D0818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mak9FqqZWE6p for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 20:04:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB808817FD
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB808817FD
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 20:04:08 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51d7e8dd118so2461652a12.1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687723447; x=1690315447;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mEYNfZpAPt4ilicN2P4HNTyZIMc+UGpMbD4k8Dtrqv0=;
 b=XDV75c2YUHoZp0ZCerynySDQw5xrXRr6wQFm3Ufhy37eomcTwks8SEU7+Q63dxl7zy
 HtURVg9WUY5Fp7elHZyFRvkPfDxLAsMQhEOdxQUXrJNIBIUOwyZR8RK910wiR78pDztz
 igvT3hrXKBjWVWjzPeo/FQiYvdJNOT98xdtzeOgJPlrk/OlPgAAYb6g3aot86dkzkV9/
 i+9qCVgSt7/akiTptILDArQLrgM3EFz3B7WrdVBxIhp97wnUJVQuOdG7ssU/m//nlHaz
 FnySByFEH94+BYUiFcaSUrRKVC+hA3Iu7sDIOZeWX/5XB7B+Ux3+MMnXIqD2fdKugT44
 RCMg==
X-Gm-Message-State: AC+VfDx+Eg6DM8YJy0rE6s9tGBgDyit0rOQ6ZQ9IqUESQDFe8ruhVXcS
 AY9lrEgICvdkeM7lcpTf9R0WuCeJFv2y3t8jPhQ=
X-Google-Smtp-Source: ACHHUZ6QDE6YWMg/ysTHJImdl3S4NtXaDMPn9SV0LKpDUF17Wdd9tAg4lUGctZA1gf2EwzMTTm9fXg==
X-Received: by 2002:a17:907:7ea1:b0:98e:886:f27f with SMTP id
 qb33-20020a1709077ea100b0098e0886f27fmr4101054ejc.20.1687723446874; 
 Sun, 25 Jun 2023 13:04:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 pj4-20020a170906d78400b009885a03467csm2400087ejb.31.2023.06.25.13.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 13:04:06 -0700 (PDT)
Message-ID: <a1ac8c67-837c-e5f9-8d2b-6ba37c822214@mind.be>
Date: Sun, 25 Jun 2023 22:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org
References: <20230620173813.4590-1-ckhardin@gmail.com>
 <20230620173813.4590-2-ckhardin@gmail.com>
In-Reply-To: <20230620173813.4590-2-ckhardin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687723447; x=1690315447;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mEYNfZpAPt4ilicN2P4HNTyZIMc+UGpMbD4k8Dtrqv0=;
 b=GV58Y/wNTz65RN/zXRZ7sZ7nNq2x03C7Cuy7zu5lk9In555dxoKNMWyaSMTNmI4wBI
 GtbC+IpfgPlGPb9oF6O1C4EOq++lh8HTvrw2o5lLAZxhl9L1ZV6e8EAUCToEksviUAsC
 uPiJKOM8Tfrjx6E4sylRDowFC7CE6pye6QQi6weOVrE65l7GvD9kclbkWBtl3bAdCNY1
 uv2dcvk39RQbaQ5i0RMleXfcrlAzDS6rney8vxR5hThXNaJxwM3Ni9Y2OqUsC0+SXFb3
 x+qwxj5G68pPLgKol14lZQDfjoa9gug8JVVN3oaF4j66Up2OhTL5ktqcjNIII7sxfsSE
 n56A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GV58Y/wN
Subject: Re: [Buildroot] [PATCH 2/2] package/alsa-plugins: require
 libsamplerate for the plugins
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



On 20/06/2023 19:38, Charles Hardin wrote:
> During the execution of the alsa plugins on a test application,
> the library would not function without samplerate being enabled
> and present. So, this is a patch to just include the samplerate
> since the latest versions seem to require it for the plugins to
> work.

  It doesn't sound unreasonable that some plugins require samplerate, but it 
seems unlikely that none of them work without libsamplerate...


> There might be another fix instead of this patch, but this got
> the sound to play for the bluez alsa stack as expected.

  If it's just for bluez, then it sounds more logical to do it in bluez-alsa?

  Regards,
  Arnout

> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
>   package/alsa-plugins/Config.in       |  1 +
>   package/alsa-plugins/alsa-plugins.mk | 22 ++++++----------------
>   2 files changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/package/alsa-plugins/Config.in b/package/alsa-plugins/Config.in
> index ee0fb4c1d5..e85ff218dd 100644
> --- a/package/alsa-plugins/Config.in
> +++ b/package/alsa-plugins/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_ALSA_PLUGINS
>   	bool "alsa-plugins"
>   	depends on BR2_PACKAGE_ALSA_LIB
>   	select BR2_PACKAGE_ALSA_LIB_HWDEP
> +	select BR2_PACKAGE_LIBSAMPLERATE
>   	help
>   	  Advanced Linux Sound Architecture Plugins
>   
> diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
> index d23a81c5ee..8046720297 100644
> --- a/package/alsa-plugins/alsa-plugins.mk
> +++ b/package/alsa-plugins/alsa-plugins.mk
> @@ -7,30 +7,20 @@
>   ALSA_PLUGINS_VERSION = 1.2.7.1
>   ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
>   ALSA_PLUGINS_SITE = https://www.alsa-project.org/files/pub/plugins
> -ALSA_PLUGINS_LICENSE = LGPL-2.1+
> -ALSA_PLUGINS_LICENSE_FILES = COPYING
> -ALSA_PLUGINS_DEPENDENCIES = host-pkgconf alsa-lib
> +ALSA_PLUGINS_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (samplerate)
> +ALSA_PLUGINS_LICENSE_FILES = COPYING COPYING.GPL
> +ALSA_PLUGINS_DEPENDENCIES = host-pkgconf alsa-lib libsamplerate
>   
>   ALSA_PLUGINS_CONF_OPTS = \
> +	--enable-samplerate \
>   	--disable-jack \
>   	--disable-usbstream \
>   	--disable-pulseaudio \
> -	--disable-libav \
> -	--disable-maemo-plugin \
> -	--disable-maemo-resource-manager \
> -	--with-speex=no
> +	--disable-avcodec \
> +	--with-speex=builtin
>   
>   ifeq ($(BR2_PACKAGE_ALSA_UTILS),y)
>   ALSA_PLUGINS_DEPENDENCIES += alsa-utils
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
> -ALSA_PLUGINS_CONF_OPTS += --enable-samplerate
> -ALSA_PLUGINS_DEPENDENCIES += libsamplerate
> -ALSA_PLUGINS_LICENSE += , GPL-2.0+ (samplerate plugin)
> -ALSA_PLUGINS_LICENSE_FILES += COPYING.GPL
> -else
> -ALSA_PLUGINS_CONF_OPTS += --disable-samplerate
> -endif
> -
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
