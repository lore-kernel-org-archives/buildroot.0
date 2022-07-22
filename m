Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D320C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 22:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D10F4045C;
	Fri, 22 Jul 2022 22:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D10F4045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dcDBFxqPoE5b; Fri, 22 Jul 2022 22:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20B7940414;
	Fri, 22 Jul 2022 22:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20B7940414
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 278FD1BF5D7
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 22:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EB0C60A8A
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 22:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EB0C60A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZ90ni4oi9wG for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 22:10:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DE7E60A68
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DE7E60A68
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 22:10:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k11so7772195wrx.5
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 15:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/nKz9+2VIVSFKrVfIvyLiQhw7ek0DIn2mkFFhlsnePI=;
 b=FIcYwMnP/3fMEEGsGMJ1VanGE3cTtiOlooB13xMnAMV3nqT/OGPO9xOS4qeN+f6dn8
 CDRsFHbuu2i2WPAnhW0uSoMFK+pmciLwuXIgFbCGyZdXZVyFoDtVT3zOUnaYKVVcyKdn
 nk5lgFwhDb5qzm1tcEOPELX2MyJOGGXtP79wOM0Z5ZpyK+PGIniDCJ0M4x3bwAS1aczs
 SqIRmQ4kN8BOcyepWtI5o9oyG2XXsLdOjbqzT3o/udhYrlYsj3B/kefNsFQs2++QaVMP
 YwKDp0JqegeWdNWKtylK4X5rR9gz2dxbGLoKaUnnI7HAXvbHaFZoeZ2IOuRz5MkIYEOU
 9b4g==
X-Gm-Message-State: AJIora9wRDjuKKzlGdq3bLLM/skNjFUHC2V+9QEYak5XCk1j/GncKHL4
 GZJWUiHFiaiiqsWb7gTVjAb+WiyD++Lq4HwP
X-Google-Smtp-Source: AGRyM1tn0bOMt2F22u8ADFVFzpZV/1t1lmliLsVWOb/PoeaiHlLuJJy9/38y5tJFYNt+F3gYW+q1vQ==
X-Received: by 2002:adf:dd91:0:b0:21e:4e97:c146 with SMTP id
 x17-20020adfdd91000000b0021e4e97c146mr1156727wrl.281.1658527855326; 
 Fri, 22 Jul 2022 15:10:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 c185-20020a1c35c2000000b0039c5642e430sm6237640wma.20.2022.07.22.15.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 15:10:54 -0700 (PDT)
Message-ID: <d672e040-67d8-2fd6-705d-4ff62e2bfec5@mind.be>
Date: Sat, 23 Jul 2022 00:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20220721183446.3675375-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220721183446.3675375-1-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=/nKz9+2VIVSFKrVfIvyLiQhw7ek0DIn2mkFFhlsnePI=;
 b=gy4i5FvQCqZL8cryMpLxiR3rtMHSCRx/IEa3ZGDMJq8sx4OCvZxSVA4EOqgJ3cfm1a
 TmDsR6Vz1kl54XtxVXpyiMK9m6zmmdYxFJJS1eERVYWx0VJIZtNsNubpqn5MIxPHkOof
 pGnJZcNrtm9YnOXKD2MIEXDwtlkxcxZMNn2L9EYKFTt9GmjdEfTChU/KA7wZqfzb3zUB
 5hRBarW6H9B/TY0NaR5zdYSb5psPKkBLZLYCiD09mp5dLdheCBIwhuwBRkZXxpHVGYRF
 Z1CYsqwkOyrfpKWE5HVsdSfAWyC09cQ2xJGUC0jCkH6PZHDxZUN2s62gRI0e/1NoemWN
 cCxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gy4i5FvQ
Subject: Re: [Buildroot] [PATCH] package/re2: bump to version 2022-06-01
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/07/2022 20:34, Michael Nosthoff via buildroot wrote:

  You're signoff is missing. You can simply reply with it, patchwork will pick 
it up.

  Regards,
  Arnout

> ---
>   package/re2/re2.hash | 2 +-
>   package/re2/re2.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/re2/re2.hash b/package/re2/re2.hash
> index 28f407cc32..380b547658 100644
> --- a/package/re2/re2.hash
> +++ b/package/re2/re2.hash
> @@ -1,3 +1,3 @@
>   # locally calculated
> -sha256  1ae8ccfdb1066a731bba6ee0881baad5efd2cd661acd9569b689f2586e1a50e9  re2-2022-04-01.tar.gz
> +sha256  f89c61410a072e5cbcf8c27e3a778da7d6fd2f2b5b1445cd4f4508bee946ab0f  re2-2022-06-01.tar.gz
>   sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
> diff --git a/package/re2/re2.mk b/package/re2/re2.mk
> index b6d29c3caf..39b2c8d990 100644
> --- a/package/re2/re2.mk
> +++ b/package/re2/re2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RE2_VERSION = 2022-04-01
> +RE2_VERSION = 2022-06-01
>   RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
>   RE2_LICENSE = BSD-3-Clause
>   RE2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
