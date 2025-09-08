Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E9CCAC588
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5B2B4266E;
	Mon,  8 Sep 2025 10:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kjb0HP4Io1WH; Mon,  8 Sep 2025 10:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8A304266D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8A304266D;
	Mon,  8 Sep 2025 10:55:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A42741D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A1D7425F1
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwXYnT10V4aS for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:55:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A23C142487
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A23C142487
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A23C142487
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:47 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45de287cc11so5469515e9.1
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328946; x=1757933746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xCRkHTBtLVPSSMZTDvr0jmLdQizOpMcGRMriIf7O9X8=;
 b=amw6YKp5+f8T0rVNw1fWOs+PV64hwYJf+0Msn4NM5fL21ZhaYGsIF8MQf+EiRB7vyy
 MJBKRp+QpXq9Dmg4KpItKS4n9cZ7r+n0+xTlTqFLiCB3Aa8E81M4YwHxQ0H+FeenO/lb
 3GGYo5eTvKs6vXT03recy/Uw5Otmw97KoBbgP4HbeHiEhcbbS2vETDnmNDfw3u1/T8rZ
 Vk8kscoRyFcW6UsJKeutRu6dLNh5OCz8D7PfImBWBLSUpQjxfDa58FyMPplFt0WtDMjF
 5TR9b3PeZHHw/E7yELpzxDbOrAu5tNKrYU+168mKSR1PiVoUX/+R6oGOVAfqvUte5fqY
 uyRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIwqpP0fVlp8KzK1V3UQCGErUD/HzJlDAi+xLVoF72CSlY5qzaww04mwc6gCo3RGW6gVcQKEiMiwk=@buildroot.org
X-Gm-Message-State: AOJu0YwrJJ/6z04ptRt8SrrGu4xxwSM1UXSx/q1DCcAsuLm1NqCtSF+j
 n7EIPRdqdm43KhwH4sLOVbooPDhJ8DmtGeQoG/znWs1+/SlFag47tOH0609n1h9ApXY=
X-Gm-Gg: ASbGncti2nrQ7xFD7ft2KzBE7iYqYVF3TGJALI5vm5yetHnzuw++HcaA1TLKXcDuYwf
 cmGwD8zjKj+rn8UfgAc7CLqfzfBMxAkpiCfwHZom6BQwJOb4NV95yYNO+aNOL+qIgMwl/+csy8d
 Obm6yJS0GNEIgGK7+AJ9ij9XjSrCy3/qcfGesGa/SEa6NF+fjc6x7A6qkmjiDKjHUs2OKs7TxtJ
 qqD8VSqmhc06KpPrraYG8mxt/0j7lHiImAvKxeDY7OjJxdc585XkpJ2pmeywa+GE/a6YZCkICFH
 yFl8nSipiBCTX2EZDnhDXCZywXdbWPMtu3qb4jze4FOEyqbPJdJMpVnuTLj2oiwRdo9xLDPCZ9M
 N42xNrLLds6Lws/PhaV9iXck+Noh7CmnxmdLKODYpt9y8HgpF+bSsstjdqfkSvRrOF05ol5sfuI
 s8q/7crwyEN/m/rtu709dHI/wq
X-Google-Smtp-Source: AGHT+IFSDpI7xpKDF0K65oprc2J6aNnOTpUqMsz5z2uD6O9rhjl73l/aawrIdFkzG7gFxgHOuihGtQ==
X-Received: by 2002:a05:600c:c04b:20b0:45d:e728:ce6 with SMTP id
 5b1f17b1804b1-45de72810b4mr15933795e9.18.1757328945593; 
 Mon, 08 Sep 2025 03:55:45 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e06dbde2d2sm17544469f8f.12.2025.09.08.03.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:55:45 -0700 (PDT)
To: Henri Roosen <henri.roosen@ginzinger.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:55:44 +0200
Message-Id: <20250908105544.681566-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250818135142.1533405-1-henri.roosen@ginzinger.com>
References: <20250818135142.1533405-1-henri.roosen@ginzinger.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328946; x=1757933746; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xCRkHTBtLVPSSMZTDvr0jmLdQizOpMcGRMriIf7O9X8=;
 b=SDWidyuThPLq35V8wzks8xZYVtuB7WwxCWs5wKO+CjZQsY7wBG+/m+KJ5ooO0/Cdv4
 21hR4AoItZAchavm2IAiANFT+mH23bPi6ufo2RGF0jj2c3RqVdNKWZjhzRNL4Uj1fbjs
 NUoqyjafCzymzY8iPKiH/ZdQr2tm0zoVo9FyC5Br2DX3TbMSiyl1eIyxxyuxQpPFyAno
 FXmhHCHhVRZ6Jw4p0SX4tP3jsLld3W189MGtRM5vQbc+yJF02diGDVZlljDi3ly2plzf
 edC9wDkPG6ucpslcGnbceFQrBKQfFfvaI13vLNc22gDR8JmYWZz3UekybN6Ua8ThXVTc
 0Zlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SDWidyuT
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: needs host-cmake >=
 3.20
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since commit-2882cf4ae649 ("package/wpewebkit: security bump to version
> 2.48.3") wpewebkit depends on cmake 3.20.
> Fixes build on current Debian LTS (bullseye) which has only 3.18.4.
> 
> >>> wpewebkit 2.48.3 Configuring
> ...
> CMake Error at CMakeLists.txt:9 (cmake_minimum_required):
>   CMake 3.20 or higher is required.  You are running version 3.18.4
> -- Configuring incomplete, errors occurred!
> make: *** [package/pkg-generic.mk:263: /../buildroot/output/build/wpewebkit-2.48.3/.stamp_configured] Error 1
> 
> Fixes: 2882cf4ae649f7d5e9cee72f84e672328f550845
> Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/wpewebkit/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 969590482c..5cbba43792 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -41,6 +41,7 @@ config BR2_PACKAGE_WPEWEBKIT
>  	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
>  	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
> +	select BR2_HOST_CMAKE_AT_LEAST_3_20
>  	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"
>  	select BR2_PACKAGE_CAIRO_PNG if BR2_ENDIAN = "BIG"
>  	select BR2_PACKAGE_HARFBUZZ
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
