Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE21DCA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 738AA61669;
	Fri, 29 Aug 2025 15:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJk9ZKGrfxIv; Fri, 29 Aug 2025 15:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 807B561534
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 807B561534;
	Fri, 29 Aug 2025 15:58:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B16F7D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A5D440725
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqqsRJSYnxGb for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:58:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41E2340319
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41E2340319
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41E2340319
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:58:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3FE4CB97846F; Fri, 29 Aug 2025 17:58:00 +0200 (CEST)
Message-ID: <0411b634-285e-4a30-b9c0-2d247b51349e@rnout.be>
Date: Fri, 29 Aug 2025 17:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jim Reinhart <jimr@tekvox.com>
References: <20230920202452.655292-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20230920202452.655292-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756483080; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=20IV+2H9lzVFuNkL/Ag17NBmTy/0o0GZEX3SpgjvZqY=;
 b=icW/CeyMRDYtwMiwhy7SxN7oO9ZqoirKr53sjGU3xI9eTaSpzvEpBMmKqxA8CTtdij0GkI
 Et4T2oFXUx7MCUSd4WNvDtNJOZ5eIJIlyTQPsoKVaDsBwFxLFoRiW0jgiU6rytB4rTPzRQ
 PRGh52Vi+wOJWGApS+Fpsab0A/la2qU2O3VewqohXOJR/g8We7cIo2PIYPaLG5BXhils/Q
 0GZzuGO47eijpWeDQeQP0aiSdmkl/WzNytQ9Fuanm/Q+qZjDo3WhiXvpGYVuLvkHthXYeC
 rsXQBv44/IbIyDsZZUuBsOlV1mfxAKtdE7keTCp3hO9iSYBwBU2HMVY/9DhS+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=icW/CeyM
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/dotnet6-runtime: new package
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

  Hi Guilio,

  Some additional comments I made on top of the ones for -prebuilt.

On 20/09/2023 22:24, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> Add .NET 6 runtime to enable C# console applications to run on embedded
> Linux. At the moment the package can only be built for arm and aarch64.
> 
> https://dotnet.microsoft.com/en-us/download/dotnet/6.0

  Is it useful to have 6 and 8 parallel installed? Is it useful to have version 
selection at all?

[snip]
> diff --git a/package/dotnet6-runtime/Config.in b/package/dotnet6-runtime/Config.in
> new file mode 100644
> index 0000000000..71e22da422
> --- /dev/null
> +++ b/package/dotnet6-runtime/Config.in
> @@ -0,0 +1,31 @@
> +config BR2_PACKAGE_DOTNET6_RUNTIME_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	# On ARM CoreCLR JIT requires 16 64-bit or 32 32-bit FPU registers
> +	default y if BR2_arm && (BR2_ARM_FPU_VFPV3 || BR2_ARM_FPU_VFPV3D16 || \
> +				 BR2_ARM_FPU_VFPV4 || BR2_ARM_FPU_VFPV4D16)

  So... shouldn't this condition exist for the prebuilt version as well?

  Also, not supported on x86?

> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # aarch64 fpu assembly registers build failure
> +
> +config BR2_PACKAGE_DOTNET6_RUNTIME
> +	bool "dotnet6-runtime"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

  This condition is actually redundant with the other one, both musl and glibc 
always have threads.

> +	depends on !BR2_STATIC_LIBS

  Doesn't the build try to statically link with its dependent libraries? I.e. 
doesn't it required BR2_SHARED_STATIC_LIBS (shared because it generates only 
shared libraries, and static because it only statically links with libraries)?

> +	depends on BR2_PACKAGE_DOTNET6_RUNTIME_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_CMAKE

  Normally there shouldn't be select statements for host packages.

> +	select BR2_PACKAGE_ICU
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBKRB5
> +	select BR2_PACKAGE_LIBZLIB
> +	select BR2_PACKAGE_LTTNG_LIBUST
> +	select BR2_PACKAGE_OPENSSL

  Have you tested that it works (builds) with libressl?

> +	help
> +	  .NET Core 6 Runtime
> +
> +	  https://dotnet.microsoft.com/download/dotnet-core/6.0
> +
> +comment "dotnet-runtime needs a toolchain w/ glibc or musl and threads"
> +	depends on BR2_PACKAGE_DOTNET6_RUNTIME_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/dotnet6-runtime/dotnet6-runtime.hash b/package/dotnet6-runtime/dotnet6-runtime.hash
> new file mode 100644
> index 0000000000..9adddfd138
> --- /dev/null
> +++ b/package/dotnet6-runtime/dotnet6-runtime.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  a674c44736bf4f4dfafa800899577ef92cb626b9118b5fbdd0182f8c05b5c2e1  dotnet6-runtime-6.0.22.tar.gz
> +sha256  cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310  LICENSE.TXT
> diff --git a/package/dotnet6-runtime/dotnet6-runtime.mk b/package/dotnet6-runtime/dotnet6-runtime.mk
> new file mode 100644
> index 0000000000..ac1cb3815c
> --- /dev/null
> +++ b/package/dotnet6-runtime/dotnet6-runtime.mk
> @@ -0,0 +1,77 @@
> +################################################################################
> +#
> +# dotnet6-runtime
> +#
> +################################################################################
> +
> +DOTNET6_RUNTIME_VERSION = 6.0.22
> +DOTNET6_RUNTIME_SITE = $(call github,dotnet,runtime,v$(DOTNET6_RUNTIME_VERSION))
> +DOTNET6_RUNTIME_LICENSE = MIT
> +DOTNET6_RUNTIME_LICENSE_FILES = LICENSE.TXT
> +DOTNET6_RUNTIME_DEPENDENCIES = host-cmake libzlib openssl libcurl icu libkrb5 lttng-libust

  For such a long list, please do one dependency per line.

DOTNET6_RUNTIME_SRC_DEPENDENCIES = \
	...

  Also, don't depend on host-cmake instead use $(BR2_CMAKE_HOST_DEPENDENCY)
like cmake-package.

> +
> +ifeq ($(BR2_aarch64),y)
> +DOTNET6_RUNTIME_ARCH = arm64
> +else ifeq ($(BR2_arm),y)
> +DOTNET6_RUNTIME_ARCH = arm
> +# Set FPU type
> +DOTNET6_RUNTIME_ARM_FPU_TYPE = $(BR2_GCC_TARGET_FPU)
> +ifeq ($(BR2_ARM_FPU_VFPV3)$(BR2_ARM_FPU_VFPV4),y)
> +# Set 0x07 if 32 fpu registers are used
> +DOTNET6_RUNTIME_ARM_FPU_CAPABILITY = 0x07
> +else ifeq ($(BR2_ARM_FPU_VFPV3D16)$(BR2_ARM_FPU_VFPV4D16),y)
> +# Set 0x03 if 32 fpu registers are used
> +DOTNET6_RUNTIME_ARM_FPU_CAPABILITY = 0x03
> +endif
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> +DOTNET6_RUNTIME_TOOLCHAIN_PREFIX = $(GNU_TARGET_NAME)
> +else
> +DOTNET6_RUNTIME_TOOLCHAIN_PREFIX = $(TOOLCHAIN_EXTERNAL_PREFIX)
> +endif

  Hm, maybe it's more future-safe to use $(notdir $(TARGET_CROSS))? Of perhaps 
TARGET_CROSS with the full path just works as well?

> +
> +ifeq ($(BR2_ENABLE_DEBUG),y)

  We changed this into BR2_ENABLE_RUNTIME_DEBUG in cmake-package, should do the 
same here.

> +DOTNET6_RUNTIME_BUILD_CONFIGURATION = Debug
> +else
> +DOTNET6_RUNTIME_BUILD_CONFIGURATION = Release
> +endif
> +
> +DOTNET6_RUNTIME_CMAKEARGS = --cmakeargs "-DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/share/buildroot/toolchainfile.cmake"" \
> +		--cmakeargs "-DCMAKE_INSTALL_RUNSTATEDIR="/run"" \
> +		--cmakeargs "-DCMAKE_CXX_COMPILER_TARGET=$(DOTNET6_RUNTIME_TOOLCHAIN_PREFIX)" \
> +		--cmakeargs "-DTOOLCHAIN=$(DOTNET6_RUNTIME_TOOLCHAIN_PREFIX)"
> +
> +# Append FPU specific defines
> +ifeq ($(BR2_arm),y)
> +		DOTNET6_RUNTIME_CMAKEARGS += \
> +		--cmakeargs "-DCLR_ARM_FPU_TYPE=$(DOTNET6_RUNTIME_ARM_FPU_TYPE)" \
> +		--cmakeargs "-DCLR_ARM_FPU_CAPABILITY=$(DOTNET6_RUNTIME_ARM_FPU_CAPABILITY)"
> +endif
> +
> +define DOTNET6_RUNTIME_BUILD_CMDS
> +	cd $(@D) && PATH=$(BR_PATH) ROOTFS_DIR=$(HOST_DIR) \

  ROOTFS_DIR=$(HOST_DIR) sounds suspicious... Are you sure that that is correct? 
Not STAGING_DIR or TARGET_DIR?

> +		$(SHELL) ./build.sh --subset clr.jit+clr.runtime+libs --verbosity diag \
> +		--arch $(DOTNET6_RUNTIME_ARCH) --gcc --cross --skipcrossarchnative \
> +		--configuration $(DOTNET6_RUNTIME_BUILD_CONFIGURATION) \
> +		$(DOTNET6_RUNTIME_CMAKEARGS)
> +endef
> +
> +define DOTNET6_RUNTIME_INSTALL_TARGET_CMDS
> +	# Copy all .dll libraries to target directory
> +	cp -Rf $(@D)/artifacts/bin/testhost/net6.0-Linux-$(DOTNET6_RUNTIME_BUILD_CONFIGURATION)-$(DOTNET6_RUNTIME_ARCH)/. \
> +		$(TARGET_DIR)/usr/share/dotnet
> +	# Remove all .dbg, .pdb, .h, .a, .xml files from target
> +	find $(TARGET_DIR)/usr/share/dotnet/ \
> +		-type f \( -name "*.dbg" -o -name "*.pdb" -o -name "*.h" \
> +		-o -name "*.a" -o -name "*.xml" \) -delete
> +
> +	# Create /etc/dotnet/install_location file to point to dotnet
> +	mkdir -p $(TARGET_DIR)/etc/dotnet
> +	echo /usr/share/dotnet > $(TARGET_DIR)/etc/dotnet/install_location
> +	# Export dotnet to PATH and libraries to LD_LIBRARY_PATH
> +	$(INSTALL) -m 0755 -D $(DOTNET6_RUNTIME_PKGDIR)/dotnet6-runtime.sh \
> +		$(TARGET_DIR)/etc/profile.d/dotnet6-runtime.sh
> +endef
> +
> +$(eval $(generic-package))

  I expect that you can't simply bypass the build.sh script and use 
cmake-package directly?

  Regards,
  Arnout

> diff --git a/package/dotnet6-runtime/dotnet6-runtime.sh b/package/dotnet6-runtime/dotnet6-runtime.sh
> new file mode 100644
> index 0000000000..31dbe9a410
> --- /dev/null
> +++ b/package/dotnet6-runtime/dotnet6-runtime.sh
> @@ -0,0 +1,2 @@
> +export PATH=$PATH:/usr/share/dotnet
> +export LD_LIBRARY_PATH=/usr/share/dotnet/shared/Microsoft.NETCore.App/6.0.16

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
