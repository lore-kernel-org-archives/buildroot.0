Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06DED1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD67160A39;
	Sun,  7 Dec 2025 14:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEEjRGCvYI1i; Sun,  7 Dec 2025 14:32:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01879606D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117961;
	bh=J9ATx8/RhdtYsfU18d7hq0lR4/hH73yUXBQthG44HlE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BleXn7gUvHuJMNu9aB+SexmvBOUp/dwRVpMfJXwUza9ZzrRYdweDTGh84AaHezQaI
	 nhKZAz015t4wb6gKgBUR5oIBJlKy1KVT8QkGqUC7xuHRabSxE4tdnwhyIysXa0AhuO
	 C/wdubtmYrvIqHXBOtInM7CK3YQ40BdduddoBBCBGRuwGrzokJa/91L0Hh8oi3LEEs
	 rVn5/vbbXGlFNb6Z92IVdx5sOMmUfBDl0mqKBs2j9jfszv9wrZAroNr/GuSm4gpmeT
	 tbPoFLy/vYUi8A2Zuxtdqu9hkdohtVfBu/qWgAYt8ratIWkdJBacvJLWaQJvGsnogu
	 ZfVZoeIE1fMZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01879606D9;
	Sun,  7 Dec 2025 14:32:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 264C62CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 181D140259
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XphLfvdIXrfR for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32A7A40166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32A7A40166
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32A7A40166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:32:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 736F24E41AC4
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:32:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3EA49606D3;
 Sun,  7 Dec 2025 14:32:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5CA11102F2368; Sun,  7 Dec 2025 15:32:34 +0100 (CET)
Date: Sun, 7 Dec 2025 15:32:33 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251207153233.166a575b@windsurf>
In-Reply-To: <20251205171837.22075-1-raphael.pavlidis@gmail.com>
References: <20251205171837.22075-1-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765117954; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=aW+Cu2ZfdSsW4JWSy2WeyCIbGl/isr+Z5rxLkK2NxDA=;
 b=X+F6QpFM3J0KwXozOgOoNjRUwOV1tkzcAANWbz2R2EqV5FmUjixAIFkOvUC3t0U497jLN5
 Vpa1T1Y2CQqmeYJeV0efkz/6TbbpfpRZWpoiJnJTiKpgJJKeec12WYyXdlKXovqygxF9P6
 hk9o4mxvofITGt9+X2kc3o19fOg8WKvodf6sQZeU1YJL4Uhekau8Yh1mzjNJwVw0l9MYUH
 HYz5fx9wHMTh+VPouv52feMwfZAP5swHkeARb4M/0o6hhKWYd0ML33EsZj1gxe8Axp1hkg
 SIccGZcztoUAqLRDyBGegg3CvCQGCRpr9dwN8Ya0nV6L90tVXTqAHZOiKl1SKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=X+F6QpFM
Subject: Re: [Buildroot] [PATCH v1 1/2] package/xwayland: add nettle and
 libmd as sha1 libraries
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Raphael,

Thanks for this patch!

On Fri,  5 Dec 2025 17:18:36 +0000
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
> index 311dae25ec..3df8677545 100644
> --- a/package/x11r7/xwayland/Config.in
> +++ b/package/x11r7/xwayland/Config.in
> @@ -3,12 +3,12 @@ config BR2_PACKAGE_XWAYLAND
>  	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_STATIC_LIBS # wayland
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
> -	# We need a SHA1 implementation. If either openssl or
> -	# libgcrypt are already part of the build, we'll use one of
> -	# them, otherwise, use the small libsha1 library.
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xlib_libxshmfence
>  	select BR2_PACKAGE_LIBDRM
> -	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
> +	# We need a SHA1 implementation. If either openssl, libgcrypt, nettle or
> +	# libsha1 are already part of the build, we'll use one of them,
> +	# otherwise, use the small libmd library.

Could you clarify why libmd is becoming the default instead of libsha1 ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
