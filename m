From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 1 Oct 2013 07:58:35 +0000
Subject: [Buildroot] ARC builds failing
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D685F0CE28@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Any comments/suggestions on below patch?

> I can provide a patch that adds a
> 'uclibc- headers' target inside the uclibc package, and let
> gcc-initial depend on both uclibc-headers and linux-headers for ARC. That seems to work OK for me.
> 
> Something like this:
> 
> --- a/package/gcc/gcc-initial/gcc-initial.mk
> +++ b/package/gcc/gcc-initial/gcc-initial.mk
> @@ -8,7 +8,7 @@ GCC_INITIAL_VERSION = $(GCC_VERSION)
>  GCC_INITIAL_SITE    = $(GCC_SITE)
>  GCC_INITIAL_SOURCE  = $(GCC_SOURCE)
> -HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
> +HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
> +uclibc-headers linux-headers
> 
>  HOST_GCC_INITIAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk index
> 3993d9b..30a5461 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -547,6 +547,14 @@ define UCLIBC_INSTALL_STAGING_CMDS
>         $(UCLIBC_INSTALL_UTILS_STAGING)  endef
> +uclibc-headers: dirs uclibc-patch
> +       $(MAKE1) -C $(UCLIBC_DIR) \
> +               $(UCLIBC_MAKE_FLAGS) \
> +               PREFIX=$(STAGING_DIR) \
> +               DEVEL_PREFIX=/usr/ \
> +               RUNTIME_PREFIX=$(STAGING_DIR) \
> +               install_headers
> +
>  uclibc-menuconfig: dirs uclibc-patch
>         $(MAKE1) -C $(UCLIBC_DIR) \
>                 $(UCLIBC_MAKE_FLAGS) \

It fixes the ARC build which has been broken for a couple of weeks now.

Mischa
