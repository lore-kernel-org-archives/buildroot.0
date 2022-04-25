Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E138FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FACB416D0;
	Mon, 25 Apr 2022 19:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-GUL2hPGCZZ; Mon, 25 Apr 2022 19:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83D5B4167E;
	Mon, 25 Apr 2022 19:32:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CB8E1BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5191E60F43
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:32:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4mFTMloQTxH8 for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:32:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 541AE60B2D
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:32:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id a21so7504047edb.1
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 12:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3csqlE3Y+ZuJz1s59jHLlz+oxaU5DBwvPkWB3F03CCY=;
 b=JNjHw7W0SLmMMtco6pmJY7X1bApXbslDUTksQSTzBHFNhHFSs7ei9HX+5hbuEp45vO
 ql1cqX02Oo1WZffV14kAv3xwjWb7iWR6WQnh7reoXCZfeeQcfvf6pOxrT1tAQWxruvMF
 7oeFjH00Wp12fw/PEPF2Bw6ek6ol0cqQsaByKiRvbJX48TgBJey6fCf4HA10gs4B7FCL
 oUSPVAhKlQo/sfXjcswI5+8Gx7GsimRjTjaeOCpE2swvLFSD14uBtbSV2LJfnHD3Vo/w
 XJUhJz2Zh4BUs1FUb3gXfkh7ZihY7h4zpKZYd9dasOop9NiOuHQQ1FSLJQWSDsT0TLKJ
 P1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3csqlE3Y+ZuJz1s59jHLlz+oxaU5DBwvPkWB3F03CCY=;
 b=MiAlvk01QGT7fEIFV7z8mB3pkWOyKue3evxCpT7LLkUMAbaD3M/uGjBANBgS2LkCKL
 VX4JAGVHsTIa9QK0+jiQTnG56S2+EdrRU8qTWUK2LlP7PH0JHV7A7MceQKZKai/BUXUG
 WwKBHaerN0NjuuELAru06o5fEAsbUqOPf0QVIXdcEcoBUkWkJYXBvVV0tG6t7YQvGpPV
 dGQezzQW4+mvB1LUem1dcenTT/aDsjWiMlcHXpirRGFhzPg5zlWtnPcHJE4iQCvSzjxa
 gIkQW3+rHRSkyejcCtjxD48E8mcvQVwXbPq7Dx3jTHiStqPLFiJdWPSnd/jKXIY4Lp/i
 4ydg==
X-Gm-Message-State: AOAM533/yJmAp312Km1DRlpYUJqtnHJO8RU7nCwv0CoyRA85WiAS8v/2
 4LB0jVw1O4eIvo8QkqMSxPp0AQ==
X-Google-Smtp-Source: ABdhPJw0ewdKvZ9asy03S77Ag9B66r75peWoIqrrInvfPSsAq6k3mTFMB3p0eWpRsE/J3JkSOwsb9g==
X-Received: by 2002:a05:6402:1e8c:b0:424:1d6:1b71 with SMTP id
 f12-20020a0564021e8c00b0042401d61b71mr20784127edf.211.1650915119248; 
 Mon, 25 Apr 2022 12:31:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 dc16-20020a170906c7d000b006f391eafd1esm1643874ejb.67.2022.04.25.12.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:31:58 -0700 (PDT)
Message-ID: <67f429aa-725f-2641-6e0e-70bb1f11e6cb@mind.be>
Date: Mon, 25 Apr 2022 21:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220422184431.3471788-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422184431.3471788-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version
 2.36.1
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



On 22/04/2022 20:44, Adrian Perez de Castro wrote:
> Bugfix release, with the usual flurry of correctness fixes, and a patch
> to fix the build with the accessibility support disabled. Release notes:
> 
>    https://webkitgtk.org/2022/04/21/webkitgtk2.36.1-released.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/webkitgtk/webkitgtk.hash | 8 ++++----
>   package/webkitgtk/webkitgtk.mk   | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 38068745ee..00a342ed7f 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,7 +1,7 @@
> -# From https://webkitgtk.org/releases/webkitgtk-2.36.0.tar.xz.sums
> -md5  1e3fe866ab6e41e7ec3deb80bd5b3a85  webkitgtk-2.36.0.tar.xz
> -sha1  5b90bc59c2f442223de1a4d9dc8ff604888abb3c  webkitgtk-2.36.0.tar.xz
> -sha256  b877cca1f105235f5dd57c7ac2b2c2be3c6b691ff444f93925c7254cf156c64d  webkitgtk-2.36.0.tar.xz
> +# From https://webkitgtk.org/releases/webkitgtk-2.36.1.tar.xz.sums
> +md5  e6100df7f82d95a4e65176b10f5ab011  webkitgtk-2.36.1.tar.xz
> +sha1  36a95b906e54bcf94d2be04e1cbaac3584da7eb1  webkitgtk-2.36.1.tar.xz
> +sha256  0149ea5fb1d20f2a9981677d45c952a047330001ea24a8dc29035239f12c0c8f  webkitgtk-2.36.1.tar.xz
>   
>   # Hashes for license files:
>   sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index eca175d1bd..9e85c5b78f 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WEBKITGTK_VERSION = 2.36.0
> +WEBKITGTK_VERSION = 2.36.1
>   WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>   WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>   WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
