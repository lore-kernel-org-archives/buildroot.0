Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F8CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D946D40AB6;
	Sun,  5 Nov 2023 20:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D946D40AB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHUbvL_i91BQ; Sun,  5 Nov 2023 20:31:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C9F640AD1;
	Sun,  5 Nov 2023 20:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C9F640AD1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 970EC1BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70CF061043
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70CF061043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZi5acIg0xNA for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:27:12 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20FC261040
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20FC261040
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53d9f001b35so6312184a12.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699216029; x=1699820829;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9rp5x+ZyZ86BHaD3/kBJQaEabLdRUrUyLqlbkz4DKlI=;
 b=fiH7WVYXNHc+LXjTf971PaPZ9QZjGZKonL+kAXzRx7FBMX8pnjLQPEvU5oCJHQvhaU
 OQlTHm5EhuFvzEcmTNdMqdt0UhnVYyhSGU9skGBNpE31NJ2wSVpB4ML61egkPzqKHhxc
 53hY+W9qeS+MobjjF3vp6Bq3JYjT8RNpmkb5o5AHVhSx/ipLwpWgX/7VlOw3PMKB4kEW
 L2OMp35vr0QJGhl83ZgIGT9vJWbbtYsOwGurK/KOzwziNL1hH2ZRT9waCaXDqnA7xFjf
 WnyzstaLdAN9wviyTof+MawQ6zF/sCQzN4a57wQvZMlSMhoRNOZWD195KcQQMQMhBX/V
 EBCg==
X-Gm-Message-State: AOJu0Yzpc5t+2wMG0FuHn0cDIs//fd6tDVIAiV2VvExKgwewW3UL/Bzf
 TbzJTAQEFi9d3Z6R6chDQvvJQg==
X-Google-Smtp-Source: AGHT+IG+ckeBsjDaKuQs4EyZmQ420nOIFZvTtOEIV4YKm7U2Yl8rragPf63SvWLoISZezTKkxw2CVg==
X-Received: by 2002:a17:906:ee8b:b0:9be:263b:e31e with SMTP id
 wt11-20020a170906ee8b00b009be263be31emr11444116ejb.33.1699216029384; 
 Sun, 05 Nov 2023 12:27:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 gh17-20020a170906e09100b009a13fdc139fsm3297769ejb.183.2023.11.05.12.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 12:27:08 -0800 (PST)
Message-ID: <def388b5-bace-46fe-a236-b71299a5880c@mind.be>
Date: Sun, 5 Nov 2023 21:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231104225339.380802-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20231104225339.380802-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699216029; x=1699820829; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9rp5x+ZyZ86BHaD3/kBJQaEabLdRUrUyLqlbkz4DKlI=;
 b=aEduuC0ZeB+U/iOjOlWoEl6wQVnuxCeZJ8AeUquo80DmMl99uGvtcowL3sE6qiOrv0
 kgrKdUn2GRCbu9+zBBwAHnrfBOeX4d29t8Mew1VUgkMehiMQCMnEMPArOnoM0KZSjzFq
 XqPfAWV6BFRyfK/Fhaqqcf76WDleLQShdlRNvOph1mOmLoqT+uVDRn8g63reLbENnHHy
 FfB9bEQ2IjqnIJVCq8EewrWh8FCkfAih1ATU7N+vjgmSoTy4D+0vUwvGgg+Fh3NnzGfc
 pHLEGLMTdaUeWp1ZeuSAotq62GspqoLuY192Ytj9DVNuaWcRd5qPHtrBOB2ka6UkqIGf
 iusw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aEduuC0Z
Subject: Re: [Buildroot] [PATCH 1/2] package/traceroute: add
 TRACEROUTE_CPE_ID_VENDOR
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/11/2023 23:53, Fabrice Fontaine wrote:
> cpe:2.3:a:buc:traceroute is a valid CPE identifier for this package:
> 
>    https://nvd.nist.gov/products/cpe/detail/399C82DE-9AC7-4C48-8E9B-57C480E95FF5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/traceroute/traceroute.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
> index a02982a6b5..155e134c68 100644
> --- a/package/traceroute/traceroute.mk
> +++ b/package/traceroute/traceroute.mk
> @@ -9,6 +9,7 @@ TRACEROUTE_SITE = http://downloads.sourceforge.net/traceroute/traceroute/tracero
>   
>   TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+
>   TRACEROUTE_LICENSE_FILES = COPYING COPYING.LIB
> +TRACEROUTE_CPE_ID_VENDOR = buc
>   
>   define TRACEROUTE_BUILD_CMDS
>   	$(TARGET_MAKE_ENV) VPATH=$(STAGING_DIR)/usr/lib $(MAKE) $(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
