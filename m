Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394A2C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4C1681F8A;
	Wed,  8 Nov 2023 21:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4C1681F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zHWTp1fvVxd; Wed,  8 Nov 2023 21:01:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DD7F81FA7;
	Wed,  8 Nov 2023 21:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DD7F81FA7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA1351BF282
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8249141B81
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8249141B81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgW714_1Wrxr for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:01:34 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6EC441B61
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6EC441B61
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9e28724ac88so26963466b.2
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 13:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699477292; x=1700082092;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5qb8SyxcUoBc5hgx/1b86a8gYr9E9c1KhG1LATlgtlw=;
 b=D0KkqeNETh4VtUB1uURJdaGfulhQJ35j3QwZxEUVTqlnjMsA0BwNaxj69ZDw7i0iGn
 Senp2C8DbNHehZ6TbcXJYJPHPhdSskM5Lt0JZ1HWC6qNb8vqBBJaqbycfEirtBHSi3RI
 RpubQmzwmqR7hzanhFjrwOEnpBA4aNcnDRFHD3SXztzeZLTS473saNlWC94y6EtQOFzy
 wHm1t3Y0Hac6an524zyPunYHzNetN3Rvk5g1Izz5ytfyXj7GkcH3VUKfRVTiOQ0+NhCr
 rZ5mkIg5UVztHMzzwLDNGR3bp2f7+KkXpUldQHvli8bCj6PfJqdMnaUaJZ0vSUrU4NIV
 33aw==
X-Gm-Message-State: AOJu0Yw/piQWOog6TtrvqJ9CaEOKE9fPBTB03TUMb8/aIClCtWQbUFPO
 +gqTOO05czriOaCUc8rabv86mfJYfFFN/wxZvyQ=
X-Google-Smtp-Source: AGHT+IESc9NY1esSoqba2fEKwEuy1p85Weby4dhHg2NNWvMVCNHtsLXMTt7Mry6MeTzRXwt87qIGkw==
X-Received: by 2002:a17:906:1805:b0:9e3:fab3:3f4d with SMTP id
 v5-20020a170906180500b009e3fab33f4dmr1773966eje.59.1699477291795; 
 Wed, 08 Nov 2023 13:01:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 y27-20020a170906071b00b009b285351817sm1569086ejb.116.2023.11.08.13.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 13:01:31 -0800 (PST)
Message-ID: <24b09b4b-98e9-4311-9cc1-977e60e351d6@mind.be>
Date: Wed, 8 Nov 2023 22:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
References: <20231018141155.533944-1-vfazio@gmail.com>
In-Reply-To: <20231018141155.533944-1-vfazio@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699477292; x=1700082092; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5qb8SyxcUoBc5hgx/1b86a8gYr9E9c1KhG1LATlgtlw=;
 b=IWpkrJ5FXLPKmNWSWjZhd09DPHfOOvU7LFcQoevzFXjCOwuVznoBwuQJJQ4ipmW5Fv
 foXwcG0IjOOd9s4HWfgRrPBno5tauwAShzUXaqiGhgZHI6ulh1JA1tHLCvvgkIQf6baG
 FH5py9ucAP7u0ImAVUvHjlbM+tAa1Y960NCWoZdxm3pUsI54XGh9kQNcwLBtFjI7Pm8x
 lmLNrkJuostux11zKzAl1E8CYp4gbfwQC2D3/rLijOrIM9ej2aGeAkhFouJV2utKmHRF
 PNOLlZaZ0CoFKSm3P9h2RrJmWnrwK6IFLAl8Dp3QaRgqEZmcsSKa4io6/hm2InX0vcoJ
 soLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IWpkrJ5F
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies: bump minimal tar
 version to 1.35
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Vincent,

On 18/10/2023 16:11, Vincent Fazio wrote:
> GNU tar 1.35 includes a breaking change [0] that changes the tar header
> created for each regular file even for "stable" formats like pax (which
> we use in support/download/helpers::mk_tar_gz).
> 
> Previously, normal files had the devmajor/devminor fields of the header
> filled with ASCII zero (0x30). These fields are now null which also
> affects the checksum value in the header as well.
> 
>    $ diff <(head -n 100 xxd.1.34.output) <(head -n 100 xxd.1.35.output)
>    10c10
>    < 00000090: 3037 3500 3031 3531 3637 0020 3000 0000  075.015167. 0...
>    ---
>    > 00000090: 3037 3500 3031 3337 3237 0020 3000 0000  075.013727. 0...
>    21,22c21,22
>    < 00000140: 0000 0000 0000 0000 0030 3030 3030 3030  .........0000000
>    < 00000150: 0030 3030 3030 3030 0000 0000 0000 0000  .0000000........
>    ---
>    > 00000140: 0000 0000 0000 0000 0000 0000 0000 0000  ................
>    > 00000150: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 
> This has the consequence of causing hash mismatches for any tarball
> created with a version prior to 1.35.
> 
> Instead of reverting back to a host specific version (see 37a909cacf)
> and adding a cap to the maximal tar version (see ec50e407be), just
> establish that 1.35+ should be used going forward.
> 
> This change requires an updated BR_FMT_VERSION for both git and svn.
> 
> [0] https://git.savannah.gnu.org/cgit/tar.git/commit/?id=738de9ecdec45ebfeb999628742373b5f8253bd0
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

  We discussed with 3 more maintainers (Peter, Romain and myself) and came to 
the conclusion that it is really too annoying that almost everybody would have 
to build host-tar (unconditionally!). At the moment, of the main distros, only 
Fedora 39 (just released) and Arch Linux already have 1.35.

  The idea is to apply this "bump minimal tar" only when more major distros have 
switched to 1.35 or later. Or, perhaps with the additional time we find an 
alternative that is hopefully more stable. I was thinking of switching to 
sharutils, for example - last release is from 2015 so very stable! :-)


  So, for the time being, we can do the following:

- in check-host-tar.sh, check that system tar < 1.35;
- in package/tar, add a patch that reverts 738de9ecde (probably need to revert 
c3663838 as well).


  Regarding ec50e407be: we're indeed in a similar situation as back then. It's 
not ideal to have a maximal version, but for now it's better than putting the 
minimum at 1.35.


  Regards,
  Arnout


> ---
> This patch should be coordinated with other patches [1] that update the
> BR_FMT_VERSION revision for git or svn as all of the tarball hashes will
> need to be regenerated tree-wide.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/list/?series=373742
> ---
>   package/pkg-download.mk                |  4 ++--
>   support/dependencies/check-host-tar.sh | 10 ++++++----
>   2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index e5cd83d859..d33eb2d811 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -20,8 +20,8 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
>   
>   # Version of the format of the archives we generate in the corresponding
>   # download backend:
> -BR_FMT_VERSION_git = -br1
> -BR_FMT_VERSION_svn = -br3
> +BR_FMT_VERSION_git = -br2
> +BR_FMT_VERSION_svn = -br4
>   
>   DL_WRAPPER = support/download/dl-wrapper
>   
> diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
> index b7d607a47a..d56d0242a9 100755
> --- a/support/dependencies/check-host-tar.sh
> +++ b/support/dependencies/check-host-tar.sh
> @@ -27,11 +27,13 @@ if [ -n "${version_bsd}" ] ; then
>       exit 1
>   fi
>   
> -# Minimal version = 1.27 (previous versions do not correctly unpack archives
> -# containing hard-links if the --strip-components option is used or create
> -# different gnu long link headers for path elements > 100 characters).
> +# Minimal version = 1.35
> +# GNU tar upstream commit 738de9ecd introduced a "breaking" change that
> +# affects tarballs regardless of mode (pax/ustar/v7) such that tarballs
> +# generated with 1.35 will not hash to the same value as those generated
> +# by previous versions of tar.
>   major_min=1
> -minor_min=27
> +minor_min=35
>   
>   if [ $major -lt $major_min ]; then
>   	# echo nothing: no suitable tar found
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
