Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A48C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2CA940201;
	Mon,  4 Apr 2022 19:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ml7dnuiVgTR2; Mon,  4 Apr 2022 19:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A66E401A3;
	Mon,  4 Apr 2022 19:32:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9805F1BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8715D82835
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yUeXYlRB52nO for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:32:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64AE68272A
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:32:13 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ot30so12174555ejb.12
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LyBNxGFSEhkmi8uPwkHX5PllrTsECB3C8VJSnC+lJoI=;
 b=HBANSQS23GNzlLqctO7hr3aDkvea0b698BHWWMCSOS6/8VTfBMB8NSpa+37kvTBAV3
 +CEQ5RTYi595xQRe409iHHE8a9qhvDpJs+8lJ9He+I20rpXhgI9wdD3IPFR4iCiCq78s
 TyebH66LtelbgrMzAnkc/YuLfUB67tAyNkem5v4t2g8sjaBrkNs4Yb0h409W2+HcayCX
 lnPGbdMYcsHt7wcqu38qwqAYRM/bDFP5AO06i+5BHrDqqTBgZ622HrcIaTGQJuhVmlDn
 bQZt6On1KMwA2XAOFTeoTJyWxrhXdnx9Hb/G56aboLzWR0TTrbt/emWpMzS0SSeEYbTT
 cJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LyBNxGFSEhkmi8uPwkHX5PllrTsECB3C8VJSnC+lJoI=;
 b=gN2LW8AUjBu9tw2upUSaIz5qVI1opW6mxUR0pyI/5/XI6pvAtjRLxF9k9tu+XOcGII
 zTEmdjT/wowhNQKiagEP3SxZOpYgPF2EKMYy6C4RRN3541UiLJCrcDPoH1nvBbhCFkrC
 veO2/tfbsVTirDOk8UsOkI3C6fZzfsMwy7Tm6PnEfj20+uOdqLjrotivGjWyPIMH5QtE
 vIaM0KY3+Vmp1B7PUV49MhetS6OPFrFbt95b75rrCXLCgABLTR0iqkpQoqTvVTHhxRyB
 Y+wDdzqFRF8LrAgCxT1GbqVJArgeUC2ciEM/Y+DhyPN9WWTdSGGLg+fHntQvBTYcjKgA
 xaRA==
X-Gm-Message-State: AOAM532ojGRdoYgMgnerH5Q9I3LeGS12vjeweNKy5vfztBKGR8vLSdBZ
 bZ04r8wv7VfZMKhnKNtQpI9ryQ==
X-Google-Smtp-Source: ABdhPJy5e+7P6IK1xk8l7wjMDOTy8hKxxSQVALZxsg3E74dQUOLEKOCf3FwdK2vz/Ml3mI8+qvwVSw==
X-Received: by 2002:a17:906:314b:b0:6d6:da31:e545 with SMTP id
 e11-20020a170906314b00b006d6da31e545mr1699879eje.125.1649100731575; 
 Mon, 04 Apr 2022 12:32:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 kb28-20020a1709070f9c00b006d5d8bf1b72sm4674245ejc.78.2022.04.04.12.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 12:32:11 -0700 (PDT)
Message-ID: <769a2f4b-6ae0-f411-599b-ce1d193531bc@mind.be>
Date: Mon, 4 Apr 2022 21:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220403103146.2873012-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220403103146.2873012-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/flac: fix build on ppc64
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/04/2022 12:31, Fabrice Fontaine wrote:
> Disable vsx to avoid the following build failure on ppc64 raised since
> bump to version 1.3.3 in commit 89337e4f39343b3cba0e9f77b3a198fa8ea340af
> and
> https://github.com/xiph/flac/commit/cdb030cd3749b4547399a049ce3cae5e974ccd48:
> 
> In file included from lpc_intrin_vsx.c:46:
> /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/powerpc64-buildroot-linux-gnu/9.4.0/include/altivec.h:34:2: error: #error Use the "-maltivec" flag to enable PowerPC AltiVec support
>     34 | #error Use the "-maltivec" flag to enable PowerPC AltiVec support
>        |  ^~~~~
> lpc_intrin_vsx.c: In function 'FLAC__lpc_compute_autocorrelation_intrin_power8_vsx_lag_16':
> lpc_intrin_vsx.c:94:7: warning: implicit declaration of function 'vec_vsx_ld'; did you mean 'vec_vslh'? [-Wimplicit-function-declaration]
>     94 |  d0 = vec_vsx_ld(0, base);
>        |       ^~~~~~~~~~
>        |       vec_vslh
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/a97a0522c58964fa51815236bc39b378e10b5008
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/flac/flac.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/flac/flac.mk b/package/flac/flac.mk
> index 2ff048b6e6..3a18d81591 100644
> --- a/package/flac/flac.mk
> +++ b/package/flac/flac.mk
> @@ -20,7 +20,8 @@ FLAC_CONF_OPTS = \
>   	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
>   	--disable-xmms-plugin \
>   	--disable-altivec \
> -	--disable-stack-smash-protection
> +	--disable-stack-smash-protection \
> +	--disable-vsx
>   
>   ifeq ($(BR2_PACKAGE_LIBOGG),y)
>   FLAC_CONF_OPTS += --with-ogg=$(STAGING_DIR)/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
