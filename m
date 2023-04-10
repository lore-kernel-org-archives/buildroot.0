Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9556C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 13:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49893414DE;
	Mon, 10 Apr 2023 13:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49893414DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4T0vX_KFlNM; Mon, 10 Apr 2023 13:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33003414E5;
	Mon, 10 Apr 2023 13:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33003414E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC821C3B1B
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 13:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13AD981EA2
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 13:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13AD981EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mriivlRCcIX6 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 13:47:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7326C81EA0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7326C81EA0
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 13:47:36 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ud9so12390062ejc.7
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 06:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681134454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IQ4rJw2X2MynHsZrIlqovqHeNtc9TMDQjM6aj7jfHzg=;
 b=AtiqsIwpdZsy6XhlfNTJwNKAXe6p8tSvuTPk636/BWbmLcJ2toXExd5RDgxUoIvm41
 vbuyNf/DeqDYUOPlCiQGuZiD407VTF/fGuNRhB/wQEQzyq7VBa8D2BkzEdELLQK3L4XT
 KALFnAhfm3rH6p66yPnGRdvkh8oQ8v0Bog6rlNzWgwRKpk1Fx/p2C4xTEFok9M81bCkG
 GOsypSgR5TolGV/XTvwbk6/R3LQL1KFGqUf5B8oDKEkPSNbIJTFr0Pmi/kUX/IxqQGpG
 G9kf2UYEdU+odoKungegt+g8WLg1VAx17Aka5ztvuk6kMe37QU4CYDVKpEzDx+AieTwu
 mwLA==
X-Gm-Message-State: AAQBX9eNqElH5NApYQxiqif6vyQNXPcwDvT1QT3Ux2Fg+VexUIlhMEc0
 Yaz8VPeSlvP/8cNxdja9KprP0Rri6GdCRjG+hs4=
X-Google-Smtp-Source: AKy350at1TU+M6Xbdg8RmeCHFRJs9QdMnISIRc+uOEpy2spZMXNUI7Dwtimry7qmfT3Ul0TEk9OFNg==
X-Received: by 2002:a17:906:c34c:b0:94a:56ec:4ef3 with SMTP id
 ci12-20020a170906c34c00b0094a56ec4ef3mr4948521ejb.48.1681134454508; 
 Mon, 10 Apr 2023 06:47:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 w30-20020a50d79e000000b00504890a0de5sm2795765edi.34.2023.04.10.06.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 06:47:33 -0700 (PDT)
Message-ID: <abf54400-ddca-75f4-7164-d944a355301d@mind.be>
Date: Mon, 10 Apr 2023 15:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Maksim Kiselev <bigunclemax@gmail.com>, buildroot@buildroot.org
References: <20230410084020.1812422-1-bigunclemax@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230410084020.1812422-1-bigunclemax@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681134454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IQ4rJw2X2MynHsZrIlqovqHeNtc9TMDQjM6aj7jfHzg=;
 b=JR5dlbVrAUfCbXs8YEO1wJ4DQKrG5fX7Ws4YYVvHh7mAp/3srs0M5jDoMB3Y6mKxOy
 tojyzCsQC1Hc91FELs31XZKpKKZZHw2iDU8YApQ3EtpC0lZ8FkVI+kaplvkR93w7o+LD
 /iErpZqtBnSM87QvM1IkyWQkyZMYeo+A6cmX51lg/NwDd/I0Pz2NoxBhPqA429rmcSbk
 eOeHu/BFIB0XXSmjNx//Ua8Ky4/G7RpmMTFIlk1VQa8xFiceqG6cmHRb1/qb62rtZrCI
 hwfXw34hUMmIc1vKBtx4Bu6EMJC+V62Bl+Hq4OfE665jQnF/DAFRcLitTV331i4M5dqB
 C85w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JR5dlbVr
Subject: Re: [Buildroot] [PATCH 1/1] sunxi-tools: bump to version
 1.4.2-168-ged3039c
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2023 10:40, Maksim Kiselev wrote:
> This patch bumps version of the sunxi-tools to latest commit on master branch.
> 
> There are no new tags\releases since 2016 so let's use commit hash as version.
> New version brings support for the following SOCs: A63, V5, R528/T113s, V853,
> F1C100s, R329, H616, H6
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>   ...nfo-Access-to-io-memory-via-pointers.patch | 59 -------------------
>   package/sunxi-tools/Config.in                 |  1 +
>   package/sunxi-tools/sunxi-tools.hash          |  2 +-
>   package/sunxi-tools/sunxi-tools.mk            |  4 +-
>   4 files changed, 4 insertions(+), 62 deletions(-)
>   delete mode 100644 package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch
> 
[snip]
> diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
> index 59d1f3b5a0..dab68886b1 100644
> --- a/package/sunxi-tools/sunxi-tools.mk
> +++ b/package/sunxi-tools/sunxi-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SUNXI_TOOLS_VERSION = 1.4.2
> +SUNXI_TOOLS_VERSION = 1.4.2-168-ged3039c

  It's nice to use this more descriptive way of specifying a hash, but we still 
want the full-length hash in there (cfr. how it's done for e.g. glibc).

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

>   SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,v$(SUNXI_TOOLS_VERSION))
>   SUNXI_TOOLS_LICENSE = GPL-2.0+
>   SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
> @@ -26,7 +26,7 @@ SUNXI_TOOLS_FEXC_LINKS += fex2bin bin2fex
>   endif
>   
>   ifeq ($(BR2_PACKAGE_SUNXI_TOOLS_FEL),y)
> -SUNXI_TOOLS_DEPENDENCIES += libusb host-pkgconf
> +SUNXI_TOOLS_DEPENDENCIES += dtc libusb host-pkgconf
>   endif
>   
>   define HOST_SUNXI_TOOLS_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
