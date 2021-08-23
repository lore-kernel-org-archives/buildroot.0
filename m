Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29519C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 21:37:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8373F613A7
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 21:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8373F613A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B2A2400DE;
	Mon, 23 Aug 2021 21:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvcDip4_CwL1; Mon, 23 Aug 2021 21:37:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCAFC400F1;
	Mon, 23 Aug 2021 21:37:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C02B1BF32D
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 21:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A246400DE
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 21:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4t2nW5g9zHRg for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 21:37:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60E5440188
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 21:37:33 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a25so13210470ejv.6
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 14:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Py3NbYip9c3DmnVp94yenfpLkQtg3Pw3F41pwlod8wQ=;
 b=Ptl3eGXFUR2AeSGt2GpitNGWC1t2XFgLMo36p8bc7tz8842AoGS1A4mDo3OR9lqCWl
 Hyq8zjx/wWH9RofRa0/1An+8hz8FMcHeRav12+4Nc8+mHkpqD7YFW3QHOQr0VyeWJtvJ
 yJdttez4N+lKjrz9Txsoauq6sWC5S35UVOa1IZLBBBr62dqdPsmWtxI7XMHhig6n4i4Q
 gXXwPUlrZYVd3+dqZK6hNQJ2D8AdQ3joKW18WiFrcwHDycp/KUZ3MmGGNd5D+K2Vlt+V
 RgPq+25kxcPALjLj11hU2Je4/DeYgd3qGGIpXh900xXcvrCg01KltmSLhxFHnIwoJLKV
 OjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Py3NbYip9c3DmnVp94yenfpLkQtg3Pw3F41pwlod8wQ=;
 b=dmOHuuCI5S15tlQw7Moua5Tz3rWT/7195HEfr0LQ0Gy+sJpx8YLRNQijMFy/qhG3re
 7hvpvzfyHlKis+aCf/dkqi1I6ZqBodWDb9bjt5isv2iSGzx32/T+LqN/ZP4KVnwkSUVT
 Nvt3sriTZ0dH1X+9otfdlw6k87oAfytAUcPJKtEVrVmE92Tv2I7ef4ziVUoRVB93n3JY
 JukJSWmqeGal7qG47gfefBJQk1HS7hpVnztz9+Il7WRMWjlJABw5z79R/vvmgf7iC6VS
 Ir6GwXI2D6NcUBtySX4NZ7po86Q75mdz9iWvVQKsF+fx0BGRhf0gn+5R00Fw37DyBgLz
 qJxA==
X-Gm-Message-State: AOAM530qq3caHln4JgEVnHFcHE0Uf18QTwNHBFi+GDDj1GEmMdduX67s
 tuXmREsHhHVvvO8+Es2tpvGDLTPzod+okQ==
X-Google-Smtp-Source: ABdhPJyeJEetAe/RjNbIoGv/eEFXFBGygqnoJ0Cz7K5R9Jd5Wc9+13EJcJgRfrvMhC38CVPyuxoRwg==
X-Received: by 2002:a17:907:2143:: with SMTP id
 rk3mr194965ejb.406.1629754651611; 
 Mon, 23 Aug 2021 14:37:31 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j14sm10298734edk.7.2021.08.23.14.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 14:37:31 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210821093908.677218-1-fontaine.fabrice@gmail.com>
 <20210821093908.677218-2-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <c48d01d9-53de-7b68-22e3-7c0d2f4a63ac@mind.be>
Date: Mon, 23 Aug 2021 23:37:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821093908.677218-2-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/2] package/sdl2: fix build with kmsdrm
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 21/08/2021 11:39, Fabrice Fontaine wrote:
> Build with kmsdrm is broken since bump to version 2.0.14 in commit
> 5e0da5c40da82d90c3f6ca037170838a6689b65b. Indeed, first patch was
> already applied in this version:
> https://github.com/libsdl-org/SDL/commit/9354aea19834ada7ffb90d379600a242a7aa820f
> but upstream made other changes that requires EGL so add an upstream
> patch to fix the build failure
> 
> Moreover, run autogen.sh instead of autoreconf as it breaks the build
> and is not recommended by upstream:
> https://github.com/libsdl-org/SDL/pull/4214
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/355c7e5092e7641d8b04ecb550e2671d70720bd2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

[snip]
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index ff6b29f29c..8c6a4c2f64 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -22,6 +22,12 @@ SDL2_CONF_OPTS += \
>  	--disable-pulseaudio \
>  	--disable-video-wayland
>  
> +# We're patching configure.ac but autoreconf breaks the build
> +define SDL2_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh

 This also requires a dependency on host-autoconf (not automake or libtool since
sdl2 doesn't use them).

 Applied to master with that fixed, thanks.

 Regards,
 Arnout

> +endef
> +SDL2_PRE_CONFIGURE_HOOKS += SDL2_RUN_AUTOGEN
> +
>  # We are using autotools build system for sdl2, so the sdl2-config.cmake
>  # include path are not resolved like for sdl2-config script.
>  # Change the absolute /usr path to resolve relatively to the sdl2-config.cmake location.
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
