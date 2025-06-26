Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1342C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88EF0612A8;
	Thu, 26 Jun 2025 19:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYVCJ6VcdIWN; Thu, 26 Jun 2025 19:54:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C51636126D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C51636126D;
	Thu, 26 Jun 2025 19:54:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27382154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD7B61299
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNxOw9oHF55T for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:54:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30CB96126D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30CB96126D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30CB96126D
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4536b8c183cso9305365e9.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967688; x=1751572488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=juFAvWsoY7FMF3SL2xaDWPU84qYfHPfq3j5iiU4CFhc=;
 b=UFAlBeZTgw1EgWNOzweXHjyyq2Vr+VsTdRjOY8n79F2n5bZD6bWKC0wDfdJEAamYwC
 cdXtZZznIoTX9l2/tsNbXmUVSRVVxbQmL5j/kJ7rt6c0A0rRka/aqjand8JDw0pi1pJU
 UKZHF9hb7ytQ7aeblWHhY2ch4Yg0s7VHumBysEpy2vUa4Oh4CQc4gHFiU7u4OzVnYzro
 kJEhyReZo0YU7Ipztrr7KANmRShOF8u+MYs733ltXVK9kIxWgPICPBGuFaidv9qwy6fl
 xCoAkarXqMDei9JmZfdIcn9uIK7OFTFrIZWHvZRMemQWvKHqNsTVifW1QSwAcwIDyhpA
 7xrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU25KVWZ5Udndor4g2T57ITWLGLQHKK07Qasho+rpmOwhUrNmk1Zi0eX42NcSxwhqTPzwbEU+B54kE=@buildroot.org
X-Gm-Message-State: AOJu0YwTD+wA1jLiNQH0Uk9MR0skbEKAbrQEonOC4Q4IRgDGDH/qfb1G
 saSxx42aUn74eewZTgBWmT/ewXJKfzmA0rlwd/xD4Wo6PrvEiI51fQJo5hNpiwtlplk=
X-Gm-Gg: ASbGnctOSy64qi7k01U5K9m7aSYhLB4pYzH3Csr9CaP0R6N+A2wdpfrffHD5eq3NOhY
 d5aDovA37Y6DbGXQ+hplYjLcmFZsxFejIFPbDJsVVjunJy5yqOOinzEst7z4RkQn0bCYlki6N7L
 Zx7zdiQE5zMDL/zw0YuclDP5wkyWcsuaWs7LUq8W+fHsw/M2Y1RK+1DvYgM9yfoAo3onp1ZhVLl
 PXVhGPUCDiPFqcaCceuLY4Zu6gXAXS/qYn+39mZdtbzdZw7A4OSNd7J+ur9nsCpG4JrIAwlKzQe
 gJDy1D+ItzUYyjQKLirHtXULvk9cSVxhlw0W7RJSUuHpIWJpkN7EiinnDWMD+F9W3g0xLz5SBtq
 ZULCMUC7kCExnp2Tm53n3i3I6JQznziEG
X-Google-Smtp-Source: AGHT+IEqA13B2J64NEPUho/8mF7MM0n1PaerxhQP+VcsIJHjWxBUYlZsKTIvjhT9T1P4w0WhArtZwQ==
X-Received: by 2002:a05:600c:3b2a:b0:453:7713:476c with SMTP id
 5b1f17b1804b1-4538f2bfb46mr3367395e9.2.1750967688152; 
 Thu, 26 Jun 2025 12:54:48 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3a68d7sm29308095e9.14.2025.06.26.12.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:54:47 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:54:39 +0200
Message-ID: <20250626195439.15846-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617204533.1089251-1-bernd@kuhls.net>
References: <20250617204533.1089251-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967688; x=1751572488; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=juFAvWsoY7FMF3SL2xaDWPU84qYfHPfq3j5iiU4CFhc=;
 b=f3YXW5IIviwLzakkBMaNAm1XL5ennBNZ9RqSDxbyeNLmitPWlHCdeHBUBRW5AciiKQ
 T6VrT76pYOvEN2FOIF43EFo743hhO0INxcHgOfHzZjMWJQQBcu3hOxa0HADL6IBsMShv
 odTY367CclSTdsfA2AsruLbAYOBgSoHHwdgmQXzW+v2cupXcMTjIA7kCKTc3kB+fUxEa
 XXDZGFi53LeAKPVkRi1PxHWFpH1Sh0vf7eUVhudj723hi8d0XQcnvz0JFOH1l7hwGVM0
 vCFCPG2KimoLc6N9vp+Bf43AAtdbnvo477CEFO7ravnx7yWvburof5V1mVUkNSBRuWwD
 axrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f3YXW5II
Subject: Re: [Buildroot] [PATCH 1/1] package/rapidjson: bump version
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
> This bump includes compatibility with cmake 4.x:
> https://github.com/Tencent/rapidjson/commit/ebd87cb468fb4cb060b37e579718c4a4125416c1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.05.x. Thanks

> ---
>  package/rapidjson/rapidjson.hash | 2 +-
>  package/rapidjson/rapidjson.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rapidjson/rapidjson.hash b/package/rapidjson/rapidjson.hash
> index ca5befdefc..c0a9b78716 100644
> --- a/package/rapidjson/rapidjson.hash
> +++ b/package/rapidjson/rapidjson.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  39f96f17b40f7201042c9b45d6444cb7eae1b7adfb7455412a86f6140450d32d  rapidjson-ab1842a2dae061284c0a62dca1cc6d5e7e37e346.tar.gz
> +sha256  2d2601a82d2d3b7e143a3c8d43ef616671391034bc46891a9816b79cf2d3e7a8  rapidjson-24b5e7a8b27f42fa16b96fc70aade9106cf7102f.tar.gz
>  sha256  a140e5d46fe734a1c78f1a3c3ef207871dd75648be71fdda8e309b23ab8b1f32  license.txt
> diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
> index 3091edeab9..fcd6393b64 100644
> --- a/package/rapidjson/rapidjson.mk
> +++ b/package/rapidjson/rapidjson.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RAPIDJSON_VERSION = ab1842a2dae061284c0a62dca1cc6d5e7e37e346
> +RAPIDJSON_VERSION = 24b5e7a8b27f42fa16b96fc70aade9106cf7102f
>  RAPIDJSON_SITE = $(call github,Tencent,rapidjson,$(RAPIDJSON_VERSION))
>  RAPIDJSON_LICENSE = MIT
>  RAPIDJSON_LICENSE_FILES = license.txt
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
