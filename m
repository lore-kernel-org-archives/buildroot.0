Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5072ACD5BAC
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 20:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5F5A61580;
	Thu, 21 May 2026 20:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SLGzvE_bsHe; Thu, 21 May 2026 20:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B42D06159F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779394129;
	bh=j/sVnK5R60dn5XBYV1k0RnrjdadvlcUzsGCUPPr1PtE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P36Utspd0G68Jvc5GL904QpVb6t1hTlfCsiNV67z7VQrRRhm5jfGvX4T0IQuX00UM
	 NKCYiCuYG40vxPRc0W/Zrosi+2ekYOSTcDvuxJsVttBgSKb89y5gFjx6hXovYN0HDJ
	 Anr/BaT6DYu6p+XmgCY1uNckFsZxzjb+yM31/UlWJD1FQ4Ji1znfPLjul+IK9mSvOt
	 1wtbrxkt2R3CW+/HO4+g8sOgg/Ig1Qh/LxRb6ff0hAW4HYGFDvc+9vliE1qxVgwMxe
	 crUMoPGCtulIJoLB41pe4jsoLCz/c90lQ4GMSs4v6oW9PJrZ0DRH9G8wet+RPIi81q
	 ItK/LbxGoaTLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B42D06159F;
	Thu, 21 May 2026 20:08:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 019763B9
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E61966159F
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zed2lfHoWyBA for <buildroot@buildroot.org>;
 Thu, 21 May 2026 20:08:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A02561580
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A02561580
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A02561580
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:08:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B3F72B97C54F; Thu, 21 May 2026 22:08:43 +0200 (CEST)
Message-ID: <7551a523-03a3-4675-9719-36af502bf909@rnout.be>
Date: Thu, 21 May 2026 22:08:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
 <20260515-virglrenderer-v7-4-1f1814b65ccd@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260515-virglrenderer-v7-4-1f1814b65ccd@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779394124; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=kdcCRPUHnrfWQJqraPTVFKO6qlS5Yiie5n3budDMU64=;
 b=kxkNaEF654SUCBIHYO+3NclUsv1cQbc+vyJhpAXAcGlUmv41ZWjrU0aXQg1sCJgyFeOrp2
 NEsSBwEf+hPDcxsuzno0SQsSPTEoEhIhdPcjL2K9o1RauDq5nuX4uJuwGlayYxo7IHgM2C
 byimbTgOj4R2/kOLOwgKV4fT59kWXJqCNsnzBaqxfAQHiAZ9jg1whPa/cZjScm4+r7o3Er
 aQgSR9OF0fHg8T6E4hPu105zHBHBvLgtmeAOZtHU+VdGCPa7oS+RhlDwa15IfkOfm4bn3h
 5M+kb0rLRKLufIK2YVyFjGvkzYp0nL7335n4/ROMaQcgnhZXgWoGCv07PyamXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kxkNaEF6
Subject: Re: [Buildroot] [PATCH v7 4/8] package/virglrenderer: new package
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



On 16/05/2026 04:03, Joseph Kogut wrote:
> Add virglrenderer, an optional dependency of QEMU, which facilitates
> acceleration of rendering and optionally video decode through
> virtio-gpu.

  I'm not entirely sure how this works. Do you just have the driver for the 
host's hardware in your guest OS? So e.g. you have ti-sgx-um and virglrenderer 
in your guest OS, and voila, you get acceleration?

  Or is virglrender just the library that you have to link into qemu to enable 
this feature to begin with? What do you need in the guest then to be able to 
make use of it? Do you need the same driver in the host and the guest? What if 
they have different versions? Or can you have e.g. etnaviv in the host and 
vivante in the guest?

  Or maybe on the host you don't need anything other than virglrenderer, and the 
actual driver is purely in the guest? If that's the case, all the "default y if 
..." in this commit are incorrect.

  I looked at the test, but it doesn't help much because the test uses the same 
kernel/rootfs for the host and the guest...


  I have quite a few comments to this patch. In some cases, I expect that what 
you wrote is actually good but I misunderstood things. It would be good to add 
more explanation in the commit message about such situations.

> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>   DEVELOPERS                               |   1 +
>   package/Config.in                        |   1 +
>   package/virglrenderer/Config.in          | 117 +++++++++++++++++++++++++++++++
>   package/virglrenderer/virglrenderer.hash |   5 ++
>   package/virglrenderer/virglrenderer.mk   |  60 ++++++++++++++++
>   5 files changed, 184 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 25a047cb3e..774eb0b746 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1765,6 +1765,7 @@ F:	package/python-xlib/
>   F:	package/sentry-cli/
>   F:	package/sentry-native/
>   F:	package/unclutter-xfixes/
> +F:	package/virglrenderer/
>   
>   N:	Joshua Henderson <joshua.henderson@microchip.com>
>   F:	package/qt5/qt5wayland/
> diff --git a/package/Config.in b/package/Config.in
> index 9cae377fb5..01263e4c44 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -365,6 +365,7 @@ comment "Graphic libraries"
>   	source "package/sdl2_ttf/Config.in"
>   	source "package/spirv-headers/Config.in"
>   	source "package/tk/Config.in"
> +	source "package/virglrenderer/Config.in"
>   	source "package/vulkan-headers/Config.in"
>   	source "package/vulkan-loader/Config.in"
>   	source "package/vulkan-sdk/Config.in"
> diff --git a/package/virglrenderer/Config.in b/package/virglrenderer/Config.in
> new file mode 100644
> index 0000000000..041bb63a1c
> --- /dev/null
> +++ b/package/virglrenderer/Config.in
> @@ -0,0 +1,117 @@
> +config BR2_PACKAGE_VIRGLRENDERER
> +	bool "virglrenderer"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

  We usually have a comment here why it needs GCC 4.9 - typically a minimal C++ 
standard version, or C11.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBEPOXY
> +	help
> +	  A library for accelerated graphics and compute in
> +	  virtualized guests.
> +
> +	  virglrenderer can be built without virgl, venus, or DRM

  I wouldn't enumerate all the backends here but just say "can be built without 
any backend".

> +	  backends, although such a build will not provide guest
> +	  graphics or compute acceleration by itself.
> +
> +	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
> +
> +if BR2_PACKAGE_VIRGLRENDERER
> +comment "virglrenderer needs virgl, venus, or a DRM backend for guest acceleration"

  We don't normally put such comments that are just a hint for people who don't 
want to read the help text.

> +	depends on !BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
> +
> +config BR2_PACKAGE_VIRGLRENDERER_VIRGL
> +	bool "virgl"
> +	default y
> +	depends on (BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGBM) \
> +		|| BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
> +	help
> +	  Enable API-level OpenGL acceleration over virtio-gpu.
> +
> +	  Say 'y' if you want to run applications with OpenGL
> +	  acceleration in virtualized guests. Requires host
> +	  support for OpenGL.

  We don't use the "Say 'y'" formulation. I also don't know what "virtualized 
guests" means - guests are always virtualized, right? And "Requires" may sound 
like a build-time dependency on the build system. So I'd just make the help text 
"Enable API-level OpenGL acceleration over virtio-gpu. Requires the 
virtualization host to support OpenGL." Similarly for the other help texts.

> +	  https://docs.mesa3d.org/drivers/virgl.html
> +
> +comment "virgl needs OpenGL or OpenGL EGL and libgbm"
> +	depends on !((BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGBM) \
> +		|| BR2_PACKAGE_HAS_LIBGL)
> +
> +config BR2_PACKAGE_VIRGLRENDERER_VENUS
> +	bool "venus"
> +	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER

  I don't understand this default y. Is it just that there's no other way to 
know if the hardware supports Vulkan?

> +	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
> +	depends on !BR2_STATIC_LIBS # vulkan-loader
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
> +	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
> +	select BR2_PACKAGE_VULKAN_HEADERS
> +	select BR2_PACKAGE_VULKAN_LOADER
> +	help
> +	  Enable API-level Vulkan acceleration over virtio-gpu.
> +
> +	  Say 'y' if you want to run applications with Vulkan
> +	  acceleration in virtualized guests. Requires host
> +	  support for Vulkan.
> +
> +	  https://docs.mesa3d.org/drivers/venus.html
> +
> +config BR2_PACKAGE_VIRGLRENDERER_VAAPI
> +	bool "vaapi support"

  I would move this either to the beginning or the end to separate it from the 
backends. E.g.

comment "Virtio backends"

...

comment "DRM backends"

...

comment "Other options"

bool "vaapi support"


> +	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_LIBVA
> +	help
> +	  Enable hardware accelerated video encode/decode through
> +	  libva over virtio-gpu.
> +
> +comment "DRM backends"

  Not sure what is the distinction between virtio and DRM backends, but I don't 
suppose I really need to know :-)

> +
> +config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_AMDGPU
> +	bool "amdgpu"
> +	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
> +	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD
> +	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_LIBDRM_AMDGPU
> +	help
> +	  Enable DRM backend for amdgpu, used by Gallium radeonsi
> +	  and RADV vulkan drivers.
> +
> +config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_INTEL
> +	bool "intel"
> +	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
> +	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
> +	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
> +	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
> +	select BR2_PACKAGE_LIBDRM
> +	help
> +	  Enable DRM backend for i915, used by Gallium i915/Iris
> +	  and Intel vulkan drivers.
> +
> +config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_MSM
> +	bool "msm"
> +	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
> +	depends on !BR2_arm
> +	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
> +	select BR2_PACKAGE_LIBDRM
> +	help
> +	  Enable DRM backend for msm, used by Gallium freedreno
> +	  driver.
> +
> +config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_PANFROST
> +	bool "panfrost"
> +	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
> +	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST
> +	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
> +	select BR2_PACKAGE_LIBDRM
> +	help
> +	  Enable DRM backend for Panfrost, used by the panfrost
> +	  Gallium/vulkan drivers.
> +
> +endif
> +
> +comment "virglrenderer needs a toolchain w/ gcc >= 4.9"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +
> +config BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
> +	bool
> diff --git a/package/virglrenderer/virglrenderer.hash b/package/virglrenderer/virglrenderer.hash
> new file mode 100644
> index 0000000000..03da595091
> --- /dev/null
> +++ b/package/virglrenderer/virglrenderer.hash
> @@ -0,0 +1,5 @@
> +# Locally calculated
> +sha256  065bc56e89e6f631f96101cd62eba0748e48eb888b434edc86e89d05395e76f3  virglrenderer-1.3.0.tar.gz
> +
> +# License
> +sha256  3b32caf16e2402c2aff2b716858713f3e1feded85c25e71bf829816ee5009402  COPYING
> diff --git a/package/virglrenderer/virglrenderer.mk b/package/virglrenderer/virglrenderer.mk
> new file mode 100644
> index 0000000000..4e7bcbb849
> --- /dev/null
> +++ b/package/virglrenderer/virglrenderer.mk
> @@ -0,0 +1,60 @@
> +################################################################################
> +#
> +# virglrenderer
> +#
> +################################################################################
> +
> +VIRGLRENDERER_VERSION = 1.3.0
> +VIRGLRENDERER_SITE = https://gitlab.freedesktop.org/virgl/virglrenderer/-/archive/$(VIRGLRENDERER_VERSION)
> +VIRGLRENDERER_LICENSE = MIT
> +VIRGLRENDERER_LICENSE_FILES = COPYING
> +VIRGLRENDERER_INSTALL_STAGING = YES
> +VIRGLRENDERER_DEPENDENCIES = \
> +	libepoxy \
> +	host-pkgconf \
> +	host-python3 \
> +	host-python-pyyaml
> +VIRGLRENDERER_CPE_ID_VALID = YES
> +
> +ifeq ($(BR2_PACKAGE_VIRGLRENDERER_VIRGL),y)
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGBM),yy)
> +VIRGLRENDERER_PLATFORMS += egl
> +VIRGLRENDERER_DEPENDENCIES += libegl \
> +			      libgbm

  The indentation is a bit wonky here. Either put it all on a single line, or 
put the values on separate lines indented with a single tab (so 3 lines total).

  Regards,
  Arnout


> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> +VIRGLRENDERER_PLATFORMS += glx
> +VIRGLRENDERER_DEPENDENCIES += libgl
> +endif
> +endif # BR2_PACKAGE_VIRGLRENDERER_VIRGL
> +
> +VIRGLRENDERER_CONF_OPTS += -Dplatforms=$(subst $(space),$(comma),$(VIRGLRENDERER_PLATFORMS))
> +
> +ifeq ($(BR2_PACKAGE_VIRGLRENDERER_VENUS),y)
> +VIRGLRENDERER_CONF_OPTS += -Dvenus=true
> +VIRGLRENDERER_DEPENDENCIES += vulkan-headers \
> +			      vulkan-loader
> +else
> +VIRGLRENDERER_CONF_OPTS += -Dvenus=false
> +endif
> +
> +VIRGLRENDERER_DRM_BACKENDS-$(BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_AMDGPU) += amdgpu-experimental
> +VIRGLRENDERER_DRM_BACKENDS-$(BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_INTEL) += i915-experimental
> +VIRGLRENDERER_DRM_BACKENDS-$(BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_MSM) += msm
> +VIRGLRENDERER_DRM_BACKENDS-$(BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_PANFROST) += panfrost-experimental
> +
> +VIRGLRENDERER_CONF_OPTS += -Ddrm-renderers=$(subst $(space),$(comma),$(VIRGLRENDERER_DRM_BACKENDS-y))
> +
> +ifneq ($(VIRGLRENDERER_DRM_BACKENDS-y),)
> +VIRGLRENDERER_DEPENDENCIES += libdrm
> +endif
> +
> +ifeq ($(BR2_PACKAGE_VIRGLRENDERER_VAAPI),y)
> +VIRGLRENDERER_CONF_OPTS += -Dvideo=true
> +VIRGLRENDERER_DEPENDENCIES += libva libdrm
> +else
> +VIRGLRENDERER_CONF_OPTS += -Dvideo=false
> +endif
> +
> +$(eval $(meson-package))
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
