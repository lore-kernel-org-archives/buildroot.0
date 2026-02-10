Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71BAEA3F18
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 08:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 969FE81545;
	Tue, 10 Feb 2026 08:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S09hNkAWRyRL; Tue, 10 Feb 2026 08:01:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63BD081422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770710481;
	bh=EV20xNQVBaR3SslWdG2ZvUvuyP6Lxul0yHceUM+T5xo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lp8tQd4e5sgshSy5uoqoFwm0l3/EwCv0TmquLaxEuFuvVAETkFjJDw4+Qji6D3f7p
	 d+JvEVehejnFc132ryKx3Rj22i/yo6Liz89KI2z1pai/Q/LASBDzAounkxpOLtGe/T
	 oru0M9nRjhI6HVCc+C6yd4rYizv3vb4CDDLWKgrUcdX8wTXx6vVDFL3XrIVb7UebH8
	 mxrD1Q3v6Jlk5TcWOXbxcoCLYRJzzGSGjkmBxQS8TpntIR7pufRpF8wNb1rzo2W+mJ
	 T8Gg3hkIw/X0S9FoX4yAFBXk7JBOqqWRkgrBuLCQA2kQDk13qYTQ/gwbAnqM3tZmZw
	 d2SVlCV5PFyiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63BD081422;
	Tue, 10 Feb 2026 08:01:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 214DDF2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 08:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EE9840D9A
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 08:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id golWUkAN4uZs for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 08:01:18 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18DA840D99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18DA840D99
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18DA840D99
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 08:01:16 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 5DF43BDE032E;
 Tue, 10 Feb 2026 09:01:12 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 10 Feb 2026 08:01:12 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Cc: buildroot@buildroot.org, guenther.harrasser@mobileye.com, Chris Packham
 <judge.packham@gmail.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260209132034.3298699-1-jimmy.wesolowski@mobileye.com>
References: <20260202155535.3412990-1-jimmy.wesolowski@mobileye.com>
 <20260209132034.3298699-1-jimmy.wesolowski@mobileye.com>
Message-ID: <a16c18964c63e254812e4baa5cd57b84@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1770710472; bh=Djy3ymeHYdZBTt7BNid/Cjbx5OdNTKev/22Iy3+xYIk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=387AKOO5/Y8zpiNPR58g7SLuK36gxukTTsyAzNzPjqrqQEg4nxer1gCrkSWZWnojb
 ADpLB9d781pF6MTa+9f2FcK4iN1eZZ0R6Q2pagfqAhP2RHrvdMk1jMjMghFBzHBOjE
 S4YMM9e4VP+M/Q3OrLjXJY3aYx1jsyLh+ki1E0iA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=387AKOO5
Subject: Re: [Buildroot] [PATCH v2 1/1] package/coremark: port for mips-i6500
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jimmy, Vladimir, all

thank you for the update, technical remarks below.

Most important: You do not need the extra files in the mips-i6500 
directory. They are identical to the ones in linux64, except for white 
space and the copyright inserted in the file headers.

This would reduce your patch to the addition of EXTRA_CFLAGS, which is 
probably what most people use when adapting this package. It also covers 
my current customization.

Please also check the output of utils/checkpackage package/coremark/*

On 2026-02-09 13:20, Jimmy Durand Wesolowski wrote:
> From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> 
> Compile for MIPS I6500 CPU 64-bit, with all compiler flags as
> recommended by MIPS
> 
> One missing flag -s "-Tmsym32.ld" since linker script
> "msym32.ld" does not exist in the MIPS toolchain

Since the actual flags are part of the configuration (EXTRA_CFLAGS), you 
might choose a more appropriate commit message.

> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
> 
> ---
> Changes v1 -> v2:
>   - do not add mips-i6500 through a patch, but copy it through rsync
>     in POST_EXTRACT_HOOKS (suggested by
>     Andreas Ziegler <br025@umbiko.net>)
>   - allow specifying a port directory to use through kconfig, such as
>     mips-i6500. The default stays linux for 32-bits architecture,
>     linux64 for 64.
>   - allow passing extra PORT_CFLAGS through kconfig  (suggested by
>     Andreas Ziegler <br025@umbiko.net>)
> 
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
> ---
>  package/coremark/Config.in                  |  19 ++
>  package/coremark/coremark.mk                |  23 +-
>  package/coremark/mips-i6500/core_portme.c   | 336 ++++++++++++++++++++
>  package/coremark/mips-i6500/core_portme.h   | 291 +++++++++++++++++
>  package/coremark/mips-i6500/core_portme.mak | 140 ++++++++
>  5 files changed, 805 insertions(+), 4 deletions(-)
>  create mode 100755 package/coremark/mips-i6500/core_portme.c
>  create mode 100755 package/coremark/mips-i6500/core_portme.h
>  create mode 100755 package/coremark/mips-i6500/core_portme.mak

The mips-i6500 files are unnecessary.

> diff --git a/package/coremark/Config.in b/package/coremark/Config.in
> index f0e13eda63..bb29a8093f 100644
> --- a/package/coremark/Config.in
> +++ b/package/coremark/Config.in
> @@ -6,3 +6,22 @@ config BR2_PACKAGE_COREMARK
>  	  used in embedded systems
> 
>  	  https://www.eembc.org/coremark/
> +
> +if BR2_PACKAGE_COREMARK
> +config BR2_PACKAGE_COREMARK_PORT
> +        string "coremark port directory"
> +        default "linux" if !BR2_ARCH_IS_64
> +	default "linux64" if BR2_ARCH_IS_64
> +        help
> +          Path to the platform specific port directory.
> +	  This allow using a different platform specific port than the
> +	  default indicated if the support is available in CoreMark.
> +

This block is not necessary.

> +config BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA
> +	string "coremark port extra CFLAGS"
> +	default ""
> +	help
> +	  Additional CFLAGS to pass to CoreMark platform specific port.
> +	  Any additional flags indicated here will be added to the
> +	  CFLAGS_PORT variable.
> +endif
> diff --git a/package/coremark/coremark.mk 
> b/package/coremark/coremark.mk
> index 9ea8693e71..3c367ff90b 100644
> --- a/package/coremark/coremark.mk
> +++ b/package/coremark/coremark.mk
> @@ -9,14 +9,29 @@ COREMARK_SITE = $(call 
> github,eembc,coremark,v$(COREMARK_VERSION))
>  COREMARK_LICENSE = Apache-2.0
>  COREMARK_LICENSE_FILES = LICENSE.md
> 
> +COREMARK_CFLAGS = \
> +        $(TARGET_CFLAGS) \
> +	$(call qstrip,$(BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA))
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +COREMARK_CFLAGS += -DUSE_PTHREAD
> +endif # BR2_TOOLCHAIN_HAS_THREADS=y
> +
> +define COREMARK_MIPS_I6500
> +	rsync --archive --update \
> +		$(COREMARK_PKGDIR)/mips-i6500/ $(@D)/mips-i6500/
> +endef # COREMARK_MIPS_I6500
> +
> +COREMARK_POST_EXTRACT_HOOKS += $(if 
> $(BR2_MIPS_NABI64),COREMARK_MIPS_I6500)

The POST_EXTRACT_HOOK is not needed.

> +
>  define COREMARK_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
> -		PORT_CFLAGS="$(TARGET_CFLAGS)" \
> -		PORT_DIR=linux$(if $(BR2_ARCH_IS_64),64) EXE= link
> -endef

PORT_DIR should stay as is. But you need to specify COREMARK_CFLAGS 
instead of TARGET_CFLAGS.

> +		PORT_CFLAGS="$(COREMARK_CFLAGS)" \
> +		PORT_DIR=$(BR2_PACKAGE_COREMARK_PORT) EXE= link
> +endef # COREMARK_BUILD_CMDS
> 
>  define COREMARK_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D $(@D)/coremark $(TARGET_DIR)/usr/bin/coremark
> -endef
> +endef # COREMARK_INSTALL_TARGET_CMDS
> 
>  $(eval $(generic-package))

<...>

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
