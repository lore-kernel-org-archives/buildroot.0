Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF0DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:24:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC7F3611C1
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC7F3611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA7F640D95;
	Wed,  6 Oct 2021 19:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zb47PSlcGQSr; Wed,  6 Oct 2021 19:24:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD3B240D9A;
	Wed,  6 Oct 2021 19:24:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B30AF1BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A34D883B3D
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgaUPHeYxGQG for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:24:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 441718381F
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:24:35 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id p13so14291195edw.0
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3OL+nattd4VF+EWKDyYOIRsbDZboF2PZPZRn46/jcns=;
 b=alotX1Ii0695Aa1RbUgfloOb3zKhdhe0Dodh5j013B6A+xAggkJ/Lt59pyQK0t5yuH
 wHH4m45pYCSP1p2gg61XBzWnsFHFGpxAJwUUS1gj2m5I5lBw5oFG4JYKMTMhWfDytC9U
 es6/6CeYUZs30POZpkPkTsE2l7/3LicLJIcTHkcjckGrzH3haLmdjaIoOJ54tLm3T9hr
 7PYbIfYig99rXanMRXiwqHmucPIPE3mgcRjP8p+QxlYGoyA3xzmbvvvVKFTaWPD1LpmU
 ise1tQKfc7Kio51Jhih2P/yU+7bmJ30qdjEr9PkGkgkurIh9FP10JmxavfXG6Wmm2p2V
 r88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3OL+nattd4VF+EWKDyYOIRsbDZboF2PZPZRn46/jcns=;
 b=B1jlEQ4SudwY81CuZ/fSXHVtmBBM4C2p1X1fEHsHYx3gEZMiU7LDeV1ivT9XhQt7Pp
 nx8pIXNPGkKTUWe656FZOxYj2NvRIrq23B8K59DkWrhC9oAb3GjUVfa3rt3xdZM9ijeK
 dBddjnz3mgaoOM7T5BCo8pKvBKQHsUJfkcYxLOMfwuY1q0UIKdv5ExzLnjGo/my3vMMk
 ycK1UYmfWxrpkKYWC4aYwBrmLJ+RvFcCuX5694JFvn4AA3MrfWC0hCVPw0tuItJUR9OX
 uAJc0lTZFwOAXLS6bQa0JnB8kmwznHjKwshZV60vXbrNRkjlA+1PUoJHPpa+dg5IrM03
 4gvA==
X-Gm-Message-State: AOAM531RtFI2LvhIH9qA8r7Ypww9ClPG1wKZl3PjzpNkQBOPNZ1MSbuq
 /IToaJsTUoPJOmE7DDp+jmS85Q==
X-Google-Smtp-Source: ABdhPJw+VaAd//A8LyL5cTqMfCGEFN0+E2XdZltPGVpnkc6Gm9QNct6S9Nn622haF14Y2tsfKCCE7g==
X-Received: by 2002:aa7:cd8b:: with SMTP id x11mr37734edv.384.1633548273370;
 Wed, 06 Oct 2021 12:24:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u16sm9180014ejy.14.2021.10.06.12.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:24:33 -0700 (PDT)
Message-ID: <f8f3102b-c9dc-d1a3-7605-582c2471d74d@mind.be>
Date: Wed, 6 Oct 2021 21:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB0493556D0B2FAAE08AE4F4299FA39@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <VI1P190MB0493556D0B2FAAE08AE4F4299FA39@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] [PATCH 1/1] package/sam-ba: bump version to 3.5
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/09/2021 17:48, Lang Daniel wrote:
> Sadly the most recent version of Microchip's SAM-BA programming tool is no longer hosted
> on GitHub. Therefore the package is downloaded from Microchip directly.
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sam-ba/Config.in.host | 1 +
>   package/sam-ba/sam-ba.hash    | 2 +-
>   package/sam-ba/sam-ba.mk      | 4 ++--
>   3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
> index 2236b5f48a..b96e377e79 100644
> --- a/package/sam-ba/Config.in.host
> +++ b/package/sam-ba/Config.in.host
> @@ -8,3 +8,4 @@ config BR2_PACKAGE_HOST_SAM_BA
>   	  microcontrollers.
>   
>   	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SoftwareTools
> +	  https://www.microchip.com/en-us/development-tool/SAM-BA-IN-SYSTEM-PROGRAMMER
> diff --git a/package/sam-ba/sam-ba.hash b/package/sam-ba/sam-ba.hash
> index 1bc14f3fd7..10b95c9c0e 100644
> --- a/package/sam-ba/sam-ba.hash
> +++ b/package/sam-ba/sam-ba.hash
> @@ -1,3 +1,3 @@
>   # sha256 locally computed
> -sha256  dc32c49688bbfab5aa687042caae5f611fe3d9e722098a561f8f5d2fbc57249d  sam-ba_3.3.1-linux_x86_64.tar.gz
> +sha256  f66e431f0401b197e80599156ea93aa3aab050bc4d16523c95fae1107ef9101c  sam-ba_3.5-linux_x86_64.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
> diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
> index 3082d49192..10bea8ef70 100644
> --- a/package/sam-ba/sam-ba.mk
> +++ b/package/sam-ba/sam-ba.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -SAM_BA_VERSION = 3.3.1
> -SAM_BA_SITE = https://github.com/atmelcorp/sam-ba/releases/download/v$(SAM_BA_VERSION)
> +SAM_BA_VERSION = 3.5
> +SAM_BA_SITE = https://www.microchip.com/content/dam/mchp/documents/MPU32/ProductDocuments/SoftwareTools
>   SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION)-linux_x86_64.tar.gz
>   SAM_BA_LICENSE = GPLv2
>   SAM_BA_LICENSE_FILES = LICENSE.txt
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
