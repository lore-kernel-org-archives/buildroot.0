Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C53C98304
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 20:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB73360664;
	Tue, 22 Sep 2026 20:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwvNbjTVi6Xe; Tue, 22 Sep 2026 20:08:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A6FE36063F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790107697;
	b=GxaRA6GEMuPqWtop1Och4HWaDzwEaO/2C81RC77yhN9cwrZWFp8lv7FMFF3Oc4c7VoGr
	 I4ZVchhqnuLAcbwgfg2RA7msj7pLicBGF+5gWDmSDzqXnntqAK9gBbgp7UJFkjXnuYBOg
	 g7gCRtlk3bQLqKhTinwZ3+c1EcTAKIFygBmlRhYX34KKfd7051YHCjXOo9OTySwYD0Uz7
	 LOn9qhK+Npt2Jt/y/LcKjjUZtCcE+7cmOVxrjA+mgn60tk+a35Qms+2nwwEyzgkYBLVa6
	 KH3323CNX77Xa9y6fo6oNvsAVUKJom+lEo0d+v+jaRpTEVve+uBOwjsgJRYeSlxaoww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790107697;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ymzLB7go21aqV2/aGp0l1s/uzN/Vry37Hn1jacJ8NOI=;
	b=lHgR+seogy38FHD08p5Z2IgkSKvSsF/HIf/Gd7lfhTPRNRDkzcDyXvfNew5lCWMQHh+L
	 nIl/uheUh3a7l+FqaCoJUb95SkiDgplVtpVkhJr4SoYEXX3owR3cccbyexbXKvefM/S/s
	 DWovJVU5Ku+OQhgM5QUJaDGp+GNogIQMPs0wU8iWa2yA9GqvMIZShd+usx7eyFYkF8Nu6
	 oijHHwD9UPmPEA7IWRBFRU4pyzgo1p27jakshj6w7FjuXqlgGJ0lCTeDWpa6bRDl8abeo
	 6mgVcIDo/GQGdiE8Wbq/SpKdvHVK+GpJhKCFRJxWCp0zXGPKAXCdNEyIrqwWWp9CiCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790107697;
	bh=ymzLB7go21aqV2/aGp0l1s/uzN/Vry37Hn1jacJ8NOI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gqbm1BcDuPuz+nInMU3rMqnNJg9kJQCVb8vqAVZF4M0J7FwzHgnzTALxfawsbnj0T
	 qzj35zKr1XbdPw2Co9NJZR/eBEqYwOLiG6RURoipmCczz9wqcxHZOMg6RVmjjCxljF
	 Dnwo6Vb2HvDfewvYIDSMMfnxWDdllV3jF4Q26s/2QDenTgwyvP5zfyTU+gHq/uuiSd
	 malNQoSRTTJl/mPHUC6eR61YLye0AodcetPiUxZM1KFwW3fr8D4L3FLl6Y/VpYL/mr
	 0S0+Cc/lJIJ7SP+keWju5xLMAMgxXlNqSY41gZM9qURnZZUcIrRX64nO5XN/ZQx5Pc
	 kgGM0yKAdbXDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6FE36063F;
	Tue, 22 Sep 2026 20:08:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29FC024E
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B50980809
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2iEXByiPbel for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 20:08:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CEFC080805
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790107693;
 b=TqnCcsP020Y1bwCd92MIaP7PaI5hk9VhZj/8+jZRYvwZJ8d2ZQpWw0UrHoDf52nMXjm0
 m/jrKtJgqCtXZW9IQZRua4gUnsQhkAeSh9sXfQ9NRpe8y0DoYLkwfYFVG5bULRDIbJKUB
 Uhip39vg1nujkwOr1iqNqsUgQPcVdn/XJQHUphMOJwMRkDBMCVpuETceh5hmgjCMVx5lj
 9FC5nopyokQY9cWnKJxNvakr0MMlv/P5AlDVdNsqBtniSQXvCp+RVOEFSSNtAdpB+BMhl
 eaVM6LwJduW73CJ6gDmCtAt10mlKrYWs19qhHJ3msUuu26s632YW/xqSGkw63ZIagiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790107693;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=8uKJuFJAfTJz0JLkS0dBcX8ZsH0F991dC60zVL7AvUE=;
 b=p8FbATHa27E0TrQcMXG8DxY2fcx/Z/4FH8zo+iT38nhX+6Juul7D+MIeYnkvpBKUBdEC
 +FKJAikXlqa0iAd733yq93OAmFUALRsFdfnX97i/dv5ogO/4OgJbVe4viP2Vxv+eXkXEJ
 K4cn9hTpd6ubx+lgmv8/6ETJT+veR1tgVGa+YRWreoNVfjZPSH437CpO7Fwe5Afp8YdYx
 VJWIVcwjUZjAhA5tXvEixJDJbdzGPDSYGrjik82iaKZkoBTMwpssZXMJZFmfLehD8zzfc
 qmfohs9v6XvbzdU7mS6OB9MQTL85BYTbmxBTa051Foez4I9MWCif2fZ+SSBT2FRvXqQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=i9BuQEM2; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEFC080805
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:08:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1E8662003C1;
 Tue, 22 Sep 2026 22:08:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 22:08:08 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 22:08:08 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>
In-Reply-To: <20260816191830.533747-4-alseycmiller@gmail.com>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
 <20260816191830.533747-4-alseycmiller@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <81e6615173601a56112d1e66cfd3d5ec@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 3/8] package/sdl3: add ALSA and test program
 options, follow dbus
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alsey,

Thanks for the patch.

On 16/08/2026 21:18, Alsey Coleman Miller wrote:
> SDL_ALSA had no option at all, so whether the ALSA audio driver was
> built depended on what SDL's own detection found in the sysroot when it
> happened to configure. Add BR2_PACKAGE_SDL3_ALSA and pass
> SDL_ALSA_SHARED=OFF with it, so libasound is linked rather than
> dlopen()ed - a dlopen leaves nothing in the ELF, and the library is 
> then
> absent from the target unless something else pulls it in.
> 
> SDL_DBUS was off unconditionally, which loses screensaver inhibition 
> and
> the D-Bus parts of the Wayland backend; make it follow 
> BR2_PACKAGE_DBUS.
> 
> Add BR2_PACKAGE_SDL3_TESTS for the test programs, which are useful for
> checking the video and audio drivers on the target.
> 
> Finally, name the backends that were left unset - OSS, JACK, sndio,
> PipeWire, RPI - and turn the examples off. SDL probes for each of these
> and builds against whatever it finds, so leaving them out makes the
> result depend on which unrelated packages are enabled.

Could you split this patch in 4 smaller ones?
- one patch for the ALSA change,
- another for DBUS
- another for introducing BR2_PACKAGE_SDL3_TESTS
- finally a last one disabling examples and other unbeeded options

> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
> ---
>  package/sdl3/Config.in | 15 +++++++++++++++
>  package/sdl3/sdl3.mk   | 38 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sdl3/Config.in b/package/sdl3/Config.in
> index 7bce4ceaba..ed43879862 100644
> --- a/package/sdl3/Config.in
> +++ b/package/sdl3/Config.in
> @@ -75,6 +75,21 @@ config BR2_PACKAGE_SDL3_OPENGLES
>  comment "OpenGL ES support needs an OpenGL ES provider"
>  	depends on !BR2_PACKAGE_HAS_LIBGLES
> 
> +config BR2_PACKAGE_SDL3_ALSA
> +	bool "ALSA audio"
> +	depends on BR2_PACKAGE_ALSA_LIB
> +	help
> +	  Enable the ALSA audio driver.
> +
> +comment "ALSA audio needs alsa-lib"
> +	depends on !BR2_PACKAGE_ALSA_LIB
> +
> +config BR2_PACKAGE_SDL3_TESTS
> +	bool "build test programs"
> +	help
> +	  Build and install the SDL3 test programs, which are useful
> +	  for checking the video and audio drivers on the target.
> +
>  endif
> 
>  comment "sdl3 needs a toolchain w/ dynamic library, threads, wchar"
> diff --git a/package/sdl3/sdl3.mk b/package/sdl3/sdl3.mk
> index ecbcbf4bc2..7c92ee9bc8 100644
> --- a/package/sdl3/sdl3.mk
> +++ b/package/sdl3/sdl3.mk
> @@ -13,23 +13,59 @@ SDL3_CPE_ID_VENDOR = libsdl
>  SDL3_CPE_ID_PRODUCT = simple_directmedia_layer
>  SDL3_INSTALL_STAGING = YES
> 
> +SDL3_DEPENDENCIES = host-pkgconf
> +
> +# The audio and video backends this does not have a Buildroot option 
> for are
> +# named explicitly rather than left out: SDL probes for each of them 
> and
> +# builds against whatever it happens to find in the sysroot, so an 
> unlisted
> +# backend makes the result depend on which other packages are enabled.
>  SDL3_CONF_OPTS = \
> -	-DSDL_DBUS=OFF \
>  	-DSDL_DUMMYVIDEO=OFF \
> +	-DSDL_EXAMPLES=OFF \
>  	-DSDL_HIDAPI=OFF \
>  	-DSDL_IBUS=OFF \
>  	-DSDL_INSTALL_DOCS=OFF \
> +	-DSDL_JACK=OFF \
>  	-DSDL_JOYSTICK_MFI=OFF \
>  	-DSDL_JOYSTICK_VIRTUAL=OFF \
>  	-DSDL_OFFSCREEN=OFF \
> +	-DSDL_OSS=OFF \
> +	-DSDL_PIPEWIRE=OFF \
>  	-DSDL_PULSEAUDIO=OFF \
>  	-DSDL_RENDER_D3D=OFF \
>  	-DSDL_RPATH=OFF \
> +	-DSDL_RPI=OFF \
> +	-DSDL_SNDIO=OFF \
>  	-DSDL_STATIC=ON \
>  	-DSDL_UNIX_CONSOLE_BUILD=ON \
>  	-DSDL_VIVANTE=OFF \
>  	-DSDL_VULKAN=OFF
> 
> +ifeq ($(BR2_PACKAGE_SDL3_ALSA),y)
> +SDL3_DEPENDENCIES += alsa-lib
> +# SDL_ALSA_SHARED makes SDL dlopen() libasound at runtime rather than 
> link it,
> +# which leaves nothing in the ELF for Buildroot to see and the library 
> absent
> +# from the target unless something else pulls it in.
> +SDL3_CONF_OPTS += -DSDL_ALSA=ON -DSDL_ALSA_SHARED=OFF
> +else
> +SDL3_CONF_OPTS += -DSDL_ALSA=OFF
> +endif
> +
> +# SDL uses D-Bus for screensaver inhibition and for parts of the 
> Wayland
> +# backend, so it follows dbus rather than being off unconditionally.
> +ifeq ($(BR2_PACKAGE_DBUS),y)
> +SDL3_DEPENDENCIES += dbus
> +SDL3_CONF_OPTS += -DSDL_DBUS=ON
> +else
> +SDL3_CONF_OPTS += -DSDL_DBUS=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SDL3_TESTS),y)
> +SDL3_CONF_OPTS += -DSDL_TESTS=ON
> +else
> +SDL3_CONF_OPTS += -DSDL_TESTS=OFF
> +endif
> +
>  # SDL3 fails to build in Thumb mode on some ARM architectures
>  ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>  SDL3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
