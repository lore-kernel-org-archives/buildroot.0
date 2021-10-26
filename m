Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166A5C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:33:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABD96103C
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8ABD96103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F455607AE;
	Tue, 26 Oct 2021 19:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUbKlgv25GkY; Tue, 26 Oct 2021 19:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9E0360657;
	Tue, 26 Oct 2021 19:33:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 562861BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4629280BFA
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNVlqusqXDaB for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:33:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 228C780B8C
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:33:31 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r12so861354edt.6
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=rM0uGQi7pMg0MnaL7u8Kld2z+BUvn/a2ST8w1BfjrJA=;
 b=WkVxyhsizSo35/pC57OApahQaPuVMfzeiyfOHpAWQuTL84Ddrou3e7KjM/f4xFN50r
 0zjyfu7geGLLljloTZPwhLHJAPvQmUprbaWLcpHEgJmX2QF/qG8nZ7nzaoslJCRR4QcX
 9xVgzWDeU3oJ3B7ehSsRue4M0AYrjIa/UFi0qQzFDhCoaiF9aq3OGbymtaYwxpgdvIDQ
 k2ALNt/bBkaTJqi0DmwvmdbD3dVdIPLZI5IvxLzTwjRglzsXO0irR3KYR6LC3s/4O0CF
 ZK01UjD62u2zRoLRlcxeD3DZJWPnwGbiS50xdbAS9FzlrhEJwIa5cJknvKGSYDKx/U2L
 390A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rM0uGQi7pMg0MnaL7u8Kld2z+BUvn/a2ST8w1BfjrJA=;
 b=A/4qauhnLCRIOYjUYnXqRcgtQR4qZCicuCAR5fnsTafyUOoKKGzN6d7/iesftRh2zX
 qidarkh49WHV81hsVSEM+uW/mkr4Sxl+CAPYjJ0UGCo2cidUa131tNRd2ULI/cuOQTf3
 7OSGBycx4Af0Z3RG8qxFFEQDl2HRCIB27iXoSZ1zXjSZ6BS4KtnT14DjrVLF3/FkX8DR
 OBSbr1iFaOOegGt+7poncgNew2g6ePl+X2+rrme2vbUJndQ8A6IpQ50XQWxaB0lOVzig
 4Bp0T78nKGfOR4sQc/4siBrUFmgrw2LbS72gd734LxRDOGgByVFsLI+0vKWltTgVTpOo
 AB8A==
X-Gm-Message-State: AOAM5313pD9slLQZYsBdiCP6nts1nsP6l4ZVV7xWT0rO97PCbQjnUtS9
 cxGhg1U3QlWTmDE/OPyh4GzJJw==
X-Google-Smtp-Source: ABdhPJwUeaJw8FZ3nnaRoVgTs87fs6DoX5H5wL98qWWXFGeY2kWVG+RkufNdk5yS7jzP8Cuahh12zA==
X-Received: by 2002:a17:906:2f16:: with SMTP id
 v22mr33302024eji.334.1635276809360; 
 Tue, 26 Oct 2021 12:33:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r19sm11235448edt.54.2021.10.26.12.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:33:28 -0700 (PDT)
Message-ID: <d1b2fb7f-13fc-0cf1-4b48-d6c09a218592@mind.be>
Date: Tue, 26 Oct 2021 21:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211024071047.2241497-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211024071047.2241497-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/motion: bump to version 4.4.0
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



On 24/10/2021 09:10, Fabrice Fontaine wrote:
> Use LICENSE file added with
> https://github.com/Motion-Project/motion/commit/34091a770c679da79f5be58f392020a8514521ee
> instead of doc/COPYING removed with
> https://github.com/Motion-Project/motion/commit/13d8fdc37c6ea42ef9c49ddc594e2b96d43cd36f
> 
> https://github.com/Motion-Project/motion/releases/tag/release-4.4.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/motion/motion.hash | 4 ++--
>   package/motion/motion.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/motion/motion.hash b/package/motion/motion.hash
> index 96ab1c4338..085ac90449 100644
> --- a/package/motion/motion.hash
> +++ b/package/motion/motion.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  dafa4264b2d8e4778f8be5871f09b6c0ec710d5a836182c583469c18db944d70  motion-4.3.2.tar.gz
> -sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  doc/COPYING
> +sha256  3fb0d14fff8a8a143716223b5d2d55c0f52b11badf13a2e485b98bae3cf1b572  motion-4.4.0.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/motion/motion.mk b/package/motion/motion.mk
> index 29b70fd85f..dae812b9a4 100644
> --- a/package/motion/motion.mk
> +++ b/package/motion/motion.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -MOTION_VERSION = 4.3.2
> +MOTION_VERSION = 4.4.0
>   MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
>   MOTION_LICENSE = GPL-2.0
> -MOTION_LICENSE_FILES = doc/COPYING
> +MOTION_LICENSE_FILES = LICENSE
>   MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
>   # From git
>   MOTION_AUTORECONF = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
