Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722FACD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 400CD40210;
	Sun,  7 Apr 2024 19:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhkG6yiQ1kda; Sun,  7 Apr 2024 19:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 376EF401B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 376EF401B1;
	Sun,  7 Apr 2024 19:46:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18DB81BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4ADEC401B1
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVKmnPMQUHMW for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 569AC40210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 569AC40210
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 569AC40210
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:45:59 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4162b8cb3e9so33187685e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712519157; x=1713123957;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1kA/53RdV6rcsI/jKETcUWASi1YRJmAK8zbKDU4ELE=;
 b=qRK6nbYIQofs6e+Ydw9TW1G+jujulkahOi96Dp8x2qQptHpmpBacswag+WfFctOnug
 wgA13OyF/z1BfvxpFrsN3IjiZ2jOAMvuMe2SXt1J1YcK+E32btIq7mTxIpuUPxX83rlg
 U5lUE7UlCJLXa4EoKPWODDCU3f66FU623FP25iwJPVyr/KKn8heZRiqwe/FhG+Z6MSFP
 NnsmYE3QK5LSVVObyjF6c2GY/KImakAkqsMqbDMXEt4Bpf62xkpRpLbUGciVxXX6nIos
 sjh0EfvbhtgAqbsjLtcJ5Na+nxS86GXCvc72MilGFbr5Mz1pBNDyCQETAVvYVMYvheyp
 pwZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb2nOXMH9lBM7UewdfOhyYQrjjQwVGt0CTdlU2h42QXExprqlxBcTBSmRAUL3ylsDJ+zkCl6CGTNEj/xeXDBejbE8FpcHDPg==
X-Gm-Message-State: AOJu0YzZmUEqFPH/pq4n4bpezI6MRIkNLm/1NuyybeLl3cxsSOz+AeP0
 YnNy0bPPmxC30eMu8wN9OawDnKCb1mR8LhfRAj5Jy5YVYu3jYzt/y3ZKxf2QTCA=
X-Google-Smtp-Source: AGHT+IGisufuzeFEY5e367bX3e/sOZKtb41IYVJqnTNGJjmhX2BfDrl0T53wTuE7wH+TyRuNaa6ofg==
X-Received: by 2002:a05:600c:19d1:b0:414:392:38d2 with SMTP id
 u17-20020a05600c19d100b00414039238d2mr6537933wmq.24.1712519157450; 
 Sun, 07 Apr 2024 12:45:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b004164a9e346esm4411718wmq.2.2024.04.07.12.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:45:57 -0700 (PDT)
Message-ID: <1d2cc275-7842-46bc-b7f2-c88104230e81@mind.be>
Date: Sun, 7 Apr 2024 21:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407170936.2788174-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407170936.2788174-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712519157; x=1713123957; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F1kA/53RdV6rcsI/jKETcUWASi1YRJmAK8zbKDU4ELE=;
 b=bN5BRWzlwoPDKzBRKBo2bItxy1ZGAQZHgSeCgfogPMCkr7yHRZ1Z5KXcEz5ZPCUUNK
 TGWCkOkKWwGw5Zh7dwiPSjFsoKH5feca14p1tiVoS4QnBG18GA0EZaoiX/fF27V//+db
 qRstH5JwKERz5o2VM+hcYRHBvuuPq1+3e6ndlu8ANXTWpYNAtcz4ysaP/h2nED6Vvl3W
 26gsXlQCJmQJxNy+cta5itGQajH7U73o4jlZZt6/Fm3xHtA32cv5UG6HOpLe+JZ70YAC
 IdYAb8z0d2X/rk6YnD7xRlDUG6pzBvDvj2/KeK58A38Jjls+qV+wXPMWxR3zmx7p+ZUC
 yZXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bN5BRWzl
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: security bump to version
 3.3.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 19:09, Fabrice Fontaine wrote:
> - Fix a potential denial of service caused by accepting arbitrary
>    length primes as potential elliptic curve parameters in ASN.1
>    encodings. With very large inputs the primality verification
>    can become computationally expensive. Now any prime field larger
>    than 1024 bits is rejected immediately.
> 
> https://botan.randombit.net/news.html#version-3-3-0-2024-02-20
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/botan/botan.hash | 2 +-
>   package/botan/botan.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/botan/botan.hash b/package/botan/botan.hash
> index 840191aa4b..37e00ea9cc 100644
> --- a/package/botan/botan.hash
> +++ b/package/botan/botan.hash
> @@ -1,4 +1,4 @@
>   # From https://botan.randombit.net/releases/sha256sums.txt
> -sha256  049c847835fcf6ef3a9e206b33de05dd38999c325e247482772a5598d9e5ece3  Botan-3.2.0.tar.xz
> +sha256  368f11f426f1205aedb9e9e32368a16535dc11bd60351066e6f6664ec36b85b9  Botan-3.3.0.tar.xz
>   # Locally computed
>   sha256  1833cde7c7cc03296b1ef2ddc178b1cd7fd1c476840f32cf6aedb09ab0bc9004  license.txt
> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
> index 95352ea41b..e0bd258f57 100644
> --- a/package/botan/botan.mk
> +++ b/package/botan/botan.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BOTAN_VERSION = 3.2.0
> +BOTAN_VERSION = 3.3.0
>   BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
>   BOTAN_SITE = http://botan.randombit.net/releases
>   BOTAN_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
