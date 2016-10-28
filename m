From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 14:40:59 +0200
Subject: [Buildroot] [PATCHv2] toolchain/external: fix arch-subdir
In-Reply-To: <1477591308-26500-1-git-send-email-yann.morin.1998@free.fr>
References: <1477591308-26500-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161028144059.1e0ecafd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Oct 2016 20:01:48 +0200, Yann E. MORIN wrote:

> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index f7c6a19..770a50f 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -665,7 +665,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
>  			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
>  		fi ; \
>  	fi ; \
> -	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
> +	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}::; s:/+$$::;` ; \

Unfortunately, this doesn't work:

 1/ There is a missing double quote in your sed expression, so it breaks

 2/ Once fixed, your patch makes sure ARCH_SUBDIR is empty when
    SYSROOT_DIR==ARCH_SYSROOT_DIR but continues to break in the
    side-by-side sysroot case we have with the MIPS toolchains.

So, I've instead use Vicente patch, that I have slightly improved.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
