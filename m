Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714C0CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D81F600C6;
	Sun,  7 Apr 2024 14:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Updgz89NflKL; Sun,  7 Apr 2024 14:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44D4F60788
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44D4F60788;
	Sun,  7 Apr 2024 14:44:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C3091BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 363CC60788
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y80FJTV9OQTP for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:44:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98C50600C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98C50600C6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98C50600C6
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:44:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-343c2f5b50fso2318955f8f.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712501068; x=1713105868;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bNtsXg/by4VOcxpINabL43xF8rejbqGjsFXDtpcMoro=;
 b=c64dQwV/1KfeSlANM+1s18R4DsVCIs4v+Xq67flvH6itM1kKiT16l9KT3yIxhQ6wnB
 JZU2OZBYFiyGtlj12w+a121xPR3oDeqemjq/fM5WmMHYO/K/YiLNbwTNs5FKN1EatrfN
 EFFc2l4UdxXUxhgUZ617PN3ZgMm38eIMEsNxqCCshOrJOCLWAy+tFNc6crhHZT8QpXni
 Yd9cA+52dp5fYn2sR8ydg8bF0+Wt8lhWOMvfeu5yHfVqRRT452EwaSDtII6wKZNHhJIc
 lBljlXvoxioDkCUOp79GU1YG0VjLLXjJH8gJpXt2hM6rvtzVqozjzw+VpAZh6uRe8m5B
 aLgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmkst/gv3+jylfJxtQLUjYQSXGDDRIJfZhJUDuWuu6Ot3nJWXaG4820Nnnucx5SZ1jR3oCyk3G6U6k75ecLHBfidIMwjCmng==
X-Gm-Message-State: AOJu0YwBOCveo//1hEy4dJmEPm4ZLHe1z3Jsa9f6bZVA3+CAOx7jhHCm
 FKqzixkxi45gN4QLTEZFApuyZj2IEBU0PDXgxthmoYFZmRaDn0j9Sg8wyP5T8X4BQ+ygqFFz3VA
 q
X-Google-Smtp-Source: AGHT+IG/EFQAAnwIlDS1zRMBkMDblsW4czuToHMni2/59l8bGAnfXwGA0lI0XRwXCVF0B0YyMNc3qg==
X-Received: by 2002:a5d:46c3:0:b0:343:ef1b:9f62 with SMTP id
 g3-20020a5d46c3000000b00343ef1b9f62mr4561976wrs.17.1712501068335; 
 Sun, 07 Apr 2024 07:44:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adff209000000b003432d61d6b7sm6763686wro.51.2024.04.07.07.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 07:44:27 -0700 (PDT)
Message-ID: <39b1e138-856b-4e7e-ac4d-21f1f3dd0020@mind.be>
Date: Sun, 7 Apr 2024 16:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <20240301121757.52642-1-thomas@devoogdt.com>
 <20240301121757.52642-2-thomas@devoogdt.com>
Content-Language: en-GB
In-Reply-To: <20240301121757.52642-2-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712501068; x=1713105868; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bNtsXg/by4VOcxpINabL43xF8rejbqGjsFXDtpcMoro=;
 b=X+TpS/5lx3Zryge7PFZuULcDEovM1f3/hL7W/b/SXf8b9mCvKVd3ILNA+CFcHpWYHh
 7CltICdZGyN5IitIa67zMISFSBnzj99p6Aa5CVs8z1SnBED2FAkGtVqPt1oyNxKT9ueA
 lL6W3/uweqhfWMLkaV0Sd942zTPPVFVkjxAeyMAdtNHOpDfIh/7aFQqrxud8nFs7TQWk
 sOVZyznGthvxxMZtjkNtJXtxVnd3/TXaoyWTlFrC8eS4gg90bmzAMaG3PVYvr8V++Brk
 WmcUczdHl5IE7Wjs7BrZi7h1qBNzZIDNIQfQt+f+Kgb/k85WtsBJZcktR5bXuYt1yv2H
 1B2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=X+TpS/5l
Subject: Re: [Buildroot] [PATCH v2 2/2] package/sdl2: bump to 2.30.0
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
Cc: Michael Fischer <mf@go-sys.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/03/2024 13:17, Thomas Devoogdt wrote:
> Changes:
> https://github.com/libsdl-org/SDL/releases/tag/release-2.30.0
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v2: fix git message, accidentally took the message from a 2023.02.x branch
> ---
>   package/sdl2/sdl2.hash | 4 ++--
>   package/sdl2/sdl2.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
> index 7a28d5efc8..95d2cf959f 100644
> --- a/package/sdl2/sdl2.hash
> +++ b/package/sdl2/sdl2.hash
> @@ -1,4 +1,4 @@
> -# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.28.5.tar.gz.sig
> -sha256  332cb37d0be20cb9541739c61f79bae5a477427d79ae85e352089afdaf6666e4  SDL2-2.28.5.tar.gz
> +# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.0.tar.gz.sig
> +sha256  36e2e41557e0fa4a1519315c0f5958a87ccb27e25c51776beb6f1239526447b0  SDL2-2.30.0.tar.gz
>   # Locally calculated
>   sha256  9928507f684c1965d07f2b6ef4b4723d5efc2f6b4ab731f743a413c51c319927  LICENSE.txt
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index eb5042e3cd..91f6585761 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SDL2_VERSION = 2.28.5
> +SDL2_VERSION = 2.30.0
>   SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
>   SDL2_SITE = http://www.libsdl.org/release
>   SDL2_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
