Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6CEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC648410D0;
	Sat, 12 Mar 2022 16:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wauS_dWfUU8P; Sat, 12 Mar 2022 16:59:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5B07410D4;
	Sat, 12 Mar 2022 16:59:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04ED81BF279
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01A8160E52
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GHyssn_jPAYN for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:59:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 489BC60899
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:59:32 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qt6so25330029ejb.11
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 08:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=X2gYQNiCgiDv3GB39guurabt9Dq/5qH3mg1lX+1NAWQ=;
 b=ZLDLCyFsyOpxckY3bNF3zXrW6zxn5XNHWUrC/KOIX4RxCF+TiiV7RLKrJYzJiBO67S
 /lX9piwcwNiTNuIf6S90LjzsuxLyxpLZHXZ7UJpl0gmSgtME7WKpZMaPPky5JQqCISJq
 TcYbgUuXBcaDmRjZPf9oin1/GfzgsI+2yAP3vbh+/J9h8vg9ow41+JlS8lGFTJKN3LGU
 qOwOt7YALLkInTLK8GZZVw4LNW0Iqu/fszA93zXywvo+ltiHvX0e/7z6skfYxsmz58Bz
 jzjmYO7wNzc83hRiDB0vnUzTUvOp0EvaGi9vMDKp83hr7MqB32j5fbGvNnMXf56oh1vo
 Vv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=X2gYQNiCgiDv3GB39guurabt9Dq/5qH3mg1lX+1NAWQ=;
 b=iefPh8ODjDeHLLdooejoPU8zw9fROvyaDFp9gf8z2Znj5kW2zhoxm/4e8B6BYPJClS
 edApJ7+uLUjn6stCekZwITtc3IaIqQ1fmr0p7FTBxlGZo8DE0DP3Frs1ceO9DSa0L/O9
 xWLdpXGla8riT8buA3InbNoJ2EzPM/gGk+iYaa1yScHpR+esxGO72IZnJv8HsREkze+9
 xpuU6HAxDrp2v6XXSnkmyRKVl7/Sbth1L39AxaeIIDYm4fKcp9LWK/SMLspyf3ETSXUH
 dLqX37cJyKmlIq6Merc+Hw+BPWQQyEVJ5ha+9sHEwl7I7Q/TQIF5+bHduRRBf46F9D2m
 Xjrg==
X-Gm-Message-State: AOAM5317s53043M47bauYrNOHUm2xS4b0V7JfXTWim4OIg+NQKl1RtOB
 qbuh2pBA+Vxjv6Q2uIIouvBwX+SinF0zZQ==
X-Google-Smtp-Source: ABdhPJx7Jjqi1rKPheiMNNi8kn7NR+F4Qw8RQlnpXsqZXxUYP/vUHoYwQ8x/EW3WN91vYHGKfYlR8w==
X-Received: by 2002:a17:906:53c3:b0:6cf:742d:84de with SMTP id
 p3-20020a17090653c300b006cf742d84demr12533896ejo.576.1647104370497; 
 Sat, 12 Mar 2022 08:59:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a1709063e4700b006da6357b1c0sm4512178eji.196.2022.03.12.08.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 08:59:30 -0800 (PST)
Message-ID: <94f4ba32-a06a-671e-1bb5-a59a8b5587c6@mind.be>
Date: Sat, 12 Mar 2022 17:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220218190403.475643-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220218190403.475643-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-zattoo: bump
 version to 19.7.11-Matrix
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



On 18/02/2022 20:04, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
>   package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
> index ac4960df92..0b88d5c747 100644
> --- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
> +++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  8cc02c4627b5108e39bb7b6a6f56f7ba5debbb1adf982c4f23395944aa7d2c8e  kodi-pvr-zattoo-19.7.10-Matrix.tar.gz
> +sha256  07d96b1b0c3b464c0bf02279fa8cab9ccdf675344129f3a970b14bafce225fb4  kodi-pvr-zattoo-19.7.11-Matrix.tar.gz
>   sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
> index 7a3b230e8b..95c5de0925 100644
> --- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
> +++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_PVR_ZATTOO_VERSION = 19.7.10-Matrix
> +KODI_PVR_ZATTOO_VERSION = 19.7.11-Matrix
>   KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
>   KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
>   KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
