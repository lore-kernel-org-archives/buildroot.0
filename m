From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:34:04 +0200
Subject: [Buildroot] [PATCH] core: distclean is a noconfig target
In-Reply-To: <1473598598-5546-1-git-send-email-yann.morin.1998@free.fr>
References: <1473598598-5546-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160911153404.06d0d424@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 14:56:38 +0200, Yann E. MORIN wrote:
> When the .config contains invalid configuration *(e.g. two providers for
> a same virtual pacakge), it is not possible to run "make distclean"

pacakge -> package

> @@ -86,7 +86,7 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
>  noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
>  	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
>  	randpackageconfig allyespackageconfig allnopackageconfig \
> -	print-version olddefconfig
> +	print-version olddefconfig distclean

The distclean target uses the DL_DIR variable, which is derived from
BR2_DL_DIR, which can come from either the environment... or the
configuration file. So, the BR2_DL_DIR from the configuration will be
ignored. I'm not sure what the consequence is, but it's worth thinking
about this.

Also, what is the rationale for having just "distclean" and not "clean"
in noconfig_targets ? The fact that "distclean" remove the
configuration, and as such "helps" in solving configuration issues ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
