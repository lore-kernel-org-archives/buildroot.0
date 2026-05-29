Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B05DCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F24B884372;
	Fri, 29 May 2026 08:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMDGKQjFgoZW; Fri, 29 May 2026 08:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88EFC84369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043447;
	bh=PYeLNMElKO9hCVrjnpJue4advvSVzhRdkPeue8g2yag=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r+d9tsF3uVXU36MZyEGRbHHMSTVp35GuhGmW0HEhDABGTRH7/CnTpA/muqVLY9wJi
	 yTyOHBoB/744TnHUUO3UklFCd5zKN9vhexe6OtvHy+BkD24AlJqqnxl3441o+5eV3M
	 4F5djxHRH+TsdbD56fvWCw94t1Q71+etW3+YNe0I5nbRmSTGh1E0XoBryNTCmBuIEq
	 bZKsiHapwiTpyirsX9eTntlcYEh+sexeRPL+Wcg3UdU3WgAV7Y82x1K9QQw/N6YNAw
	 ZN5gwEkCo1hdBYAemEGeILP6w1ZF9IouSbRkLlU763U8Ys94dIxhi+3zk6w4Jn8Ya0
	 YdRuex3gQqwBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88EFC84369;
	Fri, 29 May 2026 08:30:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F3B428E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 362288432D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UC4VDRrRRQy5 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 345C984327
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 345C984327
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 345C984327
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:34 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-45e8a834cc2so8380051f8f.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043432; x=1780648232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vZAycTirmd8EVxyWYzaR3/atSYZ1KBB0PYXPIpWdLV4=;
 b=amXuPHgedY+BCX1EetizL7t1Oir67cOjVxy738f0GY0hT0FVXdCqEJU8iJjO88s22M
 88+9/vAgus3sdADoGlW78vKNcR7wesDq9yTXjR56D12PSfJAON0mLktOdogjGBE5lhm4
 DfgR9UO+B3SeV3Jt8v5A4b2lF/rCM+puscEqaCT+xHGGyEJhBwNkDDE45rDKeBp6rNvY
 1KR1WpBrFtMFmx1ZpvKZUcU9LsPl1udTceZXsV4it5B7zqGWxOE0bTLqRtJwE5qsyPv4
 Mb0197Ozl9VFHBKFX+GuEorumIOftl8mLdf1bJwdY8QB6ZB7cFJ4FqCVbBmp4axS9BTc
 xN3w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8DAWbM+rw9Kdup67EvdYvRzjirQPc/zOEoHtxmgofEYiR6jzc1O8GWyZKeEwRN/8ewSZAjBKrsQrc=@buildroot.org
X-Gm-Message-State: AOJu0Yzvs3fRmCbM8m92N/b6zS/YiVFbbcZ5TPLu4/RiNhPNzDEAy1R1
 G3K2LJqJujAFA3iA3rHADrzG/U/EF8Xh+DBKF5mXGzyfycW2fpONSiTQYgnYX+t2QhI=
X-Gm-Gg: Acq92OEY7DW4MU97+emRvp17lEqRuxbbWRSZazzncZ6Pbo1HrL6GWsxjfcFT2su7MJk
 VXSNJhAQzyhGoXFVyW3GvjdTuPEvNz+ysUwMp/52y0uQ9AYz/9hJ84HBpnZawK0QwTCuKH9mLNP
 hC8EpK59qJQta2CAy4kv02IR2g3PPAUd57HEil5RorryfJcFD6z2GIwgUoCrxOkrcCoAmgw6/A9
 ojkmk3Kne3lCSaPU80OgWDVNN6nHxVMXbjC39rAHAZad1g+vamF1aFOc6KjTD+UcdTM0S6kwuIl
 g7K9L4RJRmZbkjkvbGPUU+n2lgwH7n7yWdiILnaKRkEcxCS1ZKjcyydOD/ppU3Q117WnCVetU7T
 MRh+pobzyr+NSqR8ClIDNGR5vj6mj5AkKRJzxxB3AaIDI3HE6AryYmeC11lmcFiIWJZktQ79oVX
 UWCLoMLQvhvBXlOxX1VkSewerqu9Bi0Ggc26jaTJ6egptQzSJAay5RvYieSA==
X-Received: by 2002:a05:6000:250e:b0:453:f951:4e5b with SMTP id
 ffacd0b85a97d-45ef141afc1mr3817945f8f.13.1780043431912; 
 Fri, 29 May 2026 01:30:31 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef356b129sm2392076f8f.32.2026.05.29.01.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:31 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:31 +0200
Message-ID: <20260529083031.59882-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519182130.890979-1-bernd@kuhls.net>
References: <20260519182130.890979-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043432; x=1780648232; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZAycTirmd8EVxyWYzaR3/atSYZ1KBB0PYXPIpWdLV4=;
 b=XB4BYMlZD+sd2pykb4QyUiq21dMKLuIh7A9yAKxCkvrcw5vk76Eq/wn5z6hjiq9dqX
 9W+ycD8PReXSEv/F7PG1GSjI5WP3vfkA0urUpg67J7Byi479LL4m7h1LCQLHWG25Hf0T
 JfRTakWdMbP95BF+iVdYinM9Rr9rQAdrMwERGAMemQl/2Yws2AgZcT2AJuGm4iaviHlO
 4tpnVQfe7ZdaC9hSTldAd0Ia9ZBo8IxJ7WMG7CrEC/fkbekLSaZ93OSmxNIRwGrIkn8P
 uZUme+v0HcU7oS/Q1+z8gh6TKo/Lypt0wQM9TknkA6wLYAqU2jCscqye8d1yVmW5YyZ/
 l4qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XB4BYMlZ
Subject: Re: [Buildroot] [PATCH 1/1] package/haveged: security bump version
 to 1.9.21
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
> https://github.com/jirka-h/haveged/blob/v1.9.21/ChangeLog
> 
> Fixes CVE-2026-41054: https://seclists.org/oss-sec/2026/q2/575
> "The bug was added in 1.9.3."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/haveged/haveged.hash | 2 +-
>  package/haveged/haveged.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
> index 066e21c132..0aee4d5e0c 100644
> --- a/package/haveged/haveged.hash
> +++ b/package/haveged/haveged.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  acbb05776668657012273be9bb3310e3140b79959aa4538e4cca8d30d40c0b8f  haveged-1.9.19.tar.gz
> +sha256  14e711975401ad03fdb29d2dcc20a501596ee752d92affdf43dcb3ad61cf20ff  haveged-1.9.21.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
> index 0e377d36ce..e22712f016 100644
> --- a/package/haveged/haveged.mk
> +++ b/package/haveged/haveged.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HAVEGED_VERSION = 1.9.19
> +HAVEGED_VERSION = 1.9.21
>  HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
>  HAVEGED_LICENSE = GPL-3.0+
>  HAVEGED_LICENSE_FILES = COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
