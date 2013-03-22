From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Mar 2013 15:29:20 +0100
Subject: [Buildroot] [PATCH v3 1/2] package: Makefile.in: Add target
 compilation flags for NOMMU architecture.
In-Reply-To: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130322152920.59b74891@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 22 Mar 2013 17:01:41 +0800, Sonic Zhang wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>

Thanks for getting back to us with Blackfin-related changes!

> +config BR2_TARGET_ABI_FLAT
> +	bool

I don't think FLAT is an ABI, it's a binary format.

For example, on ARM, you can have ELF or FLAT binaries, that follow
either the OABI or EABI. True, OABI is deprecated, but it still clearly
points the fact that FLAT is *not* an ABI, but a binary format.

Therefore, I think we should introduce config options like:

config BR2_BINFMT_ELF
	bool

config BR2_BINFMT_FDPIC
	bool

config BR2_BINFMT_FLAT
	bool

probably with a choice list or something.

>  if BR2_arm || BR2_armeb
>  source "arch/Config.in.arm"
>  endif
> diff --git a/package/Makefile.in b/package/Makefile.in
> index a8bf36b..acfd9c8 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -103,6 +103,14 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
>  TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>  
> +ifeq ($(BR2_TARGET_ABI_FLAT),y)
> +TARGET_LDFLAGS += -Wl,-elf2flt
> +endif

This will have to use some BR2_BINFMT_FLAT config option, as per the
discussion above.

> +ifneq ($(BR2_USE_MMU), y)
> +TARGET_CFLAGS += -D__NOMMU__
> +endif

I'm still not entirely happy with that. This define is completely
non-standard, I am not sure we want to have this at the global level.
autotools-based packages should be fixed to check if fork() is
available or not. For other packages, this special flag can be
introduced on a per-package basis. But it's true that maybe a good
number of packages will need that. Not sure here. What do others think?

> +
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
>  TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
>  else
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 890506b..09bdc7b 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -82,6 +82,11 @@ $(2)_CLEAN_OPT			?= clean
>  $(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
>  $(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
>  
> +ifeq ($(BR2_TARGET_ABI_FLAT),y)
> + ifneq ($$($(2)_FLAT_STACKSIZE),)
> +  $(2)_CONF_ENV			+= LDFLAGS="$(TARGET_LDFLAGS) -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)"
> + endif
> +endif

Ok. This needs an update in the documentation, detailing the new
<pkg>_FLAT_STACKSIZE option.

>  #
>  # Configure step. Only define it if not already defined by the package
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 57b0fd0..5ce32f9 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -303,6 +303,11 @@ endif
>  
>  $(2)_REDISTRIBUTE		?= YES
>  
> +ifeq ($(BR2_TARGET_ABI_FLAT),y)
> + ifneq ($$($(2)_FLAT_STACKSIZE),)
> +  $(2)_FLAT_LDFLAGS = -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)
> + endif
> +endif

How is this one supposed to work? Who will use <pkg>_FLAT_LDFLAGS?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
