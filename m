Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F0CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDFBB820A3;
	Sun,  5 Nov 2023 18:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDFBB820A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aFlAExYRmroT; Sun,  5 Nov 2023 18:06:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 219028209C;
	Sun,  5 Nov 2023 18:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 219028209C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50BDB1BF4D6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28F97408E6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28F97408E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H4qKrmEHRQOY for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:06:44 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAB23400D6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAB23400D6
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507bd64814fso5006321e87.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 10:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699207602; x=1699812402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N5gm5+3XKdd4fkjTIvqrcpDulcWMVqN/iO1Ed3Rc1ug=;
 b=vDiR8717x8bRUIFAPDgU4bH7rRbzFAmrms1ej4FQdp5VQvPBdBHrpdQu29nzIy2/s9
 8DU2Si3Y3FE1DZQbT9HsTiRnmt4qsZhHOhdI+c+K3uwDIgkhFWncz3QQYpIh00CreX95
 5KIWtqFmGXIZRkXi2pSS6iYv3z/c/4VYOdn8LxRLuPWd9F6BLG2xBaz5KaVzn1tn4xZa
 zEzo1+U6UKTgU1vWqnkZvpC1lAjwTgMn0gRKYDWzNYcUfkWIJX04JLOfCm8n6xlWGh0f
 j9kxY8jDfPPTcnOQP/IMMQZjZK/0EZa/8l78Jcxb8Pi0mIoT1B46PVnGku9elzR0dsVE
 N5zw==
X-Gm-Message-State: AOJu0YzRIs7WcDQjjVB9b83dTI2Z5iBOCcIP+ctyF9LcQm00HZB+zwf2
 JzFGhN2Mjz23Xgy/nnMx1mEPRw==
X-Google-Smtp-Source: AGHT+IGhrK+isaFuNytKk9jogishfzSHelb6+2Awktb+FJT0livuJWMGs1xVT6HA610ecuCg6BbClA==
X-Received: by 2002:a19:910a:0:b0:500:9214:b308 with SMTP id
 t10-20020a19910a000000b005009214b308mr18712261lfd.65.1699207601798; 
 Sun, 05 Nov 2023 10:06:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a50d54b000000b0054351b5a768sm3523132edj.82.2023.11.05.10.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 10:06:41 -0800 (PST)
Message-ID: <026d4c48-0e78-4410-b824-5967ea54fd0a@mind.be>
Date: Sun, 5 Nov 2023 19:06:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
 <20231009151729.2223963-7-arbab@linux.ibm.com>
In-Reply-To: <20231009151729.2223963-7-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699207602; x=1699812402; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N5gm5+3XKdd4fkjTIvqrcpDulcWMVqN/iO1Ed3Rc1ug=;
 b=E5uPbc8ukWg/fxvwjWr1XYoZ9Nq+MzIB7Q/lSQqp6D/88p67jxxEmxsGPgBeoLamU4
 +LC1AR7mIxIyQVKcomGuhX8wL6k4XzRipjcXCrQV1u+fuGDSkPwWCH9onnN4UK/+0Asu
 0L/c49nxx1MXUhed/fuhEci9ByEc1N2DrZ61Y1sWOBNSPS7LqO5Na20htKRBsL3L3MEy
 6HL+ome/I31RufPXdIV+wQIYxHQQ1n2eVebMcjJn++C7UzVU88yTNDXIMGrEEZ1zyvTt
 yOKNAHwqqjB8mBg14JhRmzZEy10fEQL6ZrFWeX4RxqWCfVAJFNwdSRkJMMJ6Rcrrliha
 PjYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E5uPbc8u
Subject: Re: [Buildroot] [PATCH v3 6/8] package/petitboot: run petitboot UI
 on consoles
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
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/10/2023 17:17, Reza Arbab wrote:
> Display the petitboot UI instead of a login prompt, allowing the
> configuration of custom tty(s) as we do for the login prompt.
> 
> petitboot already depends on udev, so let's use it instead of rcS to
> launch pb-console. This has the advantage of easily wildcarding the list
> of ttys ("hvc*") and enables hotplug devices ("ttyUSB0").

  Indeed, hotplug devices is a good reason to use udev!

> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
>   package/petitboot/Config.in    |  8 ++++++++
>   package/petitboot/pb-console   | 36 ++++++++++++++++++++++++++++++++++
>   package/petitboot/petitboot.mk | 10 ++++++++++
>   system/Config.in               |  2 +-
>   4 files changed, 55 insertions(+), 1 deletion(-)
>   create mode 100644 package/petitboot/pb-console
> 
> diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
> index 4981c165bf76..5f1d91e77ecb 100644
> --- a/package/petitboot/Config.in
> +++ b/package/petitboot/Config.in
> @@ -28,3 +28,11 @@ comment "petitboot needs a uClibc or glibc toolchain w/ wchar, dynamic library,
>   		!BR2_TOOLCHAIN_HAS_THREADS || \
>   		!(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) || \
>   		!BR2_PACKAGE_HAS_UDEV
> +
> +config BR2_PACKAGE_PETITBOOT_GETTY_PORT
> +	string "TTY port(s)"
> +	default "console"
> +	depends on BR2_PACKAGE_PETITBOOT
> +	help
> +	  Specify a space-separated list of ports to run the petitboot UI on.

  This line was too long, as reported by check-package.

> +	  Wildcards are allowed. Example: "hvc* ttys0 ttyS*"

[snip]
> diff --git a/system/Config.in b/system/Config.in
> index 24798dc06803..9587dd9ce4db 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -375,7 +375,7 @@ config BR2_SYSTEM_BIN_SH
>   
>   menuconfig BR2_TARGET_GENERIC_GETTY
>   	bool "Run a getty (login prompt) after boot"
> -	default y
> +	default y if !BR2_PACKAGE_PETITBOOT

  Since the getty would conflict, I wonder if it shouldn't be a `depends on` 
instead of just a default. On the other hand, you could imagine a getty on one 
port and a pb-console on another port, so I guess it's OK.

  Regards,
  Arnout

>   
>   if BR2_TARGET_GENERIC_GETTY
>   config BR2_TARGET_GENERIC_GETTY_PORT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
