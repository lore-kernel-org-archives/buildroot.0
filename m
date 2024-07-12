Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B54AC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8C5741203;
	Fri, 12 Jul 2024 15:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kHO7JIH8Yro; Fri, 12 Jul 2024 15:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF66412A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABF66412A4;
	Fri, 12 Jul 2024 15:37:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75C6F1BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62CB1412A4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CoG3NZey32Qf for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:37:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5ECD41203
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5ECD41203
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5ECD41203
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:37:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE98C1BF210;
 Fri, 12 Jul 2024 15:37:35 +0000 (UTC)
Date: Fri, 12 Jul 2024 17:37:34 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240712173734.30592e67@windsurf>
In-Reply-To: <20240627220223.6687-3-aperez@igalia.com>
References: <20240627220223.6687-1-aperez@igalia.com>
 <20240627220223.6687-3-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720798656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/+kKnvS5bicN/8pnHn8ZCCysY7OEDg1BE+7PDBGUCM=;
 b=QGzKKGrdOJhipa3mdoBBsNS4No+4d81BazhIT263KQT3PVN4UgKnRJTDG7pfFPruN7rIfh
 06KLJrQnL26NmVPuU2lSm5ltMw6LL4bCo6ThKQk3HvRTeTuZfO34d2hJztsPYvrnveRrrM
 RvIZWWJjlcN6m/7RUJDX3cwrzFijyzkFSgOhYUN91YpGGX6V+JYA2mzJiJyH6CqUckSIoF
 f0x+VUcoblJL1mfcS4dotdo1HNX4Hffbl6gZm4VHMRQzwAN0vIT8XqwvohZ07QNYwIie1+
 MZLMbENcd+kIyJMCBHQgDpuTUW9HE90LMVWFFNzf26t92iN6stD6YEJ/Zyt9oQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QGzKKGrd
Subject: Re: [Buildroot] [PATCH 2/2] package/sysprof: update to version 46.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Will Newton <will.newton@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adrian,

On Fri, 28 Jun 2024 01:02:19 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Bring Sysprof twelve years into the future by updating it to the most
> recent release. The GUI now uses GTK4, for which there is not yet a
> package, so for now the option is removed.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Would you want to be added in the DEVELOPERS file for this package? You
just did a big bump, it would make sense if you helped fixing the build
failures that might results for this bump :-)

> diff --git a/package/sysprof/0001-define-NT_GNU_BUILD_ID.patch b/package/sysprof/0001-define-NT_GNU_BUILD_ID.patch
> deleted file mode 100644
> index dcc2cbe67cc..00000000000
> --- a/package/sysprof/0001-define-NT_GNU_BUILD_ID.patch
> +++ /dev/null

Dropping this patch required an updated in .checkpackageignore.


> diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
> index 3913274be4f..4ea1d3ebf1d 100644
> --- a/package/sysprof/Config.in
> +++ b/package/sysprof/Config.in
> @@ -1,31 +1,26 @@
>  config BR2_PACKAGE_SYSPROF
>  	bool "sysprof"
> -	depends on BR2_USE_WCHAR # glib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> -	depends on BR2_USE_MMU # glib2
> -	# In its util.h file, sysprof contains architecture-specific
> -	# code
> -	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
> +	depends on BR2_USE_WCHAR # glib2, libdex, json-glib
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libdex, json-glib, polkit
> +	depends on BR2_USE_MMU # glib2, libdex, json-glib
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libunwind, polkit
> +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
> +	depends on !BR2_STATIC_LIBS # polkit

Also because of libunwind.

> +	depends on !BR2_OPTIMIZE_FAST # polkit
> +	select BR2_PACKAGE_JSON_GLIB
> +	select BR2_PACKAGE_LIBDEX
>  	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBUNWIND
> +	select BR2_PACKAGE_POLKIT
>  	help
>  	  Sysprof is a statistical, system-wide profiler that can
>  	  profile user and kernel code using the perf API.
>  
>  	  http://sysprof.com
>  
> -if BR2_PACKAGE_SYSPROF
> -
> -config BR2_PACKAGE_SYSPROF_GUI
> -	bool "sysprof GUI"
> -	depends on BR2_PACKAGE_LIBGTK2
> -	select BR2_PACKAGE_LIBGLADE
> -	select BR2_PACKAGE_GDK_PIXBUF
> -	help
> -	  GUI for the sysprof system-wide statistical profiler.
> -
> -endif
> -
> -comment "sysprof needs a toolchain w/ wchar, threads"
> +comment "sysprof needs a toolchain w/ dynamic libraray, wchar, threads, gcc >= 7"
>  	depends on BR2_USE_MMU
> -	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS || \

BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS is an architecture dependency, so
it should have been handled like BR2_USE_MMU.

> +		BR2_STATIC_LIBS || BR2_OPTIMIZE_FAST

I changed the handling of BR2_OPTIMIZE_FAST to be like what polkit does:

comment "sysprof can't be built with Optimize for fast"
	depends on BR2_OPTIMIZE_FAST

not amazing, but at least consistent with polkit.

BTW, pretty mind-blowing that sysprof absolutely requires polkit...


> -SYSPROF_VERSION = 1.2.0
> -SYSPROF_SITE = http://sysprof.com
> -SYSPROF_DEPENDENCIES = libglib2
> -SYSPROF_LICENSE = GPL-2.0+
> +SYSPROF_VERSION_MAJOR = 46
> +SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).0
> +SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
> +SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
> +SYSPROF_LICENSE = GPL-3.0+
>  SYSPROF_LICENSE_FILES = COPYING
> +SYSPROF_DEPENDENCIES = libglib2 libdex libunwind json-glib polkit
> +SYSPROF_CONF_OPTS += \

= instead of +=

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
