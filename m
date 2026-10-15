Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5DECC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2169A4080D;
	Thu, 15 Oct 2026 20:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkCK8HplWQdm; Thu, 15 Oct 2026 20:14:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D330B407FC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792095258;
	b=IVoBzzcOMy20vwm7cew2oHarK9vptVydvNzZ2oMmGE9Du5v2dHOKIw/K0iiHSbRP7qTe
	 AsNYQxjsuBtB0VhacvMETP9JYWyrdV+P7YpnPm019wM9AFNOPMXK6uTsEtKJ6TDTqp3Fw
	 mGAKBkjq+Z++yuQuq9FGS77cVaQV5B9DDJxmAhfQWYNg0wPRPWKlIF+2Cj8H0mj8KvgJP
	 Wj5DpU56mVj1bGatZJGymgrmKM+lT2SyV/uUvaVRZxCCx/EYzBk05uh2AA3Sc89rkt2K+
	 59pFVNi45q8yJsGnJoVcBBWUTOFKcBHcfUFokz+hGOh9IGU8QFRpuQS8fDkg1J0UcNQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792095258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rWJXizU7V/daE0SThfP0t73ZFi1cSZzdgtW0dKDNF3o=;
	b=VBLOGkrlndIaFz78vwjg1hp+n0CKiDM4xkXGIW1qrXqj3+4q2HSGCNtegN9vCpgpjX3u
	 hSBODm39FxoPurPPkhOBBoei3jVjAy0F8elG5cgZCQBRdLVuy/ieyu61av7X+0lePwI80
	 oUPa886GSpe3mC+T6WnhE/LmrS0D/1u25P/kO5cwRWpjmGLuKPeJqX7GAPebYXETKptqs
	 kPJ4CYul3ssD8TFV6kH6WogyVZe5w3SaVF09katXB03EBHQKMCCXa5VuNezVr/IvhC1CS
	 OSOGLo4xjL0i22hZ+ZyxGHNV4Irm+UL40esb5D8mtye0JkX+a3Qpkh4U4jbTlYiKgeQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792095257;
	bh=rWJXizU7V/daE0SThfP0t73ZFi1cSZzdgtW0dKDNF3o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rY5cSvRQxHnCWpiF+Qs51okA9zgV8lNNgBVlLd065nw/hLe5XG+VAtu+CYjvLHXhB
	 H+2YM6NwcFWkFUBfRTHlXVFHmmumBmHNwwVhEtHOIV7ayK0RLn4FXB7IUM5l5fO+/k
	 UVQtLwQ2sPaeshUI5oevGq/1S5tgmuJ3XYe9cuTSt6LEAsCc6DKjkgDfSrO/ow2JZ4
	 1bVymwMtQ/W6MZTspHm002x9LkFKR6DJqCaRwcN4D/jxv72s9cM1FHDTrD7AcuwpkT
	 vvpAvN+2jOtd3I7Mqf6Cfr7Wor9UKPKpsD3O9zbMS7schlPxwMaSgkddLfYOVjHBFn
	 rgMPrUaP0OqJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D330B407FC;
	Thu, 15 Oct 2026 20:14:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64C3F1AB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B58E40452
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTd3hqx9KjBY for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:14:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9E0DE40087
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792095254;
 b=eerk4IemD8JW2bRhA8V9lHbnNiat//vNdeqoiZp7oVe2vahd2nfpWijdSrNRSFnxcpJL
 4jI3cAsGD1rzbAtIEjC9/BlyvW/o6iT87iQfdiP/qYkyn+GeMkwtqIsd/nTXvd4yqB6d4
 kesRWxjgWcryRx7RStO+M6LnuseJcUWosYBxTdqklsnxu/VA5H6qgdyeKbp+MmP10CJOW
 zu/I0fyjabIr2oxmwdvTkL0bBhFf41Pe8mskXmSyry3g6AeXLtjZM2mOzppEV38vOwbaB
 A6b/Gx+nW8gKPEHDSgeRM9MQvC4/Jieq3ujEEZKLyTcfRtHsGeCS6D2CqOEmRpOeHmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792095254;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Thj8OvfLl41gYXJwndngTVRDQ+8b1OHTWTan/3qS2WI=;
 b=FWaChNpYk4931IRthMZiSxcFTEzcZJ04lkbUZRbWDZIly11QHTprUYtmEsUwvXP3Y5WM
 eYgj53bry0hrVTVlYGoTwaoJaZcWLPQxuuNEZDuuLYNoXS5JqUxcJaqt/v3wAcssthoEs
 YVefltHnysJrf9aAMUkBsXcsHMdpLqo2XAzWUeHqekFS2bDTl6i7kljwy2Ix46LbNOhVf
 AMwkBWUVUlUHvNuJcZ7w0gSV7wu6FAnx1Tn9ZPJIHGRUUFalQZxXo3wO4u2JXYcykGXXB
 wEuS4dj+b9yJpkbkQorWuVmaTqdNiZZlQC/OdIT/Y9Gou+pu47QcHIz2gr0RtpS1IPw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=efaUAvHB; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E0DE40087
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:14:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7B5901A1248;
 Thu, 15 Oct 2026 20:14:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3FE0B6075C;
 Thu, 15 Oct 2026 20:14:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8DDF810328629; 
 Thu, 15 Oct 2026 22:14:06 +0200 (CEST)
Date: Thu, 15 Oct 2026 22:14:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, 
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Message-ID: <atEzse9YpghEz6bC@windsurf>
References: <20261013215825.319471-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013215825.319471-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/llvm-project/libclc: fix build
 with llvm 23
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

Hello,

On Tue, Oct 13, 2026 at 11:58:24PM +0200, Bernd Kuhls wrote:
> Buildroot commit 5f79161e4a8756acdb25c8500de9b2dee663f2ac bumped the
> llvm packages from 22.1.8 to 23.1.0 causing configure errors with the
> libclc package:
> 
> -- Check for working CLC compiler: /usr/bin/gcc
> CMake Error at cmake/modules/CMakeTestCLCCompiler.cmake:29 (message):
>   The CLC compiler
> 
>     /usr/bin/gcc
> 
>   is not able to compile a simple OpenCL test program.
> 
>   Output:
> 
>   gcc: error: unrecognized command-line option
>   '--target=spirv64-unknown-unknown'
> 
> Update various configure options to detect the correct host compiler.
> 
> Add post install hooks to create symlink which is needed for mesa3d to
> detect libclc.
> Fixes tests.package.test_mesa3d.TestMesa3DRusticl.test_run:
> 
> Libclc failed to load. Please make sure it is installed and provides
>                 spirv-mesa3d-.spv and/or spirv64-mesa3d-.spv
> 
> For details see
> https://gitlab.archlinux.org/archlinux/packaging/packages/libclc/-/commit/ca75c4b19c76ae856a368d070d914b12f71203a5#line_9b9baac1e_A71
> 
> Fixes:
> https://autobuild.buildroot.net/results/3fc/3fcdcb71be590b090df2f765c68aeaecc44dd215/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for having looked at this problem. Some questions below.

> ---
>  package/llvm-project/libclc/libclc.mk | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/package/llvm-project/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
> index ff00871747..cefdca63d4 100644
> --- a/package/llvm-project/libclc/libclc.mk
> +++ b/package/llvm-project/libclc/libclc.mk
> @@ -36,13 +36,28 @@ LIBCLC_CONF_OPTS = \
>  	-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
>  	-DCMAKE_SHARED_LINKER_FLAGS="$(HOST_LDFLAGS)" \
>  	-DCMAKE_MODULE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
> -	-DCMAKE_C_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
> -	-DCMAKE_CXX_COMPILER="$(CMAKE_HOST_CXX_COMPILER)" \

So we were using gcc

> +	-DCMAKE_C_COMPILER="$(HOST_DIR)/bin/clang" \
> +	-DCMAKE_CXX_COMPILER="$(HOST_DIR)/bin/clang" \

and now we're using clang? Is that what the change is about?

>  	-DLLVM_CMAKE_DIR="$(HOST_DIR)/lib/cmake/llvm" \
> +	-DLIBCLC_TARGET=spirv64-unknown-unknown \
>  	-DLIBCLC_CUSTOM_LLVM_TOOLS_BINARY_DIR="$(HOST_DIR)/bin"
>  
>  HOST_LIBCLC_CONF_OPTS = \
> -	-DLIBCLC_TARGETS_TO_BUILD=spirv64-mesa3d-
> +	-DCMAKE_C_COMPILER_FORCED=ON \
> +	-DCMAKE_CXX_COMPILER_FORCED=ON \
> +	-DCMAKE_C_COMPILER="$(HOST_DIR)/bin/clang" \
> +	-DCMAKE_CXX_COMPILER="$(HOST_DIR)/bin/clang" \
> +	-DLIBCLC_TARGET=spirv64-unknown-unknown

Is it correct to have the same -DLIBCLC_TARGET=spirv64-unknown-unknown
value passed to both the host and target package? What does that
do/mean excactly?

> +define LIBCLC_LINK_STAGING_SPV
> +	ln -sf spirv64-unknown-unknown/libclc.spv $(STAGING_DIR)/usr/share/clc/spirv64-mesa3d-.spv
> +endef
> +LIBCLC_POST_INSTALL_STAGING_HOOKS += LIBCLC_LINK_STAGING_SPV
> +
> +define LIBCLC_LINK_TARGET_SPV
> +	ln -sf spirv64-unknown-unknown/libclc.spv $(TARGET_DIR)/usr/share/clc/spirv64-mesa3d-.spv
> +endef
> +LIBCLC_POST_INSTALL_TARGET_HOOKS += LIBCLC_LINK_TARGET_SPV

A comment above those, perhaps replicating the comment from the
ArchLinux package, would be good to have.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
