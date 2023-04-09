Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285AFC77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 14:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBD79403E5;
	Sun,  9 Apr 2023 14:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBD79403E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NOFjTfjyDAR; Sun,  9 Apr 2023 14:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08FDD403A7;
	Sun,  9 Apr 2023 14:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08FDD403A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 093671BF41F
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4B1C415F0
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4B1C415F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jd8q1ZcKHKqI for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 14:11:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 837AC415ED
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 837AC415ED
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 14:11:25 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id g18so18486973ejj.5
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 07:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681049483;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ao+4hf8R5yRXS3UKeD8KteQTAkHulUoGCRV6Ee+k+hY=;
 b=QmRZ3ODCW6WRQusnhdC2OTn2VyREYYEKIbQpsw1Lhgoj695QvihSG1hfjaLYWYvdRt
 yp13Sv8eQr24OLMClhgDT7PZgIuCNF76zqWqcLQCoXuh0095/6TRLEVpbyMpzKz/lGok
 S4ifOnb0JDEDG/z90cJj24F/AU85IzUMK50sCF+ccLCMj2RlHgyEdd7BB3IBWSbN1rIp
 ZW5jm0l62X7qPSb4H6lqmTTSZRO2WCJZhD6vQVJGfbucrNUKeeH0PGheAWz3fpqJUDX5
 A+aLNk7oVnjb+ccgWzy/tEHP1D5N8dmpiad5i8B26G8qxF9hQ9lRNq2UIwylEigBT/GO
 a0ow==
X-Gm-Message-State: AAQBX9epTDoIG+Wkai073eTn+FAipo3d5yndvBe8r2cdmSjYuoh4ENAd
 qqwkJXYENd1tv6K18RCH77rv4g==
X-Google-Smtp-Source: AKy350aiQadWAEzUXJ+Zel3tf0aLYFqA3/8e7muGk0U4Yb45/na/+jVyaCdldZGr0XCLaw0gmhH9uA==
X-Received: by 2002:a17:906:9f2a:b0:931:af6a:ad08 with SMTP id
 fy42-20020a1709069f2a00b00931af6aad08mr5130764ejc.57.1681049483581; 
 Sun, 09 Apr 2023 07:11:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 qk6-20020a1709077f8600b00948fd62a53asm4152791ejc.71.2023.04.09.07.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 07:11:23 -0700 (PDT)
Message-ID: <09955cfc-0891-307b-e16c-2874f73a0e33@mind.be>
Date: Sun, 9 Apr 2023 16:11:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230405183613.18906-1-dalang@gmx.at>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230405183613.18906-1-dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681049483;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ao+4hf8R5yRXS3UKeD8KteQTAkHulUoGCRV6Ee+k+hY=;
 b=U58HZM/u8gnp4nj73OVvkDcWNY8D9NPHQY6l8tdNdE5AEeWq2XDEuoJ0sod3LjEJz+
 zzBHAySNB+JdhS8M5mYkTKDJts/LadZ+ByzrEzqY4OKcgAq4M8oFG6zhRXRORiBtYYOx
 yhWTine39T4mSdj7quwXdACJmpOVsE9fx0uMteAcskMfqKkIYPOW2qMHPRzSbw7r8sXk
 B/z8TzH9/v1JeGbLmTnyoi/f0xZLjPgDjhWmNmwheU+x6hWbCf+7NP+xT51gmmA6OqTO
 /Frpw0ekVy3NURK//LjLaFSZzWKtorhhpnPjfXL7yo2X7wfmmJ0KG5Hqa9ChAfk2fN+V
 y5Aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U58HZM/u
Subject: Re: [Buildroot] [PATCH] package/pangomm: bump to version 2.50.1
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
Cc: Daniel Lang <d.lang@abatec.at>, James Knight <james.knight@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2023 20:36, Daniel Lang wrote:
> https://gitlab.gnome.org/GNOME/pangomm/-/blob/2.50.1/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pangomm/pangomm.hash | 4 ++--
>   package/pangomm/pangomm.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pangomm/pangomm.hash b/package/pangomm/pangomm.hash
> index 0fb40e6568..dc606c5de9 100644
> --- a/package/pangomm/pangomm.hash
> +++ b/package/pangomm/pangomm.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/pangomm/2.48/pangomm-2.48.2.sha256sum
> -sha256  e1d75522c53f462799875cd247f9b49c91ced4b1abe68387ac35b271392d4ea5  pangomm-2.48.2.tar.xz
> +# From https://download.gnome.org/sources/pangomm/2.50/pangomm-2.50.1.sha256sum
> +sha256  ccc9923413e408c2bff637df663248327d72822f11e394b423e1c5652b7d9214  pangomm-2.50.1.tar.xz
>   # Locally computed
>   sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
> diff --git a/package/pangomm/pangomm.mk b/package/pangomm/pangomm.mk
> index e5b237197b..64ac625b7f 100644
> --- a/package/pangomm/pangomm.mk
> +++ b/package/pangomm/pangomm.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PANGOMM_VERSION_MAJOR = 2.48
> -PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).2
> +PANGOMM_VERSION_MAJOR = 2.50
> +PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).1
>   PANGOMM_SOURCE = pangomm-$(PANGOMM_VERSION).tar.xz
>   PANGOMM_SITE = https://download.gnome.org/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
>   PANGOMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
