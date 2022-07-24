Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D036C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 20:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06F5C40C89;
	Sun, 24 Jul 2022 20:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06F5C40C89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id isz_mQgOdHxi; Sun, 24 Jul 2022 20:00:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 087DC40C86;
	Sun, 24 Jul 2022 20:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 087DC40C86
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5002C1BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36F8F61192
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36F8F61192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bEc-8L6JMiMc for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:56:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 298A160C0F
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 298A160C0F
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:56:32 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u5so13326289wrm.4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LV4eCvUxK1vnYFvS140FnPwe8Ag0VefbUbhI/z2wIuE=;
 b=btEXwuNZWtQpwf4yReVwmyqLzMUl5EwPDp/Av1WYukTkoJJIioDl7Xp6VuWACbLrMm
 3wT/7EXhRI6m+CIJmQac0prAH0fUrtrASjNwSMwYpmTqi0CwkHhmOWw2gnuL8q8sn8v1
 iRzNx5bJUaywFe+pG89Ox2/DcRe4mU8001WsAJjRHHgG36foGyQK0nQOIDFWjLdw8z4F
 wIDjQFLRjQSB+PZGzzC0EIasxfjBTRh/l3ZRP5t0sNghvBkZLz6LaIVZOPYK1aSmMW1R
 lzTvXNkoMxCX2EAUignfiYdVK3CRAQXdP6c2tbEs3F99/1wHKYgmL2h+YL7yitybBQ8T
 8IeA==
X-Gm-Message-State: AJIora8L1acYdI5bw87CN0Gq6KcIh5bLWaQIcPMtu5zEnnw+3IBtGHpU
 DD/VWwkq+A1sbytuxLX3RYRbwQ==
X-Google-Smtp-Source: AGRyM1ssCiKlCrqEL4x6nmlV+ZRuhDfWbHn7OuW5Dlyp7UDB0qfvtCm8/1vuZimqa1Np5hGj/fnslw==
X-Received: by 2002:a5d:456c:0:b0:21e:40f5:aaef with SMTP id
 a12-20020a5d456c000000b0021e40f5aaefmr5958798wrc.396.1658692589982; 
 Sun, 24 Jul 2022 12:56:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 c9-20020adffb49000000b0021d6d18a9f8sm10248978wrs.76.2022.07.24.12.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 12:56:29 -0700 (PDT)
Message-ID: <1ceff6e7-c1a7-b2b9-fb2e-e0a1ce7907b2@mind.be>
Date: Sun, 24 Jul 2022 21:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
 <20220724162500.2683871-21-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724162500.2683871-21-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=LV4eCvUxK1vnYFvS140FnPwe8Ag0VefbUbhI/z2wIuE=;
 b=EuRJyuuqhOtYiAQAlu9pm8KIBydWAuWSm3YST0FNINslIajo0P12snAd4XXN8FRKre
 gWz/FkGcw4XNp80OIUUz2ccmPrnWZnbc6AXIpDRUi8Nl864VsdLuPHb2aaxZUmaRNa4T
 z/2SueildnkedzO/V4BbZNv7gXUfeqT+EO1NyFvnAIqaLH6gozxsrfaogyOg8lTqM5Op
 PfqRakCJFZhZPy0VdBuvHH9yXtWZgQ5tvnJCEzwWULcU9kmXPw0tKvBVPqcs1Iszg+qC
 dOJGOjJ+4lGvICWmQ/f7gXfadWRnRcy+TnbHT01nDt/hls3jmV9ClDX2f1C7ejfGZmzv
 07fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EuRJyuuq
Subject: Re: [Buildroot] [PATCH 20/20] package/x11r7/xdriver_xf86-video-mga:
 bump version to 2.0.1
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



On 24/07/2022 18:25, Bernd Kuhls wrote:
> Removed patch (and autoreconf) which was commited upstream:
> https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/f227f2f286123a9ca64b567783825a2c18b87971
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[snip]
> diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
> index 218e52e19c..813429789b 100644
> --- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
> +++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
> @@ -1,7 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2018-December/002933.html
> -md5 b8fc99b4adea8bfe80156b13df4b6c9c  xf86-video-mga-2.0.0.tar.bz2
> -sha1 833f2710a1fd7b3f2db3700b2ad055527da5033b  xf86-video-mga-2.0.0.tar.bz2
> -sha256 268946e1a13e9d80e4f724a0740df9e6e8c8bad37697fcbf456924e9fdbb5d79  xf86-video-mga-2.0.0.tar.bz2
> -sha512 b92006486aef815ff4399f291d610c65d88c0b32a9dae97658c644715ff62b221b01495b5c7a2311745e26f699c1c1f753b81c7bf54cf75567af9f78ac015540  xf86-video-mga-2.0.0.tar.bz2
> +# From https://lists.x.org/archives/xorg-announce/2022-July/003184.html
> +sha256  27a33b70837965bb4a5f27fd260be085ca5bba837a4e62907f093c2f205603ab  xf86-video-mga-2.0.1.tar.xz
> +sha512  d9a0abedb71f3354788c2f91b770bc00c4118cfa2c99072dea82c28f025bc87bb88ebaf969962a8f0e97e1ff7938aebd9c682b730b0e07d5174dd9e8dc2cdfb6  xf86-video-mga-2.0.1.tar.xz
>   # Locally computed
> -sha256 6c567575e381478c7616eedff3ea2ae5228a5b54fbdd22d4070ebae312fa085c  COPYING
> +sha256  f69c2f4fd11ec4de7fcc23146187836eed1755aade3fef28b9204ea1a4adf61b  COPYING

  As you should know, when the license file hash changes you should record in 
the commit message why it changed (to prove that there's no actual license change).

  In this case it was easy to find out so I did it myself: it's a spelling 
correction.

  Applied entire series to master with that fixed, thanks.

  Regards,
  Arnout

> diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
> index 24f2da2cce..4841a643bc 100644
> --- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
> +++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
> @@ -4,12 +4,11 @@
>   #
>   ################################################################################
>   
> -XDRIVER_XF86_VIDEO_MGA_VERSION = 2.0.0
> -XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.bz2
> -XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/archive/individual/driver
> +XDRIVER_XF86_VIDEO_MGA_VERSION = 2.0.1
> +XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.xz
> +XDRIVER_XF86_VIDEO_MGA_SITE = https://xorg.freedesktop.org/archive/individual/driver
>   XDRIVER_XF86_VIDEO_MGA_LICENSE = MIT
>   XDRIVER_XF86_VIDEO_MGA_LICENSE_FILES = COPYING
> -XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
>   XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
>   
>   ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
