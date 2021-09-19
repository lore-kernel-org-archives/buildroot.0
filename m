Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700A4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:10:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A92E61205
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A92E61205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA71D4051A;
	Sun, 19 Sep 2021 13:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9I-mfNFpE9gG; Sun, 19 Sep 2021 13:10:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 689044051D;
	Sun, 19 Sep 2021 13:10:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B38161BF5AC
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB42D40134
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tU--wY_bfzm9 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 13:08:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7A4D40261
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 13:08:50 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c22so49653004edn.12
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 06:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j1qJt+Q8JBIdLrGBdCTG/I40k+PDlKmO9ZEUCxobxOU=;
 b=GNrstyeoqsfR8OTR0pSu2oC7uaA9HIJe3RZ/2QitaLXy9LEocS2ySfEEVoghGLYSCQ
 87e/XD5qGtOsHmSrwZHLMLka3SMvNVKTUaQVgOT5Usko+c2uZY62+Qt5hR51RvL6x7j5
 oD0FN3ca4ChQ+ghIoemfngoymKJ5h3IYiNVR3aqK25ejx/iMnkxeubYNM2z3xHrfRRhF
 4DtJUuDVxNmtHjy9Qfv0HNf4J5K6GOU8rojgmVcRIFUEuD1VNyQRMRk23pxEgj2frey5
 IQ/0CqeWMBTW6wqtKmfuzAuOdyoR+4p5p8Fv1QUB0AoRb3Hir0kg12oeiub3wl+3Z09N
 wEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j1qJt+Q8JBIdLrGBdCTG/I40k+PDlKmO9ZEUCxobxOU=;
 b=ItgLu2MBlxfcHfBl/NEAOW2Ik3rVQNGhQNnKU0HGM0v9pzNET9UScGFIsOUBk6xivq
 Nr8fc6uJVCJ0siEA4cs00nPI1IWYBSk99IpDfNQhW/ApuishzGjjeIfOJpcmrjp1xN6r
 Yvhf4bIDEPJxFOaop5UpuIRHKPrIZAJFQb3hSDhl7YtWbPaNWNIDNkYwP13X4UtYnM3a
 T0Mi9itVLaFILnZr6hppZV99noDZPdr84cT4Lf8cXzG7IPkROdRhqBDrJmBMlyt3olHH
 gUNlXMeunfJRAqJOn6K8UJ2nH8JWpz47O8Km6C7xt1uSiVYDFsfLtfwca53i9KqGjLwi
 LvQA==
X-Gm-Message-State: AOAM530WUVlE7l9kFNCEh20I3GRDFWsrXs8MBqlH2oIYkl0JpKA6RC3s
 kXAwloULRvkuaS93AZAeoDxkLA==
X-Google-Smtp-Source: ABdhPJxbgJSYTgChmmDJB1XVXCrjGgcDW6iHRc/h5y3ywD9Lf92Sge9kfq5uMNP41Ah7I///O5oxlA==
X-Received: by 2002:a17:907:d23:: with SMTP id
 gn35mr24307887ejc.556.1632056928954; 
 Sun, 19 Sep 2021 06:08:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id br21sm4957592ejb.112.2021.09.19.06.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 06:08:48 -0700 (PDT)
Message-ID: <7bc4d7c1-c62b-89c7-0a29-9e2b7be14cd0@mind.be>
Date: Sun, 19 Sep 2021 15:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20210908082110.694376-1-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908082110.694376-1-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump to versions 1.42.0, 2.10.0_libuv_v1.42
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 08/09/2021 10:21, Asaf Kahlon wrote:
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libuv/libuv.hash | 2 +-
>   package/libuv/libuv.mk   | 2 +-
>   package/uvw/uvw.hash     | 2 +-
>   package/uvw/uvw.mk       | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
> index 042dd9dc34..172ef1f168 100644
> --- a/package/libuv/libuv.hash
> +++ b/package/libuv/libuv.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  6cfeb5f4bab271462b4a2cc77d4ecec847fdbdc26b72019c27ae21509e6f94fa  libuv-1.41.0.tar.gz
> +sha256  371e5419708f6aaeb8656671f89400b92a9bba6443369af1bb70bcd6e4b3c764  libuv-1.42.0.tar.gz
>   sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
> diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
> index d3c58d4dd4..9fe775951d 100644
> --- a/package/libuv/libuv.mk
> +++ b/package/libuv/libuv.mk
> @@ -6,7 +6,7 @@
>   
>   # When bumping libuv, check if a new version of uvw is available
>   # and bump it too.
> -LIBUV_VERSION = 1.41.0
> +LIBUV_VERSION = 1.42.0
>   LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
>   LIBUV_DEPENDENCIES = host-pkgconf
>   LIBUV_INSTALL_STAGING = YES
> diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
> index 2aeb4732cd..5f7521c8b3 100644
> --- a/package/uvw/uvw.hash
> +++ b/package/uvw/uvw.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  dd610cb1626b8a7779ed251584bcc0362fb98fcee13e699680f61828a1ba55de  uvw-2.9.0_libuv_v1.41.tar.gz
> +sha256  30b0ba97a94d5e652490c6b1b32c95e608263f21cf3bc606308d09b3e3a114bf  uvw-2.10.0_libuv_v1.42.tar.gz
>   sha256  5de32af2469480cf3261c9781962e0887366666ba8ee1f4a32c386c77fc50c88  LICENSE
> diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
> index 96375926d9..9c15d536cb 100644
> --- a/package/uvw/uvw.mk
> +++ b/package/uvw/uvw.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -UVW_VERSION = 2.9.0_libuv_v1.41
> +UVW_VERSION = 2.10.0_libuv_v1.42
>   UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
>   UVW_INSTALL_STAGING = YES
>   UVW_INSTALL_TARGET = NO
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
