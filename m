Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C647C02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 21:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C033F417E3;
	Wed, 12 Feb 2025 21:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amaeeDQaZrei; Wed, 12 Feb 2025 21:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81FBE417EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81FBE417EA;
	Wed, 12 Feb 2025 21:24:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DDED31C9
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 21:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF7FC403F5
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 21:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRZ7C_GdFjB8 for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 21:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8DAC3403CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DAC3403CA
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DAC3403CA
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 21:24:47 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-220ca204d04so1929185ad.0
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:24:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739395487; x=1740000287;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qzimFIFNZhkFcHcMNH5hlVwYbzPSi9oOqmi7feMVQuw=;
 b=qm6ovGoGq3wgVt0Jc/s57/xMuyBmvn/6NJHtv2tEBm7gYZF8Q9LJWiNkqE3UvLMiK+
 Qr9IOpx0L83Vr1IPTc5jJn5LB9xw6o8qSPNB6YpRgbx/UxtDSMIJpSQp0ghjMJubT1QG
 wKsaR4yuVi9OhaQPcCA9mXpb9HbeFTrWkFGGe4mpRErpfpgihXb9B8TUYb+TO7S44GmM
 7XvCAuGqdS8K0vYl18oN5ZFK21+VjOBn+cBAacYN8gCT1N6GH5/fx4rBl9/e6pewhHqf
 zD9ZhecmibUCsVxBK/IXTkMuAErcA5qSWEBLQRBrDq0hYIFPPj4aGWLGLNmoUVnGeusk
 a9ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO6KeVWgBLZC+cH3xoooVLbqK555cUe1xha0d1ACzwV/uHGY7wu+QIpGLCIl0+B78cjV+7K+xH5w8=@buildroot.org
X-Gm-Message-State: AOJu0YzCsHFMTwpCFBfkA95gCd6kLY3G2lT2Mg7nM0yyzqsrxk/gPcgx
 KEYpTMnmSKDaIZaVkLB0X5XDOAehIsFbj5GaZi3CYHda7TT9AuKWo+wC3vMwW+c=
X-Gm-Gg: ASbGncuhNxIR8jMGPy/Yaj7vsq592tIhGFHibFgECk1zZXh+RuU55/A71h7iiE2eb5C
 BivrElf00uxTmZ8QwsUZHwHMf5J1A8Hb//AZlh7tiP7PO9BMx6kr0iYcTDO9zFNWEyhPkFna6Xw
 8rLEXPQnnNor1MJ3KFZBbS1i6DBGbiJhWA6k1DaPW2YL1YXwaBGLDr0Ct+UhoYJT77g8dmSY55A
 0xumlk2ZNfQ2VWNAWntj+abUmJd+OqUhIxbDHEMAC2auHpDzbWxrh8lkX/0yC0u5DPYMn304hWB
 qiVXVnlzAHx/LckJeBP8JZlA7UrpAw==
X-Google-Smtp-Source: AGHT+IESXBnVw5Ul8JseeEWiRll49lnqefGYWPnc+Kvibq2nLOJVh5lo9Nr08hMdMm67smO/IBkrew==
X-Received: by 2002:a05:6a00:348c:b0:728:9d19:d2ea with SMTP id
 d2e1a72fcca58-7322c39d1c2mr7952807b3a.13.1739395486879; 
 Wed, 12 Feb 2025 13:24:46 -0800 (PST)
Received: from flame.local ([192.145.118.235])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7308d31fe8dsm6105438b3a.169.2025.02.12.13.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 13:24:46 -0800 (PST)
To: Julien Olivain <ju.o@free.fr>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org,  "Yann E . MORIN" <yann.morin.1998@free.fr>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <96b69abb843dc7292777c64f6787f134@free.fr> (Julien Olivain's
 message of "Mon, 10 Feb 2025 20:33:55 +0100")
References: <20250207231203.3952765-1-dario.binacchi@amarulasolutions.com>
 <96b69abb843dc7292777c64f6787f134@free.fr>
Date: Wed, 12 Feb 2025 13:24:32 -0800
Message-ID: <m234giua9b.fsf@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1739395487; x=1740000287; darn=buildroot.org;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=qzimFIFNZhkFcHcMNH5hlVwYbzPSi9oOqmi7feMVQuw=;
 b=vhYpmIIVo90d+o4dD6sn8/jaR10XllWdd9eVyBImru5LL21X84BFR8Vvc7mESB0E7P
 bpV4BQ8KWfoMSjBuhK1ANtyWMIqzX5MiU2hKyK1LqzxosHiicy0z1uoOl4VEJhYhrAbi
 ZRjc6LC23pwjO8lL+9IVJs/f+3o6MoZh6KB22yS39hjo60JCfYIeBJpX9Y2Ap3qKkaI1
 QCYjZACRRk0t57M3fj5/Ls/FgJJfkuqEy37v1bW+cJ+3ZLqYa/JaVyBL4tegj+lTDVfg
 ucmeeg8G80uZ9hpPNXXygcA0FCqqE5GBEqYI7jkwkXbr+odpqnfgJvhauNywaoypFhfG
 j9MQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=vhYpmIIV
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: fix binman failure
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi Julien, Dario,

Julien Olivain <ju.o@free.fr> writes:
> I don't think this is the right fix for this issue.
>
> U-Boot Makefile is using the "SCP" variable here:
> https://source.denx.de/u-boot/u-boot/-/blob/v2025.01/Makefile#L1411
>
> According the the "binman" documentation:
> https://source.denx.de/u-boot/u-boot/-/blob/v2025.01/tools/binman/entries.rst#L1727
>
> This SCP is the "System Control Processor firmware blob".
>
> Buildroot exports a SCP variable here:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/package/pkg-download.mk#L18
>
> The value is set here:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/Config.in#L134
>
> BR2_SCP corresponds to the SSH Secure File Copy command:
> https://man.openbsd.org/scp
>
> which has nothing to do with the System Control Processor firmware
> binman is expecting. So this is an unfortunate name clash.
>
> There is few defconfigs using BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS to
> workaround this. See for example:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/configs/orangepi_zero_plus2_defconfig#L45

This worked to fix the issue for me on bananapi m3:

# https://lore.kernel.org/buildroot/96b69abb843dc7292777c64f6787f134@free.fr/
# https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/configs/orangepi_zero_plus2_defconfig#L45
# https://github.com/skiffos/SkiffOS/issues/325
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
