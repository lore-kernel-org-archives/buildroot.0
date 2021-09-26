Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F23C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:51:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66CEB60F9B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66CEB60F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4042F80F24;
	Sun, 26 Sep 2021 19:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NasXTMbLcU_x; Sun, 26 Sep 2021 19:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62FC781B10;
	Sun, 26 Sep 2021 19:51:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E7F91BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AA864029D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:51:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ksKtYNIVtX_P for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:51:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BD5D40145
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:51:36 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v10so55480224edj.10
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=dPHdCUiRq+Ng61Fm9VOGFMJ56Z8UVJSwiuYxs02vetM=;
 b=hpecdFJNvQ6BW5ftkadvgYivxfqxu78C8nIQNjV1lOjI/YUJNK5PbBZD/gj32G/nbA
 pkLNnQ9/CrOWm59CGuIxTAXM98jlV00hHlOVVpOc1XLDBJA6VMzW6uWTgab+xgcKw31L
 5iUYHt4Yw6Qic4fUR/IagzDJOl7mMPQTY9lCrgcvZkhh3D8iZQ+YB/LdmSDMmxkQW8hq
 OWK+nPWY7rs6M3zMa6UtY1pFQuHtpxKxGz0UguLwjjD3Pma9jYGjdM2Xz3qxkOZi/25h
 2rBysnesuIPUYUzbIFunmu4I+S05cImfk1ttEVgysLiWHyh3SYDncysU6lvEqluO627A
 V9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dPHdCUiRq+Ng61Fm9VOGFMJ56Z8UVJSwiuYxs02vetM=;
 b=7C3FTnsIHe/CwrVYy5IfsHXsLIxvL2PVJeSMGAFQvAhbyq3ePvpZtKLZjBJQVc26WD
 ASj16M9M0F43CqsAYSLZMnv/x9hF3ipbduJUlas1yNRDJid4uRYMMIDfqi5iA2ZBPqxY
 UtqJzCX/XoYFSNh6qEJGPGVGyTBXX3SSyroK1CqrrNumDWcNURgQhKT/nQi2aqvCjQjb
 JQSAxnnrFZkDT5krD1f/r+dH0Aut3DQSxQfiKRm0GvIA5pvh7uJ4v3ltj02cgLL0EUOX
 HSoRUwaHAZLVQ7Ffhs1x9PdnugOoP5xYtPCaoefmTX7GoAuQO4dP7XIjfahuhOFWuBYG
 JGpg==
X-Gm-Message-State: AOAM531sCAbg+UJ6baaheTLugqUnKELuzcH2qZ249IwmiFWJ1UH1gRST
 VBbqBA75xCWzcTkwmF4AVmUGKkQ/eqdruw==
X-Google-Smtp-Source: ABdhPJyZEkvXien9f1aKMnKQFL+pOS+SXqHQdyB8klRVdfxujQ2JSP3StSF3pF0L5FbFGgip6M6M+A==
X-Received: by 2002:a17:906:6148:: with SMTP id
 p8mr23181139ejl.17.1632685894740; 
 Sun, 26 Sep 2021 12:51:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m14sm7670553ejl.74.2021.09.26.12.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:51:34 -0700 (PDT)
Message-ID: <599519d5-87ad-3ce2-5a92-cfb30c8d489e@mind.be>
Date: Sun, 26 Sep 2021 21:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210926132119.2664730-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210926132119.2664730-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-octonet: fix json
 dependency
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



On 26/09/2021 15:21, Bernd Kuhls wrote:
> While creating the initial package file a wrong dependency was chosen.
> 
> This package really depends on jsoncpp, not json-for-modern-cpp:
> https://github.com/DigitalDevices/pvr.octonet/commit/f724c5934c63c64a0085c3dbe4cd3c3fc58f1318
> 
> This bug was found while testing per-package directories.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-pvr-octonet/Config.in           | 8 ++++----
>   package/kodi-pvr-octonet/kodi-pvr-octonet.mk | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/kodi-pvr-octonet/Config.in b/package/kodi-pvr-octonet/Config.in
> index e831194ba5..7b46cccb2a 100644
> --- a/package/kodi-pvr-octonet/Config.in
> +++ b/package/kodi-pvr-octonet/Config.in
> @@ -1,11 +1,11 @@
>   config BR2_PACKAGE_KODI_PVR_OCTONET
>   	bool "kodi-pvr-octonet"
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
> -	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
> +	select BR2_PACKAGE_JSONCPP
>   	help
>   	  DigitalDevices Octonet PVR client addon for Kodi
>   
>   	  https://github.com/DigitalDevices/pvr.octonet
>   
> -comment "kodi-pvr-octonet needs a toolchain w/ gcc >= 4.9"
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +comment "kodi-pvr-octonet needs a toolchain w/ gcc >= 4.7"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
> index 170f56f7f5..e2699bc44d 100644
> --- a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
> +++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
> @@ -8,6 +8,6 @@ KODI_PVR_OCTONET_VERSION = 19.0.0-Matrix
>   KODI_PVR_OCTONET_SITE = $(call github,DigitalDevices,pvr.octonet,$(KODI_PVR_OCTONET_VERSION))
>   KODI_PVR_OCTONET_LICENSE = GPL-2.0+
>   KODI_PVR_OCTONET_LICENSE_FILES = LICENSE.md
> -KODI_PVR_OCTONET_DEPENDENCIES = json-for-modern-cpp kodi
> +KODI_PVR_OCTONET_DEPENDENCIES = jsoncpp kodi
>   
>   $(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
