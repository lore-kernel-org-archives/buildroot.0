Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC341C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CAAD41A5B;
	Wed, 27 Apr 2022 17:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLnY37_yhKZP; Wed, 27 Apr 2022 17:18:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B3C841A57;
	Wed, 27 Apr 2022 17:18:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62A3E1BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6016983E66
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mwSfl9UEwvC6 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:17:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 688EF83E45
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:17:58 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id k27so2727439edk.4
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 10:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OWUVtTumDaD2y4W9NSmKjrPJgzTmyemvN13bBCii0A8=;
 b=NTNR0Gxrh7XuetyfZx/S0eQ63AOYHSAazI8gCCOZvhydoo4ZDWzyuTHj3JAWdaCZjn
 wQbw3vBfSYxGF4dSn0xF5XzwlZVkasIT3GtwWF4uPbMrqsa66vroINadW3y3d4G/TE4q
 NSDhWxefC9oqyetA633DgSp3wZlBK+IqJHcMZOal6f9U3hkSHL3LZawxmyYi0hxlj7i6
 VdeVCGVSi6BpmdWvtiO0fwl7yHSjEskpOSLNC30j3IMSY7ddCa7Cb+B9cWgtu3clMTIB
 07aUJ4Z9jq8pbBE+i15a8c4aLNRYV+52yIEpqgGu2d5LN0+OYlIDtKtWcLMrmuaGjFu1
 kyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OWUVtTumDaD2y4W9NSmKjrPJgzTmyemvN13bBCii0A8=;
 b=GCVL1czkTpq3EOA1RPUypUbWZsqjbBC1pOtYv5Qzv2SMgnVEAJkDSmVYk6d6kJLPMB
 f0etpOxUrAvpiyWeEzt6g21Q8IpCQ7ZKQzKhQv+JSiO3NqBJRnJGQL/SWA+fcNaiHNI+
 WBh82n+7jwBp7JHWe2fK1Dlzc0//rMBfdoxfWIW5qKXJCx6pUuoBkDVbYdnwDGD1KicT
 hlJmUT+Bw5gfNSu1X6Xk54sgXHIzcAnzTqAZ6YJgRdLSqWUZzkTMbcAx/01AIjqx0WgW
 9Jd+aGVCWxEoUeHPhHbbNlew40Tj4k/I2ZC9CEOqLeMCveNS8ew2tJrsr7H01MdxIGXI
 G6XA==
X-Gm-Message-State: AOAM532aGUShWczfgkXmTWWjgfpf8bXEgLrXu4fu8RkwYAtlQxTRsdHh
 1xwEVeNEBd/HbUIiN2OnFh6G2w==
X-Google-Smtp-Source: ABdhPJxWZkOPHfEOGG5Aepplllk+oGod/itvhxxragefj7y4NbxzQgUk8U9Ugaqsx8OLMQL4bTkf5A==
X-Received: by 2002:aa7:d954:0:b0:425:f621:f77f with SMTP id
 l20-20020aa7d954000000b00425f621f77fmr12981894eds.363.1651079876632; 
 Wed, 27 Apr 2022 10:17:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a05640234d600b00425f1d7deb9sm5247249edc.28.2022.04.27.10.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:17:56 -0700 (PDT)
Message-ID: <9ce03303-1b6b-3894-58f2-91318daa7df5@mind.be>
Date: Wed, 27 Apr 2022 19:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: ambi@samba.org, buildroot@buildroot.org
References: <afc126a1-3afc-44e8-710c-69e9be5dd1ed@mind.be>
 <20220425081626.80691-1-ambi@samba.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425081626.80691-1-ambi@samba.org>
Subject: Re: [Buildroot] [PATCH 1/2] package/openjdk-bin: add support for
 host architecture aarch64
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
Cc: Tudor Holton <buildroot@tudorholton.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/04/2022 10:16, ambi@samba.org wrote:
> From: Christian Ambach <ambi@samba.org>
> 
> Signed-off-by: Christian Ambach <ambi@samba.org>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/openjdk-bin/openjdk-bin.hash |  2 ++
>   package/openjdk-bin/openjdk-bin.mk   | 10 +++++++++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
> index 62691ed6f0..4d3942125f 100644
> --- a/package/openjdk-bin/openjdk-bin.hash
> +++ b/package/openjdk-bin/openjdk-bin.hash
> @@ -1,8 +1,10 @@
>   # https://github.com/adoptium/temurin17-binaries/releases
>   sha256  288f34e3ba8a4838605636485d0365ce23e57d5f2f68997ac4c2e4c01967cd48  OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz
> +sha256  302caf29f73481b2b914ba2b89705036010c65eb9bc8d7712b27d6e9bedf6200  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.2_8.tar.gz
>   
>   # From https://github.com/adoptium/temurin11-binaries/releases
>   sha256  43fb84f8063ad9bf6b6d694a67b8f64c8827552b920ec5ce794dfe5602edffe7  OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz
> +sha256  79572f5172c6a040591d34632f98a20ed148702bbce2f57649e8ac01c0d2e3db  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.14.1_1.tar.gz
>   
>   # Locally calculated
>   sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
> diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
> index 3d1ebd7429..5cb6e3ba6a 100644
> --- a/package/openjdk-bin/openjdk-bin.mk
> +++ b/package/openjdk-bin/openjdk-bin.mk
> @@ -11,8 +11,16 @@ else
>   HOST_OPENJDK_BIN_VERSION_MAJOR = 11
>   HOST_OPENJDK_BIN_VERSION_MINOR = 0.14.1_1
>   endif
> +
> +ifeq ($(HOSTARCH),x86_64)
> +HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = x64
> +endif
> +ifeq ($(HOSTARCH),aarch64)
> +HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = aarch64
> +endif
> +
>   HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
> -HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
> +HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
>   HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
>   
>   HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
