Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02081C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9DB840CB7;
	Sat, 31 May 2025 16:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVz13oE4UKjU; Sat, 31 May 2025 16:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A590240A31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A590240A31;
	Sat, 31 May 2025 16:39:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E078E127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5CA040A31
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6qZOFL31Qd0 for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:38:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB818409E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB818409E8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB818409E8
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:38:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF1001C0D69; Sat, 31 May 2025 18:38:55 +0200 (CEST)
Message-ID: <f4d6f1d5-80e3-4032-bd72-49bfb8708c82@rnout.be>
Date: Sat, 31 May 2025 18:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
References: <20240831113626.105125-1-thomas@devoogdt.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20240831113626.105125-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LUhXhyg/S2R8qDQi6lYbhOaiCOebpXsmLcOUxMwWjFg=;
 b=Md+V9l94Z9lEDVlIkHA0INsoy8zPsj+Ha2lkeGOGkOGwXoEcW8Z2GuGw26Dr/jDMS5T5cx
 xF2QXcn7EyC1uwcc8K+rgoYRRalTOG3Yo2RL8wMTEiJHb5976YTHW9vcYhHhLHCGmyUlRr
 BAfYXKyfYie7fZ1Q88caNT0fYUweu5wbliJQcyJsMaGMtUPvyrtFimweJnLO/IMn0xApHr
 j3V4DxZb9xTuTXgQJQ73PR5jz63bxthQ9ITpmyqLlSwuLDXP0SIFlA3Jk8ZNjzCgT/gnm+
 kgRn7s10wLZI5XxH4ijqRrG3AIQZfoCW0lzJyHE3AtJyWl0BhRVEH8uydXW2cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Md+V9l94
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: add libgtk4 support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/08/2024 13:36, Thomas Devoogdt wrote:
> WebKitGTK defaults on GTK4 since version 2.44 [1],
> and the libgtk4 package was added in commit faf2a1d,
> so start using it.
> 
> [1] https://webkitgtk.org/2024/03/27/webkigit-2.44.html
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

  Applied to 2025.02.x, thanks.

  Just to make future cherry-picks of webkitgtk easier.

  Regards,
  Arnout

> ---
>   package/webkitgtk/Config.in    | 33 +++++++++++++++++++++++++--------
>   package/webkitgtk/webkitgtk.mk | 15 +++++++++++----
>   2 files changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index 8ee90dda1c..a556fec194 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -16,11 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>   
> -comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 10, host gcc >= 4.9"
> +comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 10, host gcc >= 4.9"
>   	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>   	depends on !BR2_BINFMT_FLAT
> -	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +	depends on (!BR2_PACKAGE_LIBGTK3 && !BR2_PACKAGE_LIBGTK4) || \
> +		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
>   		!BR2_HOST_GCC_AT_LEAST_4_9
>   	depends on BR2_USE_MMU
> @@ -35,7 +36,7 @@ config BR2_PACKAGE_WEBKITGTK
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
>   	depends on BR2_USE_WCHAR # icu, libsoup3
> -	depends on BR2_PACKAGE_LIBGTK3
> +	depends on BR2_PACKAGE_LIBGTK3 || BR2_PACKAGE_LIBGTK4
>   	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>   	select BR2_PACKAGE_CAIRO
>   	select BR2_PACKAGE_CAIRO_PNG
> @@ -54,10 +55,10 @@ config BR2_PACKAGE_WEBKITGTK
>   	select BR2_PACKAGE_WEBP
>   	select BR2_PACKAGE_WEBP_DEMUX
>   	select BR2_PACKAGE_WOFF2
> -	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
> -	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
> -	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
> -	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_LIBGTK3_X11
> +	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_WEBKITGTK_X11
> +	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_WEBKITGTK_X11
> +	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_WEBKITGTK_X11
> +	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_WEBKITGTK_X11
>   	help
>   	  WebKit is an open source, standards compliant web browser
>   	  engine.
> @@ -66,6 +67,22 @@ config BR2_PACKAGE_WEBKITGTK
>   
>   if BR2_PACKAGE_WEBKITGTK
>   
> +comment "webkitgtk X11 target needs the X11 GDK backend"
> +	depends on !BR2_PACKAGE_LIBGTK3_X11 && !BR2_PACKAGE_LIBGTK4_X11
> +
> +config BR2_PACKAGE_WEBKITGTK_X11
> +	bool "enable x11 target"
> +	default y
> +	depends on BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK4_X11
> +
> +comment "webkitgtk Wayland target needs the Wayland GDK backend"
> +	depends on !BR2_PACKAGE_LIBGTK3_WAYLAND && !BR2_PACKAGE_LIBGTK4_WAYLAND
> +
> +config BR2_PACKAGE_WEBKITGTK_WAYLAND
> +	bool "enable wayland target"
> +	default y
> +	depends on BR2_PACKAGE_LIBGTK3_WAYLAND || BR2_PACKAGE_LIBGTK4_WAYLAND
> +
>   config BR2_PACKAGE_WEBKITGTK_SANDBOX
>   	bool "sandboxing support"
>   	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 468fefab0e..5115f3eec5 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -14,7 +14,7 @@ WEBKITGTK_LICENSE_FILES = \
>   	Source/WebCore/LICENSE-LGPL-2.1
>   WEBKITGTK_CPE_ID_VENDOR = webkitgtk
>   WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
> -	enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libgtk3 libsecret \
> +	enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libsecret \
>   	libsoup3 libtasn1 libxml2 libxslt sqlite webp woff2
>   
>   WEBKITGTK_CMAKE_BACKEND = ninja
> @@ -28,10 +28,17 @@ WEBKITGTK_CONF_OPTS = \
>   	-DENABLE_WEB_RTC=OFF \
>   	-DPORT=GTK \
>   	-DUSE_AVIF=OFF \
> -	-DUSE_GTK4=OFF \
>   	-DUSE_LIBHYPHEN=OFF \
>   	-DUSE_WOFF2=ON
>   
> +ifeq ($(BR2_PACKAGE_LIBGTK4),y)
> +WEBKITGTK_CONF_OPTS += -DUSE_GTK4=ON
> +WEBKITGTK_DEPENDENCIES += libgtk4
> +else
> +WEBKITGTK_CONF_OPTS += -DUSE_GTK4=OFF
> +WEBKITGTK_DEPENDENCIES += libgtk3
> +endif
> +
>   ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
>   WEBKITGTK_CONF_OPTS += \
>   	-DENABLE_BUBBLEWRAP_SANDBOX=ON \
> @@ -103,7 +110,7 @@ else
>   WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
> +ifeq ($(BR2_PACKAGE_WEBKITGTK_X11),y)
>   WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
>   WEBKITGTK_DEPENDENCIES += libgl \
>   	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
> @@ -111,7 +118,7 @@ else
>   WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=OFF
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
> +ifeq ($(BR2_PACKAGE_WEBKITGTK_WAYLAND),y)
>   WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
>   else
>   WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=OFF

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
