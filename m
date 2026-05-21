Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63E4CD5BAF
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 20:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D42C84C01;
	Thu, 21 May 2026 20:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tje2p-G3zGML; Thu, 21 May 2026 20:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A5884C02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779395101;
	bh=pkZ2OfXrjnG9K761leCBOX4dRxdWRiwzsD974iTRfrk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bvtu7Dgv2xWctp/n639kJ+33SXiliyMB5PEy48BpVYhibUx0MsZgEH08W2UWbfEWg
	 UOs4KmQdDYiD+nL/9ZzOuFZ14Mvhluq57Dc0kjJN1lpYiRV8OuzDMJgpo1pjNXwM/d
	 PDMRTzqfs8i4c+fAZ5Gu21qMHTjDfMWI+CMMK5sucDyj0hLvWR6ZSyRVxbgObElta9
	 aet1Egc0r5NjijGaomUm9jj48vcMq7rl3OSrPfBx6gsgPNanigD3AHa8XoWPnBAFKB
	 AzwjO187OK3GTOsP6eE29WXMCpIsJTDZl4+zsJMsRUNLMwdwREag4oqmdIM8vM0Mpf
	 opjKkyZO06ktA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A5884C02;
	Thu, 21 May 2026 20:25:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 824E1282
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F86984C00
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySYers0VMnyc for <buildroot@buildroot.org>;
 Thu, 21 May 2026 20:24:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B64F84BFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B64F84BFF
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B64F84BFF
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:24:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 64F69B97C549; Thu, 21 May 2026 22:24:56 +0200 (CEST)
Message-ID: <3bca72e7-9bc3-42d8-a642-dfb70cd0a473@rnout.be>
Date: Thu, 21 May 2026 22:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
 <20260515-virglrenderer-v7-7-1f1814b65ccd@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260515-virglrenderer-v7-7-1f1814b65ccd@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779395097; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=YYZVHzFR9KDnMi5fxkTnd35F8eWfjQb2nRfbr8eQOgc=;
 b=e7XqPALTMJh66bbKg/iR0f1j0BbB4GnNs9uw9klss7vH62qqp6jdZvBdWPzwsgMG3i3T0v
 6hMAkkGUtUYZwQrPu+cGemWYrYCefgzhZsvTew7TBZoJ2kyGAj1aFMSDVd3bZgdqchHyOG
 DAdB1HOhHxf7In57JdzbC86Z12l29P3wb4dviakk5fNaDTeU8+PY1uksrwPkWftwFB8/xn
 kXBYGp6GC2Z8x93BS7RLHRveHZRGtD7SV27llnRgQNZOy2P14/fOlzrXSLvMIMU0X98NUm
 MYvC66dQF/KQdD4F+DciBUd2+/2lo2Jm/hAuvcN9/DgSt7ij6qPucErs7XSaoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=e7XqPALT
Subject: Re: [Buildroot] [PATCH v7 7/8] package/qemu: add virglrenderer
 integration
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/05/2026 04:03, Joseph Kogut wrote:
> Add optional virglrenderer integration, along with enabling OpenGL when
> necessary.
> 
> https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>   package/qemu/Config.in | 21 +++++++++++++++++++++
>   package/qemu/qemu.mk   |  7 +++++++
>   2 files changed, 28 insertions(+)
> 
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index d4e4e37a3e..dbae7c4de4 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -126,6 +126,27 @@ config BR2_PACKAGE_QEMU_OPENGL
>   comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
>   	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
>   
> +config BR2_PACKAGE_QEMU_VIRGLRENDERER
> +	bool "Enable virglrenderer"
> +	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_QEMU_OPENGL
> +	select BR2_PACKAGE_VIRGLRENDERER
> +	help
> +	  Say 'y' to enable qemu support for virglrenderer.
> +	  virglrenderer backends such as virgl, venus, or DRM native
> +	  context are configured under the virglrenderer package.
> +
> +	  Run qemu with `-device virtio-gpu-gl`
> +
> +	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
> +
> +comment "virglrenderer needs OpenGL accelerated display frontend support"
> +	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
> +
> +comment "virglrenderer needs virgl, venus, or a DRM backend for guest acceleration"
> +	depends on BR2_PACKAGE_QEMU_VIRGLRENDERER
> +	depends on !BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND

  Does it actually work if you have a DRM backend but no virgl or venus? I'm 
confused again...

  Regards,
  Arnout

> +
>   config BR2_PACKAGE_QEMU_FDT
>   	bool "Enable FDT"
>   	select BR2_PACKAGE_DTC
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index aff1762fb9..4f4786532c 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -279,6 +279,13 @@ else
>   QEMU_OPTS += --disable-opengl
>   endif
>   
> +ifeq ($(BR2_PACKAGE_QEMU_VIRGLRENDERER),y)
> +QEMU_OPTS += --enable-virglrenderer
> +QEMU_DEPENDENCIES += virglrenderer
> +else
> +QEMU_OPTS += --disable-virglrenderer
> +endif
> +
>   ifeq ($(BR2_STATIC_LIBS),y)
>   QEMU_OPTS += --static
>   endif
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
