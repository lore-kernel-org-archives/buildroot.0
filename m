Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6686EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01DC84243B;
	Sun, 24 Jul 2022 12:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01DC84243B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F55AAk8k2-OH; Sun, 24 Jul 2022 12:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B98F84174C;
	Sun, 24 Jul 2022 12:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B98F84174C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1B31BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55CF040025
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55CF040025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lAt4tJ6Ke2Qy for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:29:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7478140186
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7478140186
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:29:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 w8-20020a05600c014800b003a32e89bc4eso4839455wmm.5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QgaB0pHkJldId28H9YJYJ3wmRhaHtZV3iACy4h6Wn3M=;
 b=0RQEV8geg1Wveb1/AQPJ/oK1knSeAe/Kg0VB4jxozqp0BG269LYbZzOj2ofp7UNdzd
 fYJqK6oFnledYcOBBeBUBWzMYeMupf0YECuCNWHnJclfy28ADBiKiOCZ57vmLjw6V7Jp
 AkssnzZj0w9wmeOCokNmFfUN0LUjiCstcvut43rSTakm+iAiL1Vexe6MxslF0CDvIOjf
 xBL+3FmCsicm3Uc7cSbQ929sbwHgWdv5/eQppNkYH8pyv4WHLzBQyI0DfmYokizGCwwW
 bINc4PFJWIMOU6u8Jlm7cgcShJJzCjtQhXcsFwVqSU2AsBO18GUhEPKkojoqSIc6gdVD
 8iyA==
X-Gm-Message-State: AJIora+zjch0Ufe9NZfQLeApwufynKTbMWIlXVzrZdl7oS9AXYSMHVfc
 /G89FOyXDXZps0fJqoNvcYfBPQ==
X-Google-Smtp-Source: AGRyM1su9cFF632tYS/O1DD93na7f3lY1l7BgmXPSkYrMwVP7JjjSepk2+YQlQ4qk+dix/nUE2Gu4g==
X-Received: by 2002:a1c:f718:0:b0:3a3:2416:634d with SMTP id
 v24-20020a1cf718000000b003a32416634dmr5595678wmh.83.1658665788500; 
 Sun, 24 Jul 2022 05:29:48 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a7bc8d2000000b003a327b98c0asm10668006wml.22.2022.07.24.05.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 05:29:48 -0700 (PDT)
Message-ID: <7fc15a6b-3718-90c4-9d87-848bc0fbc3cb@mind.be>
Date: Sun, 24 Jul 2022 14:29:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220724092934.6041-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724092934.6041-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QgaB0pHkJldId28H9YJYJ3wmRhaHtZV3iACy4h6Wn3M=;
 b=Szh/bMlPVhwozqX8OoSvYbSFZmJT6FtUPXM07eUvH1z9vcFQgV/8QrY+P8Et8vBvsR
 dDeyq+DkvUikEwJG3gJaGidxfAItzMNFdB/KH6bXhz2BYUzr+dlVZ2xi8cgYlT3Hqo6j
 635hEszD9Y/oK8g/KmmsQ0s7z4hErsBLHIP+6YaEcNS5BWP7pvioGY/WLcKdj7lAwq57
 v+fxGPHgVQMC3uSp4wi1tg1uzPyq+IDBiM++bIkfy5Igy3dtDWauK9TFMqdYt8fJvp8c
 kV5IS5eG56XSwGN316SHcM04esfoqwbUhzuPUYxGMNZJ+PxT4cbV0Hh8rCs5lSfsfyeZ
 o5xQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Szh/bMlP
Subject: Re: [Buildroot] [PATCH 1/1] package/libiio: drop 'from' in comment
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 11:29, Fabrice Fontaine wrote:
> Drop 'from' in comment of Config.in which was added by commit
> 00deb6a7c11440766767cc07800661e8067df474
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libiio/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libiio/Config.in b/package/libiio/Config.in
> index 98d663e203..21c3a3b439 100644
> --- a/package/libiio/Config.in
> +++ b/package/libiio/Config.in
> @@ -32,7 +32,7 @@ config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
>   config BR2_PACKAGE_LIBIIO_USB_BACKEND
>   	bool "USB backend"
>   	default y
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # from libusb
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
>   	select BR2_PACKAGE_LIBIIO_XML_BACKEND
>   	select BR2_PACKAGE_LIBUSB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
