Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993D7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D844424BF;
	Sun, 24 Jul 2022 12:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D844424BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p32dQyPPND5d; Sun, 24 Jul 2022 12:19:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D7942431;
	Sun, 24 Jul 2022 12:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D7942431
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37A1E1BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 120F540B97
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 120F540B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NIA_Q5Vojpsh for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:19:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D1E240186
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D1E240186
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:19:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id a11so5224384wmq.3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sku4LuPzP8zP4lHXnJ7qyAEIXhgT42fjLu7q/1bUWP4=;
 b=by1X+zGKsC1uRr1vvOXGrAwLeFqzzD6KqfqpaYa1dnM0T8TEzq4hSSB9EVBsuJGAee
 4T23d3LDuNtsABtd6JPiPbFNCqi3tcQNPoEnNqjB7ePKpftyZHgToSegWiRFfywznYzl
 YtdY/072c1cDiKVA9fqIfipJ7b8BVlnA9cc2ON6i2O/W1D2K5PsKZsiXWa8QtDfV13RD
 d3/bP2GtSfPNA6Bfp1G11buo5f27eI67w+P+oRr+hQ1A1cem9IL+TQE2UYy/kzVHq+ZJ
 5+cd9by3OnJsRpnj6BAopawxPcVTVFUIQxtihF07rnks7lzIG4YZWBqnFRIaMyx6HdS/
 s8jQ==
X-Gm-Message-State: AJIora9HqJt6Kbv/y58b0KcJdACSI/GT5IECFgRZFcsT8xVGRMvtrLfl
 TxpSMfRSdgzCZATVaTgSNLBdMM7EeFbuAA==
X-Google-Smtp-Source: AGRyM1vc4be1nrTta1pC9nwk04ShEhdcHvubofH217ZVuv9AqoFT4hpr0zWBGtBYEcDPtQtSPHjOVg==
X-Received: by 2002:a1c:241:0:b0:3a3:142d:b65 with SMTP id
 62-20020a1c0241000000b003a3142d0b65mr17916848wmc.171.1658665154982; 
 Sun, 24 Jul 2022 05:19:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 e10-20020adfe7ca000000b0021dbaa4f38dsm11195561wrn.18.2022.07.24.05.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 05:19:14 -0700 (PDT)
Message-ID: <f45889d8-d35e-5091-f84b-84487b2cc852@mind.be>
Date: Sun, 24 Jul 2022 14:19:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220724043450.2255769-1-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724043450.2255769-1-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=sku4LuPzP8zP4lHXnJ7qyAEIXhgT42fjLu7q/1bUWP4=;
 b=SpZGRRHxenLznAo/K0cVRXJIv5GtoZux6pf9hmnWgMMNImQPZ63P2FFHTHbJOH5Agv
 F5vUNhs84bMbxO17lrLF30PKGgNwbVaOHSBxi6Y6d8e5IZBG/II7eglJOSftv60eREf7
 MzWIkL6tI320tk8spH3jiyTBrG/Tu0AGGd9CMdIaWJ8pHrMlCi2KeDTgaFoOqdpReaVU
 BBOns5i9KeMnpU3fgijWYzenBhZKRhGPvZ2HiGei1nHK3fxsNrMbza+Sv5cIg7MN/Nfw
 7s49+50iGcOdim315uIj5P6beNJaWnsv0jEj6vpNmJeftzzXlq7iQdY8e37CrDYIPtih
 HtMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SpZGRRHx
Subject: Re: [Buildroot] [PATCH] package/thermald: bump to 2.5
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



On 24/07/2022 06:34, Ricardo Martincoski wrote:
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> test-pkg config1:
> BR2_PACKAGE_THERMALD=y
> BR2_INIT_SYSTEMD=y
> https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/595287515
> 
> test-pkg config2:
> BR2_PACKAGE_THERMALD=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/595287679
> ---
>   package/thermald/thermald.hash | 2 +-
>   package/thermald/thermald.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
> index 3a7c0f6952..eceff77d37 100644
> --- a/package/thermald/thermald.hash
> +++ b/package/thermald/thermald.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  3e5a5033339c021de41ed4f946dd39e13f79f722fb5bd98d798e83658184c39b  thermald-2.4.8.tar.gz
> +sha256  e6515678ce8ff37978a453e1617a087a40ba3a31809a42c1768b6f816e564cc9  thermald-2.5.tar.gz
>   sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
> diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
> index 4e43277128..38f6b5a00f 100644
> --- a/package/thermald/thermald.mk
> +++ b/package/thermald/thermald.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -THERMALD_VERSION = 2.4.8
> +THERMALD_VERSION = 2.5
>   THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
>   # fetched from Github, with no configure script
>   THERMALD_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
