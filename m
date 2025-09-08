Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11933CAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBE4661C24;
	Mon,  8 Sep 2025 10:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IWo-yt0sod6; Mon,  8 Sep 2025 10:56:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D678061C7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D678061C7D;
	Mon,  8 Sep 2025 10:56:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A9071D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5143B84F49
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cs5f5COe36yY for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:56:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0947784EE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0947784EE1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0947784EE1
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45de93a7516so2959735e9.1
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328958; x=1757933758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uKL34AtInYZ5dH6fY14s1AfzUS1NsLZF/UsoXUV5usc=;
 b=Q4sjhZI1arlgCJ+PbLb1LuVC2rs5pancSiidQi1t2BY2xntT7sQSUnPEhm8P/sosEi
 U5TQsMd1CVF9ek+He7FalhIT5auNPXUFYFmC46tfms4556p9L1UbA++jX2qSVcMY+iws
 ciHNRr7FVzdvmrRqm6IXtMmgbQ3dLUdHPnJ9xL+ZG8jzNNPK0c2K8OaYoKvtGTc9b2pp
 Z/mIujZjyPxLmG/zURD8UxYQSbhNc1NCjapwJfJvwiYsIh8gpoBewYkXgZ1Sqkr7tfnc
 zXgFhxdWlP+k77LI1+qkeqDUFO85YaHuoq80XkEoDELV+1GL+ZaSQ+qhb5W4UGRWdjlZ
 9qNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK4gaQGsX2zD5fgqjV3UhHbh/pwo445YOy9317fy5R5dmrxm0EoXydHTPOyivfuvR6E9syzU38EQw=@buildroot.org
X-Gm-Message-State: AOJu0YyTGze/XZboSpwnPN07avlpU/FnmKO9LXIghJVcI5g0Dt+WNysD
 +GEqWRJOGk2t4UCoLoTX0lEz3mgiSMhp6UJEkPKZ6cxmN7dFbrU9f/HcCZ/ZH6Yo0Fs=
X-Gm-Gg: ASbGncvXVT/N/bG0XqIpgvRjb6KVJ8BtT/OUQu3EpFipiJUj1dSY7ActHi+KFyOv1uX
 E2EK4IaTzLa2S1LO4FhVAedsP5eB1wSJyI4xxl8bkCaRo3MlA2bKxD3Y3SVLPxe1k9mf+fleljA
 Jy5VRyQmyk13aO42fkTqjnDH1QZ3TBJKEUdZy7KJKK0gFRICUaQddTDm8snE7e/1SYF6awMeg6T
 OxyBpz9I9Y5nRHPzKwkCmkghCLHOucTKUn1p9BynBmh7oxfm4/k4gsbQrqWB7q2IUZWqyh3k094
 GLzURbRXPfZ3jaxOPAxjO1RiC1hyXzFRVdzPoV5Zf5iTt8lCoJqkVWf0DgYrtuKve8egLfwpfSB
 jrMB57be8KnjJ9/S4g+SsbCE8GYcNH8ACP3g+sivXLPpWvnGCEEFA2GREnHLkTJHpsygN+Z8O+8
 u22j9TwUKR4m3ojA==
X-Google-Smtp-Source: AGHT+IGmAGBD97Epj/WeEGcN5gEkwzb3VxahJy8ok+Exiz/jYT1CykNbxuavifT2cKV6GzqdbxV0Uw==
X-Received: by 2002:a05:600c:3b21:b0:45c:b53e:331e with SMTP id
 5b1f17b1804b1-45dddea6034mr61247405e9.7.1757328957845; 
 Mon, 08 Sep 2025 03:55:57 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd0869b33sm195370725e9.9.2025.09.08.03.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:55:57 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:55:56 +0200
Message-Id: <20250908105556.682034-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250823170545.59420-1-thomas.petazzoni@bootlin.com>
References: <20250823170545.59420-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328958; x=1757933758; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKL34AtInYZ5dH6fY14s1AfzUS1NsLZF/UsoXUV5usc=;
 b=filLy2IqH4+jfoev0yCIpxuZAKGbBNraXNoWUwc4pvTp3m4H22amWd5fKXc1KxhR3d
 slJVs0tnjDPVOghy8DmuWe7T6Zsk9zCMfBKtF5H2GqTOWoGEigPyifpw4IZxlOMPWvE7
 ZimgjihzPh2VLkMrlD4mfCKsY5HGVinQkDvx02kMk+p6j0hYCwVLebXurcAB+YmkZV2T
 xscvSWmabgkz9IL5E1E/9M2HBmT7PGLb82aDsPvZYg4WIlM/IrgwK4f+d6FalKVezQ81
 sTQhqwaeMxFKwarWy3F4ULUUlwsj0ldnu/y2DNOcP5RK6SZDP09/R0K3eVqBvDhFgkuu
 m+SQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=filLy2Iq
Subject: Re: [Buildroot] [PATCH 1/2] package/sdl: improve existing patches
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
> - Replace patch 0001 by a properly Git-formatted patch, cherry-picked
>   from the upstream Git repository at
>   https://github.com/libsdl-org/SDL-1.2
> 
> - Add Upstream: tags on both patches, with the upstream Git
>   commit. Updated .checkpackageignore accordingly.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  .checkpackageignore                           |  2 -
>  ...-compilation-with-libX11-1.5.99.902.patch} | 51 +++++++++++--------
>  ...x11yuv.c-fix-possible-use-after-free.patch |  5 +-
>  3 files changed, 33 insertions(+), 25 deletions(-)
>  rename package/sdl/{0001-fix-compilation-with-libx11.patch => 0001-Fix-compilation-with-libX11-1.5.99.902.patch} (57%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index ca7fec588a..7826734ecd 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1044,8 +1044,6 @@ package/screen/0002-Change-binary-permission-flags-even-if-chown-fails.patch lib
>  package/screen/0003-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch lib_patch.Upstream
>  package/screen/0004-Renamed-sched.h-to-eventqueue.h.patch lib_patch.Upstream
>  package/scrub/0001-configure-ac-make-sure-m4-macros-are-included-in-the-build.patch lib_patch.Upstream
> -package/sdl/0001-fix-compilation-with-libx11.patch lib_patch.Upstream
> -package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch lib_patch.Upstream
>  package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch lib_patch.Upstream
>  package/sdl_mixer/0002-configure__set_macro_directory.patch lib_patch.Upstream
>  package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch lib_patch.Upstream
> diff --git a/package/sdl/0001-fix-compilation-with-libx11.patch b/package/sdl/0001-Fix-compilation-with-libX11-1.5.99.902.patch
> similarity index 57%
> rename from package/sdl/0001-fix-compilation-with-libx11.patch
> rename to package/sdl/0001-Fix-compilation-with-libX11-1.5.99.902.patch
> index 27f244883e..83f0ab2bb1 100644
> --- a/package/sdl/0001-fix-compilation-with-libx11.patch
> +++ b/package/sdl/0001-Fix-compilation-with-libX11-1.5.99.902.patch
> @@ -1,20 +1,24 @@
> -sdl: Fix compilation with libX11 >= 1.5.99.902
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -
> -# HG changeset patch
> -# User Azamat H. Hackimov <azamat.hackimov@gmail.com>
> -# Date 1370184533 -21600
> -# Node ID 91ad7b43317a6387e115ecdf63a49137f47e42c8
> -# Parent  f7fd5c3951b9ed922fdf696f7182e71b58a13268
> -Fix compilation with libX11 >= 1.5.99.902.
> +From 41410b72746cfc7ff515aefed62b0b179bf6e8da Mon Sep 17 00:00:00 2001
> +From: "Azamat H. Hackimov" <azamat.hackimov@gmail.com>
> +Date: Sun, 2 Jun 2013 20:48:53 +0600
> +Subject: [PATCH] Fix compilation with libX11 >= 1.5.99.902.
>  
>  These changes fixes bug #1769 for SDL 1.2
>  (http://bugzilla.libsdl.org/show_bug.cgi?id=1769).
>  
> -diff -r f7fd5c3951b9 -r 91ad7b43317a configure.in
> ---- a/configure.in	Wed Apr 17 00:56:53 2013 -0700
> -+++ b/configure.in	Sun Jun 02 20:48:53 2013 +0600
> -@@ -1169,6 +1169,17 @@
> +Upstream: 5d79977ec7a6b58afa6e4817035aaaba186f7e9f
> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> +---
> + configure.in               | 11 +++++++++++
> + include/SDL_config.h.in    |  1 +
> + src/video/x11/SDL_x11sym.h |  4 ++++
> + 3 files changed, 16 insertions(+)
> +
> +diff --git a/configure.in b/configure.in
> +index 08c8e1e9..89c526d4 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1127,6 +1127,17 @@ AC_HELP_STRING([--enable-video-x11-xrandr], [enable X11 Xrandr extension for ful
>               if test x$definitely_enable_video_x11_xrandr = xyes; then
>                   AC_DEFINE(SDL_VIDEO_DRIVER_X11_XRANDR)
>               fi
> @@ -32,10 +36,11 @@ diff -r f7fd5c3951b9 -r 91ad7b43317a configure.in
>           fi
>       fi
>   }
> -diff -r f7fd5c3951b9 -r 91ad7b43317a include/SDL_config.h.in
> ---- a/include/SDL_config.h.in	Wed Apr 17 00:56:53 2013 -0700
> -+++ b/include/SDL_config.h.in	Sun Jun 02 20:48:53 2013 +0600
> -@@ -283,6 +283,7 @@
> +diff --git a/include/SDL_config.h.in b/include/SDL_config.h.in
> +index 8bb1773c..78ca747b 100644
> +--- a/include/SDL_config.h.in
> ++++ b/include/SDL_config.h.in
> +@@ -282,6 +282,7 @@
>   #undef SDL_VIDEO_DRIVER_WINDIB
>   #undef SDL_VIDEO_DRIVER_WSCONS
>   #undef SDL_VIDEO_DRIVER_X11
> @@ -43,10 +48,11 @@ diff -r f7fd5c3951b9 -r 91ad7b43317a include/SDL_config.h.in
>   #undef SDL_VIDEO_DRIVER_X11_DGAMOUSE
>   #undef SDL_VIDEO_DRIVER_X11_DYNAMIC
>   #undef SDL_VIDEO_DRIVER_X11_DYNAMIC_XEXT
> -diff -r f7fd5c3951b9 -r 91ad7b43317a src/video/x11/SDL_x11sym.h
> ---- a/src/video/x11/SDL_x11sym.h	Wed Apr 17 00:56:53 2013 -0700
> -+++ b/src/video/x11/SDL_x11sym.h	Sun Jun 02 20:48:53 2013 +0600
> -@@ -165,7 +165,11 @@
> +diff --git a/src/video/x11/SDL_x11sym.h b/src/video/x11/SDL_x11sym.h
> +index 4875b989..bd83f7f5 100644
> +--- a/src/video/x11/SDL_x11sym.h
> ++++ b/src/video/x11/SDL_x11sym.h
> +@@ -165,7 +165,11 @@ SDL_X11_SYM(Bool,XShmQueryExtension,(Display* a),(a),return)
>    */
>   #ifdef LONG64
>   SDL_X11_MODULE(IO_32BIT)
> @@ -58,3 +64,6 @@ diff -r f7fd5c3951b9 -r 91ad7b43317a src/video/x11/SDL_x11sym.h
>   SDL_X11_SYM(void,_XRead32,(Display *dpy,register long *data,long len),(dpy,data,len),)
>   #endif
>   
> +-- 
> +2.50.1
> +
> diff --git a/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
> index d7858d0f96..68e66bd5a2 100644
> --- a/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
> +++ b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
> @@ -1,9 +1,10 @@
> -From d7e00208738a0bc6af302723fe64908ac35b777b Mon Sep 17 00:00:00 2001
> +From c24c08c9aa0f92213793e5ef404f2c387603d7f8 Mon Sep 17 00:00:00 2001
>  From: Ozkan Sezer <sezeroz@gmail.com>
>  Date: Sat, 18 Jun 2022 14:55:00 +0300
>  Subject: [PATCH] SDL_x11yuv.c: fix possible use-after-free
>  
>  Fixes: https://github.com/libsdl-org/SDL-1.2/issues/863
> +Upstream: d7e00208738a0bc6af302723fe64908ac35b777b
>  Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  ---
>   src/video/x11/SDL_x11yuv.c | 2 +-
> @@ -24,5 +25,5 @@ index 62698dfd..0d5754e3 100644
>   								0, width, height);
>   		}
>  -- 
> -2.30.2
> +2.50.1
>  
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
