Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B373E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 22:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F5280EE2;
	Sun, 29 Dec 2024 22:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q91V0-BYMf2x; Sun, 29 Dec 2024 22:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CFA980F57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CFA980F57;
	Sun, 29 Dec 2024 22:08:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A563C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DE1F4004A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DkC8SMPtrRa for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 22:08:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 953E8408AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 953E8408AA
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 953E8408AA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:08:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30057E0002;
 Sun, 29 Dec 2024 22:08:40 +0000 (UTC)
Date: Sun, 29 Dec 2024 23:08:39 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241229230839.386b3378@windsurf>
In-Reply-To: <20241018215214.623918-2-raphael.pavlidis@gmail.com>
References: <20241018215214.623918-1-raphael.pavlidis@gmail.com>
 <20241018215214.623918-2-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735510120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N/R19BOGcbSgN1MwpSooL2/Rnlnk31swPu0OOO55Vmg=;
 b=LlGzUe7mow4PphKIwChXC8X7Ga9qrcPs0PgO8gJySA5eQnUDpwbbK50okarB5/roZr3uAI
 HGMYyHvId5YT2dKGQYoAx5W7JaCe7MmORLu8oJxlaSDka1h7uTv/cpDu0WwmZiLLaw5+a7
 /0o0ryXCPNMDJLh40/0oftdC/mTKI6NT1PTqyoSnLb+UmE4hE18uT6/Tb1SsdVNsJK3Bdt
 KsQs3y7oebOUeVUe92z2C1Rb6H3r2n+AavirFJ0B3qylAzcnSZoWAlRrC725qzdolmg/lM
 Nl0wcJrzKSsu22rBmua38mzpo720HDHFFPdwS+dLZhLPfd4I6xrOHE+SZCLQ+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LlGzUe7m
Subject: Re: [Buildroot] [PATCH v1 2/2] package/xwayland: bump to version
 24.1.3
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

Hello Raphael,

On Fri, 18 Oct 2024 21:52:14 +0000
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> Additionally, make libdrm an optional dependency. Also,
> xlib_libxshmfence is not a required dependency.

Could you clarify whether those "additions" are related to the bump,
i.e made possible by the bump, or are unrelated, and could be done
separately?

> Release notes:
> https://lists.x.org/archives/xorg-announce/2024-October/003532.html

This is not entirely useful, as it's only the release notes for 24.1.3,
but we're bumping from 23.2.4 so there were many other changes.

> diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
> index 311dae25ec..a4e4a4e46f 100644
> --- a/package/x11r7/xwayland/Config.in
> +++ b/package/x11r7/xwayland/Config.in
> @@ -3,12 +3,10 @@ config BR2_PACKAGE_XWAYLAND
>  	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_STATIC_LIBS # wayland
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
> -	# We need a SHA1 implementation. If either openssl or
> -	# libgcrypt are already part of the build, we'll use one of
> -	# them, otherwise, use the small libsha1 library.
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xlib_libxshmfence
> -	select BR2_PACKAGE_LIBDRM
> -	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
> +	# We need a SHA1 implementation. If either openssl, libgcrypt, nettle or
> +	# libsha1 are already part of the build, we'll use one of them,
> +	# otherwise, use the small libmd library.
> +	select BR2_PACKAGE_LIBMD if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_NETTLE && !BR2_PACKAGE_LIBSHA1)

Could you explain this change? There's no explanation of it in the
commit log.

> diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
> index 5bb26bf17e..c7fd2c2ff8 100644
> --- a/package/x11r7/xwayland/xwayland.hash
> +++ b/package/x11r7/xwayland/xwayland.hash
> @@ -1,6 +1,8 @@
> -# From https://lists.x.org/archives/xorg-announce/2024-January/003443.html
> -sha256  a99e159b6d0d33098b3b6ab22a88bfcece23c8b9d0ca72c535c55dcb0681b46b  xwayland-23.2.4.tar.xz
> -sha512  ac3ff208cbef5bbe4637c335cfda226489c93b0a3768f2f4fb0201c588485ede38262fbce77ef1425b3d2a0be61b6580df53341c7b95e6072c8b6371ad29d187  xwayland-23.2.4.tar.xz
> +# Verified from https://xorg.freedesktop.org/archive/individual/xserver/xwayland-24.1.3.tar.xz.sig
> +# with key 67DC86F2623FC5FD4BB5225D14706DBE1E4B4540
> +# From https://lists.x.org/archives/xorg-announce/2024-October/003532.html
> +sha256  dcdb57a66cc9b124c8f936760592628ac4e744a7d7b3179aa86189ad7ea4cb10  xwayland-24.1.3.tar.xz
> +sha512  7e0e11b07408f41a81bafa7bc519d02ed9bdc36e11be16abe255a7d779d04824af23d79323f1602119b046c545cdd43ea91b93e23feb0ffe411aa6989b462c1d  xwayland-24.1.3.tar.xz
>  
>  # Locally calculated
>  sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
> diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
> index c66dd471ac..0621e3547a 100644
> --- a/package/x11r7/xwayland/xwayland.mk
> +++ b/package/x11r7/xwayland/xwayland.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XWAYLAND_VERSION = 23.2.4
> +XWAYLAND_VERSION = 24.1.3
>  XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
>  XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>  XWAYLAND_LICENSE = MIT
> @@ -12,7 +12,6 @@ XWAYLAND_LICENSE_FILES = COPYING
>  XWAYLAND_CPE_ID_VENDOR = x.org
>  XWAYLAND_INSTALL_STAGING = YES
>  XWAYLAND_DEPENDENCIES = \
> -	libdrm \
>  	pixman \
>  	wayland \
>  	wayland-protocols \
> @@ -20,22 +19,26 @@ XWAYLAND_DEPENDENCIES = \
>  	xlib_libXfont2 \
>  	xlib_libxkbfile \
>  	xlib_libXrandr \
> -	xlib_libxshmfence \
>  	xlib_xtrans \
>  	xorgproto
>  XWAYLAND_CONF_OPTS = \
> -	-Ddri3=true \
> -	-Dxwayland_eglstream=false \
> +	-Dxwayland_ei=false \
>  	-Dxvfb=false \
>  	-Ddefault_font_path=/usr/share/fonts/X11/ \
>  	-Ddtrace=false \
>  	-Ddocs=false
>  
> +ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_XLIB_LIBXSHMFENCE),yy)
> +XWAYLAND_CONF_OPTS += -Ddri3=true
> +XWAYLAND_DEPENDENCIES += libdrm xlib_libxshmfence
>  ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
>  XWAYLAND_CONF_OPTS += -Dglamor=true
>  XWAYLAND_DEPENDENCIES += libepoxy
>  else
>  XWAYLAND_CONF_OPTS += -Dglamor=false
> +endif # BR2_PACKAGE_LIBEPOXY
> +else
> +XWAYLAND_CONF_OPTS += -Ddri3=false
>  endif

A few more explanations about this in the commit log would also be good
to convince the casual reviewer (like me!) that this makes sense would
be very useful.

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
