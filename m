Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B56C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 14:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59F36821B7;
	Thu, 24 Nov 2022 14:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59F36821B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0B8YpxGAaNF; Thu, 24 Nov 2022 14:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E8BF8218C;
	Thu, 24 Nov 2022 14:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E8BF8218C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFA141BF2B1
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B560D60E83
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B560D60E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YCAxmjDsoFB for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 14:38:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A626660C0C
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A626660C0C
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 14:38:11 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id vv4so4614926ejc.2
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 06:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CrOJ+EYxeoA20I16Yl8W2FI8LdudKKGCeeMy89mB1Xc=;
 b=rUcTpH7WF+73yqvzIzyNez2Z6aVFNF7wRDhaUbfoLQfOgWWwU0ezBVvC6zzlahfQmN
 N5r/KgEnSk6gO2h0QnfmtyEQ+KOAsJpFMfGk4UA6qiLjvDCF6+4Uiu0GWeVbxuLnVQP0
 efP7lA46PeaUSLKTVkRQE1AZjhbdAP9Tb1gRPb1dF0kjdxd7zMIvYojYIAR9iaxMqnAD
 nVfvoRe7oa+ZJutuor5xlqNAhJrjB/m+UTxnc7H82UQq9Rg6cIad2opPwl5RucBvgxpF
 u72yqEzZi8U+vzyCFDKOF/r5K6q895YsSdNKK+NuRZFMMCgJN+31AWUks5v+2/doPRk0
 oteA==
X-Gm-Message-State: ANoB5pkgdulpIk9q2TjVYCDa6kzSj0bpWOuhKCVy9r+2orXx19UESOFV
 KTZPY1pzElUyZgpFrOvG2M9Glw==
X-Google-Smtp-Source: AA0mqf73Nd4tBKQ8qOyKsglYVVfF0RPd55/F9AVQYNt22Dhh3Zeq7EkWy9S+z5IriRwcZxtsHb2mdw==
X-Received: by 2002:a17:906:2d49:b0:7ae:16a9:e4d7 with SMTP id
 e9-20020a1709062d4900b007ae16a9e4d7mr27605525eji.574.1669300689825; 
 Thu, 24 Nov 2022 06:38:09 -0800 (PST)
Received: from [10.1.0.116] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 9-20020a170906210900b007add62dafbasm479861ejt.157.2022.11.24.06.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 06:38:09 -0800 (PST)
Message-ID: <337b25c5-9c0f-ac90-bbef-505adeb7003b@mind.be>
Date: Thu, 24 Nov 2022 15:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20221124135334.158081-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221124135334.158081-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CrOJ+EYxeoA20I16Yl8W2FI8LdudKKGCeeMy89mB1Xc=;
 b=fNEn7U41uEWhIJJlRXjYGsk6lSh7rIb5Aif1/evE40Db0r9vaeSBrzo4JTUwGQGJMg
 MrpJyXCSpfNqVo7D/tdvcQC1moRcTVVV2cpd8VdxT6Oa4PeylUO4E51Q9yJlaoTtp1Fy
 HSV9C2cbN0NB0X2f+MBwM0ceSs/L5VVZEJLpjeFmuV9n9mHNUOYK2McQjMh3nQVvsAsl
 B5cWZBeSAoU3m9LHHLUsxS+GLnk4JBwHu8exJG2Ysgajk2YFwnfcndVWlQbblj1lOnSK
 o7Y+xXU9DbaR3lkQI8Dr4RKJv15AeszhWT4D9OflJTGwRyAnsDCdDeJYFkN6Q21db0BK
 exhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fNEn7U41
Subject: Re: [Buildroot] [PATCH] package/libkrb5: security bump to version
 1.20.1
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
Cc: =?UTF-8?Q?Andr=c3=a9_Zwing?= <nerv@dawncrow.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/11/2022 14:53, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2022-42898: In MIT krb5 releases 1.8 and later, an authenticated
> attacker may be able to cause a KDC or kadmind process to crash by reading
> beyond the bounds of allocated memory, creating a denial of service.  A
> privileged attacker may similarly be able to cause a Kerberos or GSS
> application service to crash.  On 32-bit platforms, an attacker can also
> cause insufficient memory to be allocated for the result, potentially
> leading to remote code execution in a KDC, kadmind, or GSS or Kerberos
> application server process.  An attacker with the privileges of a
> cross-realm KDC may be able to extract secrets from a KDC process's memory
> by having them copied into the PAC of a new ticket.
> 
> Bugfix tarballs are located in the same directory as the base version, so
> introduce LIBKRB5_VERSION_MAJOR.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libkrb5/libkrb5.hash | 2 +-
>   package/libkrb5/libkrb5.mk   | 5 +++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
> index 2fce24b45b..94dfa2ed6e 100644
> --- a/package/libkrb5/libkrb5.hash
> +++ b/package/libkrb5/libkrb5.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -sha256  7e022bdd3c851830173f9faaa006a230a0e0fdad4c953e85bff4bf0da036e12f  krb5-1.20.tar.gz
> +sha256  704aed49b19eb5a7178b34b2873620ec299db08752d6a8574f95d41879ab8851  krb5-1.20.1.tar.gz
>   
>   # Hash for license file:
>   sha256  cfadcf7b2ead2f3af793c25c00638c9908ac0023b101695f40cb9a03b16811dc  NOTICE
> diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
> index 5e547470ed..9bacfaee58 100644
> --- a/package/libkrb5/libkrb5.mk
> +++ b/package/libkrb5/libkrb5.mk
> @@ -4,8 +4,9 @@
>   #
>   ################################################################################
>   
> -LIBKRB5_VERSION = 1.20
> -LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION)
> +LIBKRB5_VERSION_MAJOR = 1.20
> +LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).1
> +LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
>   LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
>   LIBKRB5_SUBDIR = src
>   LIBKRB5_LICENSE = MIT, BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
