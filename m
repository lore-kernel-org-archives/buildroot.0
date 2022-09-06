Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B59DECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 20:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0545540298;
	Tue,  6 Sep 2022 20:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0545540298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1d4OA3kXwi2; Tue,  6 Sep 2022 20:18:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF66940237;
	Tue,  6 Sep 2022 20:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF66940237
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1E91BF2A6
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34B20815CD
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B20815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_4OGaFDFlUS for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 20:18:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2870815AC
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2870815AC
 for <buildroot@busybox.net>; Tue,  6 Sep 2022 20:18:30 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lx1so25751850ejb.12
 for <buildroot@busybox.net>; Tue, 06 Sep 2022 13:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IUx7tU2EYzgxRKsJPi/DmYUCjdlvoOWapqAvfSIqXkc=;
 b=5OJyaT2iLm4Cj/DwviszMf4X8nIn4USryDxJ0dBW8AqhEUHlL5K1XIT3CbQ3G8ba8d
 y15n3083I8MBRQCsABdwYY+S60O0mJAaiVliSgSf73q2NdlFjv/+eSswa3JgB1kcZRIL
 G2QsoCUdfm4zJ0Mvyxbe8cZZ4yafGItVzahXDkjUEvgfBDGcn11nZkyzbWjM5twIoVr1
 RpbEgvbcbbWL5gvYKq64UaJcsDGl0ue9wLKDVBwEIZ/o4dE3Off4G0SZiXBQY7/gMbgc
 babqJ8r8tN3EexxpHa9Y6b6ay/QeGnC06c62WocBw3XXWY6LmrJbY7cTP9v5QElwSGJd
 XdEg==
X-Gm-Message-State: ACgBeo1+s+Q/3Esas7hBb25X07G4j8Bgf6PAYJTaMAiE+kL50s+v+VTP
 c/pLzvGYv/yJ6y9TeDiY/WZTJQ==
X-Google-Smtp-Source: AA6agR4D9AS77OJ46ZaUIjHytoZL0B4jxfHdiExx93DDU9szXAXGXy8DI+n6RhvmWWcEBp9AwXLBAQ==
X-Received: by 2002:a17:906:5d08:b0:734:bf6a:6309 with SMTP id
 g8-20020a1709065d0800b00734bf6a6309mr125461ejt.516.1662495509176; 
 Tue, 06 Sep 2022 13:18:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a170906b28300b007305d408b3dsm7102364ejz.78.2022.09.06.13.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 13:18:28 -0700 (PDT)
Message-ID: <40715473-05e5-dac3-c3f5-eecb0710ed01@mind.be>
Date: Tue, 6 Sep 2022 22:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Baruch Siach <baruch@tkos.co.il>, buildroot@busybox.net
References: <a8ea0d5fc6b7f447cbfab2426e1fe3687ee7e0d1.1662007555.git.baruch@tkos.co.il>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <a8ea0d5fc6b7f447cbfab2426e1fe3687ee7e0d1.1662007555.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IUx7tU2EYzgxRKsJPi/DmYUCjdlvoOWapqAvfSIqXkc=;
 b=FWIhnihUk5ydWsL0UqIkxXs67FyjJ4+OKjyxZGZjbsrmonR4GrdGCF/D4X8pxiCRvK
 yrwshr6HA3U6nEMWTM5L046ochuJdKGXE26IMZ2UGe72zHZmBxLUe/Qko0o3WHuFph+K
 yn6S6TBDiXj+1PE7pdktMET8hOLdskPGjPChFvaRObi07pUJ4RblzBe/GY9qLLFOexcI
 X0mV1oWEyJ0r9d4RExO+Vdk5VdorQrPo55uS3mRQNKB12ZjupD4PCfGPYt4LtKiXRuyB
 Wba2Dpeg4YCTbbWbyRI5dcO3piJjWAhVKr/Vg0tMU0L8rR5VEN4I/Htpc7F2C+ydkcF3
 sFFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FWIhnihU
Subject: Re: [Buildroot] [PATCH 1/2] boot/mv-ddr-marvell: bump to latest
 commit
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



On 01/09/2022 06:45, Baruch Siach via buildroot wrote:
> This update fixes build with gcc 11.
> 
> Update license file hash for unrelated code changes.
> 
> Tested on Macchiatobin.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2931841699
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2931841700
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

  Applied to master, thanks.

  This bump is a *lot* more than just bugfixes - it's more than two years' worth 
of changes. However, this is such a niche package that I think we can make an 
exception (rather than try to backport the fix ourselves).

  Regards,
  Arnout

> ---
>   boot/mv-ddr-marvell/mv-ddr-marvell.hash | 4 ++--
>   boot/mv-ddr-marvell/mv-ddr-marvell.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.hash b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
> index 5bfae8af4576..75e87d833df3 100644
> --- a/boot/mv-ddr-marvell/mv-ddr-marvell.hash
> +++ b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  bfab74a625d65238c569b9df282b55c0fc9a1e2d3decedcf194d44774df2ede4  mv-ddr-marvell-305d923e6bc4236cd3b902f6679b0aef9e5fa52d.tar.gz
> -sha256  48bb930b6fbc3f5db72e29c849b096df3868e4a6d2bdc0e2dd3365c768241cd5  ddr3_init.c
> +sha256  16f02232e21a15979b3d9971e28f7e59562484a5c1f99c2b28c248a3b76a63fa  mv-ddr-marvell-d5acc10c287e40cc2feeb28710b92e45c93c702c.tar.gz
> +sha256  907a03943ca940790e97620aca8d46b5b04c653dcf2ab6c66a25238b60cf5635  ddr3_init.c
> diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.mk b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
> index 442b6aed5351..e05192fe9b8f 100644
> --- a/boot/mv-ddr-marvell/mv-ddr-marvell.mk
> +++ b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -# This is the latest commit on mv-ddr-devel as of 20201207
> -MV_DDR_MARVELL_VERSION = 305d923e6bc4236cd3b902f6679b0aef9e5fa52d
> +# This is the latest commit on mv-ddr-devel as of 20220529
> +MV_DDR_MARVELL_VERSION = d5acc10c287e40cc2feeb28710b92e45c93c702c
>   MV_DDR_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,mv-ddr-marvell,$(MV_DDR_MARVELL_VERSION))
>   MV_DDR_MARVELL_LICENSE = GPL-2.0+ or LGPL-2.1 with freertos-exception-2.0, BSD-3-Clause, Marvell Commercial
>   MV_DDR_MARVELL_LICENSE_FILES = ddr3_init.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
