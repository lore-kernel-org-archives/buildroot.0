Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7286D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96D6B40E2A;
	Wed,  7 Jan 2026 17:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjjSQ8g2QHoB; Wed,  7 Jan 2026 17:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB1854107E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808544;
	bh=87t/g0a8GJ5CUxcBitgfn6H5EB3BMLZAhpRvScw4VEo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sJesZysdw67q49o8p2I0G6Y6Mmw9BqlGrHF8hVD+k7LSLxnQMPqh4biOpsgDN8Z3s
	 YjI2mXiE2+Q5DxfFaHGPEbj1vwaR6B5RUcqxDW9D488dZh/bVrbQ8OIVLwuSHg2ui2
	 532sXwdsBxes4c5RHvx7irkJclqjs7veCnqsgx/aNApcwrrCNFUNpRnKYIBllArhJT
	 u02KocWdye2t7S7knKZc7k4FDLwH4tQwbTHZGwSkiJtZymvPT/Y5lfw1DsPKycqZya
	 I6SgG95z8iiM4gxrG3JPsvph+H6OZmp8CtxFeLON5arqVEhMBrb82K/DStZhm9j89X
	 SRbG4BlW3AldQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB1854107E;
	Wed,  7 Jan 2026 17:55:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63DE425B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 619E6607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbZNtqnuKdB4 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F8B360661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F8B360661
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F8B360661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44847B97A704; Wed,  7 Jan 2026 18:55:39 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:37 +0100
Message-ID: <20260107175537.230185-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215210234.1123314-1-thomas.petazzoni@bootlin.com>
References: <20251215210234.1123314-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808539; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=c5RR8PBJCyuPI1j+A09k+DyDqOv5garFdq+PFEvqbxk=;
 b=JeeNFU7lkEvlOCwM6NTqk+JPlLNU/+0cBuD8opeRqlDn32YHDIOnWcVdPu94HGxDI7C7FC
 K64FdLLkY5Ci9IK9ELcDPDPLeS4CYG6hz2zEWwATtWtOkdMiDScVEpalJfZt/JHVMZgPXT
 nXS2NOx6l5X1pdpmUwaWJw0JMkv7m7ejK+uU+GpUKb66xRwzaIk3dRaICAjq+YAp56U8Vp
 DHd4zp6t+p7P2AUuJNWoDg1iLmW7fWO/ZpYBqWzXpIfhPU4hzm1bvtTc9xPtcO2BgQIkq9
 7DLK5hO9aOvBkOYNejuEzayy8zBm9jEENF1W0Fsu1cSbZUqG9Tbv416NU4I2Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=JeeNFU7l
Subject: Re: [Buildroot] [PATCH v2] package/mesa3d: add missing dependencies
 for imagination driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The build of the following basic configuration enabling the
> imagination Vulkan driver
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION=y
> 
> fails with:
> 
> meson.build:847:3: ERROR: Feature llvm cannot be disabled: CLC requires LLVM
> 
> Adding just LLVM as a dependency is not enough, as then libclc is
> needed, then LLVMSPIRVLib, then clangBasic, then the pco_clc tool.
> 
> In fact, like the Panfrost driver, building the Imagination driver
> requires building host tools using host-mesa3d. To fix this we:
> 
> - Make the BR2_PACKAGE_MESA3D_OPENCL option selectable
> 
> - Make sure that BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION depends
>   on BR2_PACKAGE_MESA3D_LLVM and select
>   BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER (the latter being needed to
>   build host-mesa3d)
> 
> - Make sure the host-mesa3d builds imagination
>   tools (-Dtools=imagination) and install
>   pco_clc (HOST_MESA3D_INSTALL_PCO_CLC). This requires introducing
>   HOST_MESA3D_TOOLS as a list of tools to build, which then gets used
>   to construct the -Dtools argument, as we can now have both
>   "panfrost" and "imagination" in this list.
> 
> With all this, the defconfig above builds successfully.
> 
> This has been broken since Buildroot commit
> 5e818c16a31a902ec29a250f920f43c76e2d9868, which introduced the vulkan
> driver support.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.11.x. Thanks

> ---
> v1 -> v2:
> 
> Ensure that both panfrost *and imagination tools can be built. The v1
> would only allow one or the other.
> ---
>  package/mesa3d/Config.in |  6 ++++++
>  package/mesa3d/mesa3d.mk | 19 +++++++++++++++----
>  2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 89e40d47b1..e1faea95d5 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -58,6 +58,7 @@ menuconfig BR2_PACKAGE_MESA3D_OPENCL
>  		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
>  		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
>  		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
> +		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION || \
>  		(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
>  		 BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER)
>  	select BR2_PACKAGE_LLVM_RTTI
> @@ -336,10 +337,15 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
>  	bool "Vulkan imagination driver"
>  	depends on BR2_arm || BR2_aarch64
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
> +	depends on BR2_PACKAGE_MESA3D_LLVM
> +	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
>  	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>  	help
>  	  Vulkan imagination driver.
>  
> +comment "imagination vulkan needs llvm"
> +	depends on !BR2_PACKAGE_MESA3D_LLVM
> +
>  config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
>  	bool "Vulkan Intel driver"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 36e6614124..3ba51c8b8f 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -284,9 +284,18 @@ else
>  MESA3D_CONF_OPTS += -Dglvnd=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
> +HOST_MESA3D_TOOLS += panfrost
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION),y)
> +HOST_MESA3D_TOOLS += imagination
> +endif
> +
>  HOST_MESA3D_CONF_OPTS = \
>  	-Dglvnd=disabled \
>  	-Dgallium-drivers=$(subst $(space),$(comma),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \
> +	-Dtools=$(subst $(space),$(comma),$(HOST_MESA3D_TOOLS)) \
>  	-Dinstall-mesa-clc=true \
>  	-Dmesa-clc=enabled \
>  	-Dplatforms= \
> @@ -294,10 +303,6 @@ HOST_MESA3D_CONF_OPTS = \
>  	-Dglx=disabled \
>  	-Dvulkan-drivers=""
>  
> -ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
> -HOST_MESA3D_CONF_OPTS += -Dtools=panfrost
> -endif
> -
>  HOST_MESA3D_DEPENDENCIES = \
>  	host-libclc \
>  	host-libdrm \
> @@ -310,10 +315,16 @@ HOST_MESA3D_INSTALL_PANFROST_COMPILE = \
>  	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/panfrost/clc/panfrost_compile $(HOST_DIR)/bin/panfrost_compile
>  endif
>  
> +ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION),y)
> +HOST_MESA3D_INSTALL_PCO_CLC = \
> +	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/imagination/pco/uscgen/pco_clc $(HOST_DIR)/bin/pco_clc
> +endif
> +
>  define HOST_MESA3D_INSTALL_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/compiler/clc/mesa_clc $(HOST_DIR)/bin/mesa_clc
>  	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/compiler/spirv/vtn_bindgen2 $(HOST_DIR)/bin/vtn_bindgen2
>  	$(HOST_MESA3D_INSTALL_PANFROST_COMPILE)
> +	$(HOST_MESA3D_INSTALL_PCO_CLC)
>  endef
>  
>  $(eval $(meson-package))
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
