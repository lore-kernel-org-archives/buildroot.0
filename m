From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 14:42:17 +0200
Subject: [Buildroot] [PATCH] toolchain-external.mk: fix ARCH_SUBDIR for
 side-by-side sysroot toolchains
In-Reply-To: <20161027153342.27718-1-Vincent.Riera@imgtec.com>
References: <20161027153342.27718-1-Vincent.Riera@imgtec.com>
Message-ID: <20161028144217.46ac552d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Oct 2016 16:33:42 +0100, Vicente Olivert Riera wrote:

> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index f7c6a19..a25c102 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -665,7 +665,12 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
>  			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
>  		fi ; \
>  	fi ; \
> -	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
> +	if [ "`dirname $${ARCH_SYSROOT_DIR}`" = "`dirname $${SYSROOT_DIR}`" ] ; then \
> +		SYSROOT_DIR_DIRNAME=`dirname $${SYSROOT_DIR}`/ ; \
> +		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR_DIRNAME}(.*)/$$:\1:"` ; \
> +	else \
> +		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
> +	fi ; \

I've applied your patch, which I have slightly improved to handle the
SYSROOT_DIR == ARCH_SYSROOT_DIR case, where ARCH_SUBDIR should be
empty. This way, I believe we handle all three cases:

 1. SYSROOT_DIR == ARCH_SYSROOT_DIR

 2. SYSROOT_DIR and ARCH_SYSROOT_DIR are side-by-side

 3. ARCH_SYSROOT_DIR is nested in SYSROOT_DIR

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
