Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67915CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ADFC80B19;
	Fri,  5 Jun 2026 12:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTpN3rszg1Ag; Fri,  5 Jun 2026 12:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E350C827F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663814;
	bh=FqBuKoX3OUmrrCCBreD4mQ3m7axZzp76TF1wrMruseU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m81JXDzx5/J1wzPHZafsBkBkaVf958cFepF4nZugASwieSa6KElm2nVOTbUobyREx
	 +TByxDS/w4WtF2Olw3lwLTcqj6Zkogtc5aW7D2QQtdal55Jw0VWIGIj4SLdVEa9nFw
	 1XCKduATH2hjK7hvnaLFwHUZ779zyO8F879Boqjmra7yjp040Y2XHzugWG7IMeQXdk
	 Ywa4hzMaKmUkwQ+vJKIWUPxIBXH7sYX3iN29iTvW5izRG/K1eGkYTtZIoCGF8iMAYe
	 lmLB8t5ul8LqQ4TUAPTpsJPH76hKvCMM6RkKTVb2GaTGZ2T1GTsgdQoTd9HE6dr6oB
	 LYd1tlhVOo8HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E350C827F3;
	Fri,  5 Jun 2026 12:50:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E3D5388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 148EE61072
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZcMKjvSJqIU for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADB2960BBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADB2960BBC
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADB2960BBC
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:10 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45fd464d51fso1082960f8f.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663809; x=1781268609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OJTa1o6FhDPJ4HmLab9PmbZKDpV5pYpdeKm6rPiOHzs=;
 b=ZpEdA2h3vGYMPz2FYX29QizzaTyfDpV1pcUIXO1rnrGDvr4klPTITASaqyVI6/xUSb
 xwZVW3wJbsGy23C5RiyymqBLquD74iyzhdCx66WeJ24MnJN/npwHty6Q28fwfhMhUfgI
 DLg+5MZyVzemhXInzad/VBIODq+Kl90tRQkXzS0ajI9fEVOSVR1YayjBhJN9G5QbLMSy
 F3AdHjLZ3CEw4NoI5X722WZKY1bEwDIdNsmimUCvWbPSjR8MFReVvZU5NnwpmXx58W3T
 0G0/YnFqSDExkIqYyyMOiZJ+ynUulST0AUsoIjKneuAcLAai+zajRpylS9J2SuaHsmSz
 xIHQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9pAIU7WD09vmPzFSVURVgF+9xuZKLzDnJQ3iJ5LY0CRV/v5H+N/3aX0/FuwPrsZGk05an4qn6LMXE=@buildroot.org
X-Gm-Message-State: AOJu0YwdqdUV8mOO9Ocyh3Dmz3sBPUCXzodgDkGZVsbkjW+j8U6Fug1t
 pEeC+uunW+4pByL2lg8pjohtIKD9L7zKX4hOcI/K4KO6AIiyaK3irIMXDWrpefVD3CA=
X-Gm-Gg: Acq92OEAqagquBS9f7CYrjMUad0NhZBv0zmtUYWrKnXECO1t/IwTl+9gx/xEUwrPSsW
 k47YaoJgL94Ue39UaK8wTM+5hpol2Fp7KjoOAXnlL7tmB5QM+C5bf4hYGbBq5IPENGZ8nZ+bgpg
 L444pI2GdOBtZ58LxSKjoRxoB2xfU2LOsr+kvSJU5tB/6DsF73hbst7J6PEGRhh/Rsz6z5R6Shd
 wcBsdc9GJn3haFoER2KYAMI1+cSOrbMoFnJUS3ry4jqtNTj1aMSI/3gbu0XY4WkNj0yfkH/Ofu7
 jFKC3yrEcj215WhQHR5NIlX+exXoYYXCOxDh6XlEtQgl8FMCkwP5D3SJvueXfwyo33QNu00M4fo
 dLUGOtzAuaV673YyBb2j6WleYdyy5tM4IXyOdhcyKfbp+yED8VbQ+c+u8iP0daSVw86fO8A5VIX
 XWFPTrm/bRq9l0rMmwUiz1K4n9+jpAmLBzT1k/
X-Received: by 2002:a05:6000:22c5:b0:45e:f68d:e791 with SMTP id
 ffacd0b85a97d-46030182afdmr5772672f8f.0.1780663808510; 
 Fri, 05 Jun 2026 05:50:08 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344558sm25273181f8f.18.2026.06.05.05.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:07 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:07 +0200
Message-ID: <20260605125007.272507-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260224182016.2631828-2-bernd@kuhls.net>
References: <20260224182016.2631828-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663809; x=1781268609; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJTa1o6FhDPJ4HmLab9PmbZKDpV5pYpdeKm6rPiOHzs=;
 b=On3AhtLFjHQJ44l6XlB9nzhyOWQzQcH3u6UIoDhKhFSamTV+7jT7TjgkApGqiidnTv
 n28TSqp+9TxpLpQ5P0KASDbhxOQE3FfSBfBvfv1TcbnhUwP0DGb4oBLsPmkQIBVGqIKf
 wwJQqZbjdOOfsTPM/la13Mve8GML+EgrZX/pR9Oz5eBxyyRcDT/GWy6j/Kg1cCnrMzdz
 Kuhrsq1yLURLOA2d7GMdlGFSbtdmz6VP7cAI4vsFA9WybZ8O00wxbyaAnAqa4dNy3aH/
 SsZoYka4gy+y/GX/JL2D9aNwl39E5S6M/xq/cbhBtynPuwWCNJqwUQjRi3ZWV5SdTvbb
 eh0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=On3AhtLF
Subject: Re: [Buildroot] [PATCH 2/3] package/vlc: update freerdp2 patch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Replace Gentoo patch from 2018 with rebased version of an upstream
> commit from 2022 which also fixes build errors introduced by gcc 14.x:
> 
> access/rdp.c: In function 'postConnectHandler':
> access/rdp.c:238:39: error: assignment to 'pDesktopResize' {aka 'int
>  (*)(struct rdp_context *)'} from incompatible pointer type 'void
>  (*)(rdpContext *)' {aka 'void (*)(struct rdp_context *)'}
>  [-Wincompatible-pointer-types]
>   238 |     p_instance->update->DesktopResize = desktopResizeHandler;
>       |                                       ^
> 
> No autobuilder error was recorded, the build error can be reproduced
> with this defconfig:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_VLC=y
> BR2_PACKAGE_FREERDP=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .checkpackageignore                           |   1 -
>  .../vlc/0007-Add-support-for-freerdp2.patch   | 173 ++++++++++++++----
>  2 files changed, 133 insertions(+), 41 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 3ad99d0eb1..cf3702acf6 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -974,7 +974,6 @@ package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch lib_patch.Upstrea
>  package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch lib_patch.Upstream
>  package/vlc/0005-Don-t-assume-strerror_l-is-available.patch lib_patch.Upstream
>  package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch lib_patch.Upstream
> -package/vlc/0007-Add-support-for-freerdp2.patch lib_patch.Upstream
>  package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch lib_patch.Upstream
>  package/vlc/0010-opengl-missing-library-check.patch lib_patch.Upstream
>  package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch lib_patch.Upstream
> diff --git a/package/vlc/0007-Add-support-for-freerdp2.patch b/package/vlc/0007-Add-support-for-freerdp2.patch
> index 75f095545b..c3148600ca 100644
> --- a/package/vlc/0007-Add-support-for-freerdp2.patch
> +++ b/package/vlc/0007-Add-support-for-freerdp2.patch
> @@ -1,32 +1,32 @@
> -From 3780bbb20bf35aa8f21ac672da3f0c5f408468e9 Mon Sep 17 00:00:00 2001
> -From: Bernd Kuhls <bernd.kuhls@t-online.de>
> -Date: Thu, 16 Aug 2018 12:27:40 +0200
> -Subject: [PATCH] Add support for freerdp2
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Juliane de Sartiges <jill@videolabs.io>
> +Date: Wed, 27 Jul 2022 09:32:25 +0200
> +Subject: [PATCH] freerdp: update to freerdp2 api
>  
> -Downloaded from
> -https://gitweb.gentoo.org/repo/gentoo.git/tree/media-video/vlc/files/vlc-2.2.8-freerdp-2.patch
> +Upstream: https://code.videolan.org/videolan/vlc/-/commit/95e7bba6105bd8c2b8ea9cabc02c8dfe7411cab2
>  
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +[Bernd: rebased for 3.0.23]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   configure.ac         |  2 +-
> - modules/access/rdp.c | 51 ++++++++++++++-------------------------------------
> - 2 files changed, 15 insertions(+), 38 deletions(-)
> + modules/access/rdp.c | 85 ++++++++++++++++++++------------------------
> + 2 files changed, 40 insertions(+), 47 deletions(-)
>  
>  diff --git a/configure.ac b/configure.ac
> -index bfe43512a2..4808b8becf 100644
> +index d96287d3e0..a91fc73172 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1992,7 +1992,7 @@ PKG_ENABLE_MODULES_VLC([VNC], [vnc], [libvncclient >= 0.9.9], (VNC/rfb client su
> +@@ -2194,7 +2194,7 @@ PKG_ENABLE_MODULES_VLC([VNC], [vnc], [libvncclient >= 0.9.9], (VNC/rfb client su
>   
>   dnl  RDP/Remote Desktop access module
>   dnl
>  -PKG_ENABLE_MODULES_VLC([FREERDP], [rdp], [freerdp >= 1.0.1], (RDP/Remote Desktop client support) )
> -+PKG_ENABLE_MODULES_VLC([FREERDP], [rdp], [freerdp2 >= 1.0.1], (RDP/Remote Desktop client support) )
> ++PKG_ENABLE_MODULES_VLC([FREERDP], [rdp], [freerdp2 >= 2.0.0], (RDP/Remote Desktop client support) )
>   
>   dnl
>   dnl  Real RTSP plugin
>  diff --git a/modules/access/rdp.c b/modules/access/rdp.c
> -index 2992090219..49986f5da9 100644
> +index 0c39663c64..04ae005938 100644
>  --- a/modules/access/rdp.c
>  +++ b/modules/access/rdp.c
>  @@ -45,18 +45,6 @@
> @@ -48,37 +48,51 @@ index 2992090219..49986f5da9 100644
>   #include <errno.h>
>   #ifdef HAVE_POLL
>   # include <poll.h>
> -@@ -144,6 +132,7 @@ static void desktopResizeHandler( rdpContext *p_context )
> +@@ -75,6 +63,8 @@
> + 
> + #define CFG_PREFIX "rdp-"
> + 
> ++#define FREERDP_PIXEL_BPP(_format) (_format >> 24)
> ++
> + /*****************************************************************************
> +  * Module descriptor
> +  *****************************************************************************/
> +@@ -139,11 +129,12 @@ typedef struct vlcrdp_context_t vlcrdp_context_t;
> + 
> + /* updates handlers */
> + 
> +-static void desktopResizeHandler( rdpContext *p_context )
> ++static BOOL desktopResizeHandler( rdpContext *p_context )
> + {
>       vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_context;
>       demux_sys_t *p_sys = p_vlccontext->p_demux->p_sys;
>       rdpGdi *p_gdi = p_context->gdi;
> -+    unsigned bytesPerPixel;
> ++    int i_colordepth = FREERDP_PIXEL_BPP( p_gdi->dstFormat );
>   
>       if ( p_sys->es )
>       {
> -@@ -153,17 +142,21 @@ static void desktopResizeHandler( rdpContext *p_context )
> +@@ -151,11 +142,13 @@ static void desktopResizeHandler( rdpContext *p_context )
> +         p_sys->es = NULL;
> +     }
>   
> -     /* Now init and fill es format */
> +-    /* Now init and fill es format */
>       vlc_fourcc_t i_chroma;
>  -    switch( p_gdi->bytesPerPixel )
> -+    switch( p_gdi->dstFormat )
> ++    /* Now init and fill es format */
> ++    switch ( i_colordepth )
>       {
>           default:
> --        case 16:
> -+            msg_Dbg( p_vlccontext->p_demux, "unhandled dstFormat %x bpp", p_gdi->dstFormat);
> -+        case PIXEL_FORMAT_BGR16:
> ++            msg_Dbg( p_vlccontext->p_demux, "invalid color depth %d", i_colordepth);
> ++            /* fallthrough */
> +         case 16:
>               i_chroma = VLC_CODEC_RGB16;
> -+            bytesPerPixel = 16;
>               break;
> --        case 24:
> -+        case PIXEL_FORMAT_BGR24:
> +@@ -163,7 +156,7 @@ static void desktopResizeHandler( rdpContext *p_context )
>               i_chroma = VLC_CODEC_RGB24;
> -+            bytesPerPixel = 24;
>               break;
> --        case 32:
> -+        case PIXEL_FORMAT_BGRA32:
> -             i_chroma = VLC_CODEC_RGB32;
> -+            bytesPerPixel = 32;
> +         case 32:
> +-            i_chroma = VLC_CODEC_RGB32;
> ++            i_chroma = VLC_CODEC_ARGB;
>               break;
>       }
>       es_format_t fmt;
> @@ -87,11 +101,61 @@ index 2992090219..49986f5da9 100644
>       fmt.video.i_frame_rate_base = 1000;
>       fmt.video.i_frame_rate = 1000 * p_sys->f_fps;
>  -    p_sys->i_framebuffersize = p_gdi->width * p_gdi->height * p_gdi->bytesPerPixel;
> -+    p_sys->i_framebuffersize = p_gdi->width * p_gdi->height * bytesPerPixel;
> ++    p_sys->i_framebuffersize = p_gdi->width * p_gdi->height * (i_colordepth >> 3);
>   
>       if ( p_sys->p_block )
>           p_sys->p_block = block_Realloc( p_sys->p_block, 0, p_sys->i_framebuffersize );
> -@@ -237,28 +230,19 @@ static bool postConnectHandler( freerdp *p_instance )
> +@@ -184,20 +177,21 @@ static void desktopResizeHandler( rdpContext *p_context )
> +         p_sys->p_block = block_Alloc( p_sys->i_framebuffersize );
> + 
> +     p_sys->es = es_out_Add( p_vlccontext->p_demux->out, &fmt );
> ++    return TRUE;
> + }
> + 
> +-static void beginPaintHandler( rdpContext *p_context )
> ++static BOOL beginPaintHandler( rdpContext *p_context )
> + {
> +     vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_context;
> +     demux_sys_t *p_sys = p_vlccontext->p_demux->p_sys;
> +     rdpGdi *p_gdi = p_context->gdi;
> +-    p_gdi->primary->hdc->hwnd->invalid->null = 1;
> +-    p_gdi->primary->hdc->hwnd->ninvalid = 0;
> ++    p_gdi->primary->hdc->hwnd->invalid->null = TRUE;
> +     if ( ! p_sys->p_block && p_sys->i_framebuffersize )
> +         p_sys->p_block = block_Alloc( p_sys->i_framebuffersize );
> ++    return TRUE;
> + }
> + 
> +-static void endPaintHandler( rdpContext *p_context )
> ++static BOOL endPaintHandler( rdpContext *p_context )
> + {
> +     vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_context;
> +     demux_sys_t *p_sys = p_vlccontext->p_demux->p_sys;
> +@@ -208,11 +202,12 @@ static void endPaintHandler( rdpContext *p_context )
> +         p_sys->p_block->i_buffer = p_sys->i_framebuffersize;
> +         memcpy( p_sys->p_block->p_buffer, p_gdi->primary_buffer, p_sys->p_block->i_buffer );
> +     }
> ++    return TRUE;
> + }
> + 
> + /* instance handlers */
> + 
> +-static bool preConnectHandler( freerdp *p_instance )
> ++static BOOL preConnectHandler( freerdp *p_instance )
> + {
> +     vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_instance->context;
> +     demux_sys_t *p_sys = p_vlccontext->p_demux->p_sys;
> +@@ -229,49 +224,54 @@ static bool preConnectHandler( freerdp *p_instance )
> +     p_instance->settings->EncryptionMethods =
> +             var_InheritBool( p_vlccontext->p_demux, CFG_PREFIX "encrypt" );
> + 
> +-    return true;
> ++    return TRUE;
> + }
> + 
> +-static bool postConnectHandler( freerdp *p_instance )
> ++static BOOL postConnectHandler( freerdp *p_instance )
> + {
>       vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_instance->context;
>   
>       msg_Dbg( p_vlccontext->p_demux, "connected to desktop %dx%d (%d bpp)",
> @@ -109,22 +173,51 @@ index 2992090219..49986f5da9 100644
>       p_instance->update->DesktopResize = desktopResizeHandler;
>       p_instance->update->BeginPaint = beginPaintHandler;
>       p_instance->update->EndPaint = endPaintHandler;
> ++    UINT32 format;
> ++    switch ( p_instance->settings->ColorDepth )
> ++    {
> ++        default:
> ++            msg_Dbg( p_vlccontext->p_demux, "no valid pixel format found for color depth %d bpp", p_instance->settings->ColorDepth);
> ++            /* fallthrough */
> ++        case 16:
> ++            format = PIXEL_FORMAT_RGB16;
> ++            break;
> ++        case 24:
> ++            format = PIXEL_FORMAT_RGB24;
> ++            break;
> ++        case 32:
> ++            format = PIXEL_FORMAT_ARGB32;
> ++            break;
> ++    }
>   
> --    gdi_init( p_instance,
> +     gdi_init( p_instance,
>  -                CLRBUF_16BPP |
>  -#if defined(FREERDP_VERSION_MAJOR) && defined(FREERDP_VERSION_MINOR) && \
>  -    !(FREERDP_VERSION_MAJOR > 1 || (FREERDP_VERSION_MAJOR == 1 && FREERDP_VERSION_MINOR >= 2))
>  -                CLRBUF_24BPP |
>  -#endif
>  -                CLRBUF_32BPP, NULL );
> -+    if ( p_instance->settings->ColorDepth > 16 )
> -+        gdi_init( p_instance, PIXEL_FORMAT_XRGB32);
> -+    else
> -+        gdi_init( p_instance, PIXEL_FORMAT_RGB16);
> ++                format );
>   
>       desktopResizeHandler( p_instance->context );
> -     return true;
> -@@ -432,10 +416,6 @@ static int Open( vlc_object_t *p_this )
> +-    return true;
> ++    return TRUE;
> + }
> + 
> +-static bool authenticateHandler( freerdp *p_instance, char** ppsz_username,
> ++static BOOL authenticateHandler( freerdp *p_instance, char** ppsz_username,
> +                                  char** ppsz_password, char** ppsz_domain )
> + {
> +     VLC_UNUSED(ppsz_domain);
> +     vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_instance->context;
> +     *ppsz_username = var_InheritString( p_vlccontext->p_demux, CFG_PREFIX "user" );
> +     *ppsz_password = var_InheritString( p_vlccontext->p_demux, CFG_PREFIX "password" );
> +-    return true;
> ++    return TRUE;
> + }
> + 
> + /*****************************************************************************
> +@@ -432,10 +432,6 @@ static int Open( vlc_object_t *p_this )
>       if ( p_sys->f_fps <= 0 ) p_sys->f_fps = 1.0;
>       p_sys->i_frame_interval = 1000000 / p_sys->f_fps;
>   
> @@ -135,7 +228,7 @@ index 2992090219..49986f5da9 100644
>       p_sys->p_instance = freerdp_new();
>       if ( !p_sys->p_instance )
>       {
> -@@ -508,9 +488,6 @@ static void Close( vlc_object_t *p_this )
> +@@ -512,9 +508,6 @@ static void Close( vlc_object_t *p_this )
>   
>       freerdp_disconnect( p_sys->p_instance );
>       freerdp_free( p_sys->p_instance );
> @@ -146,5 +239,5 @@ index 2992090219..49986f5da9 100644
>       if ( p_sys->p_block )
>           block_Release( p_sys->p_block );
>  -- 
> -2.14.4
> +2.47.3
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
