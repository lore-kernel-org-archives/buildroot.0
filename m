Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D22BD65C7C
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 17:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C0ED40363;
	Wed, 17 Dec 2025 17:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54JQJ-eF4PUY; Wed, 17 Dec 2025 17:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A245408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765991599;
	bh=37BZx/CWwCEXuwDu2ijuPSY2D/eqSqc2IsMvm7kQoPQ=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AxR9kjv1yZe9CGhoInnB+qPLkY7crV5b7TRfiFIiVE2euWqt2Vy8Hw7C4mUOMUOfO
	 43dxsiutn1PgSK4F7NeWkqMPjpAqDyjSN3z+edac3V1ixfcGI1pqnfhVMJ0aILsSAH
	 DohhFBHBuJWZGD0jEAnvz/j+M/j/y0/+M1rewdBUNF6p9qejqTK0pv7i9T+ZpyDS/F
	 iVFn/yrkrSt3Vu15aydphTj5bln9oXjJRVOKgqVwgDTqKd948QfJ+9Z8tsgvoIfox4
	 2OKse8gka9g+tH94PlF7//1u0bbH+n//BRei/dGVFkI2Zf7R57s3I91uoOGjSJg7xV
	 NWkNJ77ZlwTKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A245408FF;
	Wed, 17 Dec 2025 17:13:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 878A32C3
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 17:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DE3A40AC4
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 17:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5ZXq5JaEXVj for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 17:13:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6038A4067C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6038A4067C
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6038A4067C
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 17:13:17 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so1170537766b.3
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 09:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765991595; x=1766596395;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bUBeXkGQ4+JPOJM6Alfc46dg4HQWDbni+C0wBGj9Ik8=;
 b=i2IEKny4HcOhv6LYT5UJDBpMYQMHdqEyYu7vhb0YC1bLrv9vHke4VZfpHs/6VYtjAh
 IF6PlHyqxgValeuDbspMtK7KvrQJH9KYuj9n1mgZI5v+02p12XPdjSyX425mbKRRyzQb
 PpKot6RszT13/ikhrdy+unkuKexU8ucsDG0PxiH+q04RXisB/B6Qj4vDB/jRYJvqfk2p
 PE8AlBy/RCKKWyyMnywWiZkREZoC8PJaa7pEtT0qd2paTAFryBfFkCM5a9A7+1kHMKio
 2n9+knc1lHHR9wbSvm81v5mB9PwWtFByCuIIlXHYwaMzcYeu0lXShQzTEM8ToNXLtiOd
 8GNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWguwy2qPMDHIqFLuZO/qOeeJtCS4u1E2k6eT/EGhQag2RMjJLaXMDx0o46YgVQ5jFkjIemQFFFTEo=@buildroot.org
X-Gm-Message-State: AOJu0YynDl8jDd2fAKElNhfcHxgtdWynIOIGnJOy6v0A5KiYNLbzdEaN
 CokbDOSQck16PKA+upHlPgvZBq/qC6nmKK4cUYqdF75fLJnp9/WEmeHl
X-Gm-Gg: AY/fxX7xaL59HBZaisjD4n86vTUyaTm9d6om6Abo3DzgAvCMrjAvpDW326HsjuVGnal
 oo0U3Z7osCeGheh3A34a+Yayw4JxvqMloedIc/GXWyuJqhxqhcMgG6E1Sjz/RVSO4BzWjJD//YA
 S21+lWz8zEXghJPjyx2ZCA3k7UAQCddgK2A5uXttj3g43cKFDN2dgl4Ec7rweZB3ZnZAxZfkNry
 2a4GH8WFKa6rcmggmkj9KqljgmUozd2uMT5j1DBHsyJo/46OSzGP8YG5PlZt3lMhLsBp5FdkW7o
 1STFq/5qzuT8nnguJcw0QX6PUIan18OdRSuhlYVk3eER+auptQeYl39yuM8M4iv5w0B6I7iYMg9
 l2/vNc7jyn7jEPhuUPNtLMlzjwxyTgnU9I8WWxIwF6+0CKXP0DVLR7IvtnS51hDPGwhmM4ISuUD
 xQRRNB5l7KwEIIsh452597yDSPx7Rodt4dsqKWH78ne8NEIXi5kAlkpDY0dOjLJwGSltMDb1XJw
 yFhaYPFiSlJImNApHxgdNAZTvA=
X-Google-Smtp-Source: AGHT+IGsspqzjEGSsf9oxZQ/jSs2bleoviyPSis7pX/gAqpXvgVYxE7kbC+pzpv1lrG0UvCTjUdphg==
X-Received: by 2002:a17:907:9496:b0:b7a:1bde:a01b with SMTP id
 a640c23a62f3a-b7d23d13da0mr1603852866b.63.1765991595030; 
 Wed, 17 Dec 2025 09:13:15 -0800 (PST)
Received: from [192.168.0.110]
 (ipservice-092-208-175-047.092.208.pools.vodafone-ip.de. [92.208.175.47])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b80208c9cddsm5089066b.2.2025.12.17.09.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 09:13:14 -0800 (PST)
Message-ID: <6be746d8-7249-41e2-acb5-15a7138e89f9@gmail.com>
Date: Wed, 17 Dec 2025 18:13:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20251215225837.1257574-1-thomas.petazzoni@bootlin.com>
 <20251215225837.1257574-2-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20251215225837.1257574-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765991595; x=1766596395; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bUBeXkGQ4+JPOJM6Alfc46dg4HQWDbni+C0wBGj9Ik8=;
 b=Y+UIJ0PGkUsMCYlaQ5+8xs00I1QohQJvaEk+NxVKn8bDciB1+KgJkQ1XRer3Iucb/4
 Aw5ned6mbRa2n0T8N6M88aiCFefU/lQnFuPNDrWimYcpeBQHs5CHNu7qN6s1zVwW2iyH
 3FYt2cb1wXZUBKB8NyERuqvNM/dGLR8LwNcVRG+DMaZkJiyPkZ6Hhxn+g/oNYxmI0utx
 uzxtCszsuMWHijRGGw0cY0hhJeFbIb7O/vDNfTT2L2Zj0sZLUm0kF2VAwzPB0arLeUn1
 aezF+Y2X84urg1VZxVXhLZeygLiXWIuVUL/ouSI45z7yX+OXnsPUOU3pfveo1ud9nOBQ
 GL0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y+UIJ0PG
Subject: Re: [Buildroot] [PATCH 2/2] package/sway: properly propagate
 wlroots dependencies
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,
I do not know you to respond correctly, but I reviewed it and tested it, 
and it looks good to me.

On 12/15/25 23:58, Thomas Petazzoni wrote:
> Commit 00fb3a57cbaedb8df43f75f0e891423c1ef7d8c6 added a wlroots ->
> libgbm dependency, but forgot to propagate it to package/sway.
> 
> Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   package/sway/Config.in | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sway/Config.in b/package/sway/Config.in
> index 1f4b497af3..1e4c8bfd3e 100644
> --- a/package/sway/Config.in
> +++ b/package/sway/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_SWAY
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
>   	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
>   	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
> +	depends on BR2_PACKAGE_HAS_LIBGBM # wlroots
>   	depends on BR2_PACKAGE_HAS_UDEV # wlroots
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, pango
>   	depends on BR2_USE_WCHAR # pango
> @@ -53,11 +54,12 @@ config BR2_PACKAGE_SWAY_SWAYNAG
>   
>   endif # BR2_PACKAGE_SWAY
>   
> -comment "sway needs systemd, udev, EGL and OpenGL ES support"
> +comment "sway needs systemd, udev, EGL, OpenGL ES and GBM support"
>   	depends on !BR2_PACKAGE_SYSTEMD || \
>   		!BR2_PACKAGE_HAS_UDEV || \
>   		!BR2_PACKAGE_HAS_LIBEGL || \
> -		!BR2_PACKAGE_HAS_LIBGLES
> +		!BR2_PACKAGE_HAS_LIBGLES || \
> +		!BR2_PACKAGE_HAS_LIBGBM
>   
>   comment "sway needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
>   	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
