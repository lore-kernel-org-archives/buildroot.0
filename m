Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91817C43217
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 13:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E266A4056A;
	Thu, 24 Nov 2022 13:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E266A4056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjkid6sqB4Hh; Thu, 24 Nov 2022 13:47:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F00A040C89;
	Thu, 24 Nov 2022 13:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F00A040C89
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE01B1BF419
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 13:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 873E841BDB
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 13:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 873E841BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9dqG3QBNceD for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 13:47:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32D8541BD4
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32D8541BD4
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 13:47:39 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id s5so2583665edc.12
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 05:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sOgD17j8xwbFqjihLIfu1nNyJWA+Qg5aA3k1IbAYTAA=;
 b=TXXMt30IfIFezQQIHSchZkAQLANIASFmTdg3/E8Ym+sScGOvrcjvfwvj1OE+ty4ja/
 1SQwiEBrV9SG6yl41kfPRrEflODoiYHKbNAVU92Zf021yyYHM2oXFaOGMHZP5GC5ylsv
 X8uOZGzwXYrqce865xGCfrA+BXK4xCK0nPFiK2QEwGH0N4UogQP1kQyY9S1yuKhqNgmc
 s5N2wJDN++Lug1xhCX1q3w378zxF2n6VxDJ5Va4jjeG8D6X8mkjq4BQK18VVtYW1xaZl
 R3368yiBmZXldpMuVSarHvovxGc4frthM6QSOhZA/YAFyhoChHD9Slz8JWUbsCs5+9Dh
 8Igg==
X-Gm-Message-State: ANoB5pk45NX3Hn4FlH28FN5yzgmlHMMzu/0JCBHZA4D4imSOn42Q5Zpf
 mviIUW9FAZ6gtmnPT8vcKhGfIg==
X-Google-Smtp-Source: AA0mqf7mXRwcE+FtzJDZNmNssMFGAvMRLLVEby4TpXSHpI9lQnx6WqsSwj2oU/JYZyEViFbFiMZlPA==
X-Received: by 2002:a05:6402:2929:b0:469:b603:ca21 with SMTP id
 ee41-20020a056402292900b00469b603ca21mr14482339edb.350.1669297658011; 
 Thu, 24 Nov 2022 05:47:38 -0800 (PST)
Received: from [10.1.0.116] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 p24-20020a056402075800b0046191f5e946sm532237edy.21.2022.11.24.05.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 05:47:37 -0800 (PST)
Message-ID: <2c5c61d4-dc85-3848-ffbe-a7a1b55dca5b@mind.be>
Date: Thu, 24 Nov 2022 14:47:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20221101003419.754757-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221101003419.754757-1-christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sOgD17j8xwbFqjihLIfu1nNyJWA+Qg5aA3k1IbAYTAA=;
 b=WPkfXxwLLgbeTtmtOVIpltim6FWvTddFy5qe1ErkrWTbQkpjCO3zu3uZABrxJnk2aC
 TxgrFhR2udvo8mbqYlvg4VjiiIZpP9B+RmxTDQ/6ri7TAkVjpfA4DbEAK7ls1Hu++876
 PpSdX6LvLtUUBxvu146jd7eJkuf2qRq9BonM+coyX8/fRbv75k6+RwzvNII7KBY/RyXf
 H8xaMZRPktk3P92kqjJA+Gfq3xUIc6c5MM4jlQU8g6507Ag0R5L4SHkR7blc/HOLNG53
 +NntH7eiEzooLH+vbKJKrG3pLHIe3+KBxHhKx9JhGTws7b2scIExz5gAYvL5E7RYeV80
 6YmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WPkfXxwL
Subject: Re: [Buildroot] [PATCH 1/1] package/go: disable stack protector for
 cgo
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/11/2022 01:34, Christian Stewart via buildroot wrote:
> Enabling the C stack protector for Cgo causes a build failure on i386:
> 
> runtime/cgo(.text): unknown symbol __stack_chk_fail_local in pcrel
> runtime/cgo(.text): unknown symbol __stack_chk_fail_local in pcrel
> runtime/cgo(.text): unknown symbol __stack_chk_fail_local in pcrel
> runtime/cgo(.text): unknown symbol __stack_chk_fail_local in pcrel
> runtime/cgo(.text): unknown symbol __stack_chk_fail_local in pcrel
> runtime/cgo(.text): relocation target __stack_chk_fail_local not defined
> runtime/cgo(.text): relocation target __stack_chk_fail_local not defined
> 
> Add: CGO_CFLAGS=-fno-stack-protector
> 
> https://github.com/golang/go/issues/52919

  Based on the comments in this issue, I could determine that this was in fact 
already fixed in 1.19.1, which we applied in Buildroot on September 7. I could 
reproduce the issue after reverting to 1.19, but not with 1.19.1.

  Therefore, I marked the patch as Rejected in patchwork.

  BTW, in the future, please make sure that a patch that fixes something 
includes the Fixes: tag - this marks it in patchwork and makes it easier to pick up.

  Regards,
  Arnout

> 
> Set CGO_CFLAGS and other flags while building Go with make.bash as well.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>   package/go/go.mk | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/go/go.mk b/package/go/go.mk
> index fe4d3a29a9..d6c15c4ac9 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -49,6 +49,8 @@ else ifeq ($(BR2_aarch64),y)
>   GO_GOARCH = arm64
>   else ifeq ($(BR2_i386),y)
>   GO_GOARCH = 386
> +# stack-protector causes a build failure on i386.
> +HOST_GO_CGO_CFLAGS += -fno-stack-protector
>   # i386: use softfloat if no SSE2: https://golang.org/doc/go1.16#386
>   ifneq ($(BR2_X86_CPU_HAS_SSE2),y)
>   GO_GO386 = softfloat
> @@ -78,7 +80,7 @@ HOST_GO_TARGET_ENV = \
>   	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
>   	CC="$(TARGET_CC)" \
>   	CXX="$(TARGET_CXX)" \
> -	CGO_CFLAGS="$(TARGET_CFLAGS)" \
> +	CGO_CFLAGS="$(TARGET_CFLAGS) $(HOST_GO_CGO_CFLAGS)" \
>   	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
>   	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
>   	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
> @@ -109,6 +111,7 @@ HOST_GO_CGO_ENABLED = 1
>   endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   
>   # For the convenience of host golang packages
> +# stack-protector causes a build failure on some architectures.
>   HOST_GO_HOST_ENV = \
>   	$(HOST_GO_COMMON_ENV) \
>   	GOOS="" \
> @@ -116,7 +119,7 @@ HOST_GO_HOST_ENV = \
>   	GOCACHE="$(HOST_GO_HOST_CACHE)" \
>   	CC="$(HOSTCC_NOCCACHE)" \
>   	CXX="$(HOSTCXX_NOCCACHE)" \
> -	CGO_CFLAGS="$(HOST_CFLAGS)" \
> +	CGO_CFLAGS="$(HOST_CFLAGS) $(HOST_GO_CGO_CFLAGS)" \
>   	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
>   	CGO_LDFLAGS="$(HOST_LDFLAGS)"
>   
> @@ -133,6 +136,9 @@ HOST_GO_MAKE_ENV = \
>   	CC=$(HOSTCC_NOCCACHE) \
>   	CXX=$(HOSTCXX_NOCCACHE) \
>   	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
> +	CGO_CFLAGS="$(HOST_CFLAGS) $(HOST_GO_CGO_CFLAGS)" \
> +	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
> +	CGO_LDFLAGS="$(HOST_LDFLAGS)" \
>   	$(HOST_GO_CROSS_ENV)
>   
>   define HOST_GO_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
