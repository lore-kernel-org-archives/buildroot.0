Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECA6C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3955404BF;
	Thu,  5 May 2022 20:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZoE-GCksxaD; Thu,  5 May 2022 20:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0465B4049E;
	Thu,  5 May 2022 20:09:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FC1D1BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C67B60ABA
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0UPGuxZq9GVg for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:09:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02E9460A84
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:09:56 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id g6so10773437ejw.1
 for <buildroot@buildroot.org>; Thu, 05 May 2022 13:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H4Ls6wAbwCArPR+94Zv8aKEBTSmxKNqnOev500CheDk=;
 b=Vtiq84Mq7jiAv4aHI0t7siCpw8N//MTmCIDhk2MIyqEU7Sh1Rf0oz08TR1vZpFnQsJ
 m17n347dcRrJBijdxdAVtwjWY/EeTKKalfNv0jWPC1NuZAgQTPQr/feMcojF2Pb3OEey
 icVjd/6098nAmAijFUYEj/3C0KH+EPyaNb69JANbuY+0SOUarpuVBCL97T79adfsxDXh
 x6DyrCodyp4u+SOnhIBvvXW3btRaf1dEeIKW/A/W6iQqI4FepaaDXWJjUWoycHt5gMAf
 D9KDGxOm1WNtkt5vdCJ6rlknNAxU6Ds9Qf67zdGtz8pSHINY7dYdgUMZHCMgm7wJoLJh
 JkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H4Ls6wAbwCArPR+94Zv8aKEBTSmxKNqnOev500CheDk=;
 b=NX6GehO9qCB2DBUCneSoWiOelTsn/+mflA/i5/PJjUx6EaAhlBMpn9+8eGEToGW63b
 OE8fcAIHT3hYPeqhHvF7jP9K/kqq/1HiXT+lDXOkuR+wTyig88+CxIb/yMbAgWpRBH05
 7MR7WOkohM0/f5UTjQLn+EJ2o4KkzYaqWkeQXE/jt8w0NE1vb08N2hvt+1zGoM7lifI+
 WnUggObN1PbUuAQQH5JddgWE2Wp+khC0bet7vuPzLP2oHuj3aeatdhmEhXU9oAdWiuvf
 gwv44RP5iN9e43eaRCGv487fmfkj/1jTIbORl2gGBOs+ng6nTrBi756VYMP7lbB8qa40
 +2hA==
X-Gm-Message-State: AOAM530ATS1FUUfM4HmofKWvOydGjyuuUIs9LzH3xzFbWdjjciZHpiiW
 aJg882vmSSzRblLE52cFqi7Rf7vBIK6+DA==
X-Google-Smtp-Source: ABdhPJzU2AmGtCggOMCF1OH3DeUekCd4F1CKUtBLnZZmGjTaXK4ENVuub3rSYRErIrwXC6cMlyFP/w==
X-Received: by 2002:a17:907:7ea7:b0:6f4:7a72:da92 with SMTP id
 qb39-20020a1709077ea700b006f47a72da92mr16591861ejc.348.1651781395178; 
 Thu, 05 May 2022 13:09:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a50f10c000000b0042617ba63c4sm1288556edl.78.2022.05.05.13.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 13:09:54 -0700 (PDT)
Message-ID: <30a4e37d-21f7-139d-b001-691e07c4312c@mind.be>
Date: Thu, 5 May 2022 22:09:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220505120233.494216-1-foss+buildroot@0leil.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220505120233.494216-1-foss+buildroot@0leil.net>
Subject: Re: [Buildroot] [PATCH] package/libcamera: bump to latest master
 commit 8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/05/2022 14:02, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> This brings in numerous improvements in ipu3 and rpi IPAs as well as
> adding support for Black Level Correction, auto gain and auto white
> balance algorithms to rkisp IPA. A handful of new camera sensors are
> also supported.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcamera/libcamera.hash | 2 +-
>   package/libcamera/libcamera.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index 8d5abf0e62..181bb1349a 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  3624c71ba492c602c5335aab3dc87798193f7596c6cc75f7cfb847165f180930  libcamera-1966b9a58436fab51f8270aad6a228b935e4fac4-br1.tar.gz
> +sha256  9aa62d41470238ac8c3bb847601d1a803ac7a270d3b5e87f722e9c93c867d18d  libcamera-8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98-br1.tar.gz
>   
>   # license files
>   sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 9cbb1910dc..77381ab3ca 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = 1966b9a58436fab51f8270aad6a228b935e4fac4
> +LIBCAMERA_VERSION = 8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98
>   LIBCAMERA_SITE_METHOD = git
>   LIBCAMERA_DEPENDENCIES = \
>   	host-openssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
