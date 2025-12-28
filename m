Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89949D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 23:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 728CC80F58;
	Sun, 28 Dec 2025 23:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmKvvUtihaGi; Sun, 28 Dec 2025 23:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C44D380EDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766963280;
	bh=9OP34o/QffDV88XMcpKNzSmbhnHCqC1g8fXzu0S/KD0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MYC70mNAwLXapp5fPfSJbKlQTc1ZzQkIzU6l2U/Mds3ChQSqGwA64AfH/9K21mA7P
	 qOx8MkAB6InPF/DcZoyF70yrzwh6JUUkzGN+1EIBE6XBzgnooWXKkgGCcxuRaoixUg
	 ZvUG4+nTkiVf6ulw+vLNbVts++w1xMqhPYkSJHPz+R8TN35uLR9w9kvqccSFkC7KMz
	 zZq1VGdm2gJPPsjLki03ZOT3nxI+QBsF7kQnsw1HdkzC6Ki/I3VfKuoDF6zB5Vh34V
	 t32KChYt1QYOGDq/kR6wq3ViTVtccmLVvwDAjLpVCfSn0zqjysvSD7whMWved3cgib
	 du/P4tSxIocTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C44D380EDD;
	Sun, 28 Dec 2025 23:08:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE98DD8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA0FC60A7B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxCtxYj_kX-z for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 23:07:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1B1D60A67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1B1D60A67
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1B1D60A67
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:07:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0A615780333;
 Mon, 29 Dec 2025 00:07:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 00:07:52 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 00:07:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251228124318.3450440-1-bernd@kuhls.net>
References: <20251228124318.3450440-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <e109729149f8c331b5152ec868078785@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766963275;
 bh=IFABkZdEkXCJL8oS+nzt/gFI7a5ftmV/geKTrcZ58po=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TenZjHb/RbMfNzPVi1w7geHsNkHPcP14DZIg/ohxRuffI9pF/11nXNwzJuufrDv6O
 A1jnh9ZHt0mx/oulLGaTdmfw7ZjGjLwW4isTfb7PEBQK+rIQq0AHmhy4VRw6NcdMui
 uVKEbtA9K23/nN9VNom79o9YeW21ITejoTlFcho5hf1FF1xcsKKy59BveR7NNog/XN
 EfUWfBPwC6bwXdHFJeibxYCZAg9OMpJvBhAOf26rtTIlOU9Tp+G+4WyTNKOKNkfpku
 1OIX8M4xfJIlGPQwiOFTAUY3yxOS6/NWSbVZhfumVmrcphG05oK1ZiY+n6RgaX0AGO
 oVfgHCInwvtpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TenZjHb/
Subject: Re: [Buildroot] [PATCH v2 1/1] package/piglit: bump version
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

Hi Bernd,

Thanks for the updated patch.

On 28/12/2025 13:43, Bernd Kuhls wrote:
> Disabled vulkan tests added by upstream commit:
> https://gitlab.freedesktop.org/mesa/piglit/-/commit/2519c330fba55ce6efd0dbee07aa67c703124d4f
> 
> Added X11-related configure options due to upstream commit:
> https://gitlab.freedesktop.org/mesa/piglit/-/commit/d958b70d1fc5c2ee039363d862b14ca498a50e82
> 
> Added configure options to fix build errors without libdrm and with
> libegl/libgles enabled but without X11.
> These build errors were not seen before due to other build errors
> unfixed since the bump of python3 to 3.10 with buildroot commit
> 25b1fc2898d68ddf2674b14c738045875fc5a2dc:
> https://patchwork.ozlabs.org/project/buildroot/patch/20230723074303.603364-1-bernd@kuhls.net/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: added more build fixes (Julien)
>     bumped version to current HEAD
[...]
> diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
> index 4d17405d10..360bddd40e 100644
> --- a/package/piglit/piglit.mk
> +++ b/package/piglit/piglit.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -PIGLIT_VERSION = 2affee53f3ad7a96f5b397a2b6d6408af8a374b0
> +PIGLIT_VERSION = 62d499d63d2b8b29a67efd9d93ed9b6a94d4950e
>  PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
>  PIGLIT_SITE_METHOD = git
>  PIGLIT_LICENSE = MIT (code), \
> @@ -29,16 +29,27 @@ PIGLIT_DEPENDENCIES = host-pkgconf \
>  PIGLIT_CONF_OPTS += \
>  	-DPIGLIT_USE_WAFFLE=ON \
>  	-DPIGLIT_BUILD_CL_TESTS=OFF \
> +	-DPIGLIT_BUILD_VK_TESTS=OFF \
>  	-DPIGLIT_BUILD_WGL_TESTS=OFF \
>  	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
> 
>  ifeq ($(BR2_PACKAGE_XORG7),y)
>  # libxcb for xcb-dri2
> +PIGLIT_CONF_OPTS += -DPIGLIT_USE_X11=ON
>  PIGLIT_DEPENDENCIES += \
>  	xlib_libX11 \
>  	xlib_libXext \
>  	xorgproto \
>  	$(if $(BR2_PACKAGE_LIBXCB),libxcb)
> +else
> +PIGLIT_CONF_OPTS += -DPIGLIT_USE_X11=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBDRM),y)

Here, the "utils/check-symbols" script reports the error:
package/piglit/piglit.mk:48: BR2_PACKAGE_HAS_LIBDRM referenced but not 
defined

I believe you meant "BR2_PACKAGE_LIBDRM".

Also, fixing this symbol name alone does not seem sufficient.
When testing with the following commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_PIGLIT=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_WESTON=y
BR2_PACKAGE_PYTHON3=y
EOF
make olddefconfig
make piglit

The piglit meson configuration fails with error:

CMake Error at CMakeLists.txt:271 (message):
   PIGLIT_BUILD_DMA_BUF_TESTS require libdrm, gbm_bo_map(), 
libdrm>=2.4.98 and
   xcb-dri2

So maybe this line should rather be:

ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBXCB),yy)

> +PIGLIT_DEPENDENCIES += libdrm
> +PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_DMA_BUF_TESTS=ON
> +else
> +PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_DMA_BUF_TESTS=OFF
>  endif
> 
>  ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> @@ -54,7 +65,7 @@ else
>  PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GLX_TESTS=OFF
>  endif
> 
> -ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
> +ifeq 
> ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
>  PIGLIT_DEPENDENCIES += libegl
>  PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GLES1_TESTS=ON \
>  	-DPIGLIT_BUILD_GLES2_TESTS=ON \
> --
> 2.47.3

Could you confirm and send an updated patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
