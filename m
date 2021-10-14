Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FACC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:41:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A38460E97
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A38460E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A702400D9;
	Thu, 14 Oct 2021 21:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeQJ_uhP1xtL; Thu, 14 Oct 2021 21:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 475C440114;
	Thu, 14 Oct 2021 21:41:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 156F51BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04650405BE
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cClBVnsxfKaM for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:41:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D14F40581
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:41:51 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g10so29817252edj.1
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=wiNPfns/asbYxFskeoy2Kf9v3vKFjHeK7vQNBUmYh/k=;
 b=Ye2YXC/Ym8RaWnVwm7SPVybYl0fORDpjqDDoWjcOfIh0dro2f6yUaJa370Pp8ppBW9
 2DdlSGaPQ7LC8dip8l3gIILX7Q0th8uPxAliwpLE0zPvzEGqXJ0rGh+Il9ru48FwvLxG
 m+KgK6g6cxylx3N3+wt4y1oegu3DYH9hUBrXzIsuLsrGy0verxK+YnEHzTCjepQdtuZM
 zLnc9u29s1HNlqVW3n5uOuKQJ1E30K5Y3OtKvb1n4Bj5qrmBOAAhMdivFFcuJheNPfpi
 BTnzSMHCCjDR4eo86en2W6OAn6gejCQURhpVkwYrsxvrX0N/vG00aEwDIUiLKhn8Nb88
 NjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wiNPfns/asbYxFskeoy2Kf9v3vKFjHeK7vQNBUmYh/k=;
 b=k+/ywbMrs/JY47274O99A3Kpp+8CyDQ9BiS47L9gFRBuuut9j/IcAj3u7/Tq7NAsAe
 PO13SJFVo3yj9tFegSUz1MWHvC2foixZ9om20bCGWChigO6SIGWbhG3Wd8FsDHPQaBlQ
 bPTMiKK9suca0KLaFp6QF9uA+XcChP7CJ1o24HSY07QOT5BCi1JtWMHK+U/vxShzy0ej
 3lomv2OGr0G8FMNTcbwnyAwIfY07egkKe7dXOQdhzb6fFniHtyQSOocK0rl/7U382vo2
 r24X5BJLcKYl/6t75HXDcUmWCzk30DuKiK/AnzD/3130bEOU0cEzYVNTq9T7QmJAo8yX
 fvPA==
X-Gm-Message-State: AOAM531tnAAh8qtnzNzcdD+rzPkDL6jPLwKzg2k3I5sAncHY4RBcjuC1
 iANTrQorum3Zr0lOcrxF8w2fyRzEHuc+Sg==
X-Google-Smtp-Source: ABdhPJyg6vXWMuy9oHyE+Uzm/zQuJV9tdEhuwkT6GYJd2C9ylYzfJ6HTbTwUKHV+wFM1r7GX+WBA4Q==
X-Received: by 2002:a05:6402:5186:: with SMTP id
 q6mr12193884edd.340.1634247709521; 
 Thu, 14 Oct 2021 14:41:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b2sm2857028ejz.119.2021.10.14.14.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:41:49 -0700 (PDT)
Message-ID: <5b7ea2da-bdcf-187d-435d-7b20f474ab89@mind.be>
Date: Thu, 14 Oct 2021 23:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20211010111133.73045-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211010111133.73045-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH] package/json-for-modern-cpp: bump version
 to 3.10.3
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



On 10/10/2021 13:11, Michael Nosthoff via buildroot wrote:
> This release fixes two more bug introduced in release 3.10.0: the extended diagnostics triggered
> assertions when used with update() or when inserting elements into arrays. All changes are
> backward-compatible.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/json-for-modern-cpp/json-for-modern-cpp.hash | 2 +-
>   package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
> index 068868c048..1a98971dbc 100644
> --- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  081ed0f9f89805c2d96335c3acfa993b39a0a5b4b4cef7edb68dd2210a13458c  json-3.10.2.tar.gz
> +sha256  e0d7c1b120cac47fa7f14a41d10a5d390f67d423d8e97b9d6834887285d6873c  json-3.10.3.tar.gz
>   sha256  c983d69523377819db3c377b390d5644f5ec53bec9b7c4a0f1ed893bb743d045  LICENSE.MIT
> diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> index 14843380ee..53cf17d2c6 100644
> --- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -JSON_FOR_MODERN_CPP_VERSION = 3.10.2
> +JSON_FOR_MODERN_CPP_VERSION = 3.10.3
>   JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
>   JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
>   JSON_FOR_MODERN_CPP_LICENSE = MIT
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
