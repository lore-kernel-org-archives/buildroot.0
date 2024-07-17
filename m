Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4060FC3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 20:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AF8740CA1;
	Wed, 17 Jul 2024 20:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtmZdKiUAVn2; Wed, 17 Jul 2024 20:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D787440C15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D787440C15;
	Wed, 17 Jul 2024 20:45:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB68A1BF846
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFBFC80BC3
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2EDPU-fz7FH for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 20:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B4FB80B6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B4FB80B6A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B4FB80B6A
 for <buildroot@busybox.net>; Wed, 17 Jul 2024 20:45:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C300C0006;
 Wed, 17 Jul 2024 20:44:57 +0000 (UTC)
Date: Wed, 17 Jul 2024 22:44:56 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240717224456.3434e170@windsurf>
In-Reply-To: <20240403084807.512825-2-francois.perrad@gadz.org>
References: <20240403084807.512825-1-francois.perrad@gadz.org>
 <20240403084807.512825-2-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721249097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ow0AJNnl1ZiahdYdIZ4mZFbvh8yOXU6QZMiDNVH9zQk=;
 b=olNuUUmW06yPBdI/HpVCCXZN2imYkQdlGqnLB6KGyHZHmNn/vH/mY8g1dVHISw8GmLid/3
 IhFtrGjJfJeUPfviPVrXHErcuUGSlBw8pxYmUGXWxe6bi8kkWjr3pSWyTvYQ84jtFCHBTo
 3GWrJ7F5TeQqMiTOJRE+2ZfOpMAqX8aqHwgx5WS8OMOL/LLpXwJ6MzLfnuB5MiYCaQ3Q6m
 FgJC521dexNMHhHr+eyqDv4Tk2g9oFA2OP3vIqtmZroNEOLd9x/4NZNYLywnfkFJY/9Jrm
 XEhdJo0shFfqeWkHtuMbZi4VhZzUUKqgkJhKjUlMiypLrDMdAVU6nTIwF55ncA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=olNuUUmW
Subject: Re: [Buildroot] [PATCH 2/2] package/libgtk4: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Apr 2024 10:48:07 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                   |   1 +
>  package/Config.in            |   1 +
>  package/libgtk4/Config.in    | 106 +++++++++++++++++++++++++++++++++
>  package/libgtk4/libgtk4.hash |   5 ++
>  package/libgtk4/libgtk4.mk   | 111 +++++++++++++++++++++++++++++++++++
>  5 files changed, 224 insertions(+)
>  create mode 100644 package/libgtk4/Config.in
>  create mode 100644 package/libgtk4/libgtk4.hash
>  create mode 100644 package/libgtk4/libgtk4.mk

I've applied, after doing a few changes. See below.


> diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
> new file mode 100644
> index 000000000..cda183c8d
> --- /dev/null
> +++ b/package/libgtk4/Config.in
> @@ -0,0 +1,106 @@
> +comment "libgtk4 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "libgtk4 needs an OpenGL or an OpenGL-EGL/wayland backend"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && !BR2_PACKAGE_HAS_LIBGL

BR2_PACKAGE_HAS_LIBEGL_WAYLAND is gone. And in fact, even on X11/OpenGL
systems, EGL is needed. So I simplified this to:

+comment "libgtk4 needs an OpenGL(ES) EGL backend"
+       depends on BR2_USE_MMU
+       depends on BR2_TOOLCHAIN_HAS_SYNC_4
+       depends on !BR2_PACKAGE_HAS_LIBEGL


> +
> +config BR2_PACKAGE_LIBGTK4
> +	bool "libgtk4"
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	depends on BR2_INSTALL_LIBSTDCPP # pango
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || BR2_PACKAGE_HAS_LIBGL

And this to:

+       # Even in the case of X11/OpenGL, libgtk4 needs epoxy built
+       # with EGL support, see
+       # https://gitlab.gnome.org/GNOME/gtk/-/issues/6866.
+       depends on BR2_PACKAGE_HAS_LIBEGL


> +	select BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_CAIRO_PS
> +	select BR2_PACKAGE_CAIRO_PDF
> +	select BR2_PACKAGE_CAIRO_SVG

These 3 options no longer exist, so I dropped them.

> +if BR2_PACKAGE_LIBGTK4
> +
> +config BR2_PACKAGE_LIBGTK4_BROADWAY
> +	bool "Broadway GDK backend"
> +	default y
> +	  help
> +	  This enables the Broadway backend for GDK, which provides
> +	  support for displaying GTK+ applications in a web browser,
> +	  using HTML5 and web sockets.
> +
> +	  For example, to run gtk4-demo on a target which IP address is
> +	  192.168.0.1 and use it from a web browser, execute the
> +	  following commands:
> +
> +	  $ broadwayd -a 192.168.0.1 -p 8080 :2 &
> +	  $ export GDK_BACKEND=broadway
> +	  $ export BROADWAY_DISPLAY=:2
> +	  $ gtk4-demo
> +
> +	  Then open a web browser at address http://192.168.0.1:8080.
> +	  Javascript and web sockets should be enabled.
> +
> +comment "Wayland GDK backend needs an OpenGL EGL backend provided by mesa3d w/ headers >= 3.17"
> +	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
> +
> +config BR2_PACKAGE_LIBGTK4_WAYLAND
> +	bool "Wayland GDK backend"
> +	default y
> +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND

Dropped, as the main option now implies EGL is available.

> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
> +	select BR2_PACKAGE_WAYLAND

+       select BR2_PACKAGE_WAYLAND_PROTOCOLS

was missing.


> diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
> new file mode 100644
> index 000000000..2d3e5049a
> --- /dev/null
> +++ b/package/libgtk4/libgtk4.mk
> @@ -0,0 +1,111 @@
> +################################################################################
> +#
> +# libgtk4
> +#
> +################################################################################
> +
> +LIBGTK4_VERSION_MAJOR = 4.12
> +LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).4
> +LIBGTK4_SOURCE = gtk-$(LIBGTK4_VERSION).tar.xz
> +LIBGTK4_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK4_VERSION_MAJOR)
> +LIBGTK4_LICENSE = LGPL-2.0+
> +LIBGTK4_LICENSE_FILES = COPYING
> +LIBGTK4_CPE_ID_VENDOR = gnome
> +LIBGTK4_CPE_ID_PRODUCT = gtk
> +LIBGTK4_INSTALL_STAGING = YES
> +
> +LIBGTK4_DEPENDENCIES = host-pkgconf host-libgtk4 \
> +	gdk-pixbuf graphene libepoxy libglib2 pango \
> +	$(TARGET_NLS_DEPENDENCIES)
> +
> +LIBGTK4_CONF_OPTS = -Dbuild-tests=false

Added many more disabling:

+LIBGTK4_CONF_OPTS = \
+       -Dbuild-tests=false \
+       -Dmedia-ffmpeg=disabled \
+       -Dprint-cpdb=disabled \
+       -Dvulkan=disabled \
+       -Dcloudproviders=disabled \
+       -Dsysprof=disabled \
+       -Dtracker=disabled \
+       -Dcolord=disabled \
+       -Dintrospection=disabled \
+       -Ddocumentation=false \
+       -Dscreenshots=false \
+       -Dman-pages=false


> +
> +ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
> +LIBGTK4_DEPENDENCIES += xlib_libXcursor xlib_libXi xlib_libXinerama
> +LIBGTK4_CONF_OPTS += -Dx11-backend=true
> +else
> +LIBGTK4_CONF_OPTS += -Dx11-backend=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGTK4_WAYLAND),y)
> +LIBGTK4_DEPENDENCIES += wayland libxkbcommon

Added wayland-protocols here, which was missing.

And I think that's pretty much it. Thanks a lot for the contribution!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
