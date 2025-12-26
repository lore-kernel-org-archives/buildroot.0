Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7943DE8FDA5
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 09:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4973460BDE;
	Fri, 26 Dec 2025 09:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pSTzeVeV0s3; Fri, 26 Dec 2025 09:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14B9960B5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766740496;
	bh=hKSok7NyOvQVfCX+bgk7I43urutT2f1xfcpm+raVPYg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=INheUSYWxMdAvVPTaYcxyM7MsIJWGIlfwoWyH/sE1D9V7pk4druE5vbT/MubWsnr4
	 zvjpjEnfTwzCJwfICgYdFMFYvgeRdlLGm7gSzAYvg/tbbY1bUvgnVDKBIQpITWdg3l
	 psRzy5CHRhTuqNHLq+ws1OVqpcR3eepFTuldSrVB/1TFKwYe0hNeo6iOH7pcfNcZil
	 iqY6bsUwKNLlq2O9in2gGt95qXWyF4CJT8jA8t3Efi488HtKaf+CiN+mcmTotMbfOw
	 9bv0oyfAu1LzTzwnx0sdqjHr/d5yEIaWTSDqw1fFol0qE/k9sPKAQT58TheNpo7hei
	 3z2caKwwHGXaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14B9960B5E;
	Fri, 26 Dec 2025 09:14:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E916119
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 09:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D501408F7
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 09:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoTJujBNnljv for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 09:14:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AB2A408F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AB2A408F2
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AB2A408F2
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 09:14:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C7D99C1BEB0
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 09:14:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DE624606E4;
 Fri, 26 Dec 2025 09:14:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0FC36103C8C77; Fri, 26 Dec 2025 10:14:45 +0100 (CET)
Date: Fri, 26 Dec 2025 10:14:45 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Romain Naour
 <romain.naour@gmail.com>, Thomas Devoogdt <thomas.devoogdt@barco.com>
Message-ID: <20251226101445.2b29f439@windsurf>
In-Reply-To: <20251218125030.154446-1-thomas@devoogdt.com>
References: <20251218125030.154446-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766740489; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pBI8EpEZLmaqLSQ243QDUAfaW1k5X3fd3kt0POewU9k=;
 b=1M+3JdbOeag/MzkLL1HWP25tdl7qCRupJQzk2afD/lPWwWfT6EfcgWg6jzWnK0F+1cHoJp
 jUqreJe3nbADtZ+KB4BKDYaBX/5YaqHsPoYkOyzXry7pkEx3OB1cbCksheY4ldl5Ec4o3A
 cuf5OpG1qHU0LrUVuNOrusbXAaZ6nDIuKxFEkwa2gvWO2dvNFXbRZTIkcBikv8TRknIOBE
 O8CIEZQ2fdpMfz8SzS8LbExwe3qf7K6xHWyX1Su8ox0wMyMFsr/meX00ryUhqaUdmefwN2
 k16DDCGrutmaQe0MtXe4J0or3w/392K3lwUT/q3FwDSKgvDULIELxQyDXYexQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1M+3JdbO
Subject: Re: [Buildroot] [PATCH] package/mesa3d: fix compilation with
 host-llvm enabled
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

Hello Thomas,

Thanks for your patch!

On Thu, 18 Dec 2025 13:50:29 +0100
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Meson's custom LLVM parser uses llvm-config with a default search path of
> /usr/bin, causing it to detect the host system's llvm-config (version 18.1.3)
> instead of the buildroot-compiled one. This forces all LLVM-related packages to
> match version 18.1.3, but since the host system lacks llvmspirvlib, the build
> fails. This patch forces Meson to use the buildroot-compiled llvm-config.
> 
> Fixes:
> 
>   llvm-config found: YES (/usr/bin/llvm-config-18) 18.1.3
>   Run-time dependency LLVM (modules: bitwriter, core, coverage, engine, executionengine, instcombine, irreader, libdriver, linker, lto, mcdisassembler, mcjit, native, option, scalaropts, target, transformutils, all-targets, coroutines, frontenddriver, frontendhlsl, lto, windowsdriver) found: YES 18.1.3
>   Dependency LLVMSPIRVLib found: NO. Found 15.0.0.0 but need: '>= 18.1' ; matched: '>= 15.0.0.0', '< 18.2'
>   Run-time dependency llvmspirvlib found: NO (tried cmake)
> 
>   output/build/host-mesa3d-25.0.6/meson.build:1882:21: ERROR: Dependency lookup for LLVMSPIRVLib with method 'pkgconfig' failed: Invalid version, need 'LLVMSPIRVLib' ['>= 18.1'] found '15.0.0.0'.
> 
>   A full log can be found at /home/thomas/buildroot/output/build/host-mesa3d-25.0.6/buildroot-build/meson-logs/meson-log.txt
>   make[1]: *** [package/pkg-generic.mk:263: /home/thomas/buildroot/output/build/host-mesa3d-25.0.6/.stamp_configured] Error 1
>   make: *** [Makefile:83: _all] Error 2
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/mesa3d/mesa3d.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 6fcbf96c803..36bc3d6542a 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -40,6 +40,7 @@ ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
>  MESA3D_DEPENDENCIES += host-llvm llvm
>  MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
>  MESA3D_CONF_OPTS += -Dllvm=enabled
> +HOST_MESA3D_CONF_ENV += LLVM_CONFIG="$(HOST_DIR)/bin/llvm-config"

This looks odd to me, as it isn't tied to us passing -Dllvm=<something>
to HOST_MESA3D_CONF_OPTS.

If LLVM support in host-mesa3d is needed, then we should pass
-Dllvm=enabled and this LLVM_CONFIG variable. If LLVM support in
host-mesa3d is not needed (which I would recommend to try first), then
we should pass -Dllvm=disabled, and passing LLVM_CONFIG should not be
needed.

The other thing that bothers me is that to do the same thing ("i.e
passing the path to llvm-config"), we're using here two different
mechanisms: MESA3D_MESON_EXTRA_BINARIES for the target mesa3d package,
and LLVM_CONFIG for the host mesa3d package. This is not consistent and
therefore isn't great.

Could you try to improve those two aspects?

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
