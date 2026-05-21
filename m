Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76057CD5BAC
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 19:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 264F184457;
	Thu, 21 May 2026 19:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBiSknlpXZsZ; Thu, 21 May 2026 19:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3653E84414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779390223;
	bh=GZ5AO07UIOc1pStC1fUaN/Yna32zMpQRRTDF8ZPPZrg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CcsvzJVPXLjdXgTL5G31he/cXMSb5UIP4pKV4TeT9TfAmUAHqtpwg46/JX5Z8dtWs
	 5mXXoRwTbq7Sf/wThCIfrbgdlPgcsGC3B9UQ4aMGx/XOfBsVjk/+ac5rLhSqeZ51ho
	 6KYMdZ9Pa8eGi0COcbLMplR8gD3y2cztbC5ZxG/7bit6dnj5mfi+R96P8Zt/IqBFPw
	 t8hJxkVGijBLQ5E4Lww3MtuWQuinhXZIJh9Jtvd1oM4ljYIqRHYYt0JpM8IzAHD8Kc
	 8xYTPSx/gorZ8nXHWPEikPW+F/dYY4knJJwDkKTRZAQ2OioDDniioVmLpxpcvUIuCF
	 Pt2x/wBsKoXBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3653E84414;
	Thu, 21 May 2026 19:03:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8169E265
 for <buildroot@buildroot.org>; Thu, 21 May 2026 19:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6690D613B1
 for <buildroot@buildroot.org>; Thu, 21 May 2026 19:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyOLSZd5wqqK for <buildroot@buildroot.org>;
 Thu, 21 May 2026 19:03:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F2D560F97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F2D560F97
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F2D560F97
 for <buildroot@buildroot.org>; Thu, 21 May 2026 19:03:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56F22B97C54A; Thu, 21 May 2026 21:03:37 +0200 (CEST)
Message-ID: <7b9ff6ce-5eae-475a-b7f9-b864a7ca614f@rnout.be>
Date: Thu, 21 May 2026 21:03:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
 <20260515-virglrenderer-v7-3-1f1814b65ccd@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260515-virglrenderer-v7-3-1f1814b65ccd@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779390218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=kiLY4iF956RW5u8+kosgqj2hnrB7poVRf2Ofk39yNbs=;
 b=nmU4WnqNQDS1xdRm1pSNGB0il/gIKnRai/dqJs8zl1BcKNHWAnLpak95xfeRqpaq2J5E6a
 Aj91QIBYXkAKZxjYS0le4Js/ouDofP8CLNON9uocqKp6EIroKIwH02N519go2wEXQq1NDt
 w7vqVx5lAPbRnNbwnrtEfoLaTGaHOy/siRp0TZq/t82Aj6v45n3VNWzrI7c7PYQWhEsnu0
 idSsY7CpviaWZDbDnzmuF1kLZFkkoNBj1+qfFTnGQ4w0IE1QI8T2GecH7ltw6ds/mD3XGD
 sAWukDYu2SagcjZ+XVwjnplikvRSKMX16dTQKvuBZqA0Y6vzKgMCNzRya5Rp/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=nmU4WnqN
Subject: Re: [Buildroot] [PATCH v7 3/8] package/libepoxy: remove gl/egl
 dependency
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
> Libepoxy is a library for handling OpenGL function pointer management.
> 
> It has backends for egl/glx, which may at one point have been mandatory
> to enable, but the library now builds with none of the above enabled
> features, as seen below.
> 
>    libepoxy 1.5.10
> 
>      User defined options
>        Cross files            : /home/joseph/br-test-pkg/arm-aarch64/build/libepoxy-1.5.10//buildroot-build/cross-compilation.conf
>        b_pie                  : false
>        b_staticpic            : true
>        buildtype              : release
>        build.cmake_prefix_path: /home/joseph/br-test-pkg/arm-aarch64/host/lib/cmake
>        default_library        : shared
>        docs                   : false
>        egl                    : no
>        glx                    : no
>        libdir                 : lib
>        build.pkg_config_path  : /home/joseph/br-test-pkg/arm-aarch64/host/lib/pkgconfig
>        prefix                 : /usr
>        strip                  : false
>        tests                  : false
>        x11                    : false
> 
> Removing these dependencies allows for some applications that require it
> as a build dependency, but otherwise can run headless or without GL, to
> build and function, using other graphics APIs or display pipelines.
> 
> Weston, for example, can still use Vulkan and DRM when linked to
> libepoxy without GL/EGL/X11 support.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

  Looks good to me. However, now I applied the first two patches to master, so I 
can't really apply this one to next. Fortunately :-) I have some comments later 
in the series, so I'll just mark the rest as Changes Requested, and you can 
repost after the 2026.05 release and next is merged back in master.

  When you do, you can add on this patch my

Acked-by: Arnout Vanecappelle <arnout@rnout.be>

  (BTW if you post it around June 8, you have the biggest chance that I'll 
actually pick it up and it won't be ignored for another six months.)

  Regards,
  Arnout

> ---
>   package/libepoxy/Config.in | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
> index 9da190b895..4b23497d46 100644
> --- a/package/libepoxy/Config.in
> +++ b/package/libepoxy/Config.in
> @@ -1,12 +1,12 @@
>   config BR2_PACKAGE_LIBEPOXY
>   	bool "libepoxy"
> -	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
>   	select BR2_PACKAGE_XUTIL_UTIL_MACROS
>   	help
>   	  Epoxy is a library for handling OpenGL function pointer
>   	  management for you.
>   
> -	  https://github.com/anholt/libepoxy
> +	  It can be built without EGL or GLX support for packages
> +	  that use libepoxy as a mandatory dependency but do not need
> +	  OpenGL entry points at runtime.
>   
> -comment "libepoxy needs an OpenGL and/or OpenGL EGL backend"
> -	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
> +	  https://github.com/anholt/libepoxy
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
