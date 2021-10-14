Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29789C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:41:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B501860E97
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B501860E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93D6A4077D;
	Thu, 14 Oct 2021 21:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7hjnvEDS6qUu; Thu, 14 Oct 2021 21:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3B3440581;
	Thu, 14 Oct 2021 21:41:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD9261BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD7FB80EA0
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZuDJWY8zJSBD for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:41:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C078E80A4B
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:41:00 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id a25so29780729edx.8
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Zu1e2xZ+10pculNmLqFmEYFwaHylH1IS5DY9te9H6Y8=;
 b=PUfzyUC1LqkgA9ku63F5uglUz9/Da3IJp/Nj5KL6TXFa1CVfitiqfNz9n9KElGpeAX
 dfxp0t3QaSvtSRs8uN/X5WTDmEjB60RHjqGv1lBPMQ0azv78cKmMkVMjkuNdBV8L7h7C
 bGbVzkeut5f2uyq3+nNm/prPdVOMOl/FJ+JCZaEpEhntV1S/ts8J3XjCrYaK4ET+pl+H
 Y34kehj3HXBaMrm8ok3uWKKIm0dyKfI2OESs0VOEWdrUCyUBu12kIMgsGWWQ8AoaUEXM
 EVTo4qtQvIAKTeUYNETaaE+JRLm6IcbxfUYJRP0i/lQ2NCGJx8ZJYU/y2t4+zXyVzFZT
 ywuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Zu1e2xZ+10pculNmLqFmEYFwaHylH1IS5DY9te9H6Y8=;
 b=tEdwnm+hAyowjKDkiOyn816UDVvAWw+tXSR+EK/Xt3KlmCQo27WQ2UfIZD5Lc3xt05
 5yWs13HeYRaI9HQzebCiQHvEKWHYdakp6NjNsYsWGChi9sKD566cu4H2l16ZKMJcks5i
 JP3w3E7OH2G6Jd9fKHDHoKxfUZ3SP1s2xW6qs+3Dun3l90S4inzqGDgjd1ZRjBbmYltq
 oF/5dJud6TN2h6lJ/WMMy5W0C4XjUQS65QozYfvGgz2yEN8hK/rZTz9jWeX3wzRc84lj
 7BkmdgeP1bbeuCNG5bz22m8BDy+s0t/MUB97Q3n5IPhwi4GV2ziVdrq3V64vvWYUc1QH
 aBvg==
X-Gm-Message-State: AOAM530ev1LxC5xQgrDzwQQGzBGGlsOveV6wcolmJG/8hObNHGh1flyU
 ECglf4rzsIYgFq5X1v0YNCghwQ==
X-Google-Smtp-Source: ABdhPJwG3rIDduCfVS35lI6wmZQ2CvWmSGUQGznBSOJ5NGo7i8CSlOMiwJcTSlEvqpzEzRDF2ZiqKA==
X-Received: by 2002:a17:906:ca12:: with SMTP id
 jt18mr1839392ejb.451.1634247659061; 
 Thu, 14 Oct 2021 14:40:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g17sm3139569edv.72.2021.10.14.14.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:40:58 -0700 (PDT)
Message-ID: <a3b93178-c527-953b-72da-2f39f9d90919@mind.be>
Date: Thu, 14 Oct 2021 23:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
References: <20211010094129.109078-1-gilles.talis@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211010094129.109078-1-gilles.talis@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/libolm: bump to version 3.2.6
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



On 10/10/2021 11:41, Gilles Talis wrote:
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libolm/libolm.hash | 2 +-
>   package/libolm/libolm.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libolm/libolm.hash b/package/libolm/libolm.hash
> index c080c7eaf3..80210a2e5f 100644
> --- a/package/libolm/libolm.hash
> +++ b/package/libolm/libolm.hash
> @@ -1,3 +1,3 @@
>   # locally computed
> -sha256  d947d9570345e68696668cb855f1a6a7141b7b89cbcc15a08b1fae18535c4c45  olm-3.2.1.tar.gz
> +sha256  9b61bd9182bb0ae0c5a800a8b0496b69600a0a22e3a21fce0aad119d2b1c99ae  olm-3.2.6.tar.gz
>   sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
> diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
> index 034b3449d9..0049fb6001 100644
> --- a/package/libolm/libolm.mk
> +++ b/package/libolm/libolm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBOLM_VERSION = 3.2.1
> +LIBOLM_VERSION = 3.2.6
>   LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
>   LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
>   LIBOLM_LICENSE = Apache-2.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
