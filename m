Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9755CD8C81
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92033829FD;
	Fri,  5 Jun 2026 12:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhlTWub-9nVQ; Fri,  5 Jun 2026 12:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23973829B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663828;
	bh=IMfYvEdYhY2OfzvgqBw2vhO+iUF1B0mvAtm3eTFvJFA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cWOGKYhAT/HoOmZr2AxNUcrnDTt77+EA4BwkIpO8Chx+rPtZMMurjh3WpW9erQJRD
	 86bvAIvt9ZlM7a2iVZsgLEQfyJ/LRG4pWosl/9MqJP8R3vY4PrrAJcyK6Kd6FRUFXl
	 rfIM1k6zajiMeV6a13BkkopMJSmmUS9MYtjLtxN/mQo8QdwQjZiXnWGYv0J4b/Yv+7
	 JFOJmmWZVvs/BXu7iuJXuWAGG9D53t9uhvb8yAwJNc5Q3nMOolwgiP849fVB+4dghZ
	 JbqxFx5P2dUOk5d2dUGzne+YMSydqhqACo9anyaVd4BVnE6MQHOX/rulfMYd908+9h
	 lIKGICshnvqBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23973829B6;
	Fri,  5 Jun 2026 12:50:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94FF2388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FEE74037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89sw3A-IirnB for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84AF64037F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84AF64037F
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84AF64037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:21 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-45ef29c5561so1069773f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663820; x=1781268620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QFMaqBQWQRTHJ4RnFrEji1EFvN/K/9rJ6ym8nkL00zo=;
 b=bl+2k2r7z76dmVdGHCESzCfbQ0WVCRcWCjO7q6lTMQyjhaupRe3PNzKxPHYMOJmOFw
 1ABREnqB2TyCCCMIlUvmdBOrhL7nGzhDANR3pA1PNdZM3zE0Go9Vj1Vj6RjPcEbzJFz8
 tSyK6BaVCqvvnlJkhD4IFGAcJ6GAnte9GFIacRE2OiJS0QRZq+dYrYMpdSIeXpXhiQbn
 i3UoOh5M1LaLWA31pKmPNsi/qXr8CH5QMOTDxNosiZ7wClDoLeBbVtfBu/j9mgzLsNJW
 ZFrc9SjB1KPCCxplRaRRfuHfGmRbdAbmU4+okul+u6XhTScu+WfdaHCNQgQk3hQz4iJw
 19UQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+4qtYdY/wsoCB5CfLLEs8hA+ZyqnkV3aWwspKibl0GR5GkP74w0Irhqxire8GGlX4gjmuttambBO4=@buildroot.org
X-Gm-Message-State: AOJu0YzPaoYQoaKq82MV/e4fZExcDTKFaxS7GE5cblp2aIzABr0BgYEA
 BkCtt754AhQQtz0o82TEfFdo0DD3yQmWq5hXoGjiRhOyM8wnSwwPYOb4AVZTHCIHzQQ=
X-Gm-Gg: Acq92OGnsJorEVwklVgpg1g3pJHWB4hxx7N02uoyLqfIMmvK+0JJeuBZmTp6un9siU5
 wzA2PtNQRdfmWTBrmXSgc/BvuF72RkNgL/2hgB3IDPzQ+ptRTMtqu1aFjRXa3eBmRYGRzUN13t/
 QOPKXuYAIBA5zjctBZIiCcxKYN+8oK8Ibjdsh1iUqbccSDT0bfh1AMxvR/zw+nD9rbqGczWDP1Q
 0jK9/p1LwmhPvExWjlX0SYFB5xWGPpS+pztW7845GfvKqct4nzhEyyfUOgUZ32iexk9cS3vV9wh
 WosERjcKxgRZjYXZB+1s+n4tjK+8ABJaNz0Gi1Bc5CgXyZfVIqO1f2kDGpJm+eGEJySjX2pplWG
 FYLW3GOqrKMNnHGUxz6EtD8YUzrr3PFhA57eIPvjEIjkGhdQfimsUEPRIGsGsGERZJKx/pnIRCt
 PRSNrSxwM+/3kU5aktGu1DWG1F8zA47w7H9Vkp
X-Received: by 2002:a05:600c:4e55:b0:490:601f:d775 with SMTP id
 5b1f17b1804b1-490c259a232mr55491785e9.5.1780663819509; 
 Fri, 05 Jun 2026 05:50:19 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3e4b5asm158723815e9.13.2026.06.05.05.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:19 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:18 +0200
Message-ID: <20260605125018.273031-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260409184048.3180731-1-bernd@kuhls.net>
References: <20260409184048.3180731-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663820; x=1781268620; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFMaqBQWQRTHJ4RnFrEji1EFvN/K/9rJ6ym8nkL00zo=;
 b=VC06vyR50DeoR0qk57CKrZd+uGAZNqGPd83qK5zkrHRFdxb3a2P/uCOC5hMxBxfEPY
 J6dQeADYf5ZiEiPeLYEd0ACKhbamDrDZR+vMdm4+fX9M+dXx5ZCP41ekWxYdusa3hQ4y
 cI6vtZ/h3V8Py7aPkIbQhXJmi8brqmnP/RJSy57Dl7VtzR6lhUOUhpY2WKOE0gTZzxjD
 sOzlwUrT/8RPfnZHPJT5DDmIL5WK3VhRiPZ8dZ0uFg3ReOVnitbywe/L5beXAH/g9XKg
 4tWJYOyLAMSqU01d6Ttbw7CH7rsjiG0I1Mw4GEZQyeqW3ABfR1AGZAoT3/L2oSZP1dVt
 a3xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VC06vyR5
Subject: Re: [Buildroot] [PATCH 1/3] package/kodi: fix wayland build
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
> Fixes wayland-related build error:
> make[4]: *** No rule to make target '/usr/share/waylandpp/protocols/presentation-time.xml',
>  needed by 'wayland-extra-protocols.hpp'.  Stop.
> 
> by adding a configure parameter pointing to STAGING_DIR.
> 
> The build error was not recorded by the autobuilders and can be
> reproduced by this defconfig:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON3_PY_ONLY=y
> BR2_PACKAGE_WAYLAND=y
> 
> LibreELEC added this configure parameter seven years ago:
> https://github.com/LibreELEC/LibreELEC.tv/commit/d19ab98bf324364bf36b7c2d630524267dfaaa01
> 
> so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/kodi/kodi.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index c31e789503..02feb17b4d 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -126,7 +126,8 @@ endif
>  ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND),y)
>  KODI_CONF_OPTS += \
>  	-DPC_WAYLANDPP_SCANNER=$(HOST_DIR)/bin/wayland-scanner \
> -	-DPC_WAYLANDPP_SCANNER_FOUND=ON
> +	-DPC_WAYLANDPP_SCANNER_FOUND=ON \
> +	-DWAYLANDPP_PROTOCOLS_DIR=$(STAGING_DIR)/usr/share/waylandpp/protocols
>  KODI_CORE_PLATFORM_NAME += wayland
>  KODI_DEPENDENCIES += libxkbcommon waylandpp
>  endif
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
