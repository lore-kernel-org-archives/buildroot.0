Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9057C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9338161AFD;
	Sat, 23 Jul 2022 19:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9338161AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOsyYnoNbADQ; Sat, 23 Jul 2022 19:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A047E60FFC;
	Sat, 23 Jul 2022 19:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A047E60FFC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 117461BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAF264245D
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAF264245D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t931Zd6J05mA for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:21:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D70114246C
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D70114246C
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:21:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 r188-20020a1c44c5000000b003a34ac64bdfso92580wma.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lxFReFH/4rmbda4EwIPNh/2v2ZQymRh/ZV3ZlIuSIH4=;
 b=PHSSD2LUP+JNny/fcePfeh57v3WItTa0zUqBSaY5+OqbMVlHHSktS9yNgXi1oDgh8U
 zAfqLp5HeTHhniqDytrKuiMFuPs5LUga3w+S0GZGpFGEUiWTvmMq3wHjDR0FmZKgMI0u
 OZsWyz8rzKG3u9v7n8GIhiRgI6YIoFct9xAPr6Hc+6euydG8kh12ASFjbRWinRjg9RQN
 h0bFF9IqtEuUmTMrX2owTPsJXgt1lFlFCkr2ijMxWRXFtbfeoEtSJKcqk1zGiP18ODx4
 zgV7GgZp5PVAPqhE0KYHTcssQgR4rvExblk+WXGe8ICM2dD5kZvyRBKU5trGUasydHmc
 mZyg==
X-Gm-Message-State: AJIora8wL1FcYc0fEizUcx1mklRZlyulw3JUy0P3RyjIdacb1hh6Ak/a
 Kmj1UUmCSFSakzOjJCOTDMDs2A==
X-Google-Smtp-Source: AGRyM1v6VrqH/YD2zV8BpdiTMGEAQj85FtdXoKsDvS7YQeECkypwCPYj0CmgQkcg6GsAv+blLim94A==
X-Received: by 2002:a7b:c7d1:0:b0:3a3:1890:3495 with SMTP id
 z17-20020a7bc7d1000000b003a318903495mr16269676wmk.18.1658604110781; 
 Sat, 23 Jul 2022 12:21:50 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a1c5454000000b003a30c3d0c9csm13101846wmi.8.2022.07.23.12.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 12:21:50 -0700 (PDT)
Message-ID: <2207928d-3a5c-e10f-4d11-7cef7b8e647b@mind.be>
Date: Sat, 23 Jul 2022 21:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220620210856.771825-1-fontaine.fabrice@gmail.com>
 <20220620210856.771825-2-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220620210856.771825-2-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lxFReFH/4rmbda4EwIPNh/2v2ZQymRh/ZV3ZlIuSIH4=;
 b=SAeJXWmlHmf60AUs7M7KDBy++B7RE7Ml1zNImZwvdzN3CeId4H+a2ImwKgxJHTDKMM
 zsVyv1gZNjiaajbzPPnftaIUcu4Ti4WNeZGDxtXZ3+VPWJxoLUGDd5q3XuDvdbHzDkR9
 7YCTrIIeVuv/ukhs1xf+Mgbs6vOVOALObLjWW8oHhTwshvR4e0IEo9LVQRjMt02uBmDm
 7cS5wrj+yYvRot0l2aU0u1s6HZC6Gx9BA9DS5j9SFY9cyhhSlJw5bcM9WM1kzvEB3Lsw
 hWC9D5aAeBoH09eB1AiB4E1GelSQ4HtMUdhFJmaWvtLlyc5l6y7N4OUq9UvKhKFx1lHk
 joJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SAeJXWml
Subject: Re: [Buildroot] [PATCH 2/2] package/x11r7/xserver_xorg-server: drop
 unrecognized option
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/06/2022 23:08, Fabrice Fontaine wrote:
> dmx has been dropped since version 21.1.0 and
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/b3b81c8c2090cd49410960a021baf0d27fdd2ab3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index fa5d2a802d..43d2038a8d 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -45,7 +45,6 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
>   	--disable-config-hal \
>   	--enable-record \
>   	--disable-xnest \
> -	--disable-dmx \
>   	--disable-unit-tests \
>   	--with-builder-addr=buildroot@buildroot.org \
>   	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1 -O2" \
> @@ -165,10 +164,6 @@ else
>   XSERVER_XORG_SERVER_CONF_OPTS += --disable-screensaver
>   endif
>   
> -ifneq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
> -XSERVER_XORG_SERVER_CONF_OPTS += --disable-dmx
> -endif
> -
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libcrypto
>   XSERVER_XORG_SERVER_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
