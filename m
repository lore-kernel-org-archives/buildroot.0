Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2909C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31ECB408EA;
	Sun, 19 Jun 2022 15:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31ECB408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yyzhDZg9pLu4; Sun, 19 Jun 2022 15:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3D24408E6;
	Sun, 19 Jun 2022 15:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3D24408E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6EE1BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26D05414E5
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26D05414E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aBfXDLHjwzpv for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:43:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B191F40948
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B191F40948
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:43:06 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id c13so7514796eds.10
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 08:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Fs2l2js9eCnVSD/hZqZDYHMU4Q5BLDhZJqT2AxhYXcY=;
 b=8Ell2Cp8b4WbOfYJxNK4yNZRB+RY2i9KXXistcXeXSKcXujVrjk8+zqS7RHR2fmkvE
 MseggEs6daJESzB/kf5+otI/zIZbd+JrDRybymQK3L+yjESQydZIciAde7QTiBHd42VD
 5SBLtQRsQYX+xj1VQjfcUsowZbubhc06yb6CXUnTWx6QW8c7EmFazpA3++vE09zZ+7Tl
 tIADo9pagxGqT2tJqtPtYVWTm1CNswAXSlyNZ+9hULOVyM4SrVeRk9yEPcgX2eW0NXoq
 frDOiT4S9W9o068QSlOFrEU7AdIsi0wYlK46PD5gKtnMwGtmwUzShlcZPbbGxueYrmRf
 tYjA==
X-Gm-Message-State: AJIora9YE4626XqEByCHWFv3oSuVtUw8kRRhXl73wxW9Rg6cl0cZ4gH6
 b1aLRSgJY3TE/+yjJeQtPT1AljBJV8g3Hw==
X-Google-Smtp-Source: AGRyM1tb3O4EqSkVGRJ3/piJJMelOKG4zkLW7qLontok1aYXsduarHpc0NNNoN3gN0+oiocekr1HlQ==
X-Received: by 2002:a05:6402:5021:b0:435:1e2a:2c83 with SMTP id
 p33-20020a056402502100b004351e2a2c83mr24061062eda.345.1655653384864; 
 Sun, 19 Jun 2022 08:43:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bw1-20020a170906c1c100b0070e238ff66fsm4644418ejb.96.2022.06.19.08.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 08:43:04 -0700 (PDT)
Message-ID: <6e591823-3b80-f09f-54a9-62c31fc4bbc8@mind.be>
Date: Sun, 19 Jun 2022 17:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20220613184422.319524-1-fido_max@inbox.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220613184422.319524-1-fido_max@inbox.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Fs2l2js9eCnVSD/hZqZDYHMU4Q5BLDhZJqT2AxhYXcY=;
 b=f637jeLQGrh7Awgl8/d1OPY19m3AYaYBA0RTpMZSOopmcTvqD694XvWGI7A2ida7iu
 yEs25w+x09aYDDGFnWKgzDcNq9deutJNIS/9z5dNIBbIxtp+uDD2uGKo965BN8E0T/ab
 bKXtPF+zZb0MvSx+TQ4HZ/WaX5evm5f3/7kBIlOAWwwXPaRIfxkvxfd5ZJlXTAHA8e3l
 /NQR7TzJsiL4jdXoQlesoONE7jD9vjtf+0sJm9H5D91kvQhwqsTBetFkLVROa18EsQzJ
 iLCU/IEXEgy1jKi3+kS4p4Y5W+OEQjIWoCZhDpx7taUT7x8VeiiYoPi49BDhBdz9lXuP
 ecqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f637jeLQ
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.10.3
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



On 13/06/2022 20:44, Maxim Kochetkov via buildroot wrote:
> Changelog: https://github.com/libgeos/geos/blob/3.10.3/NEWS
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libgeos/libgeos.hash | 2 +-
>   package/libgeos/libgeos.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
> index f93badbaa3..3b913b750c 100644
> --- a/package/libgeos/libgeos.hash
> +++ b/package/libgeos/libgeos.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  50bbc599ac386b4c2b3962dcc411f0040a61f204aaef4eba7225ecdd0cf45715  geos-3.10.2.tar.bz2
> +sha256  3c141b07d61958a758345d5f54e3c735834b2f4303edb9f67fb26914f0d44770  geos-3.10.3.tar.bz2
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
> index 197def1212..443c884abe 100644
> --- a/package/libgeos/libgeos.mk
> +++ b/package/libgeos/libgeos.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBGEOS_VERSION = 3.10.2
> +LIBGEOS_VERSION = 3.10.3
>   LIBGEOS_SITE = http://download.osgeo.org/geos
>   LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
>   LIBGEOS_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
