Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD52CA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 21:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEBDD83A8B;
	Fri, 22 Aug 2025 21:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDGziO0viewB; Fri, 22 Aug 2025 21:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1FB183AA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1FB183AA3;
	Fri, 22 Aug 2025 21:06:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DC07D8
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F4DE40BBB
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZClz-YdWmGy for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 21:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 280C740BB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 280C740BB6
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 280C740BB6
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:06:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E9D521A0D52;
 Fri, 22 Aug 2025 21:06:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B52B6604AD;
 Fri, 22 Aug 2025 21:06:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C7DF81C22CC97; 
 Fri, 22 Aug 2025 23:06:31 +0200 (CEST)
Date: Fri, 22 Aug 2025 23:06:30 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250822230630.76b6f36a@windsurf>
In-Reply-To: <20250820163921.1968030-3-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
 <20250820163921.1968030-3-angelo.compagnucci@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755896792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YNIQHx/8DF16N9Nab4J2EDBdUU4Ib4rDq+uSrlpVVa8=;
 b=HwB/KeX9Qkx3Hu38FiS3gjTLcHsUb/1fnou+EyL7WZW89DVZICkHHwK+ih9PEyUVQv4tFU
 PJtdGa2m5ITf7MgjsZcKm1sJk2AvglbAXxhIgwi2LEQZxGU2PILFbMNSTzeW2hZyWwMtCR
 6ZyL8oB/rDjcg+yMHIe6P2AgYgbbEaWfbnCGZ5M6Buf/IbkWh7j8Nk41HovE+dp9H7Ww3m
 ILz6x3fyJuKRN9Q8hRzrvepdB/5qjEE1lvnV2Cy+TsMbw5z5KwA2Mci66ziCQEQEQheMQb
 yOPLyBAcy7aojV2gbEQqLrUFTU/1/IhU78fy/yXOe7vIBNLjqKMpClKvGaY8hQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HwB/KeX9
Subject: Re: [Buildroot] [PATCH 2/4 v2] package/libcupsfilters: new package
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

Hello Angelo,

Thanks a lot for this great work! I have a number of comments/questions
below.

On Wed, 20 Aug 2025 18:39:19 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:


> diff --git a/package/libcupsfilters/Config.in b/package/libcupsfilters/Config.in
> new file mode 100644
> index 0000000000..e664869a41
> --- /dev/null
> +++ b/package/libcupsfilters/Config.in
> @@ -0,0 +1,34 @@
> +config BR2_PACKAGE_LIBCUPSFILTERS
> +	bool "libcupsfilters"
> +	# needs fork()
> +	depends on BR2_USE_MMU
> +	depends on BR2_INSTALL_LIBSTDCPP # qpdf
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_PACKAGE_CUPS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qpdf
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC # qpdf

For the ones that don't have a comment, are they directly dependencies
due to libcupsfilter itself?

> +	select BR2_PACKAGE_JPEG

This dependency doesn't seem to be mandatory according to
https://github.com/OpenPrinting/libcupsfilters/blob/master/INSTALL.md#prerequisites-for-compilation

> +	select BR2_PACKAGE_FONTCONFIG

Same.

> +	select BR2_PACKAGE_FREETYPE

There's no mention of freetype in INSTALL.md nor in configure.ac.

> +	select BR2_PACKAGE_LCMS2
> +	select BR2_PACKAGE_LIBGLIB2

There's no mention of glib2 in INSTALL.md nor in configure.ac.

> diff --git a/package/libcupsfilters/libcupsfilters.mk b/package/libcupsfilters/libcupsfilters.mk
> new file mode 100644
> index 0000000000..9cf449ac8d
> --- /dev/null
> +++ b/package/libcupsfilters/libcupsfilters.mk
> @@ -0,0 +1,93 @@
> +################################################################################
> +#
> +# libcupsfilters
> +#
> +################################################################################
> +
> +LIBCUPSFILTERS_VERSION = 2.1.1
> +LIBCUPSFILTERS_SITE = https://github.com/OpenPrinting/libcupsfilters/releases/download/$(LIBCUPSFILTERS_VERSION)
> +LIBCUPSFILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
> +LIBCUPSFILTERS_LICENSE_FILES = COPYING
> +LIBCUPSFILTERS_CPE_ID_VENDOR = linuxfoundation

Where did you find this? I don't see any CPE entry about libcupsfilter,
so we can't know which CPE it will get for the moment.

> +LIBCUPSFILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg

As requested above: this needs to be revisited.

> +LIBCUPSFILTERS_INSTALL_STAGING = YES
> +
> +LIBCUPSFILTERS_CONF_OPTS = \
> +	--disable-mutool \
> +	--disable-foomatic \
> +	--disable-braille \
> +	--enable-imagefilters \

What is the impact of this? Do we need it unconditionally?

> +	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
> +	--with-sysroot=$(STAGING_DIR) \
> +	--with-pdftops=pdftops \
> +	--with-jpeg \

jpeg seems optional.

> +	--with-test-font-path=/dev/null \
> +	--without-rcdir

You can probably check in ./configure --help for other things to
disable, like:

	--without-jpegxl

(I honestly didn't find any other).


> +define LIBCUPSFILTERS_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/cups-filters/S82cups-browsed \
> +		$(TARGET_DIR)/etc/init.d/S82cups-browsed

We really don't want libcupsfilter to install an init script that comes
from package/cups-filters/. If libcupsfilter is now responsible for
this, the init script should be moved there (or possibly copied
initially, and then removed in the commit that bumps cups-filters, or
something like that).

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
