Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCBEC83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB34A83D71;
	Fri,  4 Jul 2025 06:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8o-pjVWnLUW; Fri,  4 Jul 2025 06:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 675C783D30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 675C783D30;
	Fri,  4 Jul 2025 06:46:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99F081EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50E1040FA3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dls4N-wPv-7G for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:46:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64E4C40F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64E4C40F8C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64E4C40F8C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:43 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so3378265e9.0
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611601; x=1752216401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zGo8XMr4DZXJOV3L6qEJ7Uo6GgdMjmWDKgtF1Mgg5Lg=;
 b=T66TLmRfn+o27dlz69HVVAy+4kijI2d1yiPuJmFxlsWx2JvwVUg35Fmsy3Wnd6jPR9
 EU4eebpPLPTXnO2wAlrWSvz8BHdGOVbicH+bS8DdQJYGtXp4TJUVzowN45enhyhOlXrN
 5N78M7o8DFPnxN7v+QaSG+cVC+CmGDkTtN0n4/EruxGl8uCqh2Pz2fDmcH2QCAYReK6S
 KuD6e1tZCmCes1SJax1iA1nlmtml0TPPs4GQwEwr+H3cHEBfQsXiv+pqYxQ0X/du6NCr
 8onRtOKnhrHOR0kp0vLDADiGeYgrMHSD2u4zo8JthIrIHQNA/MN2606A8bfKKW3j40lW
 YjaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrHMlVZbuL6bz5H4I1LZ4bSIqT085+jTjqJLpAYOMY15O9t2GJ6T5l1XMIIBVILpiXg3DqSk8uN2A=@buildroot.org
X-Gm-Message-State: AOJu0YwdwHwzqoRP4ifOoPlR5whq35OcOM1WamiYbJlfFGfq6NvK8BQX
 zUIm5tUuVZQ8h57QnNKqJhe8rlcZy8Yo3R9+uE1ztALOLYPhuVLSz3Vd3HheBdsu1cs=
X-Gm-Gg: ASbGnct65CQOIvaLd2ymXHYtvQxjYejOik1oEGWlodx1BxB/nuLY8YVucTJpPuyeKJA
 0L2uMjPzIxNKY/B9Oy1sp+KKunZ4yxCwfkrT2MCVdU67fMiLcAJjjUjyncCAhvbxHwW4IVxm2z2
 HzFVZlrzydd6c8gsugang7kPGBDJ40Lff8WpcQt/4rXxo2jZWjjVL2s+YNaWGJZXagN91mnosE2
 HnPq8C+uA6LO60c+QwO/ChHcMkgCb3eiy0AGBZ7qu7NBKKry3K5qKTTeDblhD9Ry+Crtwd47yua
 UxosxuxYiD7DyncetqkzBWw/3FfURFdypYB0xV1EcGquZR9hGWf5fWpQ3a6qiUWgMfu0B3/U8Yc
 4fBJ6TXbzSQ==
X-Google-Smtp-Source: AGHT+IEkgfLI3WOzLqqbsqy0HS1o3/9lbzz9ZaY9SWw8Vjsy7a1EP5MOhn3siXMijRJfQDyLweJXzw==
X-Received: by 2002:a05:600c:1f12:b0:442:dc75:5625 with SMTP id
 5b1f17b1804b1-454b31091dfmr10981465e9.5.1751611601434; 
 Thu, 03 Jul 2025 23:46:41 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9be0bacsm45299445e9.32.2025.07.03.23.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:41 -0700 (PDT)
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:40 +0200
Message-ID: <20250704064640.4063909-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624051736.2859733-1-maxime.chevallier@bootlin.com>
References: <20250624051736.2859733-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611601; x=1752216401; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGo8XMr4DZXJOV3L6qEJ7Uo6GgdMjmWDKgtF1Mgg5Lg=;
 b=OMWnl2lJG2GyuFF4lT/8E8NnjyNjTBlfTk57OXb8XTlwpdLkGUxPsisE83+SaYM6Zr
 o9/Tb6NJj7huhpdqlY3mlIwgV/1d3ZLe/W9UE5ETNczklM1sePcXeW96a50/SKh5xNwd
 BUWyUNhXhXUv9h4d2J1TeIPrc0gBH/dB2LXJ2yquFDk0PYW0E58ex6abR3Xdgs5BNeNp
 dDdPXnfooEfCkZGGXQ31x7Zuc5SA/GwEhRDua2IXIjlmnFSou1XCUqzuT0yIfDQuDqsf
 zJTkbitRfvNVh7jaAUSkaMExS4oSGyYObRz6A+wJeFV3ZVwACjp4JPhJXIJmEDCPPziY
 iB4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OMWnl2lJ
Subject: Re: [Buildroot] [PATCH] board/espressobin: Bump linux to v6.12.34
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
> Bump from v5.15.1 to the latest LTS, v6.12.34.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Applied to 2025.02.x. Thanks

> ---
>  configs/globalscale_espressobin_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/globalscale_espressobin_defconfig b/configs/globalscale_espressobin_defconfig
> index 562e646b70..5b4f6dcf55 100644
> --- a/configs/globalscale_espressobin_defconfig
> +++ b/configs/globalscale_espressobin_defconfig
> @@ -1,12 +1,12 @@
>  BR2_aarch64=y
>  BR2_ARM_FPU_VFPV4=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>  BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Marvell ESPRESSObin"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/globalscale/espressobin/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.1"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.34"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/globalscale/espressobin/linux-extras.config"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
