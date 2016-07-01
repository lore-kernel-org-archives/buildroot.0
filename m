From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 20:19:12 +0200
Subject: [Buildroot] [PATCH v2 01/15] package/gcc: fix fortran support
In-Reply-To: <20160701162920.19632-2-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-2-s.martin49@gmail.com>
Message-ID: <20160701201912.6fd165cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 18:29:06 +0200, Samuel Martin wrote:
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 78ceeba..f13bc36 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -163,6 +163,10 @@ endif
>  
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
>  HOST_GCC_FINAL_USR_LIBS += libgfortran
> +# fortran needs quadmath on x86 and x86_64
> +ifeq ($(BR2_I386)$(BR2_x86_64),y)

BR2_I386 doesn't exist, you probably meant BR2_i386.

> +HOST_GCC_FINAL_USR_LIBS += libquadmath
> +endif
>  endif
>  
>  ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 6e1c02d..e981940 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -109,6 +109,11 @@ endif
>  # quadmath support requires wchar
>  ifeq ($(BR2_USE_WCHAR),)
>  HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
> +else
> +# fortran needs quadmath on x86 and x86_64
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN)$(BR2_I386)$(BR2_x86_64),yy)

Same here.

> +HOST_GCC_COMMON_CONF_OPTS += --enable-libquadmath
> +endif
>  endif

I'm not a big fan of this condition, it looks a bit clunky and
complicated. Why don't we simply enable libquadmath as soon as wchar is
available? With your condition, there are cases where libquadmath is
forced enabled, some cases where libquadmath is forced disabled, and
lots of other cases where we neither disable nor enable it. Doesn't
look pretty.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
