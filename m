Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4FFC64EC3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A29081491;
	Mon,  6 Feb 2023 11:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A29081491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cuYZJJudEnQ; Mon,  6 Feb 2023 11:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FFE381495;
	Mon,  6 Feb 2023 11:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FFE381495
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B27221BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89198402EB
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89198402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5KomPVt7teB for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:24:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE269400BF
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE269400BF
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:24:50 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so8502418wms.1
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 03:24:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y70xbsrz4ujXzlK4gBHKiDazPBmxlC7hErUZq4Mqykk=;
 b=xSFjFDRFuhjB1BZCHD1n2UYMqAvKTcg+Q7RAmITmMpfIU6m/Czf6Gda45pxqEMZxQp
 FSFJD2T8P2DlOF/FQckYxksEvH2P6dmipfhJyt0T0/XFPgrpkcjay9KAFnBAzz1KLwX/
 frqWI/LyDaNRC/SaKydHPKAJgbIVVMjUSjc40d3YncsO6CoCz/HmTIJShExnIcXx1S5K
 4ghXMCv7W345AVIa/7v12vz91dlYQLm8TI2gKUXI9OcoJc8UmrOpuCBzIpEusHgsUuvB
 Gb++jvtIt3rpq/0WDwcn5zprNvKWFw134PSi1YGTTSVf9SsUsy3jVzlxzdLjcQrOCE9f
 57Gg==
X-Gm-Message-State: AO0yUKWp3uwL89uzy2Qscw2b/m8XbcLvX4sxbjOtdJxGyRrzyyo9p+f9
 3OZDgGJWlmo6FjF50hOwwdp6Iw==
X-Google-Smtp-Source: AK7set/wfc0rhu/A1OwFCgce8Yyf+rZ6glnFlwAEtPhHEkZi7oe+3IsDLufuyhbaIoo06TcjRgk2Pw==
X-Received: by 2002:a1c:4c17:0:b0:3da:2a59:8a4f with SMTP id
 z23-20020a1c4c17000000b003da2a598a4fmr18579052wmf.38.1675682688928; 
 Mon, 06 Feb 2023 03:24:48 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm10026535wmf.42.2023.02.06.03.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:24:48 -0800 (PST)
Message-ID: <2bdc57cb-e5c9-127d-dd3e-da4bb35f89f1@mind.be>
Date: Mon, 6 Feb 2023 12:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Alsey Coleman Miller <alseycmiller@gmail.com>, buildroot@buildroot.org
References: <20220329215433.1018660-1-alseycmiller@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220329215433.1018660-1-alseycmiller@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y70xbsrz4ujXzlK4gBHKiDazPBmxlC7hErUZq4Mqykk=;
 b=hiulfyh3dD5+fAbsAFo2FbNaIHsQAV7SAljSke36i4yw3WYyoXqv9UTjflzI3LIZjo
 Fv07PKm1A76VE0AMopxNKFRIIzf2gZDWSjM05IlAohfAR/rXwjVO1nbKEhm01Q3MDn0c
 ecTbimTQDzj3c6WQPHKImv8DSyQjlumgR+yn75YNVJ07xsij9aFBy/2KuubwAZPSKlu5
 VWpO9welOab5a+j6hNu+N37kqYDKR/LI8xHGCp+oH2kA396icsmikwz21Gd1gWIMs7MN
 s6w4O8tfNsicCN3mG9sC1MdQvwo14SAQBA+tGgJicIKQY/I7lHkgKqysLbzeVOPAqFDy
 2rAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hiulfyh3
Subject: Re: [Buildroot] [PATCH 1/2] package/libdispatch: add libdispatch
 package
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
Cc: James Hillard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Alsey,

  Sorry for the extremely late feedback on this. There were a few issues with 
your contribution and I wasn't able to fix them up myself, so I marked the 
series as Changes Requested. See below for my comments.

On 29/03/2022 23:54, Alsey Coleman Miller wrote:
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
> ---
>   DEVELOPERS                           |  3 ++
>   package/Config.in                    |  1 +
>   package/libdispatch/Config.in        | 43 +++++++++++++++++++++++
>   package/libdispatch/libdispatch.hash |  1 +
>   package/libdispatch/libdispatch.mk   | 52 ++++++++++++++++++++++++++++
>   5 files changed, 100 insertions(+)
>   create mode 100644 package/libdispatch/Config.in
>   create mode 100644 package/libdispatch/libdispatch.hash
>   create mode 100644 package/libdispatch/libdispatch.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a66b9d7eee..555ec0175b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -122,6 +122,9 @@ F:	boot/opensbi/
>   F:	configs/hifive_unleashed_defconfig
>   F:	package/xen/
>   
> +N:	Alsey Miller <alseycmiller@gmail.com>
> +F:	package/libdispatch/
> +
>   N:	Alvaro G. M <alvaro.gamez@hazent.com>
>   F:	package/dcron/
>   F:	package/libxmlrpc/
> diff --git a/package/Config.in b/package/Config.in
> index 0d5d763180..e217ff5282 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1968,6 +1968,7 @@ menu "Other"
>   	source "package/libcrossguid/Config.in"
>   	source "package/libcsv/Config.in"
>   	source "package/libdaemon/Config.in"
> +	source "package/libdispatch/Config.in"
>   	source "package/libeastl/Config.in"
>   	source "package/libee/Config.in"
>   	source "package/libev/Config.in"
> diff --git a/package/libdispatch/Config.in b/package/libdispatch/Config.in
> new file mode 100644
> index 0000000000..f4fa5e47fb
> --- /dev/null
> +++ b/package/libdispatch/Config.in
> @@ -0,0 +1,43 @@
> +config BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_x86_64
> +	default y if BR2_aarch64
> +	default y if BR2_arm
> +	default y if BR2_powerpc
> +	default y if BR2_mips
> +	default y if BR2_mipsel
> +	default y if BR2_mips64
> +	default y if BR2_mips64el
> +	default y if BR2_RISCV_64

  Please add an explanation in the commit log about where this range of 
supported architectures comes from.

  Also, I expect that on ARM and possibly powerpc there are tighter constraints 
than this.


> +config BR2_PACKAGE_LIBDISPATCH_TARGET_ARCH
> +	string
> +	default "aarch64" if BR2_aarch64
> +	default "armv5" if BR2_ARM_CPU_ARMV5
> +	default "armv6" if BR2_ARM_CPU_ARMV6
> +	default "armv7" if BR2_ARM_CPU_ARMV7A

  We also have armv7m and armv4 which are not covered here.

> +	default "x86_64" if BR2_x86_64
> +	default "powerpc" if BR2_powerpc
> +	default "mips" if BR2_mips
> +	default "mipsel" if BR2_mipsel
> +	default "mips64" if BR2_mips64
> +	default "mips64el" if BR2_mips64el
> +	default "riscv64" if BR2_RISCV_64

  You can simplify BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS like this:

config BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS
	bool
	default y
	depends on BR2_PACKAGE_LIBDISPATCH_TARGET_ARCH != ""

> +
> +config BR2_PACKAGE_LIBDISPATCH
> +	bool "libdispatch"
> +	depends on BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

  Again, please explain in the commit message where the glibc dependency comes from.

> +	select BR2_PACKAGE_LIBBSD

  Please include the libbsd dependencies (as far as they're not covered by the 
libdispatch dependencies themselves):

	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
	depends on BR2_USE_WCHAR # libbsd


> +	
> +	help
> +	  Grand Central Dispatch (GCD or libdispatch) provides comprehensive support for concurrent code execution on multicore hardware.

  Please wrap at 72 columns (where the tab counts as 8 spaces).
utils/check-package will warn about this.

> +
> +	  http://swift.org

  Is there no URL specific to libdispatch?

> +
> +comment "libdispatch needs a toolchain w/ Glibc, wchar, threads, C++, dynamic library"
> +	depends on BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \

  There is no C++ dependency in the package itself...

> +		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
> \ No newline at end of file

  Please add a newline at the end of the file.

> diff --git a/package/libdispatch/libdispatch.hash b/package/libdispatch/libdispatch.hash
> new file mode 100644
> index 0000000000..64543b56eb
> --- /dev/null
> +++ b/package/libdispatch/libdispatch.hash
> @@ -0,0 +1 @@
> +sha256 d2bbfb5b98d129caa2c6bd7662c850bf57cb434572d09844b56641c4558906ab libdispatch-swift-5.6-RELEASE.tar.gz

  Please add a hash for the license files.

> diff --git a/package/libdispatch/libdispatch.mk b/package/libdispatch/libdispatch.mk
> new file mode 100644
> index 0000000000..79fc4f7780
> --- /dev/null
> +++ b/package/libdispatch/libdispatch.mk
> @@ -0,0 +1,52 @@
> +### Grand Central Dispatch
> +LIBDISPATCH_VERSION = 5.6
> +LIBDISPATCH_SITE = $(call github,apple,swift-corelibs-libdispatch,swift-$(LIBDISPATCH_VERSION)-RELEASE)

  I guess this is a swift-specific fork of libdispatch? If yes, then the swift 
bit should probably still be in _VERSION, i.e.

LIBDISPATH_VERSION = swift-5.6

  Alternatively, the package should be named something like libdispatch-swift.


> +LIBDISPATCH_LICENSE = Apache-2.0
> +LIBDISPATCH_LICENSE_FILES = LICENSE
> +LIBDISPATCH_INSTALL_STAGING = YES
> +LIBDISPATCH_SUPPORTS_IN_SOURCE_BUILD = NO
> +LIBDISPATCH_DEPENDENCIES = host-clang host-lld libbsd

  clang and lld (if they're supposed to build for the target) need a dependency 
on BR2_PACKAGE_LLVM_ARCH_SUPPORTS and BR2_HOST_GCC_AT_LEAST_5

  Also you should select BR2_PACKAGE_HOST_LLD in Config.in.

> +
> +LIBDISPATCH_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LIBDISPATCH_TARGET_ARCH))
> +LIBDISPATCH_CLANG_PATH = $(HOST_DIR)/bin

  It's not worth adding a variable for this, just use $(HOST_DIR)/bin directly 
below.

> +
> +ifeq ($(LIBDISPATCH_TARGET_ARCH),armv7)
> +LIBDISPATCH_TARGET_NAME		= armv7-unknown-linux-gnueabihf
> +else ifeq ($(LIBDISPATCH_TARGET_ARCH),armv6)
> +LIBDISPATCH_TARGET_NAME		= armv6-unknown-linux-gnueabihf
> +else ifeq ($(LIBDISPATCH_TARGET_ARCH),armv5)
> +LIBDISPATCH_TARGET_NAME		= armv5-unknown-linux-gnueabi
> +else
> +LIBDISPATCH_TARGET_NAME		= $(LIBDISPATCH_TARGET_ARCH)-unknown-linux-gnu

  Instead of defining this here, define it like that in LIBDISPATCH_TARGET_ARCH 
directly, i.e. include the unknown-linux-gnu* in 
BR2_PACKAGE_LIBDISPATCH_TARGET_ARCH.


> +endif
> +
> +ifeq ($(LIBDISPATCH_TARGET_ARCH),armv5)
> +LIBDISPATCH_EXTRA_FLAGS		= -march=armv5te

  Not all our armv5 variants are armv5te I believe...

> +else ifeq ($(LIBDISPATCH_TARGET_ARCH),riscv64)
> +LIBDISPATCH_EXTRA_FLAGS		= -mno-relax -mabi=lp64 -march=rv64imac -mfloat-abi=soft

  Having to specify all of this sounds very very wrong. We define the ABI and 
arch elsewhere depending on config options, if you're overriding here it's not 
going to be compatible with libc.

  I'm not sure about the -mno-relax, that might be needed. But please document 
in the commit message why.

> +else ifeq ($(LIBDISPATCH_TARGET_ARCH),mipsel)
> +LIBDISPATCH_EXTRA_FLAGS		= -msoft-float
> +else ifeq ($(LIBDISPATCH_TARGET_ARCH),mips64el)
> +LIBDISPATCH_EXTRA_FLAGS		= -msoft-float

  Again, floating point ABI should be defined in our ABI definition or it's not 
going to be compatible. If it requires soft float, we need to depend on 
BR2_MIPS_SOFT_FLOAT in Config.in.

  -msoft-float and other ABI options are passed along by the toolchain wrapper, 
so if these are somehow needed in EXTRA_FLAGS after all, something somewhere is 
really broken. This needs to be analyzed and explained in detail.

> +else ifeq ($(LIBDISPATCH_TARGET_ARCH),powerpc)
> +LIBDISPATCH_EXTRA_FLAGS		= -mcpu=7400

  We support many, many other powerpc CPUs, so please explain why this is needed 
and why it works on all other CPUs.

> +else
> +LIBDISPATCH_EXTRA_FLAGS		=
> +endif
> +
> +LIBDISPATCH_CONF_OPTS += \
> +	-DLibRT_LIBRARIES="${STAGING_DIR}/usr/lib/librt.a" \
> +	-DCMAKE_C_COMPILER=$(LIBDISPATCH_CLANG_PATH)/clang \
> +	-DCMAKE_CXX_COMPILER=$(LIBDISPATCH_CLANG_PATH)/clang++ \
> +	-DCMAKE_C_FLAGS="-w -fuse-ld=lld $(LIBDISPATCH_EXTRA_FLAGS) -target $(LIBDISPATCH_TARGET_NAME) --sysroot=$(STAGING_DIR) -I$(STAGING_DIR)/usr/include -B$(STAGING_DIR)/usr/lib -B$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call qstrip,$(BR2_GCC_VERSION)) -L$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call qstrip,$(BR2_GCC_VERSION))" \

  Please wrap this extremely long line. Also, since it's reused for CXX flags, 
it probably makes sense to define a variable for this.

  -fuse-ld should probably be given a full path to $(HOST_DIR)/bin/lld instead 
of relying on $PATH.

  --sysroot, -I, -B, -L options shouldn't be needed, they should already be part 
of the toolchain wrapper. However, the toolchain wrapper for clang is fairly 
recent and doesn't see that much use, so something may be missing there. Still, 
if there is a problem, it should probably be handled in the toolchain wrapper an 
not here.

> +	-DCMAKE_C_LINK_FLAGS="-target $(LIBDISPATCH_TARGET_NAME) --sysroot=$(STAGING_DIR)" \

  Again, --sysrot should already be handled by the toolchain wrapper.

> +	-DCMAKE_CXX_FLAGS="-w -fuse-ld=lld $(LIBDISPATCH_EXTRA_FLAGS) -target $(LIBDISPATCH_TARGET_NAME) --sysroot=$(STAGING_DIR) -I$(STAGING_DIR)/usr/include -I$(HOST_DIR)/$(GNU_TARGET_NAME)/include/c++/$(call qstrip,$(BR2_GCC_VERSION))/ -I$(HOST_DIR)/$(GNU_TARGET_NAME)/include/c++/$(call qstrip,$(BR2_GCC_VERSION))/$(GNU_TARGET_NAME) -B$(STAGING_DIR)/usr/lib -B$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call qstrip,$(BR2_GCC_VERSION)) -L$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call qstrip,$(BR2_GCC_VERSION))" \
> +	-DCMAKE_CXX_LINK_FLAGS="-target $(LIBDISPATCH_TARGET_NAME) --sysroot=$(STAGING_DIR)" \
> +
> +define LIBDISPATCH_INSTALL_TARGET_CMDS
> +	(cd $(LIBDISPATCH_BUILDDIR) && \
> +	cp ./*.so $(TARGET_DIR)/usr/lib/ \

  Doesn't the CMakeLists.txt have proper install commands? If not, please 
document in the commit message.

  Also, no need to cd, just do

	cp $(LIBDISPATCH_BUILDDIR)/*.so $(TARGET_DIR)/usr/lib/


  Regards,
  Arnout


> +	)
> +endef
> +
> +$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
