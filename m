Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C0AC77B73
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C08F741E47;
	Sat,  3 Jun 2023 19:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C08F741E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRCgkJWi8jKv; Sat,  3 Jun 2023 19:36:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66A2341E3E;
	Sat,  3 Jun 2023 19:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A2341E3E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2775A1BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A61E84380
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A61E84380
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3iULOse3QZ4g for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:35:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E35B084262
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E35B084262
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:35:57 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51640b9ed95so2485784a12.2
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 12:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685820956; x=1688412956;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pmcZKgoNyzopbNuGjhaXepnm10hbM/Rb1igaUEFa/YM=;
 b=Fp3YysCvLQ0QbT/bo4TaJR+595BhP6jJiS4nsKKXYUAn6tIO2quxzfpI95YUdXbeit
 EKfh9ew8kBSfLosGP7nISjL1eGcQeKI6YYDMcUVHr8lGmBRs391C7HmXlo55eHTK1oNs
 uk8bmCFASY/UlHMoGk9HZSccQbGF9+Rl17jKzshue/+RSv1aoyK3+LRhXW9jBMB2MdJn
 YDM9m84iHGZD+WhSPar+1Zhmbzqa6/mFs1vJGEoEZMKerfrl6OsyyRHbZwzz2SeLdFmD
 sFf65Jiiz15aY8TrhPptj+DNl6YBsWzVxKh2/TWah6xIDJBKejbRaWCZZfiHx0jZlbyW
 hlVg==
X-Gm-Message-State: AC+VfDyQjp4AZtN82n+p7ZEH1ceA/yMjCYFRXol/QgG1CTC6SPGG3YTg
 dEyskZ9TX86Ebdl3zjCD8RBAe02kNTQ4Q+EYDeA=
X-Google-Smtp-Source: ACHHUZ7TsvjCaHr4PGXGq2j7Bos78CPIzOmXjd5LZX+0lNA1NL+tscVITrvN0p1NyfUvWoqlbXTxbg==
X-Received: by 2002:a05:6402:219:b0:516:4107:7847 with SMTP id
 t25-20020a056402021900b0051641077847mr3042406edv.3.1685820955706; 
 Sat, 03 Jun 2023 12:35:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bo28-20020a0564020b3c00b00514b1d2759bsm2041606edb.42.2023.06.03.12.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 12:35:55 -0700 (PDT)
Message-ID: <38ce8462-fb56-db71-8561-939cb96cc572@mind.be>
Date: Sat, 3 Jun 2023 21:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org,
 Peter Korsgaard <peter@korsgaard.com>
References: <20230523160358.1270868-1-bernd.kuhls@t-online.de>
In-Reply-To: <20230523160358.1270868-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1685820956; x=1688412956;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pmcZKgoNyzopbNuGjhaXepnm10hbM/Rb1igaUEFa/YM=;
 b=BLy1+94U4wCzI8xIKMsYJnPq2Pkrc5rgCd62bariw6mDgoNXH2tiuyGFHIpc0TgaYr
 oiLnicFYmhtI8t7CpJoKJnMfZRSr1zK5Ro1xeJ8e4eiiQn0koF6y/Q5Y9GwMacfxv0vO
 Vij4dH1OkQxzne+Pqd6t9sVhFvjCHTWedVJGad/cFXrGUEB/ulWbkb2KXFJ0cjbJ20PT
 YvOFT3OMdGhw8OYRBRTyxueLXFBFSGsWFaOKFQbOI7iHZ6Cd/ILmTtNERXtaxFyUlfw6
 ey8C8Ce9SCB+JtTO9CZjzAqfpAqca9dHZrGRX8+VC61r5VlKZ6fOjn5kgjEYi1o2cFMU
 VVIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BLy1+94U
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: fix build error with
 the i915 Gallium driver
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/05/2023 18:03, Bernd Kuhls wrote:
> The error was introduced by mesa3d commit
> https://cgit.freedesktop.org/mesa/mesa/commit/?id=dfd20f002f388be3f168938bc1f25e91bb08bf98
> which was first introduced in mesa3d 23.0.0, added with buildroot commit
> 89944e2c459d45dd4271c49e35dd4a13dfd850a4
> 
> Fixes:
> http://autobuild.buildroot.net/results/9c1/9c1407ca5be221dbb3ee03d2a95ada65bb7eb36b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Peter, this one is *NOT* for 2023.02.

> ---
>   ...5-Gallium-driver-includes-Intel-sour.patch | 46 +++++++++++++++++++
>   1 file changed, 46 insertions(+)
>   create mode 100644 package/mesa3d/0005-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch

  In parallel with this one, Romain introduced a patch 0005 already, so I 
renamed it to 0006.

> 
> diff --git a/package/mesa3d/0005-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch b/package/mesa3d/0005-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch
> new file mode 100644
> index 0000000000..1f57702eb6
> --- /dev/null
> +++ b/package/mesa3d/0005-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch
> @@ -0,0 +1,46 @@
> +From cd861b7f38e448822ce765aee61304d1e0a3a8b5 Mon Sep 17 00:00:00 2001
> +From: James Knight <james.d.knight@live.com>
> +Date: Thu, 13 Apr 2023 16:38:51 -0400
> +Subject: meson: ensure i915 Gallium driver includes Intel sources
> +
> +Ensure builds flag the use of Intel sources when the i915 Gallium driver
> +is configured (`-Dgallium-drivers=i915`). Otherwise, a build may fail if
> +other Intel-based configuration options are not enabled:
> +
> +    ./src/gallium/winsys/i915/drm/meson.build:21:0: ERROR: Unknown variable "libintel_common".
> +
> +Signed-off-by: James Knight <james.d.knight@live.com>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22490>
> +
> +Upstream: https://cgit.freedesktop.org/mesa/mesa/commit/?id=cd861b7f38e448822ce765aee61304d1e0a3a8b5

  mesa3d documentation now points to the gitlab instance instead of cgit, so I 
used that here as well. I believe the intention is to drop the cgit instance at 
some point.

  Regards,
  Arnout

> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + meson.build | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +(limited to 'meson.build')
> +
> +diff --git a/meson.build b/meson.build
> +index 23d2d965b37..a3e3c5478a8 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -245,7 +245,14 @@ with_microsoft_vk = _vulkan_drivers.contains('microsoft-experimental')
> + with_any_vk = _vulkan_drivers.length() != 0
> +
> + with_any_broadcom = with_gallium_vc4 or with_gallium_v3d or with_broadcom_vk
> +-with_any_intel = with_intel_vk or with_intel_hasvk or with_gallium_iris or with_gallium_crocus or with_intel_tools
> ++with_any_intel = [
> ++  with_gallium_crocus,
> ++  with_gallium_i915,
> ++  with_gallium_iris,
> ++  with_intel_hasvk,
> ++  with_intel_tools,
> ++  with_intel_vk,
> ++].contains(true)
> +
> + if with_swrast_vk and not with_gallium_softpipe
> +   error('swrast vulkan requires gallium swrast')
> +--
> +cgit v1.2.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
