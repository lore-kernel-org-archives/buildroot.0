Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC4EEED615
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 17:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82E3B8175B;
	Thu,  1 Jan 2026 17:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ie1wOP4R7aAJ; Thu,  1 Jan 2026 17:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A13D8136A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767286820;
	bh=u5Lvbx9zl165rB+uu5RDdxbAOtC9JjsQNx1mwOnPDwQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iFv4nAYS4u0iYnbzI0WefVwTGrdqVpQrjgI3ERxix75+G4gfc8HR/pRIeanBMVo5v
	 tYxeFwD3uRUJ9rH7C2Ht28NrypkwXGE8VYJsx26D4YC/xCXDTn0tyxzwvuMm51eScm
	 xDy6AIb9IoBQr2opf18gECzPpE15+Sl2GyUL137rJdgnRONRJNLV4ysuRcT3D4TKfF
	 BcmWGLwIZM1y8+TcDu+rBA6XuBvp8pKIt9zGfYvVV0E4fSA2zATmyg7RQoRHyfo+hd
	 ihCkwSZfV1UTVkb3uN4eC+OajtYKP6iuzJM1m8vRKxmHBqegFWI5iTCmojluTopuln
	 mHsFKHqvS0lng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A13D8136A;
	Thu,  1 Jan 2026 17:00:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B970B19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F4748136A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izLfDB8Rgk1N for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 17:00:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DADB81346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DADB81346
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DADB81346
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:00:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2D69A1A25A1;
 Thu,  1 Jan 2026 17:00:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EFC9560749;
 Thu,  1 Jan 2026 17:00:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1CF50113B077F; Thu,  1 Jan 2026 18:00:12 +0100 (CET)
Date: Thu, 1 Jan 2026 18:00:11 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, eric.le.bihan.dev@free.fr,
 fontaine.fabrice@gmail.com, guillaume.chaye@zeetim.com
Message-ID: <20260101180011.5650067c@windsurf>
In-Reply-To: <20251019064503.2583945-3-thomas@devoogdt.com>
References: <CACXRmJitiNM=oBYeGc2C40vP=wRYaaYJjiGMN7siwTWJ=vWPwQ@mail.gmail.com>
 <20251019064503.2583945-1-thomas@devoogdt.com>
 <20251019064503.2583945-3-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767286814; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zFxi/Usl5qjNawmXEODKC8V8NxEWaUzClibPq+lEX+M=;
 b=rFDtDsxy2jruUPaBbwUq+B4wdkAkN2dBeaUu1+Ei7k1dcvhzQswvnVkbyuS4gJYTyw5XkG
 pmawv9Hk+EwJTlP0GXSzaqwAhHbDY//JQbii3PL1lnhVooWPph6N/YXvFcSDXdW5jShDr4
 2L/QB+XfQeQ15ssxfNv7nqftP4jQIEZpOI5nBfuFx4TDmUQHrAe/kjt8ZF+EjvMpgqkwJy
 saxbrSBClcxgrrIg14/xD3faIonJfnSHpW2Rpm/jXEGbAslrbbMRKW/NNHqW+jKeQVd9Zf
 xtu9ZZasrowQlCpBjk0lh1XcMrT9WOusqVcUqCr7X/QnMF9pa5A+cEcrhiGD7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=rFDtDsxy
Subject: Re: [Buildroot] [PATCH v6] package/librsvg: bump version to 2.61.1
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

On Sun, 19 Oct 2025 08:45:03 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> This is a major update, which replaces autotools with meson.
> The package uses cargo in the background, so copy the relevant
> environment from the cargo package to get things working.
> 
> Note that the download URL has been changed because cargo
> vendoring needs .tar.gz for it's post_process_unpack.
> 
> Announcement (for what it's worth):
>  - https://gitlab.gnome.org/GNOME/librsvg/-/releases/2.61.1
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Thanks for the patch!

> cat libgtk4.config
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_LIBGTK4=y

It's good to test large configs, but they risk bringing extra
dependencies, making you not aware of dependencies you might be missing
for librsvg.

I realized only later that this patch needs cargo-c, which isn't in
Buildroot yet. Could you make sure to always send patches with their
dependencies?


> -LIBRSVG_VERSION_MAJOR = 2.50
> -LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).9
> -LIBRSVG_SITE = https://download.gnome.org/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
> -LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
> +LIBRSVG_VERSION = 2.61.1
> +LIBRSVG_SITE = https://gitlab.gnome.org/GNOME/librsvg/-/archive/$(LIBRSVG_VERSION)
>  LIBRSVG_INSTALL_STAGING = YES
> -LIBRSVG_CONF_ENV = \
> -	LIBS=$(TARGET_NLS_LIBS) \
> -	RUST_TARGET=$(RUSTC_TARGET_NAME)
> -LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools
> -HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
> -LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf host-rustc libglib2 libxml2 pango \
> -	$(TARGET_NLS_DEPENDENCIES)
> -HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libglib2 host-libxml2 host-pango host-rustc
>  LIBRSVG_LICENSE = LGPL-2.1+
>  LIBRSVG_LICENSE_FILES = COPYING.LIB
>  LIBRSVG_CPE_ID_VENDOR = gnome
> -# We're patching gdk-pixbuf-loader/Makefile.am
> -LIBRSVG_AUTORECONF = YES
> +
> +LIBRSVG_DOWNLOAD_POST_PROCESS = cargo
> +LIBRSVG_DL_ENV = $(PKG_CARGO_ENV)
> +
> +LIBRSVG_CONF_ENV = $(PKG_CARGO_ENV)
> +LIBRSVG_NINJA_ENV = $(PKG_CARGO_ENV)
> +LIBRSVG_CONF_OPTS = \
> +	-Dtriplet=$(RUSTC_TARGET_NAME) \
> +	-Drsvg-convert=disabled \
> +	-Dpixbuf-loader=disabled \
> +	-Ddocs=disabled \
> +	-Dtests=false
> +LIBRSVG_DEPENDENCIES = \
> +	host-cairo \

Are you sure host-cairo is needed?

> +	host-cargo-c \
> +	host-libxml2 \

And host-libxml2?

> +	host-pango \

And host-pango2 ?

> +	host-rustc \
> +	cairo \
> +	gdk-pixbuf \

According to the documentation of librsvg, gdk-pixbuf is an optional
dependency.

However, according to the documentation, freetype is mandatory. You get
it automatically as it is a dependency of cairo, but I think it would
be preferable to express this dependency here.

> +	libglib2 \
> +	libxml2 \
> +	pango \
> +	$(TARGET_NLS_DEPENDENCIES)
> +
> +HOST_LIBRSVG_CONF_ENV = $(HOST_PKG_CARGO_ENV)
> +HOST_LIBRSVG_NINJA_ENV = $(HOST_PKG_CARGO_ENV)
> +HOST_LIBRSVG_CONF_OPTS = \
> +	-Dintrospection=disabled
> +HOST_LIBRSVG_DEPENDENCIES = \
> +	host-cairo \
> +	host-cargo-c \
> +	host-gdk-pixbuf \

Maybe not needed?

Could you investigate this, and resend as part of the cargo-c series?

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
