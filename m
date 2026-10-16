Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60F4CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF83817AF;
	Fri, 16 Oct 2026 15:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1wIFUrmodqo; Fri, 16 Oct 2026 15:06:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8810A817B0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163204;
	b=BgMEFDNEBR/VhfjxPo46LDvHJYj+krb2QAF+VQx2qk2Kvnr2Lq9EUiWVqLSH30hCGzQo
	 mmdeyXZr+lMnUC8Jr/nuI5dktphA1n12l/ffJqY8Ul+LWPrACUzEXXVdqAA4RQMEA1Hcp
	 NaY3xtL8W1Fyu1FiBE8DqKZ1oJQi1OI2LrWze9T+bLfAIDLuw//WQEmHx4VW1EXIuSJfY
	 v1ACuvn3DAeIWslTXPmV9jpK6bvxmM6CMKRZiJkpWjImX9tynxriG4kpUvRbOzMWkoe8S
	 vmEcegqamY1ziGXY9/SwHI7qgNB8SIvHf/gJQDu+nLF1cE2GHtKlyKBsTpxs/t38s+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163204;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MeKIIFeMNU9UrAL5WA5iR95CE2rD68z30voAX9Fv6kc=;
	b=RtpeqgfsThyNTWzLDoORqJ8J1syIvLyPyau9v3W0l8G2WMnQSs/VDoaFLMo4JZt2CIhv
	 d9IHU3PdyqKjUGw89JCMlIgqblEg5oC61M8wEB/vOc41TZrn5H5Ir8GQ2okelgP/Pjx1O
	 8/ykr9EPhpoenYYJ74LcbDDdaFE2Vdfz4EWh2ngEuAQWBDMF9502femX+kUlpmqcdHEAK
	 OtvMs+T9a7bRUcQzoe1QTGGAJg/B8DkDlGC6+0l1Z+bEoX7rJ8tse4h87GPEnUVppYn9f
	 LHRZPfUer7xFPBWlQmmAdcTbbp+z3BKddf6etNqKJC8PgIy4qUhNemhjv00IBF5gUAw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163204;
	bh=MeKIIFeMNU9UrAL5WA5iR95CE2rD68z30voAX9Fv6kc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HcOdoM2HE0oi95talSj/UH6806zdDe7ggEFvrlNbhs/MQvAjDy4FRXn7Q9+UV0thF
	 2vZWBl13URZYxhMlh3rJBSV+t0bbEkbq2hYavo/EJ7ZjXNw2kTPz22wYNIoZ4unBaV
	 4G4zeVSv/eUIH/SxIx4WBu4Tga12DOGrxq/3+jcTICNXirpoZsvnkhnpojOrJvmHcK
	 dMjA7CfhUNmqBZ/9TUWqs0193h44TrnY4KVchFX60JcGWpG0g9MCI40UN+rnbZJTTH
	 ofk5d8vZShBUnP9EHKoJH/EqfF8N/phrhp1I0/RL114+5i87qT+4PXgxdVsmqALGpB
	 W1EqDQvrywB0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8810A817B0;
	Fri, 16 Oct 2026 15:06:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37F31255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E00B817B0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHpoe5w17vmI for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EDF1E817D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163201;
 b=DqvOisiFFKGrovf9XuSTzE7Ia4jFIElLfSm5gn756W+pIXqAx5k4CWJWq07pToMYj/rK
 GdIN01clSFjqEBAW59ap5r0gvG6ntGB/xO1RUeH2uLvTpjBpuqtl+tcmN1Y41jxQOJqKN
 jPd2VxUMvUj1ioUaz06CWuq5tGKYz6mbeXolB7HjgQBYgLumiMKXUc+mJZ73+QOdhGPtJ
 UyroeVZaBJhTFxXCzhxXxFRqlz/mHzpW4VjZyJhKNuVhiJnsV0t0xZ9/gzteHYu/re/Jc
 wTJ2ErEICMJtlrkB4hMGD2i1wD4yjR8ud9CKhQFETOOzXr4Et7NmhpRkWOL476vJymg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163201;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=DwMANPB7fbdmMff3l00AyRQyAOtDNleaMVcQLeioNfU=;
 b=l3FoyzDYype9WtfNU1z6xk5J/KYa0yjzKaXKy+TPSKgACpXrgNY4lhW+I+a9yGmuH4rt
 +LK54+izMo2M1bCUAr3iBlS0wElfVI2C1r3Dp/HvUlyMmX1tqfT9jxrzNQIb0BKin4IqP
 aV6dbN2AwVh2mhURKswB53wxE2QZv3IXF6yuNcs/OIN8n10iS3Q8i1hXRZ4YOZvtFUQ1z
 skhtYsb7hnZ5BnsMRSzv3gG+xFVO4FARx2QSNKQ7LE6L4UrX6oVGkIeeUzxAaDa8JzxFa
 mozKH9Daz5eMiRGQverPFjGpRxDNkGdjhqU2Jrl7K6XvMfL3Jl3wOEFbVNkEIrdnnug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UKrs2jWM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDF1E817D3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:40 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a1cef0439aso776035e9.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163199; x=1792767999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DwMANPB7fbdmMff3l00AyRQyAOtDNleaMVcQLeioNfU=;
 b=XoKmd0CygEaiTFFU1QPkzkvEBQ/i8NT2B07EYuI6tqC4Sl7v29Z6z0TJgTC+1jV9Vi
 D3pth6j4xYaskvcz6AtE7ejL8WuNMwaIwjwRcWiFTnjIH1tdB4CPeYVazgZdbqhYrMny
 MnwuDCx2ETYURlPx4ii0a2Vi8mhBbx1zfgY0ed97J0IIdnblIHKZ7yJMigFF6MiyW7z3
 csoPRGF8nuRLN+bK5saFMYCGn4LM/CUJ0o1woPyfVLijliiXQSFshseLc2u9SwUwOY6a
 nzepa3DasaI1h4rxRYVsRja4LMAu9oYB5Cou3vxX4dn3cyEPXCCZ0IWpana2VzUEG5cT
 kuWQ==
X-Gm-Message-State: AFq9FYJiQ9o7TVBcKNYtZWsH9iW49+rBsq1hdePlX2KhdJsLD30WmpQI
 etr7IMvW+1gn3Gik3N5UIbwOa2I76HGwH+ro/NQTV8hVBM3p+BWjnjuB0tLYyDT4oB61DF5LQy8
 7+Hg3gQg=
X-Gm-Gg: AYBFou0VWJ2DBwkV9EHWGkDRENBqBrS8zc8VN3d4dD5MeV0N+5CR52ucREu7G/1/r7h
 xWCa8gOKhUQcFpxiLJlT1jMkHS3ywIK41vxBXmYtFxIuK7s9/U8gpcBnkpjDvj3xVDW5HbZZGFz
 pmPdbdcWPsOmDaOqepO2+85GHTNYA91I0iqnwvB1vliHw/MuC3oCoypNrOfsbPQQh8mDGjmRHc9
 fVBL2untiEtiSOfyc+9avcZKvRmbYMUMsGFH9WuNu+HjIJa0/eyS95e7pUoKRPNtEmFnvFdqGqj
 EobR2GFDwHcEbydNonWJe7ei8noUVs7ZlgHcC0s2vjoQ9Aa+fAzRY2kpFZVYeEGfmVXYJeB3N3G
 ZrCHDzMwm2d9h8Hg4GunZz7Pr35psDWP92CCP0790rLzISNddK6p7vJh503RfgQseVtrsi5JhrG
 L/HutjZVMf0F52KvCxObBzk8bCHUus9xegl+s/ZDqQFuNdlYZcwkogGpd9LDUFihuRUUSm3xnaO
 qGU5omqQutEI2LtIBC1yeMFormhb0gEFxQtj/v4jA==
X-Received: by 2002:a05:600c:5250:b0:4a0:1c0e:b136 with SMTP id
 5b1f17b1804b1-4a1d7616bfdmr1407965e9.29.1792163198916; 
 Fri, 16 Oct 2026 08:06:38 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1ce02d619sm38211445e9.3.2026.10.16.08.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:06:38 -0700 (PDT)
To: buildroot@buildroot.org,
	Christian Stewart <christian@aperture.us>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:06:35 +0200
Message-ID: <20261016150637.77182-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CA+h8R2pgiSspGVG7w0mSFETY+-HnjSB6B+h+xsu-EdRgLVqMog@mail.gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: new major version 1.27
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Bump to go1.27.0. The go-bootstrap-stage5 package (go1.25.x) still
> satisfies the bootstrap requirement, so no bootstrap stage changes are
> needed.
> 
> Remove the workaround for https://github.com/golang/go/issues/77436,
> which the go.mk comment scheduled for removal at this bump: restore the
> plain CGO_CFLAGS and CGO_CXXFLAGS settings in HOST_GO_TARGET_ENV.
> 
> https://go.dev/doc/go1.27#bootstrap
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   | 12 +++---------
>  2 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 1c43cabf7b6..bc6d026a6c0 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  a0721c54c688901448d77ad9b3ec7ea7c474730755ff891382e92ecb93ff2cb1
>  go1.26.6.src.tar.gz
> -sha256  f09a71029fc5cd2940fbe36b0eb1fb2d8f3407cd6adb6b7b4de3eaf04007f8c4
>  go1.26.6.linux-386.tar.gz
> -sha256  708effb774be8237570d0add163225abbdfaf4fca28b2611df167beba4feef89
>  go1.26.6.linux-amd64.tar.gz
> -sha256  d0507e9e9d7fe012aae570108cbd76c15de879e17130ab8cb90d4d7445cb1f2e
>  go1.26.6.linux-arm64.tar.gz
> -sha256  e1379a2fe77bd30fa29833074388247e7c65416e09279f746f20de2d5cf4dfea
>  go1.26.6.linux-armv6l.tar.gz
> -sha256  232b65543a42eda95df6a63f76235c1795bb535eba5c74e509faec71bc648388
>  go1.26.6.linux-ppc64le.tar.gz
> -sha256  958757933d38172dd544085d253c8738cf09793d24c8bc0422e5e1e1fffa4fde
>  go1.26.6.linux-s390x.tar.gz
> +sha256  7002403d7cc44529ef6d26f69a44818263395ead7c16c05a5808ae047ebeb0e5
>  go1.27.0.src.tar.gz
> +sha256  eac4abaca4113170a1cf261b8bf1d38480e61e99deecbc6a14767deb8b19e8ad
>  go1.27.0.linux-386.tar.gz
> +sha256  675c26c449cbb18fc24b74650de1eabbae6e16f64326fd85a283fb3b58280685
>  go1.27.0.linux-amd64.tar.gz
> +sha256  51798d2c42d0e1c6ed7fd9f48728b4193abac9e8aad6dbac2fe96a81f5909bda
>  go1.27.0.linux-arm64.tar.gz
> +sha256  e337ecd9c321377c0d8832690c2cb10463447c0bd0e65e2e3413dfff63a3435b
>  go1.27.0.linux-armv6l.tar.gz
> +sha256  068085e257a6014c036c723ca62943edbf48fd168b8d00a6d39527d10b656255
>  go1.27.0.linux-ppc64le.tar.gz
> +sha256  cb5c89fa48cba4123c68aee62b217ca030f281546df0898a0c32889c340b928c
>  go1.27.0.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad
>  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index df1023c19be..a49dc206cc6 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,10 +4,7 @@
>  #
>  ################################################################################
> 
> -# When bumping this to 1.27 (or beyond), remove the workaround for
> -# upstream issue https://github.com/golang/go/issues/77436, below
> -# (i.e. revert the commit adding these lines).
> -GO_VERSION = 1.26.6
> +GO_VERSION = 1.27.0
> 
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
> @@ -78,14 +75,11 @@ HOST_GO_TARGET_ENV = \
>  	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
>  	CC="$(TARGET_CC)" \
>  	CXX="$(TARGET_CXX)" \
> +	CGO_CFLAGS="$(TARGET_CFLAGS)" \
> +	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
>  	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
>  	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
> 
> -# Workaround for https://github.com/golang/go/issues/77436
> -HOST_GO_TARGET_ENV += \
> -	CGO_CFLAGS="$(subst -g3,-g2,$(TARGET_CFLAGS))" \
> -	CGO_CXXFLAGS="$(subst -g3,-g2,$(TARGET_CXXFLAGS))"
> -
>  # Allow packages to use cgo support if it is available for the target. They
>  # will need the toolchain for cgo support; for convenence, include that
>  # dependency here.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
