Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818ACC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:34:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C8AE60C49
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C8AE60C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 214DD60607;
	Thu, 21 Oct 2021 20:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41HRj3R9krS6; Thu, 21 Oct 2021 20:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72EEB605BC;
	Thu, 21 Oct 2021 20:34:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C803A1BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7C3C832D9
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajFi57LO9iRf for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:34:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B47C8272D
 for <buildroot@busybox.net>; Thu, 21 Oct 2021 20:34:00 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w19so2130639edd.2
 for <buildroot@busybox.net>; Thu, 21 Oct 2021 13:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=8rYBPf+95VHcg+Y5eYh+m2/gNgY1DZkouxMh3vXWZyk=;
 b=giCo6d1aLZfl4xXGsiLwyDPpvCzB8JOi3DrCDcaOAVzJCqnqHB5KiYQBzCC5zo6axA
 AgLlRU+JYxxSiT3871nTMiFmJnqyzQs7JUz6V41DIM4r+PG3exaUMgzpnLa1I8OA0rY7
 EOsmBaWfSS5jjKVpKA7tsnmNFLUF51PDc6M1ocSdbAulMiWyVCPd4d13VR9CxelkLKpi
 dv429qm8geMxMZ1EWOihcn5Ll3iNsVOy1wB1scU5kRs9KJQFOdolbu3toTJL7StXwBMj
 /LATHtuEfm81FEpt9JIGcQ3Ssqv73lHqe7gfgStYFnADmkC36XGJmPRs0VlW+ILxcImM
 ZOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8rYBPf+95VHcg+Y5eYh+m2/gNgY1DZkouxMh3vXWZyk=;
 b=wFrKyVhzWCenAx0JM1bvjTHIwvtfR1RgtOcU12KCU347PhjEG4QERp53yO/nAuPLft
 TmGoB7lpo9Hp6IiKDYI8eMxXu8X5A0VIRxlpM+rx6h5zcRtYwCAUV5/ctI8cw8VFgtEz
 RuON05CbSdQOz9pHoRQ9YvGT8ToK6hizei1dKU7XBhIcR4+mlccvLm+xbYkMosfC9W4q
 y94n0S0h4OYInRMvF3WnK88ncaBo7hbkC7FoGiyzrwamVqX1tdJzqhhLHySV16t/IulS
 momqm6grtDP6cSrHNAl6hHcbvaF/KgkgPi2njnznhviHP7QPTU+9zZ4BaCoGF0woBpk2
 mtLQ==
X-Gm-Message-State: AOAM533+ZND0xgLdpPFZJG5IOkeOTvTYCz7VQ35smA5H8pkkYOT7SqrX
 a4i1kPCHZX8D3q9K8FJ3MeA9XRN+/HRHblGn
X-Google-Smtp-Source: ABdhPJx6gRe2rbAc/jAxhwUZRZPdEMMxGgc6voIGDTdbtGtFjeC+sIImSdRBo82xjTH+eTd9MzakOQ==
X-Received: by 2002:a17:906:1c14:: with SMTP id
 k20mr10209661ejg.22.1634848438807; 
 Thu, 21 Oct 2021 13:33:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w3sm3538215edj.63.2021.10.21.13.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:33:58 -0700 (PDT)
Message-ID: <3edd96df-3350-babe-2b2d-23a20ce2db81@mind.be>
Date: Thu, 21 Oct 2021 22:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20211012164833.234016-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211012164833.234016-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/liberation: bump to version 2.1.5
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



On 12/10/2021 18:48, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/liberation/liberation.hash | 2 +-
>   package/liberation/liberation.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/liberation/liberation.hash b/package/liberation/liberation.hash
> index 1f673228e..70b44e487 100644
> --- a/package/liberation/liberation.hash
> +++ b/package/liberation/liberation.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  26f85412dd0aa9d061504a1cc8aaf0aa12a70710e8d47d8b65a1251757c1a5ef  liberation-fonts-ttf-2.1.4.tar.gz
> +sha256  7191c669bf38899f73a2094ed00f7b800553364f90e2637010a69c0e268f25d0  liberation-fonts-ttf-2.1.5.tar.gz
>   sha256  93fed46019c38bbe566b479d22148e2e8a1e85ada614accb0211c37b2c61c19b  LICENSE
> diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
> index c08ca378e..35f06dc27 100644
> --- a/package/liberation/liberation.mk
> +++ b/package/liberation/liberation.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -LIBERATION_VERSION = 2.1.4
> -LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/6418984
> +LIBERATION_VERSION = 2.1.5
> +LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/7261482
>   LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
>   LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
>   LIBERATION_LICENSE = OFL-1.1
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
