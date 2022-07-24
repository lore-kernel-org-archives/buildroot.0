Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D8BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 13:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EF27416CD;
	Sun, 24 Jul 2022 13:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EF27416CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jg_HwnXjuJhS; Sun, 24 Jul 2022 13:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C302416B6;
	Sun, 24 Jul 2022 13:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C302416B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1F01BF488
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6536060BE5
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6536060BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OMcZEZDkyF99 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 13:18:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A17BE60BC7
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A17BE60BC7
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 13:18:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k11so11971768wrx.5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 06:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1+C3O1/jOCr1rCRJHrGhKxE+MvoGNVITqoTsVJ9Y9c4=;
 b=WHET8LCQmWFE6aqK1HQWe+qcmu58ppSy+6f2rPl74zXMOSvtXu+PoJOZyS7a6cDCyo
 cS5GuCjC63scFGts1lNe8vv7kxU1/GzlmE8VgQHRErnoCCJ9orrd6T2kIS+GYDoBMQnF
 9pqBCo61zweu7OpDLgqqzp6Xp4B9Z6Cei6fp6deo4daGKuMuIeQD0aAC7cckdlXHTpt4
 cUbOn4VqR7Vju5EjGGjYUJ4Ac3czyyUPun6rZx+oa6sk0w2FCGYEB39+ID9q/5+2/YsG
 b13ECpLd3AbWPGMb3xBs7Ecs5odzv3rHREx0F/QJZIj+dBhTK6y5pZW5rzRmnvb4vkcB
 8CFQ==
X-Gm-Message-State: AJIora9THRsjoHhURrLUoqYbQnN0EX0oz//yhlhfYPgtzbdx4dWEy8p+
 yuZhF4sxUge4uCUbV9PpVXNhNQ==
X-Google-Smtp-Source: AGRyM1vH+fvxx5vpxhpUu9TT/HX6zhZQz91rUgVbgZA7FerEeiiMVGsNfYUM0LtNL78OqCqgkl6wpA==
X-Received: by 2002:a05:6000:3c3:b0:21d:9a5e:5326 with SMTP id
 b3-20020a05600003c300b0021d9a5e5326mr5037267wrg.93.1658668702602; 
 Sun, 24 Jul 2022 06:18:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a5d498b000000b0021e42e7c7dbsm9575539wrq.83.2022.07.24.06.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 06:18:22 -0700 (PDT)
Message-ID: <ae2d7c2d-c6e5-3ce0-7362-8e835ea180ca@mind.be>
Date: Sun, 24 Jul 2022 15:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220112132618.2634250-2-aperez@igalia.com>
 <20220121154235.798255-1-aperez@igalia.com>
 <20220121154235.798255-4-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220121154235.798255-4-aperez@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1+C3O1/jOCr1rCRJHrGhKxE+MvoGNVITqoTsVJ9Y9c4=;
 b=MVgNI4/G9eurVPlikGI2hrmibOwSRLVPk9tR807Rh4xuc1jEhtAX4ehuGf5uShmzOJ
 H20uJ0XI/5GtYzkdunOnyZJx+1He5Ls6/U29Bnbra2uaBccmABMwtj0jTKe7y/lUTy1M
 5Ql1LRMnyCcB86v088qWW7X1eAz4rYcwciLPNmADvxrTYYKJ8C4w7RfAO0UIfcvVgcAM
 RS6Odfn9RZ3lNKw27QFbWE+V6MWJf4M49Oez999r4hY29tldwPnvxoC668xy1QvDzPuW
 s8Ragd+zR+IC9GYGDShUP/QXbJzJHAZu5ijl9JjgJeai01wdd9+2xF/0MnMbk1h6jvl/
 QLeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MVgNI4/G
Subject: Re: [Buildroot] [PATCH RFC v2 3/7] package/musepack: use
 MUSEPACK_NINJA_OPTS
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Peter Seiderer <ps.report@gmx.net>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/01/2022 16:42, Adrian Perez de Castro wrote:
> Replace the usage of MUSEPACK_MAKE with MUSEPACK_NINJA_OPTS to disable
> the parallel build. Unfortunately switching to Ninja for building CMake
> packages has not solved the parallel build issues.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
> Changes v1 -> v2:
>    - Tweak muspack package to disallow parallel builds with Ninja.
> ---
>   package/musepack/musepack.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
> index fc66c684a5..000db5fd76 100644
> --- a/package/musepack/musepack.mk
> +++ b/package/musepack/musepack.mk
> @@ -9,8 +9,8 @@ MUSEPACK_SITE = http://files.musepack.net/source
>   MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
>   MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
>   MUSEPACK_INSTALL_STAGING = YES
> -MUSEPACK_MAKE = $(MAKE1)
>   MUSEPACK_LICENSE = BSD-3-Clause (*mpcdec), LGPL-2.1+ (*mpcenc)
>   MUSEPACK_LICENSE_FILES = libmpcdec/COPYING libmpcenc/quant.c
> +MUSEPACK_NINJA_OPTS = -j1

  Ah, right, for something like this we *do* need <PKG>_BUILD_OPTS...

  Regards,
  Arnout

>   
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
