Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAAEC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 283D584BA4;
	Sat, 23 Jul 2022 19:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 283D584BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9JzsIjSC8QXg; Sat, 23 Jul 2022 19:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 381E184B52;
	Sat, 23 Jul 2022 19:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 381E184B52
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BBC51BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9CE660746
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9CE660746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JxhSXDlJK7eB for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:39:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12C6460701
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12C6460701
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:39:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso5767018wmq.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KmAH6mTjb4oAb61njDuYQlaYGtTykbH/HDb1FocROjo=;
 b=vWvX8q564QgZn1ltOXDsSNnv750UoA6NxduO8RHUdo5H1DudHZZ//uy12N9rCyN0XM
 y7QWwsyqUzDwzA93p23wkp/bQer7UWWJ0URuul1372NAsyRx1mtyBtWkUKQe5fGuq/iG
 4CjNO9/XYpFGMKYMwXbphlIUgnljuHiCL6vcmkL8C/1WsxJxHJz1pkwkGtSI6p0uHTcH
 Tu7K7JoQQZZo/b+21wm3eY0/R30v3ah95BalqlS9Pqf9FEb/sLd3y3tqShFXxaHGjgsP
 bd5rf2TfBnlzk0RqEtBcEJ6niC1N/k1/RYsO95YXIcPcpZaLxHTtXTdDBwGWnwSg8CtV
 aYHA==
X-Gm-Message-State: AJIora8izjqBVCOvAgCoz50gLceXy+ydM+dya8MeIpfkDIvcklr76s8t
 QwY3f4BXxICG5wTt9oAYhrg2eOo+wQ3gFg==
X-Google-Smtp-Source: AGRyM1tEOeE3z3J6ECulT4Ij7c+PhvLSvGj5YVaau+4BWJJgULTaNkGSfS5TjHT8+IseMVoRvZeLZA==
X-Received: by 2002:a05:600c:4c22:b0:3a3:181e:887 with SMTP id
 d34-20020a05600c4c2200b003a3181e0887mr3759954wmp.85.1658605141224; 
 Sat, 23 Jul 2022 12:39:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a5d448d000000b002167efdd549sm7573853wrq.38.2022.07.23.12.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 12:39:00 -0700 (PDT)
Message-ID: <e342f24a-9a29-150a-bb1b-73a6a0e0f45b@mind.be>
Date: Sat, 23 Jul 2022 21:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: kory.maincent@bootlin.com, buildroot@buildroot.org
References: <20220621135833.1148493-1-kory.maincent@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220621135833.1148493-1-kory.maincent@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KmAH6mTjb4oAb61njDuYQlaYGtTykbH/HDb1FocROjo=;
 b=coHi+n/IkA1Pu7CnXtBBDA7daBHZkhrKWGyVzqYY5BYgUObwbyPt+XhvA5rdpARNlB
 muF9IuEDaW1nhH7vU0jcn1XDkp979Mam/d6NmrYT+rAvKIwfHIZiFiiUbInXVreUtL+4
 HBWV53IUX9C4pguOvL9QolIQujjixhUfTYToN2coYkzqHpkZCc4dvr50KCMbtAHMFt+D
 wBLPwvcU670jFveSWCpKC8Pfqt8O+iPLo/bqm9LagM7dPSt3TUvlZFjx4SfRNB2ZYASl
 M3AObSayiPRTb3A4QT8yCASZ6XnFwhyQ1sKZjsc4CvHn6ztvzU2tpO4txN9tjC/INIRf
 RYYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=coHi+n/I
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: remove extra
 ending parentheses
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
Cc: thomas.petazzoni@bootlin.com, geomatsi@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/06/2022 15:58, Kory Maincent via buildroot wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> There are two extra ending parentheses to be removed.
> They are present from the beggining of TF-A package. I suppose extra
> ending parenthese does not bring any issue, but it seems relevant to
> remove them.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 998de4b814..965b1a2eb5 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -191,8 +191,8 @@ endef
>   ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR_BUILDING),yy)
>   
>   ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
> -ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))),)
> -$(error No tarball location specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))
> +ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION)),)
> +$(error No tarball location specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION)
>   endif
>   endif
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
