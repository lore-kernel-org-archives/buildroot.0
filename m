Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8C3C432BE
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:04:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D075661175
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D075661175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A980400D0;
	Thu,  5 Aug 2021 19:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8okvfYH3Qfym; Thu,  5 Aug 2021 19:04:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5173B400D7;
	Thu,  5 Aug 2021 19:04:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53BB61BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43E728276E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_N6m_soG5K6 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:04:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33D30826A8
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:04:29 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y7so9841517eda.5
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 12:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fdiAySTyVjbEIeOm+1MdfkZCXoc6j4eyap+qUec+eoU=;
 b=Y05sr3mz9igBT5XO3H9n9bmb/N+lDaAtySMu/FS4nzBwA4y6ppwl09qfbipbPlsXCQ
 0HbsS2sO1L/izG4clcgsjJVykzxfbvnNx2ca3XEgajMShLugr8/PgQOPlAQPTgsk1y52
 DqERczyjjeZPOAKodge4GF4SNsP5iJQ5iMv20Bh8vOAUlgT5qY+6i49XbY74hd0rMz41
 IfgEFSFPyrGOKSfSyXosqFKgMgw8FR9EpC8+vpq3UfDcaiXHiOpphpm/Kej1EniszRiI
 wYCrsLkm3/2qZSq5IEh2riY/B6QgapxVARcwvREU/1HBFzsGttvDGhILy8T3yuZWUU7p
 URNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fdiAySTyVjbEIeOm+1MdfkZCXoc6j4eyap+qUec+eoU=;
 b=XonCv3xFj48KqYqZr/Y4Z0c4zkDL9JDaU4p7rpCaJpmfHKNaXRYLVjECuO/GcW0p2b
 x+FS40rBoBIkQIjoKgNZjAX+1+Y6ZYZOp1YpKMwuQRzil0PfyXQDhy7HG38z/x6DJap9
 tRxKthCrd+N9g67jA8eM9QJ8youYCaCQPAAsxKmG42jWhzRb8tCgy9d+C6Uo7m58kNDk
 7DcxOMfvW2O8JCib/rZVHmdQ1BOetF5j5USV+6IkkZPHbhn53unUKD4DmRIX10cNNTEe
 2g6Kq+ln/FScIRGXbCyvUidq3tiZO1yM0PX47HXzhebcse8BnBnE61zenJRqh8wTaar6
 ljmg==
X-Gm-Message-State: AOAM530IC6zFd9kWHH7J0pfckyIlnOBWGZyy92W+GGzgOTIPLleQC3Ij
 sSrNr2TvqsYdGJoBLVQtW0JaloeKXlOhKoFzFoY=
X-Google-Smtp-Source: ABdhPJz7Fpb7OEjs6GeNgcEtpXGpg3IsAaZ0OqKJq60Xen5tyJI1nYr2jJhJ/52XzgORjQVFM4pLeg==
X-Received: by 2002:a05:6402:292e:: with SMTP id
 ee46mr928587edb.315.1628190267323; 
 Thu, 05 Aug 2021 12:04:27 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id d22sm2029082ejj.47.2021.08.05.12.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:04:26 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210805083325.1919836-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <8d2c3999-3f81-fdb3-95f4-a1d5720ef1d1@mind.be>
Date: Thu, 5 Aug 2021 21:04:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805083325.1919836-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: needs gcc >=
 4.9
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 10:33, Fabrice Fontaine wrote:
> network-manager needs gcc >= 4.9 since bump to version 1.32.2 in commit
> 360d1aad84449c6a1993d8c7e469dc0cd35339a2 to avoid the following build
> failure:
> 
> src/libnm-core-impl/nm-setting-bond.c: At top level:
> src/libnm-core-impl/nm-setting-bond.c:149:5: error: array initialized from non-constant array expression
>      NM_MAKE_STRV("stable", "bandwidth", "count");
>      ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/dc270ead82707f89d47616a0c18629715c6ea1a5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/network-manager/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index 7d44768460..38ab43740f 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
>  	depends on !BR2_STATIC_LIBS # gnutls
>  	depends on BR2_USE_MMU # dbus
>  	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  	# Tested with 3.2, but may even work with earlier versions
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
> @@ -61,9 +62,10 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
>  
>  endif
>  
> -comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library, wchar, threads"
> +comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library, wchar, threads, gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_PACKAGE_HAS_UDEV || \
>  		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || \
>  		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
> -		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
