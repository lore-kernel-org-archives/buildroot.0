From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 16:29:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/gcc: fix ARC failure to build
 in 2 phases.
In-Reply-To: <1435582227-26345-1-git-send-email-talz@ezchip.com>
References: <1435582227-26345-1-git-send-email-talz@ezchip.com>
Message-ID: <20150629162906.415e456f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tal Zilcer,

On Mon, 29 Jun 2015 15:50:26 +0300, Tal Zilcer wrote:

> diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
> index 0fa2353..6b747d0 100644
> --- a/package/gcc/gcc-initial/gcc-initial.mk
> +++ b/package/gcc/gcc-initial/gcc-initial.mk
> @@ -33,7 +33,11 @@ define HOST_GCC_INITIAL_DISABLE_LIBGMON
>  	$(SED) 's/crtbeginS.o libgmon.a crtg.o/crtbeginS.o crtg.o/' \
>  		$(@D)/libgcc/config.host
>  endef
> +ifeq ($(HOST_GCC_INITIAL_OVERRIDE_SRCDIR),)
>  HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
> +else
> +HOST_GCC_INITIAL_POST_RSYNC_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
> +endif
>  endif
>  
>  HOST_GCC_INITIAL_CONF_OPTS = \

If you're using <pkg>_OVERRIDE_SRCDIR, then the assumption is that your
source tree is patched with whatever change is needed for the package
to build fine without applying any of the Buildroot patches.

In any case, I don't think it's worth the effort making that
conditional, just register the post-rsync hook unconditionally.

BTW, this problem should have been sorted out by the ARC developers,
maybe you should ping them about this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
