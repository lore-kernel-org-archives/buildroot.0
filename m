Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A45AC433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB9B0408BB;
	Thu,  3 Feb 2022 20:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQz3wiiCdhT9; Thu,  3 Feb 2022 20:41:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11FAA408D2;
	Thu,  3 Feb 2022 20:41:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9E6B1BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A62E760A72
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d3-eYwZluIMT for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:41:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF26660A6F
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:41:35 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id h7so12481342ejf.1
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 12:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=mRVyQsbt0UDA+BoyatjyxuJM2A/PQGB3tRCvK6ZJurU=;
 b=ImTEpqkrlheGOYW4QDAL29ezxFlYasqE+ERU0JEWhd0KgKRp26G7Q5Q9wmTUv9x5kh
 pDSMELvFymWhE2kmbspapj1yA49Di7+s4pLXQjDYZ2TB8JgNMZdKjQh/MgSAS2S/ROqu
 AM9YykyfGDR4Tr0P5LOeIvkleypHHe6DyvtejVDIv8UG2RTJQOtXkn71EAt3eJy1hz99
 IseETtpORfDQhigbsJ4FTIDL2au/ox7JzALZA8iALxCOaUSALTEchDbIFVUCJ5rAT+9z
 3BtZEnDQchsAd8XwaS7lQ5FDAoVwCQzJOP6P7qzIP8DiDUuiZNHgQl7PfGBI9pdwlGRY
 bSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mRVyQsbt0UDA+BoyatjyxuJM2A/PQGB3tRCvK6ZJurU=;
 b=04dcOlkHw8dVfrAp5AhS96GQOkzevtCffl6M2aAuoavIaqiPTzM4aDQ7it465P+7Ls
 DK2kqX+qERxWm6MuulzGNgURimKVOqThh1J+fBiVWtnUPAKoWF1y/SI6kWizSBo+QER4
 FPYgAPonMJ+QahVkknPZRaJva476UD1TKqR91bm+QiY9HOC8fPfMHNNlDrGqInIhUjHg
 x4Nxekl7fv2dlRqYhkOaaid4bMg211Dlh7XNwGOLaOY5XGgYezelUybF2tLV+xpqQTRB
 5IwySDzcHtsOF/KK5x3d2iNrO2+dCCU7OsRNrmoKhGhbYbsa3vNEC1SQl/1nQQ87LWwV
 d75A==
X-Gm-Message-State: AOAM530cCgtn33mojOtsgICCUPbOD75dAdgz0T38clEPVFgirI+iYcbJ
 4LLeEAt2NA2LLUUibkQUT8fAjBx9Vsx8Fw==
X-Google-Smtp-Source: ABdhPJwT5jKOAfnDQZSNuhmNcPSd/H2IUNGd09WHGjpHxWItmOgbg1Dks7xogEIez6s2huXB5fgnag==
X-Received: by 2002:a17:906:58d4:: with SMTP id
 e20mr31202319ejs.258.1643920894284; 
 Thu, 03 Feb 2022 12:41:34 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w24sm15239984edu.97.2022.02.03.12.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 12:41:33 -0800 (PST)
Message-ID: <a11ea1c0-2062-1239-e0dd-53ce1828c511@mind.be>
Date: Thu, 3 Feb 2022 21:41:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220114074309.356873-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220114074309.356873-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libglvnd: needs threads
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



On 14/01/2022 08:43, Fabrice Fontaine wrote:
> Fix the following build failure raised since the addition of the package
> in commit 0378e2e5d9ce9d5676975dfbff501360094fdc1a:
> 
> In file included from ../src/util/glvnd_pthread.c:39:
> ../src/util/glvnd_pthread.h:33:10: fatal error: pthread.h: No such file or directory
>     33 | #include <pthread.h>
>        |          ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/63624bafc6f7a225d4db0667df977fd6141561aa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libglvnd/Config.in | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
> index cd19fde582..d020c21465 100644
> --- a/package/libglvnd/Config.in
> +++ b/package/libglvnd/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBGLVND
>   	bool "libglvnd"
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
>   	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	help
>   	  The GL Vendor-Neutral Dispatch library
>   
> @@ -45,6 +46,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
>   
>   endif
>   
> -comment "libglvnd needs a toolchain w/ dynamic library"
> +comment "libglvnd needs a toolchain w/ dynamic library, threads"
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on BR2_STATIC_LIBS
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
