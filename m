Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F316C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF4664088C;
	Sat,  5 Feb 2022 22:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0OZUW9Nvncr; Sat,  5 Feb 2022 22:51:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B3B440888;
	Sat,  5 Feb 2022 22:51:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC6391BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8D666079D
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eee0VvCJWV4X for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:51:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D15AF60706
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:50:59 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id y3so9829148ejf.2
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 14:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=m7UURuV6o06/g0b/hVOEuBROpzE6NEPWolH2uoBMGYo=;
 b=LUQYvhzALfp2qPhgvovjoJq0UJAiYsiU6NYDc1d+TH9TZ8UF8O7KSP962Ltc8qsXxX
 7DwbhCzAZv7m4Qsx+x9DHp3Rwt8KeWSEFOOEbm0iwu8Dkx7bkVSY85RP163KdG0wsg53
 md1LNDtWs13uFwxbgI6U7hQibuFzT1BOSKQRQGa47AOCgpThDjldNprjfnBedsqSsWCG
 WLnEki+EVJxSKGhBxxteC9+EPcjubMl6IJZF02OH9djS/rx3NnDXXpKhlrlykayH1Jnb
 4bVfn6Rqy35+aDc2u9a7Wfm7ja2jMCmgMY1zenV7IGGyNxQKGLCLx2m/oOtHAkHaZskT
 nw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m7UURuV6o06/g0b/hVOEuBROpzE6NEPWolH2uoBMGYo=;
 b=G//8DKoi67zHrc2BFcQpM6jNbWQEDyRaB6Ggvp4bo3IaZCqixbBnsvQH1KtFCohSO1
 g4gVI0fzYQm4ZB2uU2sTDw6FcTZPtrwZD6joyrcWpK+000aMxtTdbFsj7rb8yDl2AJ3Y
 mtGYfdUS9NhLmi3Dzbr9YY4Br2i70KmmpWxTuBcHD3mtZoIBhDNtTfzGHMlrtNHJBL4F
 mlDjRSgSPpNWU4bI7a02MLZ3KK8jB/kJPxK+qdMoMigsnF/7nPfPNuRz52tKAfJjJRFs
 iyIOqOgQ0vL1gbfwkc2X6WIPPmFGL3gIZos3i6KReUjS9/uxpmNXhry5ZGw0Nzfj0pKT
 N+3Q==
X-Gm-Message-State: AOAM533zCG9o0jTKenJhtmMCn6YXWfKCr+A+SqihJVd/yrKGQtgMDt1b
 aXWnLMGc2yhrpmyiCNbG7lgQBQ==
X-Google-Smtp-Source: ABdhPJyd0Ukj/t1NPktXcpwKyMatFix+GhMWk+CcqCXCjLfYyM2e4Cq5VOMq6Gtd/UY5Ts0D/og0Aw==
X-Received: by 2002:a17:907:c0d:: with SMTP id
 ga13mr4501212ejc.576.1644101458053; 
 Sat, 05 Feb 2022 14:50:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id la1sm884404ejb.22.2022.02.05.14.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:50:57 -0800 (PST)
Message-ID: <d2313129-7b5d-c177-bc5b-eff665a0ea66@mind.be>
Date: Sat, 5 Feb 2022 23:50:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220124223806.2720164-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220124223806.2720164-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libnpupnp: bump to version 4.2.1
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



On 24/01/2022 23:38, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Just in time for 2022.02 :-)

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libnpupnp/libnpupnp.hash | 4 ++--
>   package/libnpupnp/libnpupnp.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
> index 9ebfd13379..276bf93c99 100644
> --- a/package/libnpupnp/libnpupnp.hash
> +++ b/package/libnpupnp/libnpupnp.hash
> @@ -1,5 +1,5 @@
> -# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.1.5.tar.gz.sha256
> -sha256  566f5895376a14aa87997de7ce3454595646613d1d0af34d05c31f6d9fe884a9  libnpupnp-4.1.5.tar.gz
> +# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.2.1.tar.gz.sha256
> +sha256  e0e59eb2d3d024e827050428e0e7eb228355912a38c85eb30bfeb2f0926eca4c  libnpupnp-4.2.1.tar.gz
>   
>   # Hash for license file:
>   sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
> diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
> index 03ac01c915..09bfa34b87 100644
> --- a/package/libnpupnp/libnpupnp.mk
> +++ b/package/libnpupnp/libnpupnp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNPUPNP_VERSION = 4.1.5
> +LIBNPUPNP_VERSION = 4.2.1
>   LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
>   LIBNPUPNP_LICENSE = BSD-3-Clause
>   LIBNPUPNP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
