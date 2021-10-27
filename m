Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36996C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:29:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABB0460F39
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABB0460F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81D1881D16;
	Wed, 27 Oct 2021 20:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jd95CB8oiaxQ; Wed, 27 Oct 2021 20:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEF3E81CE9;
	Wed, 27 Oct 2021 20:29:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7745E1BF3EB
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67FFF81CE9
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHxZKtrQGRw9 for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:29:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83AEB81BF5
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:29:17 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id h7so15844460ede.8
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Kn2dWwcwF6vhgKjKlqwRFwxlEpa4BvYlrLZ4fp0J6mM=;
 b=Yd9gaQ//HROTK8mm+Fdlm0GUJ9DAtAVK/QIyfpLhk6cS6oaKMljPW/cavUR29iSrVJ
 UUKOmvpNoNGMugdaHMKKWKdvn7aD8savt6ex7NPd7vGssvQ0rjUlSMXLdg1+QY46VZaK
 hlS0w7YXghpQy+YsNn+myu1JGH8mqRG9P70kV2kHr/n7xG568D3keS9QysxG2iEyyo0w
 /jeCdo2/0RbZvg6ICP41m6ae5LBtirbF/8HVPI1d4vQ+pHJDwCJrEHpEEXArAwekkHPR
 YDxNiN2y5YigeSLmyIPY5hy4HrOHi9sApCxruoakF98p8PXD/VxMAA3vXEnoazArPRLw
 nlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Kn2dWwcwF6vhgKjKlqwRFwxlEpa4BvYlrLZ4fp0J6mM=;
 b=5jlmrBttAGltTjXj4Fey0lH1IsPwOEYdV7toYMS7/I+zZ5PdTl7QQO0W8Fu3WaeWuQ
 Vp3Y03y+kbBeRwLRukPvGYT27/d8dndu0B79C1Iycx22qs0uhzxh1tz8q4saxQ/vVJsQ
 I8oMI1hF0iN/U+kOFYqPEZ1A/DbzOY3dLlEegIwL87iSZbBX0zq3eR8hdlCudIc8/3ZC
 Bqd+tKv00hiX2ljbc1DBqVd6ilJQI4RlUkdtmRLbTumSE8hvoXndXI5kB5HHHIBliBIE
 7JV1BTckFW1+a7pYoA0MBL6IAB5knf+NTOfQlnqdIbE0eMRSzOdSY8rfVJ5INif9yMc2
 NtwA==
X-Gm-Message-State: AOAM533BMxD7ZNAPtSIj4wLLHJet9do22w3iUySbiUkG0cABkITZB4Nt
 qI8xU3OlJ3xgpMLF85p8uuShsw==
X-Google-Smtp-Source: ABdhPJxGpL1aBARFiNC4TPwH4YIKTO1t8ptrhe6vjvh8LTTAncmWr4WRHm2S6x7Le8hGk0MQ2NWUdw==
X-Received: by 2002:a17:906:5804:: with SMTP id
 m4mr41062471ejq.295.1635366555702; 
 Wed, 27 Oct 2021 13:29:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m5sm442819ejc.62.2021.10.27.13.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 13:29:15 -0700 (PDT)
Message-ID: <a02ab06e-9053-bcbe-209a-822850b3b977@mind.be>
Date: Wed, 27 Oct 2021 22:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211025073245.3148426-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025073245.3148426-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 249.5
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/10/2021 09:32, James Hilliard wrote:
> Remove efi-ldsdir meson config option which is no longer used.
> 
> Meson config variable systemd-analyze is renamed to analyze.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/systemd/systemd.hash | 2 +-
>   package/systemd/systemd.mk   | 5 ++---
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index baab5304e6..a83ff7d989 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>   # sha256 locally computed
> -sha256  f3df809bbe777fcb5ffe2b29aaf6f871de764ef22706940960f88b8a850e9278  systemd-249.4.tar.gz
> +sha256  773ee546ad6df0921ea6f9e12294eb102bf68c1ac9eb3dcaca1764f8306d6e13  systemd-249.5.tar.gz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>   sha256  f5645b4b846479859d6618fa7a5a1722681aa7fc43c1e45f8bf8e1fe5738d618  README
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index c403896759..8c187d2ec3 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SYSTEMD_VERSION = 249.4
> +SYSTEMD_VERSION = 249.5
>   SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>   SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
>   SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
> @@ -507,7 +507,6 @@ SYSTEMD_CONF_OPTS += \
>   	-Defi-cc=$(TARGET_CC) \
>   	-Defi-ld=$(TARGET_LD) \
>   	-Defi-libdir=$(STAGING_DIR)/usr/lib \
> -	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
>   	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
>   
>   SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
> @@ -728,7 +727,7 @@ HOST_SYSTEMD_CONF_OPTS = \
>   	-Dinitrd=false \
>   	-Dxdg-autostart=false \
>   	-Dkernel-install=false \
> -	-Dsystemd-analyze=false \
> +	-Danalyze=false \
>   	-Dlibcryptsetup=false \
>   	-Daudit=false \
>   	-Dzstd=false
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
