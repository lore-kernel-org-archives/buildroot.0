Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D91AC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D8C360633;
	Sun, 28 Apr 2024 18:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ddkh5BpOyhz6; Sun, 28 Apr 2024 18:22:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 267F460635
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 267F460635;
	Sun, 28 Apr 2024 18:22:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1551BF344
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0729481FB9
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05TfCNA5bIYK for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:22:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E0A681FB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E0A681FB1
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E0A681FB1
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:22:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41b7a26326eso19418745e9.3
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714328565; x=1714933365;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yzy7bJihwI3akWclDmotigXAEg0Sz0MW8ia2vSp+NK4=;
 b=a8qP++eRk+w7ZUhsp7WjgmAgyCJI4JJ6CThFDxjAirvrWwC0QUujOXHLtK4sjVc7Gy
 kn8ZjtxKnbamcsrcFvaZLzTOV5oWQEuI9IGCiGvY6bVRbS/bMj5Qr5DSvF4Nos5rVvoE
 TjWCnd+APnU0/REClysc1uFVR7WUIEsKoscxx48J7LSJdx1sasssv2lE8ryT/vjX6qTi
 PVPolerObWIuWzInzPOBmdtUj+aiUxTBqCHkgvAmO4S2lcKq7EyxRMInX0PPIiv1tguP
 Vu5WlGMI++OiykeQ/mt+L82186Oe+/n9QWpeAqFzogP0c8tmQOd1kgjHmDb9q6X5eKJH
 HGhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFWl9Jl/VNSA9dTqJ5oE77R2yBfX7Jyp0W6QRRWT5bEXwYnHuTdUIA5dgzTE96bFF4QpAV98S8fE7T98URkDGmFYgDkfr6ZQ==
X-Gm-Message-State: AOJu0Yw9WiCBDutdBXkwzVkjpZpyyV2j5/geTzIWwI/3MSa/0xmR5VR+
 zM70L4ex3D2rlC5lHdXNqU2VPlWrYeHie0F+Hu33rOr1C/n+CfHKChed35WmeTI=
X-Google-Smtp-Source: AGHT+IFEob59ml0SBicvYOWXf7ua97LuYju3AcvOq+J8ku81Sq/TygeEfJbIl7ihp1/ULaAHtAnnZg==
X-Received: by 2002:a05:600c:3b8c:b0:41b:143b:5c2d with SMTP id
 n12-20020a05600c3b8c00b0041b143b5c2dmr5808826wms.28.1714328561943; 
 Sun, 28 Apr 2024 11:22:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ay24-20020a05600c1e1800b0041bf29ab003sm4959199wmb.30.2024.04.28.11.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 11:22:41 -0700 (PDT)
Message-ID: <67640c08-51b4-4abc-972a-98aca27e68c2@mind.be>
Date: Sun, 28 Apr 2024 20:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lukasz Tekieli <tekieli.lukasz@gmail.com>, buildroot@buildroot.org
References: <20240414181408.535765-1-tekieli.lukasz@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240414181408.535765-1-tekieli.lukasz@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714328565; x=1714933365; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yzy7bJihwI3akWclDmotigXAEg0Sz0MW8ia2vSp+NK4=;
 b=GNNB/Gv7RBNMLH1mE8kGBezmJGR4HAIlk7rfX3Kbt8Del33VMEKt/sX41reoZ9+h5t
 yU5SlDyFQ1TrrngOU4kLSK3nWX0oCpycCkBVrs7rTgP/4iCwI7nMI9cA/VW5J1ogsfJJ
 51XH+EtIMKwQ0rtKqpEb/PzKqWGOxQjBi1zrjnevpvf90vn5s0CSHO3kZeWdugsR0yB9
 XDKjnMBL+tt5yZw8LTUC6aqjDVK9Qelh01izVa8tJpGOmYrV9VF2D+yQQJHk7kok36CJ
 SEibQRrny+1DUr8I/qn0qRz10aJI1VwFS1Kz8A2mNCs4CqlLohtRWVseqwUaHTL/Iyhs
 ITqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GNNB/Gv7
Subject: Re: [Buildroot] [PATCH 1/1] configs/visionfive2: update u-boot to
 2024.04
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/04/2024 20:14, Lukasz Tekieli wrote:
> Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>

  Applied to master, thanks.

  Same remark about custom hash file.

  In the future, please send patches related to the same board in a series 
rather than one-by-one.

  Regards,
  Arnout

> ---
>   configs/visionfive2_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
> index c8576a35a7..8b65e4e93d 100644
> --- a/configs/visionfive2_defconfig
> +++ b/configs/visionfive2_defconfig
> @@ -24,7 +24,7 @@ BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES="FW_TEXT_START=0x40000000 FW_OPTIONS=0"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_visionfive2"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
