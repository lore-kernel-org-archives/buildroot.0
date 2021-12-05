Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1556AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 16:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C13F460642;
	Sun,  5 Dec 2021 16:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3Znkmpb43cR; Sun,  5 Dec 2021 16:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A2B760612;
	Sun,  5 Dec 2021 16:03:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 553331BF57C
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 16:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CE254037D
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 16:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 666B52uE5Szj for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 16:03:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BF5140206
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 16:03:47 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id t5so32931189edd.0
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 08:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Cqqx8aZ4dlJD/RzTxpbIecCGOLYQsq7uPv3vM0s9N74=;
 b=XWm7+mCalocwQIbZjMLLLQhyDczA0muEXGA7xPuURqp/o+ha4mrCqVo1mEwPR5+OSL
 TApPdhWYbtKYvtA69lOrWHrSqOd4kbMN1dBENR4JW/auIbFU5MtYQEhuLNuZZuqa6l+l
 6uESovV/nsPScCIVBRKNMxEn8Q04yhmG5mflghgzukXZPE5/rTFaX37OpZxsA9sKlEPO
 9ybYkRG6IzmCgfWF80N5QzlJPfk7Y3PdcLR5CSqtNHhuAJ6CeXv8lKwHMsypapHcqwF6
 GaBvqf0A3pDztCbLTVV8IAOQQ47ifFZwdCELa/NuQhKHkL5NjH9F0OeABzFb8O5dYGtx
 cmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Cqqx8aZ4dlJD/RzTxpbIecCGOLYQsq7uPv3vM0s9N74=;
 b=hJRUTfU6S/DQitYBesGtjznljFA3kx7v4bSdFHNMfPmPTNwXstVgtepq+xQWZNdU8B
 0azs6Atm5DDDVWhxMimJ4jzhhdAnI1sbghuFGeYfPgyRnh8JxE+foVldGiAqyWDTjPiI
 oqo6HYVgGGN6Afn+0GzEhsidmYbX71vowPJActlwuxvSIqTiJWwmRrJuibHpE1xuwyN/
 ehsjdRXuFNyuEWjq+2nXCh34KJHmo5qlvuwIfnjqC2S2LMlgnSY+8EX+jdSJ4UsSFlbH
 xEG0VJDKE7VkTQ9akmzaQRhTi+X5LyU1iJkxhZ90hTktemCWgHL0eL4MsZUHoydrRt+R
 jVAw==
X-Gm-Message-State: AOAM5302SRAiHH6aQFl4ALHon9DIXjSwepZ1JeZfG9NkLb7JzzI7UJ+w
 NkwzN9f6vL45jsGpzG31IIiMXg==
X-Google-Smtp-Source: ABdhPJwFy89LS+tWF67hPCHq6Tj3apfWFw8jrOoP66Lvu6SgVp0iPjY5891QwDQw1YQ6hwWkLVCZtQ==
X-Received: by 2002:a17:906:d54d:: with SMTP id
 cr13mr40538933ejc.409.1638720226261; 
 Sun, 05 Dec 2021 08:03:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s2sm5791705ejn.96.2021.12.05.08.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Dec 2021 08:03:45 -0800 (PST)
Message-ID: <152ebb16-2ff4-e8b9-c07b-ec05e3781d46@mind.be>
Date: Sun, 5 Dec 2021 17:03:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20211205151518.19449-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211205151518.19449-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/stress-ng: move to github
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/12/2021 16:15, Peter Korsgaard wrote:
> The current project URL returns 404 error because:
> 
> Quoting Coling King:
> "Unfortunately when I left Canonical last week they removed my tarballs"
> 
> So use github and update hash.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Ricardo already sent essentially the same patch about two weeks ago, so I 
applied that one instead.

  Regards,
  Arnout

> ---
>   package/stress-ng/Config.in      | 2 +-
>   package/stress-ng/stress-ng.hash | 2 +-
>   package/stress-ng/stress-ng.mk   | 3 +--
>   3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
> index 64b473b75c..839cbb1cc0 100644
> --- a/package/stress-ng/Config.in
> +++ b/package/stress-ng/Config.in
> @@ -12,7 +12,7 @@ config BR2_PACKAGE_STRESS_NG
>   	  subsystems of a computer as well as the various operating
>   	  system kernel interfaces.
>   
> -	  http://kernel.ubuntu.com/~cking/stress-ng/
> +	  https://github.com/ColinIanKing/stress-ng
>   
>   comment "stress-ng needs a toolchain w/ headers >= 3.3"
>   	depends on !BR2_nios2 && !BR2_arc
> diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
> index f3eb76fa82..bbdcd155c8 100644
> --- a/package/stress-ng/stress-ng.hash
> +++ b/package/stress-ng/stress-ng.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  f37f739e4d15343360a47980b67dc8b2a6bf3d4d3ef727d55e2dd99a0b64f9ea  stress-ng-0.13.01.tar.xz
> +sha256  1973b142b9b731952dd4ce77c3618a7e3c62494587e23bf37c8683503d048f68  stress-ng-0.13.01.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
> index e0b385e756..54572383c4 100644
> --- a/package/stress-ng/stress-ng.mk
> +++ b/package/stress-ng/stress-ng.mk
> @@ -5,8 +5,7 @@
>   ################################################################################
>   
>   STRESS_NG_VERSION = 0.13.01
> -STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
> -STRESS_NG_SITE = https://kernel.ubuntu.com/~cking/tarballs/stress-ng
> +STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
>   STRESS_NG_LICENSE = GPL-2.0+
>   STRESS_NG_LICENSE_FILES = COPYING
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
