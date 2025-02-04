Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58813C02196
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9721409CE;
	Tue,  4 Feb 2025 15:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71pLx-U58C6j; Tue,  4 Feb 2025 15:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F1A840C0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F1A840C0F;
	Tue,  4 Feb 2025 15:02:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB262185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B43AF6089A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEznZVNbARYb for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78BA760BE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78BA760BE2
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78BA760BE2
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:02:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so67196975e9.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 07:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738681325; x=1739286125;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AAj2HKhwwG7hGRfrJ4IXLA0H5FQszB+StN1UFUaOLyI=;
 b=tOYAH2HALDNzj6aE7J5avL3gAtyHlFFAjzKL4H9Pc113c+75qDfC+fNIcZSIoQ3+xT
 tSSAxj0g4rcdQH7WhiVST6Oc6PvEZwPs3C8S4DfI4tNQeCmEgTXB+2qygaB0AcczWYc7
 wh1uQzC+Qr2NVxOkGsdgfOHcjEGxWwCzM61alAnblviJpphNZFh3KsljZb3SKNeH4aQf
 2iOIeEwfv0/7kTzOG5LbOQUtHOG2KOjx9EJyJYDfG5qdaMSOfEzYwsDs7Ux0pkSJxN1s
 UtEG03J4BetsQA4YaKsHr+I2qglJU+HM4YSnIwm+jb0KCVQcqy3Hbx0vNS1iZ4m0sU6R
 pW7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGNsadSBOH8YRoKrtoOdzRJkSml/iA4kbAm1ZYSZjlOl/Bchl1o3jqAOZIGisKuzYDKhyvcmuF4v8=@buildroot.org
X-Gm-Message-State: AOJu0YyIZ2BkoPncJGUKUxRMZxbF7Ozf6VhaxJQFYvK0Nka4wbvIVXms
 ja/aRQVr3SzbSQ1hQkJjiqDPkUdFzEsXlXpx8Taezj9TnQXjekUcypRheuGniv2NO5pOJAzJojo
 b
X-Gm-Gg: ASbGncv/mwKUHWelgonrtizAFiRLDx4RlX8ND3lY1eIMrAwmMzznXGuY7X00WA6IXZ2
 wCcleLlMB09ZYu0peBfIzKUKO9LxP70kQRiDeUa0odba2QpNOiqoOeyzUDBFvZS7OjHu0l5+kig
 zmsmDYeFwzdEeEImQsbeq7KRwOx3K5m6sZxtGuyletCzGFdLr4UXjWht4+aI9tdPpmlOdu1hyuU
 p5bhtltofs9WF5u0Exl7i3mmQ7TmcvWC5l/n4+mOD6ypoyJiTFoSqVePi2JMoyl9d//68cfj65q
 OT7a2IzHmoBXIFE6eCJcPDAhNj7aQV/tCPmrlpP7XAb/yHs=
X-Google-Smtp-Source: AGHT+IG1hTgw/GacOhLtKUwlIBYLakAQM4ywo1iiqDaLGddzdx3v/R5dphsH422YseG3uGR0pmoN8Q==
X-Received: by 2002:a5d:6d09:0:b0:385:d143:138b with SMTP id
 ffacd0b85a97d-38c520a3c87mr28281050f8f.51.1738681323358; 
 Tue, 04 Feb 2025 07:02:03 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b5492sm16187579f8f.73.2025.02.04.07.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 07:02:02 -0800 (PST)
Message-ID: <efb1f898-0319-4351-a080-0f79cf85103c@mind.be>
Date: Tue, 4 Feb 2025 16:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20241226211143.2507882-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20241226211143.2507882-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738681325; x=1739286125; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AAj2HKhwwG7hGRfrJ4IXLA0H5FQszB+StN1UFUaOLyI=;
 b=TyT4PvXolIFPSunxAkuUE27NolbHR06rRiKkxxKKkHrf6+YZoCwgymWggpZ0L5z0rH
 y/v8jJQm+Id5iJhEybKYMs2YqYjekzNOSuzV5Z9PcvuZ/aXp0KuBK7ng2fACbEoEb6rl
 /4w4awNrzEbdcus00eGcaHkDva8C4PTpJl89EgZkiWYKvfymc//L6HQ+KeemAB/H7MVG
 9Zt7JmKZIKjAAMuXM8NTOb/voImf2qcOR0GcKM6BTUiSMsOPEWM8gVbmLgUj30YDadGi
 DNX51DVIWQu7R51ujryTPUxc1+DNJaLXELkVfA+1A5visUIdIIkIxw5Hzj9P6iR1KDax
 DCiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TyT4PvXo
Subject: Re: [Buildroot] [PATCH] package/cloop: bump to 3.14.1.3+nmu1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/12/2024 22:11, Thomas Petazzoni via buildroot wrote:
> This is the latest version available in Debian (which is our upstream
> for this package). The changelog is:
> 
>     [ Ben Hutchings ]
>     * Fix FTBFS with gcc 11 (Closes: #1005413):
>       - Remove exception specifications
>     * Fix module build for recent kernel versions (Closes: #1005414):
>       - Stop generating module vermagic in cloop.c. This has always been handled
>         by modpost and doing it here now results in build failure.
>       - Avoid using inode::i_bdev, which was removed in Linux 5.11.
>       - Use set_disk_ro() instead of set_device_ro(). The latter was not meant to
>         be used by device drivers and was removed in Linux 5.11.
>       - Use blk_{mq_alloc,cleanup}_disk() instead of separate queue and disk
>         allocation and cleanup on Linux 5.15+, since alloc_disk() was removed.
>       - Handle potential failure of add_disk() on Linux 5.15+.
>       - Use kernel_read() instead of vfs_read() and set_fs(). set_fs() is no
>         longer defined on some architectures, and kernel_read() has had large
>         file support since Linux 2.6.31.
>   .
>     [ Vagrant Cascadian ]
>     * debian/rules: Build tarball reproducibly, using consistent time, uid,
>       gid and sort order. Thanks to Dhole for the initial patch.
> 
> The "Fix FTBFS with gcc 11" allows us to remove the -std=c++14
> workaround added in commit
> 7e147e778fc3397cd2a069c8127fa4d2cc6c0355 ("package/cloop: fix build
> with gcc >= 9").
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks, after fixing the URL as suggested by Juju.

  We could also have removed this package and cloopfs :-)

  Regards,
  Arnout

> ---
>   package/cloop/cloop.hash | 4 ++--
>   package/cloop/cloop.mk   | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/cloop/cloop.hash b/package/cloop/cloop.hash
> index eb922764bb..a4f7056049 100644
> --- a/package/cloop/cloop.hash
> +++ b/package/cloop/cloop.hash
> @@ -1,5 +1,5 @@
> -# From http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop/cloop_3.14.1.3.dsc
> -sha256  e3079e70f9edae8ed1ac64694af08f6c7dc710ca65a56e4770dcb1325a293193  cloop_3.14.1.3.tar.xz
> +# From http://snapshot.debian.org/archive/debian-debug/20221223T030115Z/pool/main/c/cloop/cloop_3.14.1.3%2Bnmu1.dsc
> +sha256  04060d88231208b0db8ae8c3b54b0a46ee12139b617ebfc80b03d2ddd2cdb6ba  cloop_3.14.1.3+nmu1.tar.xz
>   
>   # Hash for license files
>   sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  advancecomp-1.15/COPYING
> diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
> index 6f6d5fe6a8..f42edee28b 100644
> --- a/package/cloop/cloop.mk
> +++ b/package/cloop/cloop.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -CLOOP_VERSION = 3.14.1.3
> +CLOOP_VERSION = 3.14.1.3+nmu1
>   CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.xz
> -CLOOP_SITE = http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop
> +CLOOP_SITE = http://snapshot.debian.org/archive/debian-debug/20221223T030115Z/pool/main/c/cloop
>   CLOOP_LICENSE = GPL-2.0 (module), GPL-2.0+ (advancecomp)
>   CLOOP_LICENSE_FILES = README advancecomp-1.15/COPYING
>   
> @@ -14,7 +14,7 @@ HOST_CLOOP_DEPENDENCIES = host-zlib
>   
>   define HOST_CLOOP_BUILD_CMDS
>   	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) APPSONLY=yes \
> -		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE" CPPFLAGS="-std=c++14"
> +		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE"
>   endef
>   
>   define HOST_CLOOP_INSTALL_CMDS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
