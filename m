Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956A1C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5569340946;
	Sat,  8 Jan 2022 15:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hhh6CC4yKPig; Sat,  8 Jan 2022 15:14:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D5584093F;
	Sat,  8 Jan 2022 15:14:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C417C1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36444093F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:14:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcQNJ-lnHFif for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:14:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5A384040B
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:14:46 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso4596708wme.1
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=18SOKNJsexdN7SQDJhT8dqcq7ny90F2gAh6HUzY6BL8=;
 b=bUUKp1wloGqOwMs23QuVqCd4miLj+tqqosQcsqd/3JyegLamb84j1+i5dWr52qSwrn
 xbTxRXl0f1qn7zWyt0BdBX+ymOawiGjKGRHe5Io2HyawP6hmH8eNfh4hmILKVapgcyZD
 KAFl1kyYDeNov5adn4024/39j+g25mWZKL0nm6vn5oK2HrcPbeCNYwoIAhzLGHfVYitV
 YEg1Mjcx+nqm/wtNULoCOn2zphDBHJavq2wX+D/NMHDS518iEZny/BxDItPOnua3AEsq
 o1rr2hVEbs2Dz3bdywMMaMyj4U+KJBVb5iUBkue3AptfFI8VT+a/KmiIys3XeYyrveF2
 8a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=18SOKNJsexdN7SQDJhT8dqcq7ny90F2gAh6HUzY6BL8=;
 b=jzViggYF6ArCzzabLSG5U9z//E5wX91KaW62Ne1nh7f+neKPdGV1SVqANb0phg75J5
 UsunIT/VcSm9/twJ2zx6tgLFcvzTFbHixAY6E18D/+FIdpg6b66Q6FFMhJU693aEocnK
 TZyyXXCJGh+mAbIH8deCcEOYU6IgACLfY5tQiE+hyGzPO4EXcpAdxVBZKGQtj+P6JClD
 gmmK+VSqx4+oxZqiSXxJ5eWfbSeK1pyFfwnPGR2EOTZg+e1rjHjLMK4TzW2eYkXY+9za
 HNkzE5K0/88+iPPz/DUkHsl7WjgCRAtrbpMYzOGYY/jV2sq4Y0YkHK1b+rSjXreqNImK
 LGpA==
X-Gm-Message-State: AOAM532MqEE064mksTaq3hSAd82ABQZom25kVuounkKOLyUBa4z+Kg3r
 zNXPP9XTn6eI0JA6xrDC1PIkKABGCKQmvyD8
X-Google-Smtp-Source: ABdhPJwLFJ94L+eQ1wTvVFz2Dd7JP4GpxzfyzjXYCiqgua381fn3l02kPl0aoS5eDhczVgaW7FnjbA==
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr14711902wmq.144.1641654885107; 
 Sat, 08 Jan 2022 07:14:45 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id i8sm2316646wry.108.2022.01.08.07.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:14:44 -0800 (PST)
Message-ID: <6cfa041f-d61a-215e-246f-d0beb752f386@mind.be>
Date: Sat, 8 Jan 2022 16:14:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220108100350.1102692-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108100350.1102692-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/libsoundtouch: bump version to
 2.3.1
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



On 08/01/2022 11:03, Bernd Kuhls wrote:
> Updated license hash due to upstream commit:
> https://codeberg.org/soundtouch/soundtouch/commit/d11a3adb2daddcdfafac2d86ec8de3b3f41d2f78
> 
> Updated _SITE:
> https://codeberg.org/soundtouch/soundtouch/commit/d063c0d9f9d29ef1f3302fbdee2f11f997bb2bce
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libsoundtouch/libsoundtouch.hash | 4 ++--
>   package/libsoundtouch/libsoundtouch.mk   | 5 +++--
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
> index fe6a108e33..9de72521bd 100644
> --- a/package/libsoundtouch/libsoundtouch.hash
> +++ b/package/libsoundtouch/libsoundtouch.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  f1ce96bac35779d3b752f4cc8696975b3d58f3deb9db47ffc45862767c2a2bdd  libsoundtouch-2.2.tar.gz
> -sha256  6b73f6327136a924821ec044bbd9f17cf8677faf2f2a2b1366a9fff6188c9688  COPYING.TXT
> +sha256  6900996607258496ce126924a19fe9d598af9d892cf3f33d1e4daaa9b42ae0b1  soundtouch-2.3.1.tar.gz
> +sha256  84c6d82dc7de80f5b73f231edfd3ddc5b53513908117452bfa37ea36bb4b7e0a  COPYING.TXT
> diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
> index 8a0e807d7a..c372c32ac7 100644
> --- a/package/libsoundtouch/libsoundtouch.mk
> +++ b/package/libsoundtouch/libsoundtouch.mk
> @@ -4,8 +4,9 @@
>   #
>   ################################################################################
>   
> -LIBSOUNDTOUCH_VERSION = 2.2
> -LIBSOUNDTOUCH_SITE = $(call gitlab,soundtouch,soundtouch,$(LIBSOUNDTOUCH_VERSION))
> +LIBSOUNDTOUCH_VERSION = 2.3.1
> +LIBSOUNDTOUCH_SOURCE = soundtouch-$(LIBSOUNDTOUCH_VERSION).tar.gz
> +LIBSOUNDTOUCH_SITE = https://www.surina.net/soundtouch
>   LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
>   LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
>   LIBSOUNDTOUCH_AUTORECONF = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
