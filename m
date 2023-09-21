Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F522E7D0A6
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5DDD83CBC;
	Thu, 21 Sep 2023 19:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5DDD83CBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTubF25DqTZN; Thu, 21 Sep 2023 19:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DC8483CB8;
	Thu, 21 Sep 2023 19:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DC8483CB8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E46001BF98E
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDB4683CB8
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDB4683CB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6GvxrbHySiM for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:43:20 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EB8582136
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB8582136
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99de884ad25so166733466b.3
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695325397; x=1695930197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cagFc5hHGx4J2CSvTIFq0sxBWq1NjmBqYFOC3StwNQk=;
 b=EzoH5YaWEmH+3bneR3JQPw4bParekDNWQZ/jenflgxj8hVmSPrPC+MzwOkOmOJ88+u
 P/OVMn8Fh8U4vPPc9ViHqbMXStHWGfpfZDCQeP/sjDkdZuvjllaQQ32yCb86TqhCk/Sq
 oKd+y0f7nSJ9FoBM7Sb/aj72uKevNC8JLm0OL6UwKJCfE0hq/u/LvywPBLiGQXb6Veg4
 Mq6viitFUMsLRu1nXGuJd5y4+NxSCU/X828FeGRZ5kgDWOfnHkRd97VQhr6H8yJmO5Rv
 pbBPE7h5igWTM24bi6/kyn7SIdnUqvb75ypaEZQWzP7rhE1KdYvy+AZDb/QiNIv5xWtH
 zjAw==
X-Gm-Message-State: AOJu0YyRycjJIzZA3ArOm9MQsk4kiwt8Fgh2FitgW/HHzkVjXv/pIbwH
 Dtj6M5PkUghbwSY9ia7vNXkTVw==
X-Google-Smtp-Source: AGHT+IE6Au2cyMm25Zj2iOI/77XZKHWw/Mz19fBJ7OF+pHwESxku4g76pc6j31seNfcgZ58gqDm2Gw==
X-Received: by 2002:a17:906:76d4:b0:9ae:5db5:144 with SMTP id
 q20-20020a17090676d400b009ae5db50144mr2784737ejn.46.1695325397501; 
 Thu, 21 Sep 2023 12:43:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a1709064e8500b00993470682e5sm1485885eju.32.2023.09.21.12.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 12:43:16 -0700 (PDT)
Message-ID: <4e2c842f-8f37-5a89-ad59-eba39ed5ff69@mind.be>
Date: Thu, 21 Sep 2023 21:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230917194804.768692-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20230917194804.768692-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695325397; x=1695930197; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cagFc5hHGx4J2CSvTIFq0sxBWq1NjmBqYFOC3StwNQk=;
 b=NpUxmziWGddaKmUl8cpgftgbhXY94cD571LHytL4GNUbH4R+y3IXFuPqUPmpciRZYi
 v3JSIH0/ys2Ixq1DYrcvDX6IBSAbfJDJNglEpPH4BazUR9fAPFeBrO86lmzD3xSyR72D
 YxGiL574VVOtLPTYRRyBjQp5HRyjhSFVgmjCAZ5cAgCZIr92RXkUzzS2TTDbDSt26kIU
 Eno4N7H3FN1h7Ta/GUhJzcn2xyvToUdsYUXHna1jn1dzQ4rYn77NzDcIupyCaNyzBZCE
 t2TFgnnlTWzDGocLzgmsoso2CyCuOZtnH1hiqNxmgAWo7nR2ySfFTHUX/UfQ+M2cQyKP
 jWAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NpUxmziW
Subject: Re: [Buildroot] [PATCH 1/1] package/libuv: needs gcc >= 4.9
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Bartosz Bilas <b.bilas@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2023 21:48, Fabrice Fontaine wrote:
> libuv unconditionally uses stdatomic since
> https://github.com/libuv/libuv/commit/2f33980a9141bd49cb2c34361854355b23b1e6fc
> resulting in the following build failure with gcc < 4.9 since bump to
> version 1.45.0 in commit 21764235cb7f7fb767ea4b5d825e39c711aee235:
> 
> In file included from src/fs-poll.c:23:0:
> src/uv-common.h:41:24: fatal error: stdatomic.h: No such file or directory
>   # include <stdatomic.h>
>                          ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6b9ce25ba7e5c5602313d533f460f8829f767f81
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

[snip]
> diff --git a/package/cmake/Config.in b/package/cmake/Config.in
> index 4ef5612b57..57b1ebf9fd 100644
> --- a/package/cmake/Config.in
> +++ b/package/cmake/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_CMAKE
>   config BR2_PACKAGE_CMAKE_CTEST
>   	bool "ctest"
>   	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # from jsoncpp
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv

  Here, I kept jsoncpp in the comment as well. That way, if someone ever removes 
the libuv dependency, they are reminded that jsoncpp also introduces a gcc 
version dependency.

  Note that for nodejs and uvw, the gcc version dependency comes from the 
package itself; there's no way that that version dependency will ever go away, 
so there's no need to track the dependencies.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
