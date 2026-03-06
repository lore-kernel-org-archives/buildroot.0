Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3E7FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0732042043;
	Fri,  6 Mar 2026 19:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYrUkNL0xrNA; Fri,  6 Mar 2026 19:53:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F03A041F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826786;
	bh=l4CVgql17yL6iDRqNNWVVcJ8qO423Bo/qh2bcjfKgV4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EIbyb4sv3dMY60J8cVdSX9g2te+mP+B//Q1TBlW8NQ1lIHs0W8Kqwx2aCIriQggA9
	 Sfr7Ajy9DL0Bf8wUt3ZOgmetJke93fRYxWeTXuzTpr/uMMUOBTWW1KiYGat4oI24De
	 +sR6Zru0Da8ePqU1JFKuDrNwCtsW4VVP15yNXLHTvKtYhX4dHYR5s9m2BcXwL3loTm
	 aThmCvZuMxSNH8XbGbWRrGMWRzI+c9ofe/O+U0E0/M6WH3Dtrj5GkfWEulgMFTfEEM
	 n2xDbIrtyV/P6EMwmE8GUcVSIgpGxJ5hOW1yNoZewrNz461KeO3FNU2Q/4OEDIWt45
	 fyLhYrw6Vn/mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F03A041F29;
	Fri,  6 Mar 2026 19:53:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1253A25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E28F5613CD
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJuEwjQcDNUh for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9472461482
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9472461482
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9472461482
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439c4bde55cso2639637f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826781; x=1773431581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6LkZade5Ent6VHPy/EdkXQUkpqjiz/dJjg1BxCBlYuI=;
 b=lbBXBVdjMhOQ0+bu9bNiZUcYXCBBVBr6dDEckZtg1hZJsg9ajp2UzotenE2P3Yo4Nj
 qSTzwqo9istoJBB+n+GvwvHZ6ji6kxZI8Q4gCjMsMDA+armfHbuqMShseV7XO7rjCXX8
 /RWsfQ5ZKKGXw3zmkqIMQ8cL5p6fjTCBFbjh14muOiFfWyBKp0tPpzVlQ7ze8tIRmeY2
 +X2enUDZTDZHDlzsQq+PoONeV20+yPkoDA7JdPfUALK2Fqpe4d4Qh//DDwmMSwN0SZpK
 JpiqONJm8pZbndzU8v/4EkYW1nwmLh5PHtHnhY+yk4dyCQn1qykU4A5m8SjKZiBfC6+e
 wL5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd4/mv/vDen3VR5mKR8knz5YYDCoHtEWZMFOr1G2MtyqC3ptiUyVfzmH/CYQVHOHihOeJxo1vKVFk=@buildroot.org
X-Gm-Message-State: AOJu0YyfYC4J/9AjBUhm1P7lIn8NM4q7+QMhv3P01uyqDu/FZdtjZ1ew
 4xARkCV2M2PNBDOcWLMcn0mXtK/WRzkiDxQqjo/f0I1/scwcG82ECiNVRSu6Eqtq/2HujZE54j0
 idJXv
X-Gm-Gg: ATEYQzzGg4pXNf4snRw5Gk9jsSinwlg6cDTXLUFXIxVZtEpQCfAzc1GLnawZEpCVY4e
 dqWczuYBmTY8u5qfAlVLjJpautzBqfMr9QOWZJuRVeBJcIQ+F4vkHZvGjCZmPP1CMtW/yWAlhtr
 ASWpNKwo+Lt2FuSeZv7/waozxpf0cIzx/pbvJoebeasvhnWKHetukwMtTHqcBgXcZWvXnrXEt9b
 E8vVzTmkbPrnzEuipLlaj7mBzXbbTzK89Q0b3ju1EO0HMoCumBpci11LByI2h4nClHUIsGPDzPk
 5stwix5VCFsp65WBDJrMaI/RHjeuSaxy8uq8xEUhE/e/0FbvTyCP/l3O3UOpoD6Sy2qbnxRxq6d
 LJ7Ec3+0SEM2UQrbEJOT3pX3BJ2/2tODCVGFtGu4QOGqvJInJb1NJWKZJhEJw6L1P/WZD5GdTLz
 evM29c3qCApHfN239mtcZPtuvvgA==
X-Received: by 2002:a05:600c:3509:b0:477:7f4a:44b4 with SMTP id
 5b1f17b1804b1-4852691c673mr62252905e9.1.1772826780660; 
 Fri, 06 Mar 2026 11:53:00 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae56300sm5664213f8f.37.2026.03.06.11.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:00 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:52:59 +0100
Message-ID: <20260306195259.7187-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218195812.2983207-1-bernd@kuhls.net>
References: <20260218195812.2983207-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826781; x=1773431581; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6LkZade5Ent6VHPy/EdkXQUkpqjiz/dJjg1BxCBlYuI=;
 b=QZd52wA/YHl1Jn0L6OdBMnLDqWA2gbb+IiXJxFBBkFgCmQFaosaCXe/uIMARIMAdBc
 7Ctd7bzlDppznHZ0D9AkoMugUSh97jtKaYzKOY3JUbAlartfgYbiokbfpRvPZSdMhM1v
 OMLNe1DhBAnLyz/ygQKhUgZ9rsiJYkMfJP5wpT0qb8m2L2oNe1qGH4FZvR0qdOwxxL4f
 9l4HDlRIImXBgcVmLgrEhx3yWQDTmVey7F4c8WsWwhd+4Xi5phrAYeIc0cr2INUVfqI5
 mbKPvo6+pWs44WqeV26/yK3scXyyOgJfG9pdp8opxySxR/Av5qDmC9Kt7Pf/HZGxRXd2
 8RRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QZd52wA/
Subject: Re: [Buildroot] [PATCH 1/2] package/wpewebkit: add dependencies to
 fontconfig & freetype
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
> Buildroot commit 2882cf4ae649f7d5e9cee72f84e672328f550845 bumped the
> package from 2.44.4 to 2.48.3. This bump includes upstream commit
> https://github.com/WebKit/WebKit/commit/3b54e45d63b84f8ab8d70179184c45be78386622
> which was added to wpewebkit 2.45.1:
> https://wpewebkit.org/release/wpewebkit-2.45.1.html
> "Use Skia by default instead of Cairo for rendering."
> 
> The upstream commit includes dependencies to fontconfig & freetype which
> were not added to buildroot and cause build errors with this defconfig:
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_WPEWEBKIT=y
> BR2_PACKAGE_WPEWEBKIT_SANDBOX=y
> BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA=y
> BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM=y
> BR2_PACKAGE_WPEWEBKIT_WEBDRIVER=y
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> [https://patchwork.ozlabs.org/project/buildroot/patch/20251017131035.224739-1-aperez@igalia.com/#3599999]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/wpewebkit/Config.in    | 2 ++
>  package/wpewebkit/wpewebkit.mk | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 73ba4e6bdf..c8602f1de6 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -44,6 +44,8 @@ config BR2_PACKAGE_WPEWEBKIT
>  	select BR2_HOST_CMAKE_AT_LEAST_3_20
>  	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"
>  	select BR2_PACKAGE_CAIRO_PNG if BR2_ENDIAN = "BIG"
> +	select BR2_PACKAGE_FONTCONFIG if BR2_ENDIAN = "LITTLE"
> +	select BR2_PACKAGE_FREETYPE if BR2_ENDIAN = "LITTLE"
>  	select BR2_PACKAGE_HARFBUZZ
>  	select BR2_PACKAGE_ICU
>  	select BR2_PACKAGE_JPEG
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 15a2ea93e8..31aba2a0b9 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -40,6 +40,7 @@ ifeq ($(BR2_ENDIAN),"BIG")
>  WPEWEBKIT_DEPENDENCIES += cairo
>  WPEWEBKIT_CONF_OPTS += -DUSE_SKIA=OFF
>  else
> +WPEWEBKIT_DEPENDENCIES += fontconfig freetype
>  WPEWEBKIT_CONF_OPTS += -DUSE_SKIA=ON
>  endif
>  
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
