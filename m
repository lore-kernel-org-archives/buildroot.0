Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B6ED0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB04E40D42;
	Wed,  7 Jan 2026 17:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xm-HQxZxm1N; Wed,  7 Jan 2026 17:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29E7D40CC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808155;
	bh=wX/HFH/iQwm4R90c1S6U/8BAaViHqiQyEFQGVBntirU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iQ6HhmQen+qlL3K3YRjQZUfuZMQKNT7iWQJHpuSFgfS7ue7rRIndIVJeC5XAe81tl
	 T4c19AOZ3CB3HhNvcHUVz5S3rc0CVU+Z1ae7sr411ry57XSRRGC5QC8G2jJSRJ32Ef
	 jDLIQsf0nJN9WkofuMFZD9rFEktZbS86IA8WqUzuv/HxPWw6Rruw67skkTkhpKi8+k
	 IPNSZ/pwjA8VZB4CqPqeJWuoOd3jNQ/JSk8hscyt85oB78TzoBWs5pVifg/OoWoc7L
	 cLNH3N6tANk9IpaAcK0uWAjvf3Mmk8OIxZNdTHyiFKMQkhozkIFl7UJJggACDnY/O6
	 wqUafGcWkCAdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29E7D40CC1;
	Wed,  7 Jan 2026 17:49:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6028C25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52B0C40CDA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2jWqh920zwh for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0DF540CC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0DF540CC1
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0DF540CC1
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C200FB97A70C; Wed,  7 Jan 2026 18:49:01 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:48:59 +0100
Message-ID: <20260107174900.224807-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215225837.1257574-2-thomas.petazzoni@bootlin.com>
References: <20251215225837.1257574-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808141; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Hfc7LayReyXshXhXS7twURg3VDXJ4U71Vllf/gWFUPA=;
 b=GXb8cs7zehhXAUeA7+VHoqeabMbLhLWXZ0nDFW8TlqNIjpCE22xcZjpvSxC3AE0KIq3ADn
 MTUwIOzltTcWfK8UWzdCHCHODn17ys6rNNaVJeX5+EGJNQ0ZFLtCfD4vjM9Jo3pD4v80Jd
 XkQsW+llQMJivY2z2ZpjzbR9UfKkolz1S8Uu7N8XkBGbCuXirHDxXTWKhf8d1YQvMuFNx6
 NJkHAPymeZrgY2keaFfBeFLBtIWsEanxuEaZ97viIGEL1a3omtX/yI6hmlpjgI1q5lgG1G
 lYuhIVbPSK4hYXZq6QgwZgREjjhvctwwBVYbKmILlydSYtaAXKxBC1k6ZOJVCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GXb8cs7z
Subject: Re: [Buildroot] [PATCH 2/2] package/sway: properly propagate
 wlroots dependencies
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Commit 00fb3a57cbaedb8df43f75f0e891423c1ef7d8c6 added a wlroots ->
> libgbm dependency, but forgot to propagate it to package/sway.
> 
> Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/sway/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sway/Config.in b/package/sway/Config.in
> index 1f4b497af3..1e4c8bfd3e 100644
> --- a/package/sway/Config.in
> +++ b/package/sway/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_SWAY
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
>  	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
>  	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
> +	depends on BR2_PACKAGE_HAS_LIBGBM # wlroots
>  	depends on BR2_PACKAGE_HAS_UDEV # wlroots
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, pango
>  	depends on BR2_USE_WCHAR # pango
> @@ -53,11 +54,12 @@ config BR2_PACKAGE_SWAY_SWAYNAG
>  
>  endif # BR2_PACKAGE_SWAY
>  
> -comment "sway needs systemd, udev, EGL and OpenGL ES support"
> +comment "sway needs systemd, udev, EGL, OpenGL ES and GBM support"
>  	depends on !BR2_PACKAGE_SYSTEMD || \
>  		!BR2_PACKAGE_HAS_UDEV || \
>  		!BR2_PACKAGE_HAS_LIBEGL || \
> -		!BR2_PACKAGE_HAS_LIBGLES
> +		!BR2_PACKAGE_HAS_LIBGLES || \
> +		!BR2_PACKAGE_HAS_LIBGBM
>  
>  comment "sway needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
>  	depends on BR2_USE_MMU
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
