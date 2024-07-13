Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1EAC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 07:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE902400D0;
	Sat, 13 Jul 2024 07:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FevkMG4A9dQr; Sat, 13 Jul 2024 07:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EABB840175
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EABB840175;
	Sat, 13 Jul 2024 07:30:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4CC1BF27A
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 07:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D4256069E
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 07:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_v5WKJ9YfTI for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 07:30:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C269560670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C269560670
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C269560670
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:30:39 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52e9a920e73so3023724e87.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 00:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720855838; x=1721460638;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z7WVuH5y3Ve/mF5WQY8x6qDcTkH2ZBio+lB6wde/np0=;
 b=AwqmuxNjyVx5Ao0kCZpns8e8dBOb6I3cStq9byWOEG1MetS27weHP4snsbiasHgSIr
 G+2xygfUS4SZohdg+ZE86RZt2HxmkRqnN4iLe6J4NVqpCfJIrcr0oWe0LL9x6Cdutfir
 m0BPOhMnP5xI5QM9PRhEFE37ujNcjC2+1mytA0oXT5L0WKjqASa8z424rNPud/3d9iex
 oQs/1ZqIpW/Lc84Ae2vFc93Hg1j+UUvanchb+D6r5+I+STdqUlEUgT8PXHAyZChlpPXq
 vS4B6HeJdFJgjJO3cmol3BWsFwznXnrAmRcmUHEaGNLJfj6iI9tnJtJzTe2AwS1a2Uxd
 qvqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhW+pnS9AlhCtQIjmeHI5waS30LjC2QxXeNSaoIU3Qh550lkDSIPnkkxGRIBoigXf12wMgsuNSgo/+RpZiolOZQwCnJIeekA==
X-Gm-Message-State: AOJu0Yz12Asa7ZwouX52T14LrWTdF+PglCstoOqp1ljKaErWxqUMeWfN
 uYu4LGMXtyAPuVmiRBwhzWHAdc+3hQyLoTNkj5BKHk5eyEQPfyEySeFAIgkKINFo7NbcDYWhsOX
 F9M4=
X-Google-Smtp-Source: AGHT+IHC1pDxpjmEfdjRXeiWKfK0a146pHMwwKaKk6ZU3mp+4tQI5xXIHPWB/ErVHPnT0aR0iRnkOg==
X-Received: by 2002:a05:6512:31c8:b0:52d:b118:5063 with SMTP id
 2adb3069b0e04-52eb99cc6camr9152775e87.47.1720855837711; 
 Sat, 13 Jul 2024 00:30:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23cc5bsm45347265e9.2.2024.07.13.00.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 00:30:37 -0700 (PDT)
Message-ID: <f2c376d5-d64a-456e-bfe6-129d0e0c7a0f@mind.be>
Date: Sat, 13 Jul 2024 09:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20220924210221.1490924-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20220924210221.1490924-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720855838; x=1721460638; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z7WVuH5y3Ve/mF5WQY8x6qDcTkH2ZBio+lB6wde/np0=;
 b=buo22cpSOcZLVYuTXxxyMMe+I8m4FMi4iga/LQgAawCLY6/XbT9hdY0SIajy9ElZGM
 wcq4VJI4NjI2ckq/d9zklr0u2H8x+M9OA+Mh/GMdWNvbTC7SG98dhrk1jxV786vodxy8
 zxhjmW0oGTno9FZMLPF8zdhirtiwOk/VFK79fPAhWDtl+q8IqRlUDowVBaXllj4ihTeZ
 d5evDKeWYtuT5saTNLO4NzvmUSPyt77fsZou0YJPz+L3TLjY7PMY1j9GD47sUrY9cQ51
 VTiMHW4n1pCqKEStaExZbFrdG3V+UD3YEYwm0WXUhTmLuSF7lsSAdxikHq/gQXN8pP0P
 WN9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=buo22cpS
Subject: Re: [Buildroot] [PATCH v2] package/opengl/libegl: remove
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/09/2022 23:02, Thomas Petazzoni wrote:
> Since wayland 1.15 (upstream commit
> 549a5ea710f4da1a5749587176d39fef1ded4077), libwayland-egl.so is
> provided by the wayland package, so there is no longer a question of
> whether libwayland-egl.so is provided by the particular EGL
> implementation. See the Wayland commit log:
> 
>      wayland-egl: import libwayland-egl.so frontend library from Mesa
> 
>      Currently the client-facing libwayland-egl API is defined by a header
>      file shipped by Wayland, but the implementation is left to each vendor.
> 
>      This can cause collisions when multiple implementations are installed on
>      the same system. Importing the implementation into Wayland with a stable
>      and versioned driver-facing ABI allows multiple drivers to coexist on
>      the same system.
> 
>      Pull the sample implementation from Mesa commit 677edff5cfd
>      ("wayland-egl: rework and simplify wl_egl_window initialization")
>      It has been used by the Mesa open source drivers, NVIDIA and others[1].
> 
>      v2: Reword commit message, rebase on top of newer Mesa.
> 
>      [1] https://github.com/thayama/wayland-egl
> 
> Consequently, we remove the BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> option. Packages that rely on BR2_PACKAGE_HAS_LIBGLES and
> BR2_PACKAGE_WAYLAND are guaranteed to have libwayland-egl.so.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks, after including the removal in two new packages 
added since then (sunxi-utgard-mali and sway).

  Yann's comment that some implementations still install libwayland-egl.so is 
true, but this is the case regardless of whether this patch is applied or not. 
It's also not easy to know if in the end the libwayland-egl.so of the 
implementation or of wayland should be used. So let's ignore the problem until 
someone actually faces it, and then finds a solution for it :-)

  Regards,
  Arnout

> ---
> Changes since v1:
> - Fix Wayland 15 -> wayland 1.15 in commit log
> - Re-add BR2_PACKAGE_HAS_LIBEGL dependency in weston.mk
> ---
>   package/cage/Config.in                      | 4 +---
>   package/freescale-imx/imx-gpu-viv/Config.in | 1 -
>   package/kodi/Config.in                      | 1 -
>   package/libgtk3/Config.in                   | 8 ++++----
>   package/mesa3d/Config.in                    | 1 -
>   package/nvidia-driver/Config.in             | 1 -
>   package/opengl/libegl/Config.in             | 4 ----
>   package/vte/Config.in                       | 6 +++---
>   package/waffle/Config.in                    | 2 +-
>   package/waylandpp/Config.in                 | 6 +++---
>   package/weston/Config.in                    | 6 +++---
>   package/weston/weston.mk                    | 2 +-
>   package/wlroots/Config.in                   | 5 ++---
>   package/wpebackend-fdo/Config.in            | 6 +++---
>   package/wpewebkit/Config.in                 | 4 +---
>   15 files changed, 22 insertions(+), 35 deletions(-)
> 
> diff --git a/package/cage/Config.in b/package/cage/Config.in
> index 0844d6ff62..4f823c768c 100644
> --- a/package/cage/Config.in
> +++ b/package/cage/Config.in
> @@ -1,6 +1,5 @@
> -comment "cage needs udev, EGL w/ Wayland backend and OpenGL ES support"
> +comment "cage needs udev, EGL and OpenGL ES support"
>   	depends on !BR2_PACKAGE_HAS_LIBEGL || \
> -		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
>   		!BR2_PACKAGE_HAS_LIBGLES || \
>   		!BR2_PACKAGE_HAS_UDEV
>   
> @@ -13,7 +12,6 @@ config BR2_PACKAGE_CAGE
>   	depends on !BR2_STATIC_LIBS # wlroots
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
>   	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wlroots
>   	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
>   	depends on BR2_PACKAGE_HAS_UDEV # wlroots
>   	select BR2_PACKAGE_WLROOTS
> diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
> index 9ba3d0428e..fc59d9a548 100644
> --- a/package/freescale-imx/imx-gpu-viv/Config.in
> +++ b/package/freescale-imx/imx-gpu-viv/Config.in
> @@ -64,7 +64,6 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
>   config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
>   	bool "Wayland"
>   	select BR2_PACKAGE_WAYLAND
> -	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>   
>   endchoice
>   
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 90710683db..1b1f39895e 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -31,7 +31,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
>   	bool
>   	default y
>   	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # waylandpp
>   	depends on BR2_HOST_GCC_AT_LEAST_4_9 # waylandpp
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # waylandpp
>   	depends on BR2_INSTALL_LIBSTDCPP # waylandpp
> diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
> index bc8cacd9f5..41fe3dd64c 100644
> --- a/package/libgtk3/Config.in
> +++ b/package/libgtk3/Config.in
> @@ -6,10 +6,10 @@ comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
>   		!BR2_TOOLCHAIN_HAS_THREADS
>   
> -comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
> +comment "libgtk3 needs an OpenGL or an OpenGL-EGL backend"
>   	depends on BR2_USE_MMU
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && \
> +	depends on !BR2_PACKAGE_HAS_LIBEGL && \
>   		!BR2_PACKAGE_HAS_LIBGL
>   
>   config BR2_PACKAGE_LIBGTK3
> @@ -21,7 +21,7 @@ config BR2_PACKAGE_LIBGTK3
>   	depends on BR2_INSTALL_LIBSTDCPP # pango
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> +	depends on BR2_PACKAGE_HAS_LIBEGL || \
>   		BR2_PACKAGE_HAS_LIBGL
>   	select BR2_PACKAGE_ATK
>   	select BR2_PACKAGE_CAIRO
> @@ -69,7 +69,7 @@ comment "Wayland GDK backend needs an OpenGL EGL backend provided by mesa3d w/ h
>   config BR2_PACKAGE_LIBGTK3_WAYLAND
>   	bool "Wayland GDK backend"
>   	default y
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBEGL
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
>   	select BR2_PACKAGE_WAYLAND
>   	select BR2_PACKAGE_WAYLAND_PROTOCOLS
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 40f7009492..e379255a01 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -378,7 +378,6 @@ config BR2_PACKAGE_MESA3D_OPENGL_EGL
>   	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>   	select BR2_PACKAGE_HAS_LIBEGL if !BR2_PACKAGE_LIBGLVND
>   	select BR2_PACKAGE_LIBGLVND_DISPATCH_EGL if BR2_PACKAGE_LIBGLVND
> -	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>   	select BR2_PACKAGE_MESA3D_GBM
>   	help
>   	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL
> diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
> index a8617a939b..e4a9dde0a0 100644
> --- a/package/nvidia-driver/Config.in
> +++ b/package/nvidia-driver/Config.in
> @@ -26,7 +26,6 @@ config BR2_PACKAGE_NVIDIA_DRIVER_XORG
>   	select BR2_PACKAGE_XLIB_LIBXEXT
>   	select BR2_PACKAGE_HAS_LIBGL
>   	select BR2_PACKAGE_HAS_LIBEGL
> -	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>   	select BR2_PACKAGE_HAS_LIBGLES
>   
>   if BR2_PACKAGE_NVIDIA_DRIVER_XORG
> diff --git a/package/opengl/libegl/Config.in b/package/opengl/libegl/Config.in
> index a236998947..f46d09ed71 100644
> --- a/package/opengl/libegl/Config.in
> +++ b/package/opengl/libegl/Config.in
> @@ -1,10 +1,6 @@
>   config BR2_PACKAGE_HAS_LIBEGL
>   	bool
>   
> -config BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> -	bool
> -	depends on BR2_PACKAGE_HAS_LIBEGL
> -
>   config BR2_PACKAGE_PROVIDES_LIBEGL
>   	string
>   	depends on BR2_PACKAGE_HAS_LIBEGL
> diff --git a/package/vte/Config.in b/package/vte/Config.in
> index 45d627885f..8a231a21af 100644
> --- a/package/vte/Config.in
> +++ b/package/vte/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_VTE
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on !BR2_TOOLCHAIN_USES_MUSL
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> +	depends on BR2_PACKAGE_HAS_LIBEGL || \
>   		BR2_PACKAGE_HAS_LIBGL
>   	depends on BR2_PACKAGE_XORG7
>   	select BR2_PACKAGE_LIBGTK3
> @@ -31,9 +31,9 @@ comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 10
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
>   		BR2_TOOLCHAIN_USES_MUSL
>   
> -comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
> +comment "vte needs an OpenGL or an OpenGL-EGL backend"
>   	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>   	depends on BR2_USE_MMU
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && \
> +	depends on !BR2_PACKAGE_HAS_LIBEGL && \
>   		!BR2_PACKAGE_HAS_LIBGL
> diff --git a/package/waffle/Config.in b/package/waffle/Config.in
> index ad622e9582..79cb4ca2ed 100644
> --- a/package/waffle/Config.in
> +++ b/package/waffle/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_WAFFLE_SUPPORTS_GLX
>   
>   config BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND
>   	bool
> -	default y if BR2_PACKAGE_WAYLAND && BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	default y if BR2_PACKAGE_WAYLAND && BR2_PACKAGE_HAS_LIBEGL
>   
>   config BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL
>   	bool
> diff --git a/package/waylandpp/Config.in b/package/waylandpp/Config.in
> index 86ca965056..0713884d3e 100644
> --- a/package/waylandpp/Config.in
> +++ b/package/waylandpp/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_WAYLANDPP
>   	bool "waylandpp"
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBEGL
>   	depends on BR2_HOST_GCC_AT_LEAST_4_9
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   	depends on BR2_INSTALL_LIBSTDCPP
> @@ -10,9 +10,9 @@ config BR2_PACKAGE_WAYLANDPP
>   
>   	  https://github.com/NilsBrause/waylandpp
>   
> -comment "waylandpp needs an OpenGL-EGL/wayland backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9, C++ support"
> +comment "waylandpp needs an OpenGL-EGL backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9, C++ support"
>   	depends on BR2_PACKAGE_WAYLAND
> -	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> +	depends on !BR2_PACKAGE_HAS_LIBEGL || \
>   		!BR2_HOST_GCC_AT_LEAST_4_9 || \
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
>   		!BR2_INSTALL_LIBSTDCPP
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 3b4e932b7d..cba0469d16 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -152,16 +152,16 @@ config BR2_PACKAGE_WESTON_DEMO_CLIENTS
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
>   	depends on BR2_USE_WCHAR # pango
>   	depends on BR2_PACKAGE_HAS_LIBGLES
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBEGL
>   	select BR2_PACKAGE_PANGO
>   	help
>   	  This enables the installation of Weston's demo clients.
>   
> -comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland backend and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "demo clients needs an OpenGL ES/EGL provider and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
>   	depends on BR2_USE_MMU
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>   		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
> -		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		!BR2_PACKAGE_HAS_LIBEGL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   
>   endif
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 5e71473640..b0c4061836 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -71,7 +71,7 @@ else
>   WESTON_CONF_OPTS += -Ddeprecated-weston-launch=false
>   endif
>   
> -ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
>   WESTON_CONF_OPTS += -Drenderer-gl=true
>   WESTON_DEPENDENCIES += libegl libgles
>   ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
> diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
> index 84a4ef846e..de45c0c583 100644
> --- a/package/wlroots/Config.in
> +++ b/package/wlroots/Config.in
> @@ -1,6 +1,6 @@
> -comment "wlroots needs udev, EGL w/ Wayland backend and OpenGL ES support"
> +comment "wlroots needs udev, EGL and OpenGL ES support"
>   	depends on !BR2_PACKAGE_HAS_LIBEGL || \
> -		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> +		!BR2_PACKAGE_HAS_LIBEGL || \
>   		!BR2_PACKAGE_HAS_LIBGLES || \
>   		!BR2_PACKAGE_HAS_UDEV
>   
> @@ -14,7 +14,6 @@ config BR2_PACKAGE_WLROOTS
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
>   	depends on BR2_PACKAGE_HAS_UDEV # libinput
>   	depends on BR2_PACKAGE_HAS_LIBEGL
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>   	depends on BR2_PACKAGE_HAS_LIBGLES
>   	select BR2_PACKAGE_LIBDRM
>   	select BR2_PACKAGE_LIBINPUT
> diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
> index 8a8c820c9b..9b4dd28741 100644
> --- a/package/wpebackend-fdo/Config.in
> +++ b/package/wpebackend-fdo/Config.in
> @@ -1,5 +1,5 @@
> -comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable Wayland backend"
> -	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
> +comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and EGL support"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
>   		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>   
>   config BR2_PACKAGE_WPEBACKEND_FDO
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
>   	depends on BR2_USE_WCHAR # libglib2
>   	depends on BR2_USE_MMU # libglib2
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBEGL
>   	select BR2_PACKAGE_LIBEPOXY
>   	select BR2_PACKAGE_LIBGLIB2
>   	select BR2_PACKAGE_LIBWPE
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 04ed40bd92..2a5905a30a 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -27,8 +27,7 @@ comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gc
>   comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
>   	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>   	depends on !BR2_BINFMT_FLAT
> -	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL \
> -		|| !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
>   
>   config BR2_PACKAGE_WPEWEBKIT
>   	bool "wpewebkit"
> @@ -41,7 +40,6 @@ config BR2_PACKAGE_WPEWEBKIT
>   	depends on BR2_USE_WCHAR # icu, libsoup
>   	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
>   	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
>   	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>   	select BR2_PACKAGE_CAIRO
>   	select BR2_PACKAGE_CAIRO_PNG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
