Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A6FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23338610BE;
	Tue, 12 Apr 2022 18:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uurSRZ_IX4l; Tue, 12 Apr 2022 18:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 277D0605B3;
	Tue, 12 Apr 2022 18:32:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74D0B1BF95D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6098A4172F
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yU4Rc6Ejwxfd for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:32:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0ACB841728
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 18:32:28 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w18so23376691edi.13
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 11:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=C+OGKw5YR3j7NI821WDYnPb3PZIwW4dCyezuYnw9Mqc=;
 b=F8W16koibKljggp943yUkmgKg4MFEjnFRUVGSlVoOfia2Wgo4xDdyc7U9zY4TB7Kqq
 n1/wxEabTlWMXcMyaN7Kdldh1jERYDalRoWcI1b8ReDVty6k5LWx32ZOsOf6BkYxG6FP
 Ax+WEhCPVIkM9yMBcM++KJHwEUZB4M7FzS6dffCuLFKneavrVwGZuTouwLAlmeCDi7rN
 wdtfP7ULbj+F5tLCEVSHG2ZmdG7emKx2ZFvU4VcxeUGhGecjc6JrPhaSFb8Co+yldJdx
 Jc/ztWF+kAwSwv4beH/oQeZdELqT814gJh7nkMpV+0KI1D7DgMdb7Il8H6vyI8rcEmWv
 dtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=C+OGKw5YR3j7NI821WDYnPb3PZIwW4dCyezuYnw9Mqc=;
 b=oWghJ+xYFxjF+1j66h1zpINh7aye4TP152TWNXM+3fIRpnoeb4bfiyc1xKfq8Z+rhe
 UjnM9pzf4Z/CEmXsjkFx3ogKiZKlC6snPFv6PuKwjmPdyoK3sGE/s3gIur4FhF2n60uA
 31ySBD+6H3Wq25W7BrZUJLFm0qtws6iIDi8pBz50yUHoqXayAjxRQNEORYvAkosL1BOJ
 8LtLynZOboVM+AJ+0e6eWI0LMcM/L6RbooRcADiy+mJwMlYCK16WVFgvfppGYJVtFMQf
 mxHRSPhB91EqXu+7Oscshh96fYeMOaGPaUiomkDbYumb5aujn1E8Xs8ALK46+AT1COdF
 mfGg==
X-Gm-Message-State: AOAM533tDX38zTgbeq4H45ksUC4RVyOO1k9PK5EFJRkWP6xP/ok+k85b
 Y0rqXD2mMzNqi45XS4aLOIQ3bQ==
X-Google-Smtp-Source: ABdhPJxPKn9l3cbZUYTlYOo772mq7CVVEzPygJF/o5zDv71aQY+Ae7T+KySHM35UcqXwqXi/BGgGQQ==
X-Received: by 2002:a05:6402:3549:b0:41d:95b4:e546 with SMTP id
 f9-20020a056402354900b0041d95b4e546mr3803524edd.33.1649788347245; 
 Tue, 12 Apr 2022 11:32:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 do8-20020a170906c10800b006dfe680dbfcsm13352050ejc.43.2022.04.12.11.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 11:32:26 -0700 (PDT)
Message-ID: <bdc6ef09-8f87-6fdd-5d4b-8eb9b2525c18@mind.be>
Date: Tue, 12 Apr 2022 20:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220405215207.2696390-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405215207.2696390-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rt-tests: needs __sync_*_4
 intrisics
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2022 23:52, Fabrice Fontaine wrote:
> rt-tests needs __sync_*_4 intrisics since bump to version 1.9 in commit
> 32be34427956a590d07d12e965f97fa9d2110ae9 and
> https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?id=c86dec5765e1ad0bd1d0c429ca7c138c11da2c80:
> 
> oslat.c:(.text+0x1034): undefined reference to `__sync_add_and_fetch_4'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/9b065ee7611db3a404863b85161f46a2e9e8ddad
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rt-tests/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
> index 47fa7cd840..8efa3d194e 100644
> --- a/package/rt-tests/Config.in
> +++ b/package/rt-tests/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_RT_TESTS
>   	bool "rt-tests"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
>   	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
>   	depends on BR2_USE_MMU # fork(), numactl
> @@ -30,6 +31,7 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
>   	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>   
>   comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 4.5, dynamic library"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
>   		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
>   	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
