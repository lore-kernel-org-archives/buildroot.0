Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCBFCAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA5366F48D;
	Thu, 11 Sep 2025 20:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGBPl7scLl59; Thu, 11 Sep 2025 20:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F39606F5BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F39606F5BE;
	Thu, 11 Sep 2025 20:30:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01B8C92E
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F34DE4234B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LuXcGkyJ3YR for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 932D542168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 932D542168
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 932D542168
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:30:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E4236B978576; Thu, 11 Sep 2025 22:30:16 +0200 (CEST)
Message-ID: <3b19b7d6-cf9a-4215-960b-f3ae803896bb@rnout.be>
Date: Thu, 11 Sep 2025 22:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-22-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-22-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757622617; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=VM0aV/9vur+1ry0wGLV+s7Pmsm49JukAfe7KOoh9XDM=;
 b=P3aIKGxrx/C8Cqqdl5NgrIwHu/syXEY21NhAG+HYr00Q/feTITP29z5zDEcJ9asO//ElIP
 oG+LYvaCs0ioGIa6Ms36tRvZPeFPracKWK0/Zg1R2AT0nrMeQlyXzwNpl40B56TJpoWXsD
 TUu/z83J2FDrSXMr8qxrGHqRWzD2cc+iyZRAPzDq2gzY43XkHhfPfVD4a52AEk80H46TB5
 kAfqVYdQ/5qep4TIcgXPRm9p7Mv8o7pgUDQCP37Frsexz6pHlzeSuiaIITyL8Wfbi7h7ym
 YaU/BcvuowF2Z1ybCeDewix7Fqdt/zbgUgNXZ9+tq08C2bYjG5LRJGTfMQPdFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=P3aIKGxr
Subject: Re: [Buildroot] [PATCH 21/23] package/xscreensaver: remove package
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
Cc: Julien Olivain <ju.o@free.fr>, Simon Dawson <spdawson@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
> As we're about to remove libgtk2, we must remove xscreensaver as it
> depends on libgtk2.
> 
> Cc: Simon Dawson <spdawson@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Since both Julien and Nicolas have declared an intention to update 
xscreensaver, I have _not_ applied this patch. I left it as New in patchwork, so 
we can still apply it a couple of days from now if no update is forthcoming.

  Regards,
  Arnout

> ---
>   Config.in.legacy                       |  7 +++
>   DEVELOPERS                             |  1 -
>   package/Config.in                      |  1 -
>   package/xscreensaver/Config.in         | 38 -------------
>   package/xscreensaver/xscreensaver.hash |  4 --
>   package/xscreensaver/xscreensaver.mk   | 75 --------------------------
>   6 files changed, 7 insertions(+), 119 deletions(-)
>   delete mode 100644 package/xscreensaver/Config.in
>   delete mode 100644 package/xscreensaver/xscreensaver.hash
>   delete mode 100644 package/xscreensaver/xscreensaver.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 35363b6782..2c065b363a 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>   
>   comment "Legacy options removed in 2025.11"
>   
> +config BR2_PACKAGE_XSCREENSAVER
> +	bool "xscreensaver has been removed"
> +	select BR2_LEGACY
> +	help
> +	  Due to the removal of libgtk2, the xscreensaver package has
> +	  been removed.
> +
>   config BR2_PACKAGE_SYLPHEED
>   	bool "sylpheed has been removed"
>   	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7374e389fe..3c038f9ce9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3075,7 +3075,6 @@ F:	package/sconeserver/
>   F:	package/sound-theme-borealis/
>   F:	package/sound-theme-freedesktop/
>   F:	package/vlc/
> -F:	package/xscreensaver/
>   F:	package/zmqpp/
>   F:	package/zyre/
>   
> diff --git a/package/Config.in b/package/Config.in
> index 6f7c9b613e..9fc4ac7f02 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -411,7 +411,6 @@ comment "X applications"
>   	source "package/wmctrl/Config.in"
>   	source "package/x11vnc/Config.in"
>   	source "package/xdotool/Config.in"
> -	source "package/xscreensaver/Config.in"
>   	source "package/xterm/Config.in"
>   	source "package/xvkbd/Config.in"
>   	source "package/yad/Config.in"
> diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
> deleted file mode 100644
> index ba259274d1..0000000000
> --- a/package/xscreensaver/Config.in
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -config BR2_PACKAGE_XSCREENSAVER
> -	bool "xscreensaver"
> -	depends on BR2_PACKAGE_XORG7
> -	depends on BR2_PACKAGE_HAS_LIBGL # libglu
> -	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf, libgtk2 -> glib2
> -	depends on BR2_USE_WCHAR # gdk-pixbuf, libgtk2 -> glib2
> -	depends on BR2_USE_MMU # gdk-pixbuf, libgtk2 -> glib2
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
> -	select BR2_PACKAGE_GDK_PIXBUF
> -	select BR2_PACKAGE_GDK_PIXBUF_XLIB
> -	select BR2_PACKAGE_LIBGLU
> -	select BR2_PACKAGE_LIBGTK2
> -	select BR2_PACKAGE_LIBXML2
> -	select BR2_PACKAGE_JPEG
> -	select BR2_PACKAGE_XLIB_LIBX11
> -	select BR2_PACKAGE_XLIB_LIBXFT
> -	select BR2_PACKAGE_XLIB_LIBXI
> -	select BR2_PACKAGE_XLIB_LIBXT
> -	help
> -	  XScreenSaver is the standard screen saver collection shipped
> -	  on most Linux and Unix systems running the X11 Window
> -	  System.
> -
> -	  On X11 systems, XScreenSaver is two things: it is both a
> -	  large collection of screen savers; and it is also the
> -	  framework for blanking and locking the screen.
> -
> -	  http://www.jwz.org/xscreensaver/
> -
> -comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9, OpenGL backend"
> -	depends on BR2_PACKAGE_XORG7
> -	depends on BR2_USE_MMU
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGL
> diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
> deleted file mode 100644
> index 27ef7d8f00..0000000000
> --- a/package/xscreensaver/xscreensaver.hash
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Locally calculated
> -sha256  328d51797352acf58ca5bab49e76fbf26034e7cad785f651ea11ce7b43fba25a  xscreensaver-6.03.tar.gz
> -sha256  8a03451ba5c4c9af669b53e47e50c38c149b9e152d3d627809b962da7b760bbd  hacks/screenhack.h
> -sha256  56db580415bb313a4a82c5e08f106304904d15d42faf8e6ab14b34e14e2087a5  hacks/glx/chessmodels.h
> diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
> deleted file mode 100644
> index 466d309940..0000000000
> --- a/package/xscreensaver/xscreensaver.mk
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -################################################################################
> -#
> -# xscreensaver
> -#
> -################################################################################
> -
> -XSCREENSAVER_VERSION = 6.03
> -XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
> -
> -# N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
> -XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
> -XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
> -XSCREENSAVER_CPE_ID_VALID = YES
> -XSCREENSAVER_SELINUX_MODULES = xdg xscreensaver xserver
> -
> -XSCREENSAVER_DEPENDENCIES = \
> -	gdk-pixbuf \
> -	gdk-pixbuf-xlib \
> -	jpeg \
> -	libgl \
> -	libglu \
> -	libgtk2 \
> -	libxml2 \
> -	xlib_libX11 \
> -	xlib_libXft \
> -	xlib_libXi \
> -	xlib_libXt \
> -	$(TARGET_NLS_DEPENDENCIES) \
> -	host-intltool
> -
> -# otherwise we end up with host include/library dirs passed to the
> -# compiler/linker
> -XSCREENSAVER_CONF_OPTS = \
> -	--includedir=$(STAGING_DIR)/usr/include \
> -	--libdir=$(STAGING_DIR)/usr/lib \
> -	--with-gl=yes
> -
> -ifeq ($(BR2_PACKAGE_LIBPNG),y)
> -XSCREENSAVER_CONF_OPTS += --with-png=yes
> -XSCREENSAVER_DEPENDENCIES += libpng
> -else
> -XSCREENSAVER_CONF_OPTS += --with-png=no
> -endif
> -
> -ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> -XSCREENSAVER_CONF_OPTS += --with-systemd=yes
> -XSCREENSAVER_DEPENDENCIES += systemd
> -else
> -XSCREENSAVER_CONF_OPTS += --with-systemd=no
> -endif
> -
> -ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
> -XSCREENSAVER_CONF_OPTS += --with-xinerama-ext=yes
> -XSCREENSAVER_DEPENDENCIES += xlib_libXinerama
> -else
> -XSCREENSAVER_CONF_OPTS += --with-xinerama-ext=no
> -endif
> -
> -ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
> -XSCREENSAVER_CONF_OPTS += --with-randr-ext=yes
> -XSCREENSAVER_DEPENDENCIES += xlib_libXrandr
> -else
> -XSCREENSAVER_CONF_OPTS += --with-randr-ext=no
> -endif
> -
> -ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
> -XSCREENSAVER_CONF_OPTS += --with-xf86vmode-ext=yes
> -XSCREENSAVER_DEPENDENCIES += xlib_libXxf86vm
> -else
> -XSCREENSAVER_CONF_OPTS += --with-xf86vmode-ext=no
> -endif
> -
> -XSCREENSAVER_INSTALL_TARGET_OPTS = install_prefix="$(TARGET_DIR)" install
> -
> -$(eval $(autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
