Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466B3CD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 128E240523;
	Sun,  7 Apr 2024 19:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuEpGu5KUr3c; Sun,  7 Apr 2024 19:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A191409A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A191409A6;
	Sun,  7 Apr 2024 19:48:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F31411BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED8A3409A6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zh8UXbKJXhLb for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:48:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89B5D409B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89B5D409B5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89B5D409B5
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:48:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4164c9debf6so4775125e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712519313; x=1713124113;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jmpUxBz8/zB0f5laHSbY+yhDY+YQJIibEinmeqiNIUE=;
 b=AkthhfAzwZAPuJ4zWIAqp6Q7Xu5FQw73a0x8vza5vBjk9DqWHyJibrbc8SBVSOtWUt
 P7WgImBtVdZVmj75NRsE6BUNmG7zTsN3eI1zcrynlKVyqKNTkQsac2k1yxGbmpqfP3nF
 6zo5DkcIrWuWdU7+rl8YuV6uQimhc7Dwt9DqxEWSQk0i2tmM8mHXhVFeTffq6npM7pTm
 WgGxC3yiR2OWKqKMiaqwfRurbC08Wktmwqk/P/lHIkOmsU44PIMlVIbPtQ6JCjLr90n/
 MwXF+Ym1/WVsVShBmOuQiFOe/XT0k6OX/KJLIuxzDn8T0NW0hqFpsKfJ6HPbuJDselob
 NZQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqfUs3W4W/smfiSbLw75gmKIKzipNDvpJpOB4WWuxxv/l3xibj3T9ylt7XwlCicrXwdC9iK966OGo44j/ce6OKeaG7e0gZLw==
X-Gm-Message-State: AOJu0Yzcn0WyO7CjMVVO080b4A874GE2gFA35h9epXWnjr+zy/ygzY0c
 7xPk4qFcSUNjdGIPF2y7cVdyH3gvRsG78nscJtCiPj4xsmsMQmMDX4yqrGOpxq+7KX6gvG3sUQn
 2
X-Google-Smtp-Source: AGHT+IGJFTEW6o3A1QRUQwu5DQqzTjIQdjBn1/FmtHxKYoW1e4w5ZLHNfHK/KlV7k/zJfuTpQE12yw==
X-Received: by 2002:a05:600c:a4a:b0:416:442a:6d23 with SMTP id
 c10-20020a05600c0a4a00b00416442a6d23mr2174812wmq.8.1712519313529; 
 Sun, 07 Apr 2024 12:48:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b00414807ef8dfsm10822846wmb.5.2024.04.07.12.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:48:33 -0700 (PDT)
Message-ID: <5a5de180-9e99-449d-8562-c412a369c766@mind.be>
Date: Sun, 7 Apr 2024 21:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407191448.3267678-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407191448.3267678-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712519313; x=1713124113; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jmpUxBz8/zB0f5laHSbY+yhDY+YQJIibEinmeqiNIUE=;
 b=UddbaEmJ3iJosd9AurQBzouVNf1bRNtdNcZzKpiWKgUz65oNkMMb8nLFKvSSnnaG5O
 t/920Psh8jd4mZ9z9E51FVt/Jfz6OXS+/Kli5JZ99uo+C2DYYpkRSDDqY0r2GiFEU5C9
 /lEuNvOd1zr4LYU1+C4I2A3qBQBo7XIiuKTFmcts58wqM2gsJQoLzcFpAwYADN6M/84k
 c2Mr6q/OtKiFdAO7hOBdg5EVcf2wRLVhjzHYT+7VrYlf7Cm7m6YjmhZAYp/KZx2oRbSh
 sESCtC1Snh8q1fo+t9nuD9GvaRBJ1Xg0if0Amqi0xvHpK7mIeClJxHbalFyehRVY+JeJ
 rWaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UddbaEmJ
Subject: Re: [Buildroot] [PATCH 1/1] package/links: bump to version 2.29
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 21:14, Fabrice Fontaine wrote:
> http://links.twibright.com/download/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/links/links.hash | 2 +-
>   package/links/links.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/links/links.hash b/package/links/links.hash
> index 83b27aeb9d..36a4b90592 100644
> --- a/package/links/links.hash
> +++ b/package/links/links.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  f05b3577f25dbe63e491c424f0ecb31f7bfadce9b2bc2f111dfed049c004c9cb  links-2.26.tar.bz2
> +sha256  22aa96c0b38e1a6f8f7ed9d7a4167a47fc37246097759ef6059ecf8f9ead7998  links-2.29.tar.bz2
>   sha256  92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
> diff --git a/package/links/links.mk b/package/links/links.mk
> index a861fd657a..30a26b2740 100644
> --- a/package/links/links.mk
> +++ b/package/links/links.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LINKS_VERSION = 2.26
> +LINKS_VERSION = 2.29
>   LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
>   LINKS_SITE = http://links.twibright.com/download
>   LINKS_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
