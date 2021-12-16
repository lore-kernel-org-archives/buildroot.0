Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F621C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D87DD83F2D;
	Thu, 16 Dec 2021 19:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZRltDZ2Rgfz; Thu, 16 Dec 2021 19:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 250AF83F23;
	Thu, 16 Dec 2021 19:09:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F94F1BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75BA66009C
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KiWsQ4z3eVDS for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:09:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D06861016
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:09:27 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y13so90470746edd.13
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 11:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pMPu++dkmt2uYVpl4esmnfyF2NMh099sQuK7ldqrLUs=;
 b=WoERfyQ/BNzerhQZ0DBMwJu1S1DxiltiV4HW42p6gPusvgr4zcnKS5MQQeKi6RThY3
 7tyimjhjXEJQRX4+sWH0oOW+4hRGOdm1hDEyoPWAL6g/lDBVoDjzBcMktG8BlsWiA5Uc
 ldV725g89/AxYwxz2BjWoe2QvaiZWoH7ujdSvNbf55N6uJWaYZEQc6ISoaKalROqvSmp
 rtj3VMcQN31JcQ6kB3FRFWAM3iQxOmjlerFVpqs45GJwsULxRj2ecs+pq290LQGmiJJW
 v3jfw07zH9x3RADcJBId/FwFJ6roTEhCU4kVvaWt7w1ZOVRGw0F+pV96mja1MjUprYio
 fp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pMPu++dkmt2uYVpl4esmnfyF2NMh099sQuK7ldqrLUs=;
 b=4w+g3qGZJvpWzW/foK8C3Y2tcYNi605zWCa24pKEP2P7HbsAhNN8P7SwPVshy05YON
 LyqQSxFowWsXuMb0phP1Cv2rXklJCgRENcycqMjOjgISnjcvksUJ20nytHZ6557Z5kp4
 2wWbv/2KIeRYy3amYjFuAsaZgHRFAuFjtgXt6vDzHX+vrwqJqrshrrLEDokTaOknPWe3
 jSYxIFx2R6PlazX+jmuKoYxP74BvnJ8xWYLjIkbrVOFy4HzmoDA5M8rizkE2pKzivITc
 WJ0FqYCixsupI3NKkdL9q0aX2SW3hkC4+gN0A+RMggfw1oK5Svum1qg/b5jjUbMg/MX1
 0j9A==
X-Gm-Message-State: AOAM533SavSgiUNl9lS3HlgSvnidDOdQQdDy8d6P1LONTvxRtGt1lKTW
 YluCXYdJ/peGZ40L7azSOYMtrSNBSk+jdA==
X-Google-Smtp-Source: ABdhPJzBqRP0XLQCcEYPod0Z6B6eo/Xv7YpGL/vQDltU072lhSkQBI02o3PiqTPgwjkAEAG4ibFfqw==
X-Received: by 2002:a17:907:9726:: with SMTP id
 jg38mr3768507ejc.149.1639681765776; 
 Thu, 16 Dec 2021 11:09:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a17sm2674877edx.14.2021.12.16.11.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:09:25 -0800 (PST)
Message-ID: <c475321b-c3a5-ceee-02f9-5f73e845f143@mind.be>
Date: Thu, 16 Dec 2021 20:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211215172917.3798152-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215172917.3798152-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/taglib: fix build on sparc
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



On 15/12/2021 18:29, Fabrice Fontaine wrote:
> Fix the following build failure on sparc raised since bump to version
> 1.12 in commit b4bdf704fea59db81433bbc07585e4c4db258d9a:
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/build/taglib-1.12/taglib/toolkit/trefcounter.cpp:55:21: error: duplicate 'volatile'
>     55 | # define ATOMIC_INT volatile int
>        |                     ^~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/387feeb6bcc190b3908e405ba5f8a888d7e1f348
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...e-on-systems-without-HAVE_GCC_ATOMIC.patch | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
> 
> diff --git a/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch b/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
> new file mode 100644
> index 0000000000..d8af73cb08
> --- /dev/null
> +++ b/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
> @@ -0,0 +1,34 @@
> +From 1d24bd3399f2284104cbe87d017f87325b1797ab Mon Sep 17 00:00:00 2001
> +From: Oleg Antonyan <oleg.b.antonyan@gmail.com>
> +Date: Thu, 13 May 2021 16:41:35 +0200
> +Subject: [PATCH] =?UTF-8?q?Fix=20"error:=20duplicate=20=E2=80=98volatile?=
> + =?UTF-8?q?=E2=80=99"=20on=20systems=20without=20HAVE=5FGCC=5FATOMIC=20in?=
> + =?UTF-8?q?=201.12=20(#1012)?=
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* fix error: duplicate volatile
> +
> +* fix volatile ATOMIC_INT in constructor
> +
> +[Retrieved from:
> +https://github.com/taglib/taglib/commit/1d24bd3399f2284104cbe87d017f87325b1797ab]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + taglib/toolkit/trefcounter.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/taglib/toolkit/trefcounter.cpp b/taglib/toolkit/trefcounter.cpp
> +index 18cb596c0..5b089abf9 100644
> +--- a/taglib/toolkit/trefcounter.cpp
> ++++ b/taglib/toolkit/trefcounter.cpp
> +@@ -52,7 +52,7 @@
> + # define ATOMIC_INC(x) __sync_add_and_fetch(&x, 1)
> + # define ATOMIC_DEC(x) __sync_sub_and_fetch(&x, 1)
> + #else
> +-# define ATOMIC_INT volatile int
> ++# define ATOMIC_INT int
> + # define ATOMIC_INC(x) (++x)
> + # define ATOMIC_DEC(x) (--x)
> + #endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
