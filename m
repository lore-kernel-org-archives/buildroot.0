Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7604AEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 205B040022;
	Mon, 19 Jun 2023 19:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 205B040022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yGT3hgyamVdu; Mon, 19 Jun 2023 19:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D52841563;
	Mon, 19 Jun 2023 19:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D52841563
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 158511BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E14E561274
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E14E561274
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlCXU44xJOtT for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:34:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE3776070A
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE3776070A
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:34:34 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b47742de92so21080131fa.0
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 12:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687203272; x=1689795272;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lXnQKja05hAAIKJNpM0xVXFDkv2y7LJ7Qd5zL9oH8LM=;
 b=DAEPISJUlTc8s3G5wEhu0vdtnU/K4Un8BG8uZoiliQbL7IU7008x2xtq30eilVOJrx
 7eRmwqLUSjzqtH75k0bQWoB1fAQsrvPEhb5P/da4P+cVXlYT3Dekd7x48VeemJJV4010
 ilzjsgt6M+IKWTVAOAEZbLpyn71ASv+7ryoK22Iplw7I6RNAkRWos7BvYyAXO5Q6hFaw
 rfKQscazWC9OLV2YqBrh7bmEBlO7zl/bvyDsCVN92s+/NssQrTHdYb1DLiZEDoNgjzkB
 0dspz9XI+dRTUPi3EtFDvykm6XzvyFTrxHLdFAbCfQ+bsD+zu5mvJQQBbVlds6Of3IeR
 X4BA==
X-Gm-Message-State: AC+VfDzIOOpZUM2PRZ0UtiVyoUK1maLkxxGM36eIaGvzRXjnrXxu2GNe
 qHWTcxpzVLe41MTQgexE3/IumA==
X-Google-Smtp-Source: ACHHUZ6ExILJx2Xa+w9kJYF3zUDgpKnP7dpZUuOHX8QngeR0B1OFS2sETOchmihAtaetsahUBFMxmw==
X-Received: by 2002:a2e:3019:0:b0:2b4:7380:233 with SMTP id
 w25-20020a2e3019000000b002b473800233mr2454016ljw.5.1687203272516; 
 Mon, 19 Jun 2023 12:34:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 lu4-20020a170906fac400b009889c4bd8absm92570ejb.216.2023.06.19.12.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 12:34:31 -0700 (PDT)
Message-ID: <370ff03b-7373-8a3d-5f3e-0543809ed272@mind.be>
Date: Mon, 19 Jun 2023 21:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20230619143220.210438-1-peter@korsgaard.com>
In-Reply-To: <20230619143220.210438-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687203272; x=1689795272;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lXnQKja05hAAIKJNpM0xVXFDkv2y7LJ7Qd5zL9oH8LM=;
 b=NihvMnfJ6hRi+ZR/H5CjOcWesDTqdE7n2ogxj+BZWyWo8nIs0tE4/gSzOtCtXzozTH
 hr1LztuMN+m/eAGVpZjrD/sIs1VuJjdN04uMcpNrvSczrahqhf9pGk0VYw9sFk6ZzhZY
 6FjTMSI3P4HFOvvBZiEXj/T2TU6gSrPmNbr5F5+v8pkliSjz0npfBBUToLKDW/EnKAsk
 snUJh/mACy47c7em9pbgIRTu0Mg059zjOyTMju4KrECa7ziu5UPu4jfYioEglOdJv8aW
 2g1mmxs6MYhDEZ6H9eDrJFbEvU+2kIiStfJgTCzc0s4V3Iqnxzxex71ZAMUodrlanfyS
 qp4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NihvMnfJ
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to version
 16.20.0
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/06/2023 16:32, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2023-23918: Node.js Permissions policies can be bypassed via
>    process.mainModule (High)
> 
> - CVE-2023-23919: Node.js OpenSSL error handling issues in nodejs crypto
>    library (Medium)
> 
> - CVE-2023-23920: Node.js insecure loading of ICU data through ICU\_DATA
>    environment variable (Low)
> 
> - CVE-2023-23936: Fetch API in Node.js did not protect against CRLF
>    injection in host headers (Medium)
>    https://github.com/nodejs/undici/security/advisories/GHSA-5r9g-qh6m-jxff
> 
> - CVE-2023-24807: Regular Expression Denial of Service in Headers in Node.js
>    fetch API (Low)
>    https://github.com/nodejs/undici/security/advisories/GHSA-r6ch-mqf9-qc9w
> 
> For more details, see the advisory:
> https://nodejs.org/en/blog/vulnerability/february-2023-security-releases
> 
> Update LICENSE hash after an update of the openssl license snippet:
> https://github.com/nodejs/node/commit/e7ed56f501389978e4619ab697a812631c4061ff
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nodejs/nodejs.hash | 6 +++---
>   package/nodejs/nodejs.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 4408782248..6ab4c53e79 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,5 +1,5 @@
> -# From https://nodejs.org/dist/v16.18.1/SHASUMS256.txt
> -sha256  1f8051a88f86f42064f4415fe7a980e59b0a502ecc8def583f6303bc4d445238  node-v16.18.1.tar.xz
> +# From https://nodejs.org/dist/v16.20.0/SHASUMS256.txt
> +sha256  e0990f992234e40a51fe11f92c3816c93a77e1b081145d3dd762cd1026345349  node-v16.20.0.tar.xz
>   
>   # Hash for license file
> -sha256  0bec08634ba79b5404f6b7f92ea850f3c2a06e27e6f83f2267e4f5e55ae33334  LICENSE
> +sha256  ba325815d3df8819bebaf37cad67d6e1f82271e1e4a1189b53abd28e261977d6  LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 539ded06cd..fe629ada21 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NODEJS_VERSION = 16.18.1
> +NODEJS_VERSION = 16.20.0
>   NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>   NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>   NODEJS_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
