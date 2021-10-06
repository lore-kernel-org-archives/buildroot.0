Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FB4C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:29:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8928B610A1
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8928B610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B5F983E03;
	Wed,  6 Oct 2021 19:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AuJeaMr3x-Py; Wed,  6 Oct 2021 19:29:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB48C83D39;
	Wed,  6 Oct 2021 19:29:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B81131BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B484140377
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vX6wCazP7J36 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:29:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA3E24033D
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:29:20 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g10so13489147edj.1
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=nh1NRShqgWT18Zf/998jZMg7vK6X5hSiFVNKyqSsSHo=;
 b=erqDfYWQJMIL7a5IHY3hhqaso643mzxFnXufHiX1kr0X07sy62u0kpwD84/HH3dygM
 Nn5jZe907TVRzlptZqoqJw46b6dffe/RlPH8tScoXmHo0LmznevzNjYGZYiRFpRJA8b1
 /P78L81x51Y9g1bv72lS2VAJRNBKOHp42m9I9ha479GA3kFNnn5sdqdXdXVZ7X96c1ih
 vj+goLgxN79wbPW9XnmB1/IqSFh+lPtLeSnDAijNuDHomuNQtpsy4L6fvhlIqgHzb+/H
 R6tJQmc6+waUrn2E3UVxhkUA9uAGFAsu4Ih+ZzbliyHPAbSsUJj6dRTk2+6WVz+t/OOg
 TN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nh1NRShqgWT18Zf/998jZMg7vK6X5hSiFVNKyqSsSHo=;
 b=cUZCAvz0JSnVAjEHhuWHarTa4tL9U94wYApsW5cFP8M1Lu0/7+oLOftOCuAMXxWWTj
 NY8rOjI6zAnTGj0rm0+PSf1MoipKmBV9YCv8/yBIJ8qp93kCiwtPKJIpMu2d+gqhfUQp
 +Wp/o5RKOEqOxM2hGbcUSawfd6KldYVkz5mnLjc5mQqprBVZ4HjRsaIA8W3eeftD1LcQ
 SDmHEMsYn6Ei09HI4KGmJv+e3vPfAaAqlfZWWkDjZAlEmatwpqLIr/5/+fPeWZpSVu5A
 BRFPU/X5bUZJ9JB8uwmcYnnCREEcl3Q6sV3lCLMEyez7uJPl2Du+eyiqhhm0MvatFWDL
 9sAg==
X-Gm-Message-State: AOAM53298GGkQV8dKpdLgK71+Uf0CTUTBjAvzS038377KAwBSCyn9tMp
 KtKGn10U3sMVzoFLmQrsu0/t0+7lF1PjgSla
X-Google-Smtp-Source: ABdhPJwDqyhP0jAsat1uJIdnc9ELrX244P4v1HSWZ/l8/gQ67V5ckekkDrqZlE6OycwgI+3UR8VnaA==
X-Received: by 2002:a17:906:2506:: with SMTP id i6mr85854ejb.186.1633548558751; 
 Wed, 06 Oct 2021 12:29:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d22sm9299374ejk.5.2021.10.06.12.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:29:18 -0700 (PDT)
Message-ID: <7c989b7e-b0de-c90e-84ad-e8c69fc07845@mind.be>
Date: Wed, 6 Oct 2021 21:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20210928153813.1593886-1-fido_max@inbox.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210928153813.1593886-1-fido_max@inbox.ru>
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.1.4
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



On 28/09/2021 17:38, Maxim Kochetkov via buildroot wrote:
> Release-notes: https://git.osgeo.org/gitea/postgis/postgis/raw/tag/3.1.4/NEWS
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/postgis/postgis.hash | 2 +-
>   package/postgis/postgis.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
> index 15983565b4..b1c19f029e 100644
> --- a/package/postgis/postgis.hash
> +++ b/package/postgis/postgis.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  71e929553bb73a0413206a0f92df5180ac6579c500d8ddce3a03559f1b349fcb  postgis-3.1.3.tar.gz
> +sha256  dc8e3fe8bc532e422f5d724c5a7c437f6555511716f6410d4d2db9762e1a3796  postgis-3.1.4.tar.gz
>   sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
> diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
> index b3d97b2774..3a340c680e 100644
> --- a/package/postgis/postgis.mk
> +++ b/package/postgis/postgis.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -POSTGIS_VERSION = 3.1.3
> +POSTGIS_VERSION = 3.1.4
>   POSTGIS_SITE = https://download.osgeo.org/postgis/source
>   # parallel build issues
>   POSTGIS_MAKE = $(MAKE1)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
