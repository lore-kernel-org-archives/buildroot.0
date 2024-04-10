Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F0ACD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 19:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D5DC416FE;
	Wed, 10 Apr 2024 19:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxOuQj-H687c; Wed, 10 Apr 2024 19:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A68B4172A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A68B4172A;
	Wed, 10 Apr 2024 19:42:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4E611BF59A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B258A820FB
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5xFpcjLZnyZ for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 19:42:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BEE2820F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BEE2820F0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BEE2820F0
 for <buildroot@busybox.net>; Wed, 10 Apr 2024 19:42:41 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41634598125so33492335e9.3
 for <buildroot@busybox.net>; Wed, 10 Apr 2024 12:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712778160; x=1713382960;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VSKeQJMqYkKL0lBBQRBiDOiDubdHaWorI0SftI7mUso=;
 b=t7Lm+j03/qqqnbcZXxQ2gU6oIPQiIxOj+drWWJ9lLNbWHMrudbHvQUou+kHXAcuwRl
 FwBNZBx9fgW3AHxcmsZBp8YuBANfSFSOhlllpkivk5tI9Xq6uAkFvcoC1wnLII4BaRX6
 s6LCJYNvTYYt9f/b8IPAxNZat4V41UptEEOrJuB9FP4Ni8Apei99YgqIHd/Zc2QisYKj
 GjzqnykfMMQxE3H8P8g1kJG8giBJ97sFn6Cxv1+Gv91ra/gZ60Ilvd0ts/1pp4OU0Cu9
 3wAGak+LTIAwUUsFV+5s7AJ7XkyoXKpiiU4CSe1udrzIoiFWfJY82uUa5zXM8WIBJNBH
 XxvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtTGWaiKVGQ5VSYX1U3Rngb5gljYMwx9j5/FQeYkt+IqU+uxNP4BDzMRMnjua6+c3JH8l+imHLub/cLVoYNSXPVccvX9A=
X-Gm-Message-State: AOJu0Yy3NIvYgfs4eXVtw1fzvV6rYCIiFl3nijC71RMA4lOfLfix6N3Q
 kqCWm0qj8Dp26oJ6HL8XxbC8W7DvYtUz5eu16/TpaJLfdnLKWwoPPcZBxNf0N83HzDo0/IhJw6Y
 H
X-Google-Smtp-Source: AGHT+IFwSrH9QtdkVe7zOnvZbPqcgNbXGY2J2c1Dp4hD+TqUrBapKdjpa8qAEn5s/TYVpXFXMe9Blg==
X-Received: by 2002:a05:600c:4f4d:b0:414:7e73:1f8c with SMTP id
 m13-20020a05600c4f4d00b004147e731f8cmr2409895wmq.37.1712778159727; 
 Wed, 10 Apr 2024 12:42:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b00416b64fa212sm3194813wmo.34.2024.04.10.12.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 12:42:39 -0700 (PDT)
Message-ID: <3aa27960-ae6b-44a5-b3a0-e9c1376540ad@mind.be>
Date: Wed, 10 Apr 2024 21:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
References: <20240408075234.23006-1-mf@go-sys.de>
Content-Language: en-GB
In-Reply-To: <20240408075234.23006-1-mf@go-sys.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712778160; x=1713382960; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VSKeQJMqYkKL0lBBQRBiDOiDubdHaWorI0SftI7mUso=;
 b=G/r1czEVj/kdMjpQDfKl/qrEH80Uh+7VarVsHBp7pZtHqbJEIuJFDWDoZCK5aesVfG
 j+yxmE/ZM6KPiOnb2N1H58a/Ndc/nT8R3amhGHLOstcuK4ydHNrbQXgPUivQufTHQw+O
 AzXPRrZLuF2tj6pXQX8wWBK+WDCUpzFfSQHGF0zKDx65c+/OiwKiiyuZvUPtyPTdAK0g
 zec5ZCvlRoZZF9+GM1Al//tOpgnbndygEf0A/ooHbn6RIgKNdGBQGpbBhVpqa5eOtEf0
 c6pM4JzLfyJgAswmRBsb62a0phIuXTE1kSXbGAmO1f6vEj2ithqhmJn+xYwgadpxrc1K
 ZruQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G/r1czEV
Subject: Re: [Buildroot] [PATCH] package/sdl2: bump version to 2.30.2
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



On 08/04/2024 09:52, Michael Fischer wrote:
> Signed-off-by: Michael Fischer <mf@go-sys.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sdl2/sdl2.hash | 4 ++--
>   package/sdl2/sdl2.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
> index 2ed3b9cc70..3c4b06cf3e 100644
> --- a/package/sdl2/sdl2.hash
> +++ b/package/sdl2/sdl2.hash
> @@ -1,4 +1,4 @@
> -# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.0.tar.gz.sig
> -sha256  36e2e41557e0fa4a1519315c0f5958a87ccb27e25c51776beb6f1239526447b0  SDL2-2.30.0.tar.gz
> +# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.2.tar.gz.sig
> +sha256  891d66ac8cae51361d3229e3336ebec1c407a8a2a063b61df14f5fdf3ab5ac31  SDL2-2.30.2.tar.gz
>   # Locally calculated
>   sha256  9b9e1764f06701bcf7ce21e942c682d5921ba0900c6fca760321b1c8837a9662  LICENSE.txt
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index 91f6585761..70f765f0ea 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SDL2_VERSION = 2.30.0
> +SDL2_VERSION = 2.30.2
>   SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
>   SDL2_SITE = http://www.libsdl.org/release
>   SDL2_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
