From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Dec 2010 17:41:58 -0300
Subject: [Buildroot] [PATCH 04/10] binutils: make it a proper package
In-Reply-To: <874o9xldzj.fsf@macbook.be.48ers.dk>
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>	<1293563435-10054-5-git-send-email-gustavo@zacarias.com.ar>
	<874o9xldzj.fsf@macbook.be.48ers.dk>
Message-ID: <4D1B9D16.1080902@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/28/10 19:38, Peter Korsgaard wrote:

> Seeing this I thought the build would be broken because GCC isn't moved
> yet, but I see you do move it later on in this patch, even if it isn't
> mentioned in the commit message.

Comment added.

> I find this quite complicated. I would prefer something like:
> 
> config BR2_PACKAGE_BINUTILS
>        bool "binutils"
>        depends on BR2_TOOLCHAIN_BUILDROOT
>        help
>          ..
> 
> config BR2_PACKAGE_BINUTILS_FULLINSTALL
>        bool "perform full installation"
>        depends on BR2_PACKAGE_BINUTILS
>        help
>          Select this to install all binary utilies and not just libbfd.
> 
> And then move the MPC/MPFR/GMP selects under
> BR2_PACKAGE_GCC_TARGET. Also add selects for BR2_PACKAGE_BINUTILS +
> FULLINSTALL.

Easier to define BR2_PACKAGE_BINUTILS that builds all
of binutils and only installs libbfd + BR2_PACKAGE_BINUTILS_TARGET to
install the full version.

> You have trailing spaces here and elsewhere.

Hopefully fixed.

>  Gustavo> -
>  Gustavo> -# The --without-headers option stopped working with gcc 3.0 and has never been
>  Gustavo> -# fixed, so we need to actually have working C library header files prior to
>  Gustavo> -# the step or libgcc will not build...
>  
>  Gustavo>  $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
>  Gustavo> -	# gcc >= 4.3.0 have to also build all-target-libgcc
> 
> Why are you removing those comments? We still support gcc 4.2.x

Because these are in STAGE1 (DIR1) where it's completely irrelevant /
doesn't apply and just amounts to misinformation.
gcc-initial doesn't use nor install headers since the extra gcc build
stage was added. Same scenario for libgcc.
They're leftover comments. That's the reason i kept the ones in
gcc-intermediate.

>  Gustavo>  ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
>  Gustavo>  	$(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
>  Gustavo>  else
>  Gustavo> @@ -276,22 +262,16 @@ gcc_initial-dirclean:
>  Gustavo>  #############################################################
>  Gustavo>  GCC_BUILD_DIR2:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-intermediate
>  
>  Gustavo> -
>  Gustavo>  # The --without-headers option stopped working with gcc 3.0 and has never been
>  Gustavo>  # fixed, so we need to actually have working C library header files prior to
>  Gustavo>  # the step or libgcc will not build...
>  
>  Gustavo>  $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
>  Gustavo>  	mkdir -p $(GCC_BUILD_DIR2)
>  Gustavo> -	-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
>  Gustavo> -	mkdir -p $(STAGING_DIR)/lib
>  Gustavo> -	ln -snf ../../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
>  Gustavo> -	$(if $(BR2_ARCH_IS_64),mkdir -p $(STAGING_DIR)/lib64)
>  Gustavo> -	$(if $(BR2_ARCH_IS_64),ln -snf ../../lib64 $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib64)
> 
> Why remove this ARCH_IS_64 stuff?

This is from commit 3c77bab2eeace3ee675bd745ca335fa3dd1630bb which does
a symlink trick to make libstdc++ available. It's simpler to just copy
libstdc++ (and libgcj/libgcc while at it) to the sysroot which is fixed
in patch #5 from my series.
