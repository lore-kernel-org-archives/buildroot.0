Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC14C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 21:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 640468328E;
	Tue,  1 Feb 2022 21:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8KZAtcP4-JJ; Tue,  1 Feb 2022 21:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AEB183264;
	Tue,  1 Feb 2022 21:46:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAA211BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C65EB415D0
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sa_r6Nd1A3Y4 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 21:46:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8546D415C8
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 21:46:46 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id p7so37220178edc.12
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 13:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=XFbqG/uhMenUhPE6xo5qKP6C57Xq+psHHPASUFHzLPc=;
 b=CqWLZJ515gbtWLpAZCrU4gepO4l/gYlaawBmGBTCE8Go8ZokhiD4VRwg58S8uBdDej
 9PoeZjIsNhwQWc4a0AarjZpJnoC0FVFHCeY8KyaXqfvCRBIaMNE1C0qkeIliWfNO2C5m
 3bvmvj0YTcFUiEAd5mUEKo4O4oEtiHFlcjTHpplAd3bbyaEMAODEG77iPIdQi328O0UN
 8J3dWAyyKn2fZ5ZevJrMLJyPLO82tbw+QrAKeQlS+EJb2rR6YMWoFeLK+vsIzZYVyK3l
 UsA5C7oa5Uqg7r2j7L30tRC8oi/Q90J99Nx/eq7xobWhQUoKQJ2+pBTRHWviOLKX7nXm
 Ui2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XFbqG/uhMenUhPE6xo5qKP6C57Xq+psHHPASUFHzLPc=;
 b=l0VHreaDkPW+2u2TGqgoqNgq8xOvWxS6kKpUIl0dtdGwJyrlYn42N4lUtHE6JhZdHG
 Pl8hVU2RJ2R1MSMHxGKIurM9IaicpVKhCs4mF5rqOv5qhXYzJFC1b9cH2NBC9PVLLecK
 vjgAzts9C1n5kw2WUTWHXCO26HQE4xNtN0KbIKgnFWIJ9f+Y4OJjZ0WzdGI/LQCoRO/Z
 u2vRk+T0lZNL4IYp0gQGT0XOOiFkrtjwXG8hH/xkTFJP0PQGzUiSh5kN+QDz1SjjJayw
 pfG3v7B0dyorvvuC/aopvw/lAYQlUvYT5YhTJSf7IY/KBR5JK94crVpPM2uYLy0R0CBM
 lzcw==
X-Gm-Message-State: AOAM532poUfcviIkyKNCYt6ZkC1LplaajWHSD0oRwh0DB89SD2APEKuo
 ttkpNO5n1hyoedn4mKAzRxZOREVgdnvEZw==
X-Google-Smtp-Source: ABdhPJwPNLMqR4NOmfy3W+ZQRCwhyo+/Vm7wOuW7hKknvdah3v5ZodcZBaJyevpQ7nCK3CQ7QVPt9w==
X-Received: by 2002:aa7:dcd5:: with SMTP id w21mr28007212edu.97.1643752004672; 
 Tue, 01 Feb 2022 13:46:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id lt23sm15353383ejb.173.2022.02.01.13.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:46:44 -0800 (PST)
Message-ID: <8ce4268a-b0fc-ef1d-f660-aa684140db49@mind.be>
Date: Tue, 1 Feb 2022 22:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220116220724.3460985-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220116220724.3460985-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/liburing: fix static build
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



On 16/01/2022 23:07, Fabrice Fontaine wrote:
> Fix the following static build failure raised since the addition of the
> package in commit 03ca6f4e39874583060317e7e15e9e360220877e:
> 
>>>> liburing 2.1 Installing to staging directory
> PATH="/home/buildroot/autobuild/instance-3/output-1/host/bin:/home/buildroot/autobuild/instance-3/output-1/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" /usr/bin/make -j4 -C /home/buildroot/autobuild/instance-3/output-1/build/liburing-2.1 DESTDIR=/home/buildroot/autobuild/instance-3/output-1/host/arc-buildroot-linux-uclibc/sysroot install
> make[1]: Entering directory '/home/buildroot/autobuild/instance-3/output-1/build/liburing-2.1'
> sed -e "s%@prefix@%/usr%g" \
>      -e "s%@libdir@%/usr/lib%g" \
>      -e "s%@includedir@%/usr/include%g" \
>      -e "s%@NAME@%liburing%g" \
>      -e "s%@VERSION@%2.0%g" \
>      liburing.pc.in >liburing.pc
> make[2]: Entering directory '/home/buildroot/autobuild/instance-3/output-1/build/liburing-2.1/src'
>       CC setup.os
>       CC queue.os
>       CC syscall.os
>       CC register.os
>       CC liburing.so.2.1.0
> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
> __uClibc_main.c:(.text+0xa2): undefined reference to `__fini_array_start'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/54c67e0f5bd2b5f520a250dc13b5846f94fc1790
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/liburing/liburing.mk | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
> index 74ce4156f8..874e268d43 100644
> --- a/package/liburing/liburing.mk
> +++ b/package/liburing/liburing.mk
> @@ -30,11 +30,13 @@ define LIBURING_BUILD_CMDS
>   endef
>   
>   define LIBURING_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LIBURING_MAKE_OPTS) -C $(@D) \
> +		DESTDIR=$(STAGING_DIR) install
>   endef
>   
>   define LIBURING_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LIBURING_MAKE_OPTS) -C $(@D) \
> +		DESTDIR=$(TARGET_DIR) install
>   endef
>   
>   $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
