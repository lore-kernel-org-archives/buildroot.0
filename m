Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01371E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FF4441584;
	Sat, 30 Sep 2023 15:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FF4441584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZcoirnX9AaG; Sat, 30 Sep 2023 15:06:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 340F840B2F;
	Sat, 30 Sep 2023 15:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 340F840B2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9E041BF5F5
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9230560EA5
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9230560EA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPPLvNeZxyW3 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:06:45 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E71A660D58
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E71A660D58
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-307d20548adso13471398f8f.0
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696086402; x=1696691202;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tBdHSF7g3VYSpd2vQ0shmi5Mztht2N9xsflb43WjaYk=;
 b=UakwqPKqGgAnboI1PiuvLpiLvnbTyBmDFovMWbEfA4tEG3qM68c2AH1GSi3Wf9Ngi4
 Ps71Pta1SaO1m/q88Dei9h4Z5lx8NiT4gq56tzIAFtesUuvcz8aaGZ4pYWcuHLdDLoLT
 AI4ofDncUt5pTxWxhBgX7MpD3V0MXBoXmywyiAgKY2+tlTvc060BMEtkMeIrCnv9qMpc
 D6ztjbn9d3gbfR/zxCgL2LMhpoC5QmmwVTK9Ahy6mAtWfIPqW2k1LyB0nv6TYIci0VY6
 H3NO4SDScDFFsNZ41981uwGJeAyEyeJWYlrcDQht6XLgbEjnGbAsef6qzZ9Q1lHdkcvV
 z9Og==
X-Gm-Message-State: AOJu0YwiLYuBTrf/q6+TLlO3Cpx9Q0lBM3hw5q8zo8bFvpKkLl4lhDPk
 au4GKbYgnwUAsSmbqpFfN8qUzg==
X-Google-Smtp-Source: AGHT+IFdktRdlQ2rcwWk03istBofOw6zhh2uePhW+1SicyMbUNHkGesAjPlATq5eKCgYyYqvSfciWA==
X-Received: by 2002:adf:fd03:0:b0:31f:b120:143 with SMTP id
 e3-20020adffd03000000b0031fb1200143mr6739889wrr.59.1696086402210; 
 Sat, 30 Sep 2023 08:06:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a5d46c7000000b0031fbbe347e1sm23849083wrs.65.2023.09.30.08.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 08:06:41 -0700 (PDT)
Message-ID: <507e45e1-3a75-536a-8e8a-7f9b997b6974@mind.be>
Date: Sat, 30 Sep 2023 17:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220809094109.2279598-1-james.hilliard1@gmail.com>
In-Reply-To: <20220809094109.2279598-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696086402; x=1696691202; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tBdHSF7g3VYSpd2vQ0shmi5Mztht2N9xsflb43WjaYk=;
 b=gtTG+NSDUzXXY5156EADW4u/r6YtZRyERgJYn731f1ctXefbGQmKCNrq+HQLlRxA8Z
 V4V/Wi9VvlRV48FrMjggKErPN/iA0/Ur1yD8ryTMRqHzQI3omBxtMeUtlMsyp5JHEFYK
 +oxbWSBQlUx9X2DLCFZbO54vmvbx6rtf6oPN5ADsA+PCedU7tVGhJ3FjJ/zq9V53eEkD
 FqBbWh12Gjd6Vpg6JLGKXzWs+WDYBY50NEvxLbCxFfu4XFlkRytapvRuRUYeTrUvO0XY
 oix2QQynCfFsw383WGJALa2MMVCA/uCIhIastOqD7oDe2QvKTOgOv3vVAk5z3HP3+cAo
 zvOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gtTG+NSD
Subject: Re: [Buildroot] [PATCH 1/2] package/gcc/gcc-bpf: add BPF target
 support
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
Cc: "Jose E . Marchesi" <jose.marchesi@oracle.com>,
 David Faust <david.faust@oracle.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

  After more than a year we're finally getting back to this patch...

On 09/08/2022 11:41, James Hilliard wrote:
> This adds GCC BPF target support, however unlike traditional targets
> the BPF target is effectively used by packages such as systemd as
> a separate language rather than an entirely separate architecture.

  I looked at the systemd mesonfile and it looks like it unconditionally uses 
gcc-bpf if it can find bpf-none-gcc in PATH. That's annoying, because it means 
that currently, it'll already use it if it is installed in /usr/bin... Ideally 
we should enable/disable it in systemd dependin on whether gcc-bpf is enabled or 
not.

> As such we need to build what is effectively a multi-arch toolchain

  It's not really a toolchain because there's no libc, just the compiler itself...

> for GCC BPF support, as the BPF target is effectively a bare metal
> target this isn't the same as a multi-lib toolchain and generally
> avoids library conflict issues as the BPF target does not have
> userspace libraries.

  ... which you already say here :-)


> This adds an additional gcc build stage which is similar to gcc-final
> and added as a toolchain dependency when BPF target support is
> enabled.

  I don't see why this is an additional gcc build stage. It seems to me that 
gcc-bpf shouldn't need a dependency on libc or on host-gcc-initial. It probably 
_does_ have a dependency on kernel headers though...


> Similar to our gcc toolchain we also need a toolchain wrapper, this
> is separate from our normal toolchain wrapper.

  Are you sure this toolchain wrapper is needed? Most of the fixups that are 
applied by the wrapper relate to the target architecture options - -march, 
-mtune, etc. I would expect that those would simply break gcc-bpf entirely... 
Other options are for optimisation, debugging, hardening, etc. I'm not sure if 
it's a good idea to apply those when compiling to BPF either. Then there's 
pointing to the sysroot - given that this is a bare metal toolchain, it 
shouldn't be needed. And finally there is ccache, which I'm also not sure of if 
it's going to work well with BPF code generation.

  So I'm thinking that the wrapper should perhaps be skipped here.


> Cc: Jose E. Marchesi <jose.marchesi@oracle.com>
> Cc: David Faust <david.faust@oracle.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/Makefile.in                           |   3 +
>   package/gcc/Config.in.host                    |  12 ++
>   package/gcc/gcc-bpf/gcc-bpf.hash              |   1 +
>   package/gcc/gcc-bpf/gcc-bpf.mk                | 116 ++++++++++++++++++
>   .../toolchain-buildroot.mk                    |   4 +
>   5 files changed, 136 insertions(+)
>   create mode 120000 package/gcc/gcc-bpf/gcc-bpf.hash
>   create mode 100644 package/gcc/gcc-bpf/gcc-bpf.mk
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index ff60f85092..a6f5292903 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -39,6 +39,9 @@ endif
>   # Compute GNU_TARGET_NAME
>   GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
>   
> +# Compute BPF_TARGET_NAME
> +BPF_TARGET_NAME = bpf-$(TARGET_VENDOR)-none
> +
>   # FLAT binary format needs uclinux, except RISC-V 64-bits which needs
>   # the regular linux name.
>   ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index ba2a2ee072..c49f6e6b26 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -60,6 +60,10 @@ config BR2_GCC_VERSION_12_X
>   
>   endchoice
>   
> +config BR2_GCC_SUPPORTS_BPF
> +	bool
> +	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +
>   # libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
>   config BR2_GCC_SUPPORTS_LIBCILKRTS
>   	bool
> @@ -94,6 +98,14 @@ config BR2_EXTRA_GCC_CONFIG_OPTIONS
>   	  include. Those options are applied for all of the gcc
>   	  initial, gcc intermediate and gcc final passes.
>   
> +config BR2_TOOLCHAIN_BUILDROOT_BPF
> +	bool "Enable bpf support"
> +	depends on BR2_GCC_SUPPORTS_BPF
> +	depends on BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_BPF
> +	help
> +	  Enable this option if you want your toolchain to support BPF
> +	  targets.

  This only allows us to use gcc-bpf with an internal toolchain. In general, we 
want that any feature exposed by the internal toolchain is also available in a 
(custom) external toolchain.

  However, for gcc-bpf, I don't think it needs to be tied to the internal 
toolchain at all. For me, it makes more sense to have it as a seperate package, 
unrelated to gcc, with a fixed version. Having these selectable versions is 
anyway a pain :-). And I don't think there's any reason to need to link the 
version of gcc-bpf with gcc-target.

  So I would propose to make gcc-bpf a completely new package with no 
relationship with gcc at all.

> +
>   config BR2_TOOLCHAIN_BUILDROOT_CXX
>   	bool "Enable C++ support"
>   	select BR2_INSTALL_LIBSTDCPP
> diff --git a/package/gcc/gcc-bpf/gcc-bpf.hash b/package/gcc/gcc-bpf/gcc-bpf.hash
> new file mode 120000
> index 0000000000..7ac9361ab2
> --- /dev/null
> +++ b/package/gcc/gcc-bpf/gcc-bpf.hash
> @@ -0,0 +1 @@
> +../gcc.hash
> \ No newline at end of file
> diff --git a/package/gcc/gcc-bpf/gcc-bpf.mk b/package/gcc/gcc-bpf/gcc-bpf.mk
> new file mode 100644
> index 0000000000..b12d27ad00
> --- /dev/null
> +++ b/package/gcc/gcc-bpf/gcc-bpf.mk
> @@ -0,0 +1,116 @@
> +################################################################################
> +#
> +# gcc-bpf
> +#
> +################################################################################
> +
> +GCC_BPF_VERSION = $(GCC_VERSION)
> +GCC_BPF_SITE = $(GCC_SITE)
> +GCC_BPF_SOURCE = $(GCC_SOURCE)
> +
> +HOST_GCC_BPF_DL_SUBDIR = gcc
> +
> +HOST_GCC_BPF_DEPENDENCIES = \
> +	$(HOST_GCC_COMMON_DEPENDENCIES) \

  I don't think all of those dependencies apply. For sure host-binutils 
shouldn't be needed for gcc-bpf, only host-binutils-bpf, no? And even on a FLAT 
target I don't think elf2flt should be needed.

> +	$(BR_LIBC)

  As I wrote earlier, I don't see why it should depend on libc.

> +
> +HOST_GCC_BPF_EXCLUDES = $(HOST_GCC_EXCLUDES)
> +
> +HOST_GCC_BPF_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES

  If it's a separate package with a different version, this isn't needed either.

> +
> +# gcc doesn't support in-tree build, so we create a 'build'
> +# subdirectory in the gcc sources, and build from there.
> +HOST_GCC_BPF_SUBDIR = build
> +
> +HOST_GCC_BPF_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
> +
> +HOST_GCC_BPF_CONF_OPTS = \
> +	--target=$(BPF_TARGET_NAME) \
> +	--prefix="$(HOST_DIR)" \
> +	--sysconfdir="$(HOST_DIR)/etc" \
> +	--enable-languages=c \
> +	--with-gnu-ld \
> +	--enable-static \
> +	--disable-decimal-float \
> +	--disable-gcov \
> +	--disable-libssp \
> +	--disable-multilib \
> +	--disable-shared \
> +	--with-gmp=$(HOST_DIR) \
> +	--with-mpc=$(HOST_DIR) \
> +	--with-mpfr=$(HOST_DIR) \
> +	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
> +	--with-bugurl="http://bugs.buildroot.net/" \
> +	--without-zstd \
> +	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
> +
> +ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
> +HOST_GCC_BPF_DEPENDENCIES += host-isl
> +HOST_GCC_BPF_CONF_OPTS += --with-isl=$(HOST_DIR)
> +else
> +HOST_GCC_BPF_CONF_OPTS += --without-isl --without-cloog
> +endif

  I think it's very unlikely that it's worth enabling graphite for BPF code 
generation... I wouldn't bother with this.


> +# Don't build documentation. It takes up extra space / build time,
> +# and sometimes needs specific makeinfo versions to work
> +HOST_GCC_BPF_CONF_ENV = \
> +	MAKEINFO=missing
> +
> +# Make sure we have 'cc'
> +define HOST_GCC_BPF_CREATE_CC_SYMLINKS
> +	if [ ! -e $(HOST_DIR)/bin/$(BPF_TARGET_NAME)-cc ]; then \
> +		ln -f $(HOST_DIR)/bin/$(BPF_TARGET_NAME)-gcc \
> +			$(HOST_DIR)/bin/$(BPF_TARGET_NAME)-cc; \

  I don't think there's anything that actually needs or uses the bpf-none-cc 
symlink. At least in systemd, there's explicit logic for clang and for gcc, 
there's no use of -cc.

> +	fi
> +endef
> +
> +HOST_GCC_BPF_POST_INSTALL_HOOKS += HOST_GCC_BPF_CREATE_CC_SYMLINKS
> +
> +HOST_GCC_BPF_MAKE_OPTS = $(HOST_GCC_COMMON_MAKE_OPTS) all-gcc all-target-libgcc

  The common opts are just gcc_cv_libc_provides_ssp=yes/no. Again, I don't think 
we should necessarily apply the global SSP option to BPF. SSP for BPF sounds 
slightly ridiculous...

> +HOST_GCC_BPF_INSTALL_OPTS = install-gcc install-target-libgcc
> +
> +HOST_GCC_BPF_TOOLCHAIN_WRAPPER_ARGS = -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
> +HOST_GCC_BPF_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
> +
> +define HOST_GCC_BPF_TOOLCHAIN_WRAPPER_BUILD
> +	$(HOSTCC) $(HOST_CFLAGS) $(HOST_GCC_BPF_TOOLCHAIN_WRAPPER_ARGS) \
> +		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
> +		toolchain/toolchain-wrapper.c \
> +		-o $(@D)/toolchain-wrapper-bpf
> +endef
> +
> +define HOST_GCC_BPF_TOOLCHAIN_WRAPPER_INSTALL
> +	$(INSTALL) -D -m 0755 $(@D)/toolchain-wrapper-bpf \
> +		$(HOST_DIR)/bin/toolchain-wrapper-bpf
> +endef
> +
> +HOST_GCC_BPF_POST_BUILD_HOOKS += HOST_GCC_BPF_TOOLCHAIN_WRAPPER_BUILD
> +HOST_GCC_BPF_POST_INSTALL_HOOKS += HOST_GCC_BPF_TOOLCHAIN_WRAPPER_INSTALL
> +
> +define HOST_GCC_BPF_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
> +	$(Q)cd $(HOST_DIR)/bin; \
> +	for i in $(BPF_TARGET_NAME)-*; do \
> +		case "$$i" in \
> +		*.br_real) \
> +			;; \
> +		*-ar|*-ranlib|*-nm) \
> +			ln -snf $$i bpf$${i##$(BPF_TARGET_NAME)}; \
> +			;; \
> +		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran|*-gdc) \
> +			rm -f $$i.br_real; \
> +			mv $$i $$i.br_real; \
> +			ln -sf toolchain-wrapper-bpf $$i; \
> +			ln -sf toolchain-wrapper-bpf bpf$${i##$(BPF_TARGET_NAME)}; \
> +			ln -snf $$i.br_real bpf$${i##$(BPF_TARGET_NAME)}.br_real; \
> +			;; \
> +		*) \
> +			ln -snf $$i bpf$${i##$(BPF_TARGET_NAME)}; \
> +			;; \
> +		esac; \
> +	done
> +
> +endef
> +
> +HOST_GCC_BPF_POST_INSTALL_HOOKS += HOST_GCC_BPF_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
> +
> +$(eval $(host-autotools-package))
> diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> index b30cc332d2..34e7e49a5f 100644
> --- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> +++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> @@ -12,6 +12,10 @@ BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
>   
>   TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
>   
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_BPF),y)
> +TOOLCHAIN_BUILDROOT_DEPENDENCIES += host-gcc-bpf

  I don't think it's appropriate at all to build this as a dependency of the 
toolchain. Nothing is going to use it unless it has specific handling for it - 
like systemd. So the proper approach is to add it as a dependency to systemd.

  I also don't really think it should be an option. An option in systemd maybe, 
but not a buildroot-level option.

  Regards,
  Arnout

> +endif
> +
>   TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
>   
>   $(eval $(virtual-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
