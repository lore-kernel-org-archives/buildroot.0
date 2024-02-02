Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9110BC4828F
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 20:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04921404C2;
	Fri,  2 Feb 2024 20:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04921404C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8rlOfA3KbQyK; Fri,  2 Feb 2024 20:30:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 160AE400D7;
	Fri,  2 Feb 2024 20:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 160AE400D7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 466441BF57F
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 20:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1590F400D7
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 20:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1590F400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HcT2F10jSV3c for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 20:29:57 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9BE1400CF
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 20:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9BE1400CF
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a370328e8b8so144885466b.3
 for <buildroot@buildroot.org>; Fri, 02 Feb 2024 12:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706905795; x=1707510595;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wIgTfhDvpz5z1UYTZDQDmXHNWgTFsdYRP1w0cPLEysA=;
 b=gkPzDNYXNUoDnMsLoAv+6J7ec4seuEss7QUrmOsGep/u8r7V26fa63bYV563yK5Lgi
 HnzCUwSuHNWkn5B1g3zXTHjQv9a++4eV0gAC1ztLWTCfSL3ricCR11q56kZqZ0b2Bh6q
 VaWJcWFyZkF8ppOgCK9jtxAzJZKWyioYd7YKt9Fr43kCVXbNFpQKD+VrHy8XVGA4SmL5
 DZyuOSL3aSH8Zr6hUvwdjbJUc06Szy0rHmGVQD4Cbwynx7Ymi53a0FoZLiN3m18vEZA0
 x/rSOtNKgKtrsu64/lZlfAdDZ3NOyFqIqEbWvASNbqepzo11S4YGbMmqQEXx0xtMhUzv
 0mwg==
X-Gm-Message-State: AOJu0YxEDb964sa7jSjZETULV/ujxLMHQcBjfdJ7N5CSDoFd71vgovNZ
 oH72RzlM4XHH/Z2RIvr0mYTGeq66wlaHVgGNjpQFa05CCizV9SzdZURl+/Qt
X-Google-Smtp-Source: AGHT+IG70J8bxE0NBxx6hazCDFpYttxXmqiRpiBIQKBvhYfqXND5kUeuo+owjSzjh0/2xMcVQJe5dw==
X-Received: by 2002:a17:906:6d87:b0:a36:5d54:64b1 with SMTP id
 h7-20020a1709066d8700b00a365d5464b1mr2204536ejt.73.1706905794807; 
 Fri, 02 Feb 2024 12:29:54 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWWmv+U8gC12pCdGJ482VaqKZzqpKSBQTWfhK7TWzV86ewKgsJXtLs04nNnhNppk5dfAU3A8TdWfIWL1D0CMLgi++zEM8KogQ==
Received: from ?IPV6:2a00:10:7f17:f01:4503:8b32:1ee1:49d4?
 ([2a00:10:7f17:f01:4503:8b32:1ee1:49d4])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a17090616c800b00a36c60180aesm1226747ejd.60.2024.02.02.12.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 12:29:54 -0800 (PST)
Message-ID: <d000051f-9013-41e0-b72f-68cbd0652854@gmail.com>
Date: Fri, 2 Feb 2024 21:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stefan Ott <stefan@ott.net>, buildroot@buildroot.org
References: <20240202020258.600562-1-stefan@ott.net>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20240202020258.600562-1-stefan@ott.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706905795; x=1707510595; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wIgTfhDvpz5z1UYTZDQDmXHNWgTFsdYRP1w0cPLEysA=;
 b=YfyG15hpUx3yK6fKWNFDuc9jIRF/FYHEOqSX4w5WdikgLAvJ+JSr7FRhsu6f33PV7N
 xfOb5fZVcjy8Lt3OSon8aF0eTPNPf7rIu2DdZ8f2TFhRUZhMYAV+IkDpRaTs8fzhWY4P
 Eal029ow0tijoxXY55tfmg8espz6V6g6a00sa7f4ksXzzMWi4CDdazGC4d0XticvXC4U
 D0000osVsa9UTSM+Eo1Eyp7ivRAdu2FPWc+37NOYBScaG5HeqE86PFP2anm/FWiUZ8CW
 h+dU85OipKblUyL9WppKxu5noY5lv1ifKaryq70/tXuTtiYmW5AOSLRXTZl0X50J1YS7
 n9AQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YfyG15hp
Subject: Re: [Buildroot] [PATCH v3] package/sway: make systemd optional
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

Hello Stefan,

Thanks for the new iteration!

On 2/2/24 03:02, Stefan Ott wrote:

[SNIP]

>   
> +comment "swaybar tray needs systemd"
> +	depends on !BR2_PACKAGE_SYSTEMD
> +
>   endif # BR2_PACKAGE_SWAY_SWAYBAR
>   
>   config BR2_PACKAGE_SWAY_SWAYNAG
> @@ -54,9 +57,8 @@ config BR2_PACKAGE_SWAY_SWAYNAG
>   
>   endif # BR2_PACKAGE_SWAY
>   

I like it more if the tray feature is enabled automatically if systemd 
is present, without making it an option.

Thanks,
Raphael Pavlidis


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
