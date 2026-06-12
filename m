Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BDFCD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5346D61355;
	Fri, 12 Jun 2026 11:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78rW97x3PeBe; Fri, 12 Jun 2026 11:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09CA9613C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264313;
	bh=SyMGpI39s4GKP0vfpvKF5XGEDDHZgMgQUVobFMVdyWk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j2bnB7eXLYnirwfBz1yJMncLqCGy8ulmghxmOYM5P+DT3LuZmwFt2bkdHahf7kMx/
	 KgvQoiymzfL4OqSaW6S78TQhQSjRkeQWZOgYFcfcC7achsTJG3fHgiyoLzkzCaepdi
	 PFAbTEbDIoDlvthP/M3XjNKivxMxooLaU6j0bmanVOzhZwULmPz606ukgAtOY27Zpq
	 uwqzamPH+bkauC/GuknhdfrDAOGFVv77sAguFJasakkeFMdurp2irzIxZD/g2jQhbV
	 S8v/LBGxf7hT2f1Ysco91Phg1eoOkAWSQ12ULtlZ+0wIiFP5GgidJF/lRCjTq6e1aw
	 R1kVxSOMhwavA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09CA9613C6;
	Fri, 12 Jun 2026 11:38:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80C7412F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 731D68330B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4OR6Efxh1wT for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40F24832FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40F24832FF
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40F24832FF
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-45eedcdaeaaso603770f8f.3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264296; x=1781869096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N7jhhxHbZsVbd+XuvcnPF3l1FRg9QkaLR6kczXe+9ws=;
 b=aVbBMdb0aMOQB/yu3kLY060QF4JT1yMVs6QDYvY+5pHLzPXB78eN25JjPGP5gwkTQW
 7EN5K/o07zfmu7ZBY/6mN9toVql2ydeX7wHYzdjGqFhM7An7FOQO1/NsTvWoUuwqRRQN
 E9BHVqdmhkarqmAYGU7DdDlKIVPppf9mvOZZSLEES12WGl9OewpeUJP+DVEbIKI8XyBA
 TS2yhoWhMc6ZnXf6KYaqr0dpyWO2tTETsVcz+grxjyxHI0YUZ5xBSDkuDq0YJsdUcu8p
 khS76nJn6dnndUtxlvudvifYXend3XdLiewutEXns3ETRXLF0Ii4wQLSmMr6Zpd8NmyZ
 T8zw==
X-Forwarded-Encrypted: i=1;
 AFNElJ//5zO+mvOwX90PEyWmEC+G2PoZKschB9zaMXsqA2gTNDu0E9HL47U6s+xDZwmKVKMsZ7k0TwpNkKI=@buildroot.org
X-Gm-Message-State: AOJu0Yza2PwhRilTva3oGpvLqkTjnaLJ9oZYAiYv5blPJgOGP3+9fXsj
 BylDYG0LBpfkrIFadwa8EY0MUbvT5eaW1h57gtkfINDvO1k5Uee0VvZYhjuGPybzfm4=
X-Gm-Gg: Acq92OFpzecOzJAGE+ZG6UBlQBFRPknd+Bvya6wFGehTQbSBqhc9WL1XrCvGM58kl8F
 xhCnCwrOi5lBKLV9RNSo6sEFdSfMHjQ3NpVWHM2ygW3mWsr//2Mo5wE4OxxsDDf/y7N3D8bnGie
 X8uuJ1CaXgYPJzIgEktohgNqrvYLVOZH4zppsRc0nFXXvtN9su1AnIG7L6a45h3T1MB+OWnulvW
 YSl3Z1FUrms8yehhJCHFx/yQ9EKETtcJrfM0C4/iABqTL4yl173wCEj3fm9kRcP0DpMSOB7v5pW
 mwA04Ab+ncuRu3LDxUQPryCv8easxlNgx0qhxqBIJHPto9n1euFykehYvCF/rxgXqy0kAVe7m3+
 YeIdUbmwDuvIPMcaAqg1rjtLTWs2Pj1EnqJ0gLf/s7TOGLLR+Y1QNnPDn8ZnzKtKasI4IYDpaVh
 Zhu9yIzrBuLi+iP0s=
X-Received: by 2002:a05:6000:2dc2:b0:460:30bd:4dca with SMTP id
 ffacd0b85a97d-4606dba0652mr3191028f8f.30.1781264296339; 
 Fri, 12 Jun 2026 04:38:16 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f726sm4508370f8f.15.2026.06.12.04.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:16 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:15 +0200
Message-ID: <20260612113815.253402-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603185747.3538484-1-bernd@kuhls.net>
References: <20260603185747.3538484-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264296; x=1781869096; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N7jhhxHbZsVbd+XuvcnPF3l1FRg9QkaLR6kczXe+9ws=;
 b=U0JzcXdcXNg2JtwqffJ49MAoziT3A9omB/HCnwiOjbtBME7QcKV0yoDBOj4+yKz1Dz
 fEg3wO6dWAUch7HKPmwaYjJsxGQI+R9MXSEckqpvkBPwYXjz7VCIbKBGp7GR6EQZXS74
 lxK9ZFfl3e0i87JqHwbrYry94aYLKBsNtIjnpkHNxO1kAJSxE1V8VHWCTsiVE3wJcL61
 Xs5qUNzwge+YhrK/R8jAEyL6Q/qgfeyHVMVFjKtj9Bl6vkWNZosSkUC5lzJcXpKGSGhU
 IzMzXA14H1j+utcFmOSd8/OJ8IlWJiOIaD0jarHZwPYIeUjd9gG6bkx3eXxTaZnjOTsh
 GMCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U0JzcXdc
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xwayland: security bump
 version to 24.1.12
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
> Advisory (no CVEs yet):
> https://lists.x.org/archives/xorg-announce/2026-June/003702.html
> 
> Release notes:
> https://lists.x.org/archives/xorg-announce/2026-June/003704.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/d0b6f1c51e2fea4ad37b9730bea364b23448832e
> 
>  package/x11r7/xwayland/xwayland.hash | 6 +++---
>  package/x11r7/xwayland/xwayland.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
> index 6204400852..2bf2d19020 100644
> --- a/package/x11r7/xwayland/xwayland.hash
> +++ b/package/x11r7/xwayland/xwayland.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.x.org/archives/xorg-announce/2026-April/003697.html
> -sha256  27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff  xwayland-24.1.11.tar.xz
> -sha512  586d7e60c8bf0d92cec66451284c6c43b960010f14a1e204b5de722c610dc067481fd6ece0ffae615ca53ca2d0262e2a3dbb916d04811b8d57c1085bc363f5e9  xwayland-24.1.11.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2026-June/003704.html
> +sha256  6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21  xwayland-24.1.12.tar.xz
> +sha512  b4ee41761c2caa7332573be07d9143b60015bb4a7910c90b6ae079dde0a1bf6b0b4773ff4e6fba48279cdee83b4de5eb4a19b9369b5753e4147b94fa2deece96  xwayland-24.1.12.tar.xz
>  
>  # Locally calculated
>  sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
> diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
> index 0643cc5c4c..2b8513602c 100644
> --- a/package/x11r7/xwayland/xwayland.mk
> +++ b/package/x11r7/xwayland/xwayland.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XWAYLAND_VERSION = 24.1.11
> +XWAYLAND_VERSION = 24.1.12
>  XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
>  XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>  XWAYLAND_LICENSE = MIT
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
