Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E14C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3182481240;
	Fri, 17 Jul 2026 15:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNsCtJR5JHul; Fri, 17 Jul 2026 15:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4732581230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303273;
	bh=c8XujWKp6nBQyKr+Y+8nCPcMJdLzEUW30WwQ1nhjSP0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EhNPIAm57cyvUA2Iqj4WrD57wvxy8vYun4/0GppTS8IELb08tHncBNQTVNQeUjN58
	 u6sVQYNweKacryyAcIBsjvdoKhXKxeLgSH5K+MiGqMAscE+Reqfi/rmavorQBd7RAl
	 o6NbAZzS1o7oCpy3ZCt8FraXkw0jesJDr/Imc3pXJHpp69ydZIN67wN3rJMQzy8Exk
	 4fbtUN4aY8nvXJUxAZVNw/3HzsXgAbeFWIecnoav4uEx/PYPd7EQdk5XYZNxaLK6DU
	 gF43YbvAH7hmDpHORpExSSYwv1tD/a9dD06c/ew4EmBqGe1ZG38yKU1EINMCFKcA52
	 Z7W8p4hubMlBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4732581230;
	Fri, 17 Jul 2026 15:47:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 609BA36E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45F0540BBE
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aq8PLS6Uot0L for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 364FB40BA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 364FB40BA7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 364FB40BA7
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so23932215e9.2
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303264; x=1784908064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ttX1autRU/Pa8MOVFhY70f1EPZXuaWchWtwq6YtxpaQ=;
 b=ANogvyFo+fzgFaTuB/HiYBOq/dfXbD+W9pAt7TEtx71zOk3CJHmFqMUFDmWrxEPG9i
 ryk0AZyzeUORWj3iD3AoJ/d/bZNY3eBBe7ska3zr8DZA5gM/EL9lcF0juhgOOkRzcll/
 UmYfhdCTrnYanImFt4EWxZdHEQWW3FOMO468oXztXcqhM9QQjCuqQtUm0zblg9afDkH7
 EoXS++0JwIkNZSoKIwwavXsJCOffTacJNyIMIfoDw0B3Ua9Vodym+Dk/yT6Rg84AJFRS
 53P1wVHraBiwNRrjYFLQuK0ceSl8+pyZcIHvuT5RVLTD6CpJgJBAXaPslglwGSQ2Vnlb
 PLMQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq2oxo9wlfQJpupX2/8sMVCHQ+yS99SiiFsXujL/Hpuk3nV/2PbP40cXR0zuGwXGLXNo9qsCRhMaSg=@buildroot.org
X-Gm-Message-State: AOJu0YwzLDbI/QE1134jBP+MAGBrqyxowW1hla9yDyHE+BIM3crl579y
 y2V5GnxozuxCNmdFx+iSbTSgyjLpWleMs5XeZ36U/7QWS06fva6BBPdDqtWyVDlsc8E=
X-Gm-Gg: AfdE7cmUogRmF2Auhy9Lmplm3nLJOd4AnGdImUQ4PSSQgHjQjjMpfz6EG7R/pbWtH4i
 IdGResU9z9s7nvGd+w336//3z+iXavyBsoO8BkLZoPmqR47RI4b1nudXl/rlrT6mR+UZdlUxqsl
 1vpE8eU6hvB8a+YjQ4KOqBTA6siVr9UbkOSJQmN1wPqT4HJZNKeJ3TPdbovpLCWqNeVNMg6836o
 GmBKuG1ztv8CUPOBkMKdD5DDVnkionUruez2BIig7l8A95HJs5CYYPUYHubkS5eb+xoXJH6mVii
 8SLaCyWqg9Qvex3+lVvr2t5W95W2uZSTXY0cCN4cELpr/RhLU7+3hHXk8rbX+VcFpxX0ss2I6IR
 2r7KnTW0m/opgLgCVTs+iCpBfBpfzbKCCza4OMkchHfsqTLSGlG9mifC6sboYUXaQJmFONaE=
X-Received: by 2002:a05:600c:4f92:b0:495:f31:7340 with SMTP id
 5b1f17b1804b1-4954a3d06e4mr36746075e9.5.1784303264238; 
 Fri, 17 Jul 2026 08:47:44 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49549c96ff7sm56819265e9.10.2026.07.17.08.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:43 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:43 +0200
Message-ID: <20260717154743.192542-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712113058.1579954-3-bernd@kuhls.net>
References: <20260712113058.1579954-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303264; x=1784908064; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ttX1autRU/Pa8MOVFhY70f1EPZXuaWchWtwq6YtxpaQ=;
 b=GIoEThnVyootFVJCH9xgMczF6l9ZEk43L35i3Ri6WkOdey8W4aO5kyKXyTv47TcIlX
 TDTSXx0Zo8e2jsunM6NKZbFK6hUV8poOJjM1TRrbkEQ3vDelDG/XTT9v26Wvqe98xppK
 WcL0TKEpU+clTBT6UjAvO+MYopjL+U6ZJcXXLzM68zYmtc+ouE2RK55iPax291208G8p
 figc0bLucI/EdF3T88sXO+bgWhKpGo+ni+bqAY1Zz6t31pEyj0jKtqdeUbfI1mqTarsn
 n5hVdB3oYw2m5MyH++OOtzmUqD6OQSeIK3VcwEQlGGXMX8dk6PXNNEFiVSmWbgRQJnfg
 qFSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GIoEThnV
Subject: Re: [Buildroot] [PATCH 3/4] package/x11r7/xwayland: security bump
 version to 24.1.13
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
> https://lists.x.org/archives/xorg-announce/2026-July/003717.html
> https://lists.x.org/archives/xorg-announce/2026-July/003716.html
> 
> Fixes
> -  CVE-2026-55999: glamor Font Atlas Heap Buffer Overflow
> -  CVE-2026-56000: GLX contextTags Use-After-Free in CommonMakeCurrent()
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/ac5c6561894d41b86a43af13c4a5af16612c9195
> https://gitlab.com/bkuhls/buildroot/-/commits/9c78a853c88fa85f7a31404b4ab324370cf049f6
> 
>  package/x11r7/xwayland/xwayland.hash | 6 +++---
>  package/x11r7/xwayland/xwayland.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
> index 2bf2d19020..c9b931b6e2 100644
> --- a/package/x11r7/xwayland/xwayland.hash
> +++ b/package/x11r7/xwayland/xwayland.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.x.org/archives/xorg-announce/2026-June/003704.html
> -sha256  6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21  xwayland-24.1.12.tar.xz
> -sha512  b4ee41761c2caa7332573be07d9143b60015bb4a7910c90b6ae079dde0a1bf6b0b4773ff4e6fba48279cdee83b4de5eb4a19b9369b5753e4147b94fa2deece96  xwayland-24.1.12.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2026-July/003717.html
> +sha256  173aea3d6f79609164c04528e1c8e4c9b60fcd59391c3c9dad4667297d727fb6  xwayland-24.1.13.tar.xz
> +sha512  e06e58025b441892fdd17ac55fd5c7e137bffc941b76ad784dc008047c778c6ee2895fcc47b9e8c74b1d8372491e69c39933c4186aec4df55571614f8ba98e3c  xwayland-24.1.13.tar.xz
>  
>  # Locally calculated
>  sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
> diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
> index 2b8513602c..02a21b96c1 100644
> --- a/package/x11r7/xwayland/xwayland.mk
> +++ b/package/x11r7/xwayland/xwayland.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XWAYLAND_VERSION = 24.1.12
> +XWAYLAND_VERSION = 24.1.13
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
