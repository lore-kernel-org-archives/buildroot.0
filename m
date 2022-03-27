Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1F3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEDD44062A;
	Sun, 27 Mar 2022 15:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RlSsRAyDVLzI; Sun, 27 Mar 2022 15:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EFE24020B;
	Sun, 27 Mar 2022 15:37:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC64B1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC01881ADE
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SupxqvrWOa0C for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:37:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD49281AF5
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:37:05 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id r13so23987708ejd.5
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Mi/s6vYD7bzpLj7h1tRoAxl4FSvsCVBFuMn641pSNAY=;
 b=BXb1mIeLuqJg0uFZE3GdZJ/s7zPLwH+sWZjkJaf8vhAacrzDOvd8VxgVihwd+qzUFZ
 Cqks0gpS4IsDS+epTeDFRceQok4RYke6IAzc9iv3ITkshS899mgnb5KSz4w2YQ96lHMj
 /plnbAGH8ZiLD0on6o8sLGiIuVnNkNmRMB1VE6kcKQZEXWAS3pNA/n2yVkCs+80B6SVg
 SHND08cZFgiyh195s7jMiMuWL+bCYFKGwBwD5l9mK/RrvdDh9WvgROeA8XbhITrFUcyT
 qVfAjVt8aephY5xTCcZ/HAxtghXRSoZO4bHgEefBJ+Josvtr3tDckG7COyPCWtKfIeqx
 tfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Mi/s6vYD7bzpLj7h1tRoAxl4FSvsCVBFuMn641pSNAY=;
 b=iHgi5O1C+Nu2a7cP0+yPIiR2lqOTkmMT3tNm6FQflEroY7gA9HEciqApSJC8sC4pID
 E2JdFvZTp/JNJNmPvH6McGE2utJM4oz4u+Faj8i+Ynh9pgdpFl1h5Ey9tOzl9js44r24
 MPFONVWLMA/UbKcrdz3M5mT0DdsVITgBR+De7sJ8guA62kPTHkwqQ9mBMmhifQjmFdFM
 hhx6Y9ZYa6W0SGL/fjBkberNiuJSvBJpUtoJ9mSIzI5yYksOhs87pKHRMJrgVDgVhUjS
 WZMvqQTBf4+i2MElXL9gpDXBxeB6FSteR1bmGhaga2vblNKYfWdJ9F8DLm3a5881vPcQ
 WhkQ==
X-Gm-Message-State: AOAM533J8GTfv0SSHEcjSGzq7nlDT/9osYHvWFIxlTPah0rgO63QZl0a
 0NOBJynkro1QWTJaR48tLvHPXg==
X-Google-Smtp-Source: ABdhPJxWjVBIeHzdgFG1x5syuTgYPT/ysUR3UWQHtNmP6prOFxD1AIonJD0rWvU0JPGwUtXfTk5JEw==
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id
 i7-20020a1709064fc700b006da92b2f572mr22614646ejw.184.1648395423946; 
 Sun, 27 Mar 2022 08:37:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a17090694c100b006da91d57e93sm4679627ejy.207.2022.03.27.08.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:37:03 -0700 (PDT)
Message-ID: <fba60289-c47b-0932-79b0-1a74035ca0ee@mind.be>
Date: Sun, 27 Mar 2022 17:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220318131058.32240-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220318131058.32240-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1 1/2] package/libcamera-apps: X11 support
 needs libdrm
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



On 18/03/2022 14:10, Peter Seiderer wrote:
> - X11 support needs libdrm (optional libdrm dependency already
>    present in libcamera-apps.mk)
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/5df48038df5deb4f1e85287cde9a403c5681c28e
> 
>    .../build/libcamera-apps-2d1009e3badcc8047361ff81149ad6cba3b911b5/preview/egl_preview.cpp:18:10: fatal error: libdrm/drm_fourcc.h: No such file or directory
>       18 | #include <libdrm/drm_fourcc.h>
>          |          ^~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcamera-apps/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
> index a1affc2d23..492a99cf55 100644
> --- a/package/libcamera-apps/Config.in
> +++ b/package/libcamera-apps/Config.in
> @@ -14,6 +14,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
>   	select BR2_PACKAGE_LIBPNG
>   	select BR2_PACKAGE_TIFF
>   	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
> +	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
>   	select BR2_PACKAGE_LIBEPOXY if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
>   	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
>   	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
