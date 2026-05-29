Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C8ECD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8192615E3;
	Fri, 29 May 2026 08:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJqXzGycF206; Fri, 29 May 2026 08:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12B4B615CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043445;
	bh=6Sxgsl8eK+ZiU5M4VeXY+g/SRSQIF72FeB/YORSXANA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I1DWNpcOrG1USy9FsmgoVRdXQ5nbGWgyNX7BkiQTV1wW7Tb06o7Yc9QxRMbitkaN0
	 1IauwsdxTJRB7bIISnJ5ycHCR+zkgla8bBVwQB1LUZ3eGfI/6HiYXxJNSR2G4Xq+KD
	 4Jcb0cFMcNM+HWzu1nkBR2cPSXtVuqCSC0fy4QvNTBd3d4jymTtXKuQagFMAu57Rak
	 5h1vGqFQxnL2D807VJx0oSusJaff2PoxBwv4mvQmas7vQSLdL6qCikdVzqoY9hM2ub
	 zq4vl8j24zaBR+ZYuNAU4LyUXCbAxeHHTeCJhoWg1fSGuu1pi8KsO0swq6H741HJG1
	 r3Ise5kFnAT7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12B4B615CF;
	Fri, 29 May 2026 08:30:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EFE128E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E0DD84326
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjFuSwzX1Epc for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E372A84325
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E372A84325
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E372A84325
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:31 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49050ff7cbdso62085285e9.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043430; x=1780648230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=02jZNRx1xmOyx/YwxflQ7xjLVxFzyqLgu2op02f26pE=;
 b=cXM6yI5/yBksAAye+rXfKJU4J7IEOU9tNLaYZM0/fWo4vDrMBx/MLTWcXuijHN8jNr
 wi+HTFwKcXzsEi1j97hbfsUnXZFb3AlVWl+4rfOlHHfHRHzDWNAexDigBwN3sDBThzbf
 W4G56Rtes9I3z7X4fT2JzVCn8/Zd3huk+dfjFTGviQSaUonuKOlcIaOKBehMv7xw2S1k
 lAJjrY1p9eeFi+Z4BzKB0r7cX/Q/v77QlfnmnU6GuLpfrlruZnoXh3BV3KukDMv3DYbL
 /RZGwuMGeM0m4pVP3kBRYSWtHURl6Kx07z62A86aqP9fBk1ci+JDpj5TBMuCCqe4CGLl
 yqFA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ggYgJQT4lA/MSyuATcBbW7TrVWaOoQ7aiNtjjNdC7e/iaYFZ/bK+eDD3BKV53bn3ftlNsZmpYtio=@buildroot.org
X-Gm-Message-State: AOJu0YwFNuVUm0vExwVm0RynBDjGBIm1T8ARMLBD7oJC9XDILwkqmBdo
 fp9imnYyky+sH5ENx/m0BzYSxekB8RbsqmAQ/MtwtCir2WchsLp6wnapLyqiQZ9Y0lw=
X-Gm-Gg: Acq92OEFmcwWp0HCpmJH5KUoknmkr/BQvt1MbnGqKycIDeFzLaXeVctqT3eeig51I4+
 VmUeX5aWAj2o5TL1sJcCjgDqCc54BfSQ3419oKBCx2U+5zwK4Hxb4ULW7tywiVUy4bCeh+xN/OF
 OCWQ9K9HUJmLki3UDll8i2t7Nv09n4m7kBf2J5y7fJQA8p5su8Qk0uSsAFXZ0iwmIct+G2yatgH
 d2JPJmGBQA1VS+WyMi8Ivr8n8bJkaWwiMJ3+xZu/JeUBn6gbCvFQ7+7OUkuuUVH7rJazS9z8k5u
 Nqjc799aJMJEPtsLJbVypWJHWIgVXySFAv8mFUTV8xVi1pa64ak5OBoEBX4CDdiPs1v6PwnF+zE
 Z/1I9qNnVj4KtSMGg/IfKpEX46GHJdeI4jgbFLmC/E2K27YNeaJih358X8v1E4/p5APVx/IwERv
 y6Fsuzkd+xoIfXACIHm9fxbRt6IIr2fSVslpDR3kfEmYqTq+IGZRJaAVwIZw==
X-Received: by 2002:a05:600c:348f:b0:490:9df1:f0d4 with SMTP id
 5b1f17b1804b1-4909df1f2b1mr21663145e9.10.1780043429890; 
 Fri, 29 May 2026 01:30:29 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c103baesm9927725e9.17.2026.05.29.01.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:29 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:28 +0200
Message-ID: <20260529083028.59777-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517203806.375813-2-ju.o@free.fr>
References: <20260517203806.375813-2-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043430; x=1780648230; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=02jZNRx1xmOyx/YwxflQ7xjLVxFzyqLgu2op02f26pE=;
 b=UviWeg91hpkx0uAT9WFymGx50U0MeufaEACYAMQLGhV7voMahh+cpDyrJ7DeVBNQ4o
 euorRmB6k3SNQ7ipE3+qNiSn8IrCoctq7ir22eyEt53luMJ94IXUhsL4FTIOsXvNK4KT
 C2KLFBbbLa9rThgHI0DugiSAQxz+Mpwpc23LwBjMLGyY7XxoOLW6KWf6X0vkQHRw4wRT
 zxzFXPDihWwHtn6QYRpRd7QI9EYZWt5n2ig3IiXLu6HykmyrETFQOEvh+cD1sT903nhZ
 YiVj4B/drwwSGZs8+6AobDQ4C/afjnueieVAKiGBkptbg5a9ToUCzECzCZBDc/7DTtIn
 6iHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UviWeg91
Subject: Re: [Buildroot] [PATCH next 2/2] package/tzdata: bump to 2026b
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
> For release notes, see:
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/tzdata/tzdata.hash | 4 ++--
>  package/tzdata/tzdata.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
> index fcf7bffd24..4d4d410ce1 100644
> --- a/package/tzdata/tzdata.hash
> +++ b/package/tzdata/tzdata.hash
> @@ -1,4 +1,4 @@
> -# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
> -sha512  1e33f7212fd0ae2ad3c16e68f0c1fc7a6ad26a126b8406c379a5768d79604c6a816054bd0fe3a63228d70cd6a1fc2b1bae2a9f8014e102d3727eb9d21affa1f1  tzdata2025c.tar.gz
> +# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
> +sha512  a44882258c0a7fbe587e8b73d6bb3cd5be7d4788976ea742adbbf176eb3b33e5bd7d1714b2fffe2972b1a42e7335eac39ed0bd63e819bb421550f8cae1df4f2f  tzdata2026b.tar.gz
>  # Locally computed:
>  sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> index a7b6dd8f65..71f8fc3ac1 100644
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TZDATA_VERSION = 2025c
> +TZDATA_VERSION = 2026b
>  TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
>  TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
>  TZDATA_SELINUX_MODULES = tzdata
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
