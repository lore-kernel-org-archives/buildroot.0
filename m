Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9C1CD4850
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 18:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A81DC60B90;
	Fri, 22 Sep 2023 18:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A81DC60B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4badU3ZzpDOs; Fri, 22 Sep 2023 18:39:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6E8261675;
	Fri, 22 Sep 2023 18:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6E8261675
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9529D1BF2FA
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 18:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A92B61675
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 18:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A92B61675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLlvorPCmf1q for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 18:38:59 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26B1260B90
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 18:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26B1260B90
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so323627266b.3
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 11:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695407937; x=1696012737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h2yO64ZanVG22TcfDKcZvswYQlCYV6Ro2n42fZ8CcSQ=;
 b=imQ+8gtmMmooAPKvlUW9QRYLSP9bqDr5QFdKFqimlOGn6UiHxoJP2QIbRgpn2ZXWDZ
 6AgsV4/+qtWp8QYM8S51gnX+0sAp1lXB0no0CaoqNH7yFS8zRVZGmF9B9CmvHxNUj21f
 EjO05Vy39lNmO8F/ULFd3oo4BwTByhv6et+gAGMe8AoTyUbTKgT1dB1o7fPxg2Jg5qQb
 12sdSMaJcKnx8nIa4r4OCZJw+xcq+nMmUtzFTtZ7LoPCLh2ID0wG8weevmjXa8sdP9+F
 6ntCUHZ6vbLB+/7afsfnI8L4qgHF8pyksfDYFsaTpzIQQDAbQhfZ62snnr31Rlij3AIa
 RkXQ==
X-Gm-Message-State: AOJu0YwrL3VvpIITyLOrg8pWtDG8+js2OM+eHWGiogFnb3D9CT6/nxtZ
 s5OEUgnVTDt9hMb7V7Oe1gyX1Ob5fTP+L7OPiHs=
X-Google-Smtp-Source: AGHT+IGYsoZDX9NqPyyO0Chgvm/E0IVKepn7fCCdQSJLgLKLrZ+kw1bpoSqZ5lUNSPln33sQXpHdZw==
X-Received: by 2002:a17:906:3017:b0:9a1:6318:4d39 with SMTP id
 23-20020a170906301700b009a163184d39mr184026ejz.29.1695407937198; 
 Fri, 22 Sep 2023 11:38:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a1709060e4600b0099bd6026f45sm3009487eji.198.2023.09.22.11.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 11:38:55 -0700 (PDT)
Message-ID: <3a3931dd-0819-e4c6-4190-9c6625e8f644@mind.be>
Date: Fri, 22 Sep 2023 20:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230916151015.723729-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20230916151015.723729-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695407937; x=1696012737; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h2yO64ZanVG22TcfDKcZvswYQlCYV6Ro2n42fZ8CcSQ=;
 b=IBrVH0zwAVTsVa/YI5JD61dDNHbptRBdBGyjMh34JR1R/yEX3pXjYoZfXMQ46XyErQ
 jBtnITFIMEHEbU6tvnQaZYGY1KvJDy7noqc/lbkBPykRH6K1Po5OEvvJize5QEHOqr8Z
 ORE9dTuB42bt7HkmDOxPC7dWrK3w1rC+A5LEMZi9iuQXUWp1mcmse4LPImLn9D4d5Wuz
 87mDtjzP8Se4mKBY6rGJkmQRd3ghkJqKQQa4pe/eh3rccICpFGB2O7JjC0e+hH7j2iC7
 JUorVrR+5I8R06UYzAbF/UjIAOQzQN01+rEdpJploWNxrA4nBJgz+ZRYE09DkkNRB4gm
 Kn5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IBrVH0zw
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: add bsdunzip option
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/09/2023 17:10, Fabrice Fontaine wrote:
> Add bsdunzip option to avoid the following build failure raised since
> bump to version 3.7.1 in commit 7991d2c48a859f9c0333ade8192868c21b1a8a31 and
> https://github.com/libarchive/libarchive/commit/c157e4ce8eb170a92945cc2d292fd7106bdfcce1:
> 
>    CCLD     bsdunzip
> /home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/powerpc-buildroot-linux-musl/12.3.0/../../../../powerpc-buildroot-linux-musl/bin/ld: cannot find -lz: No such file or directory
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/aaf7fdefa0b7bd7e5ac743487c197544c1a2ce6f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/libarchive/Config.in     |  6 ++++++
>   package/libarchive/libarchive.mk | 10 ++++++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
> index ffa4cff7b3..2c8d813ccb 100644
> --- a/package/libarchive/Config.in
> +++ b/package/libarchive/Config.in
> @@ -30,4 +30,10 @@ config BR2_PACKAGE_LIBARCHIVE_BSDCAT
>   	  The 'bsdcat' program is a simple replacement tool
>   	  for zcat, bzcat, xzcat, and such.
>   
> +config BR2_PACKAGE_LIBARCHIVE_BSDUNZIP
> +	bool "bsdunzip"
> +	help
> +	  The 'bsdunzip' program is a simple replacement tool
> +	  for Info-ZIP.
> +
>   endif
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 2db36156b8..7e364e3902 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -42,6 +42,16 @@ else
>   LIBARCHIVE_CONF_OPTS += --disable-bsdcat
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDUNZIP),y)
> +ifeq ($(BR2_STATIC_LIBS),y)
> +LIBARCHIVE_CONF_OPTS += --enable-bsdunzip=static
> +else
> +LIBARCHIVE_CONF_OPTS += --enable-bsdunzip=shared

  It's not clear to me how this would solve the reported build failure - AFAICS 
it should make no difference at all if bsdunzip is selected.

  So I tried to reproduce the issue, but for me, the build just succeeds...

  Regards,
  Arnout

> +endif
> +else
> +LIBARCHIVE_CONF_OPTS += --disable-bsdunzip
> +endif
> +
>   ifeq ($(BR2_PACKAGE_ACL),y)
>   LIBARCHIVE_DEPENDENCIES += acl
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
