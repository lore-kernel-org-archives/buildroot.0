Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2321DEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5BDD60C0F;
	Sun, 25 Jun 2023 13:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5BDD60C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1V0Mtqp9Gxv5; Sun, 25 Jun 2023 13:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0C0B60BEA;
	Sun, 25 Jun 2023 13:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0C0B60BEA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2F581BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA0FB415E9
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA0FB415E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5sYtiFp9yI1O for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:11:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF34A415E7
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF34A415E7
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:11:44 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-312863a983fso2725232f8f.2
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 06:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687698703; x=1690290703;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CozQXW095HKhz5CjSqs42HYjWS16udRDULXpsE73tH8=;
 b=buCqSpYZXYqnmkrbt6wrWpCbKPFKWycjMbs8EtY4wNb7XUqgABv8u2bNKk4F/bIkEf
 e6myt3KR0NG7wDhbdz3XnyNhoDI+1dbDsgwUqfsnwQGal2yIUh+hfyJtEHf77w2GivjI
 fQzz/0vcw4Q4Q0ehmTiR9rE9WD4TuKFzICXueW8nOORJpVO+zUeKvET//LO5Tp3HgD83
 By/t+NmJ9THHJrxvrPO7IfRd/Ou8by+P7GGBL8JpdTy0FKwPyTl0i9TPhR/eOsw4lGwF
 3MyZ/5e8yzMNIWG3BpX81XnYUGls0Kh+eCiPVd37zx4bmFy2uIEZJss+h+vMp1oPcYhx
 2pSA==
X-Gm-Message-State: AC+VfDyxF4slUsDTK/k980bDemL6BrPO9mzH4E9YNw0aOQZcsNlhHTHt
 GGRV62qefLGwY/nTmadOfkskDQ==
X-Google-Smtp-Source: ACHHUZ5pC07x6Xaqddeg6MA2hmw3MXRtPpR21UkaXJ1dfHLjkFSg0XevVhJtjZCDNwEKYH66/uN6JQ==
X-Received: by 2002:adf:fac3:0:b0:311:13d4:3953 with SMTP id
 a3-20020adffac3000000b0031113d43953mr19981894wrs.29.1687698702535; 
 Sun, 25 Jun 2023 06:11:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 u12-20020adfdd4c000000b0030903d44dbcsm4589580wrm.33.2023.06.25.06.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 06:11:41 -0700 (PDT)
Message-ID: <854d90f7-7f38-2d43-4c93-c59432d5d695@mind.be>
Date: Sun, 25 Jun 2023 15:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Oleg Lyovin <ovlevin@sberdevices.ru>, buildroot@buildroot.org
References: <20230625124848.1423168-1-ovlevin@sberdevices.ru>
 <20230625124848.1423168-2-ovlevin@sberdevices.ru>
Content-Language: en-GB
In-Reply-To: <20230625124848.1423168-2-ovlevin@sberdevices.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687698703; x=1690290703;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CozQXW095HKhz5CjSqs42HYjWS16udRDULXpsE73tH8=;
 b=f1b6k7qKWTUqIOge0ViZysS4MJeDO54Ur0Vj3dcQUcc9/dy/+sSXp8+T11AQu7dI2f
 yqOJnAgTvMmmNMGO75YbkZKB1zEW3yrVLngKnKXfAwvNBGNNBybKOFT2pxmMaE8wrGB/
 jHPm9tL5Bfqca8vxJ6edbzFHLrQlvP7js2unV9c9CJC6ZnScZbuzGb/w4RpROsxCpbNh
 kYG2q4HClyZYG4jAn4EkRTmY9G/sIjfwgvXbxjpHflGKiXJAV+baWo9E14b7Sk6+W/EJ
 g9Kf/0NkEua7EroiM7UGsXTBpWVqtHaPymd3WM1m256+wR4VVD3XX589khmQyKic46Ks
 PqIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f1b6k7qK
Subject: Re: [Buildroot] [PATCH 2/2] package/libcgroup: fix build with musl
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: olegartys@gmail.com, sdfw_system_team@sberdevices.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Oleg,

  Thank you for your patch! I have a few comments for improvement.

  First of all, in the subject line, "fix build with musl" suggest that it 
currently fails to build in mainline. That's not the case, because musl is 
excluded. So a better subject line would be "allow to build with musl".

On 25/06/2023 14:48, Oleg Lyovin via buildroot wrote:
> libcgroup depends on fts API which is missing in musl libc
> and provided by musl-fts package.
> 
> This patch makes libcgroup dependent on musl-fts for
> non-glibc configurations.
> 
> Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
> ---
>   package/libcgroup/Config.in    | 7 ++++---
>   package/libcgroup/libcgroup.mk | 5 +++++
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
> index 03efa71e6b..75c9accacc 100644
> --- a/package/libcgroup/Config.in
> +++ b/package/libcgroup/Config.in
> @@ -2,7 +2,8 @@ config BR2_PACKAGE_LIBCGROUP
>   	bool "libcgroup"
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	# libcgroup uses <fts.h> which is not included by default in uClibc
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
> +	select BR2_PACKAGE_MUSL_FTS if BR2_TOOLCHAIN_USES_MUSL

  If fts really is the only problem, then we don't need a libc exclusion at all, 
because musl-fts works for uClibc as well. It's enough to put

select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC

  If there is a different reason why uClibc doesn't work, then the comment above 
should be updated and the dependency should be

depends on !BR2_TOOLCHAIN_UCLIBC

  Can you test with uClibc and update the patch accordingly? You can use the 
test-pkg script to try out a number of configurations.


  I've marked this patch as Changes Requested in patchwork.

  Regards,
  Arnout

>   	help
>   	  libcgroup is a library that abstracts the control
>   	  group file system in Linux.
> @@ -18,5 +19,5 @@ config BR2_PACKAGE_LIBCGROUP_TOOLS
>   
>   endif
>   
> -comment "libcgroup needs a glibc toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
> +comment "libcgroup needs a glibc/musl toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
> index fb0b646c51..d67710ec1e 100644
> --- a/package/libcgroup/libcgroup.mk
> +++ b/package/libcgroup/libcgroup.mk
> @@ -36,4 +36,9 @@ else
>   LIBCGROUP_CONF_OPTS += --disable-pam
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
> +LIBCGROUP_DEPENDENCIES += musl-fts
> +LIBCGROUP_CONF_ENV += LDFLAGS=-lfts
> +endif
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
