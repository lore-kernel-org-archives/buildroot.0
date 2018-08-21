From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 14:05:09 +0200
Subject: [Buildroot] [PATCH 1/1] Add support for building toolchains
 against custom kernel headers.
In-Reply-To: <20180821110646.5671-1-mark.corbin@embecosm.com>
References: <20180821110646.5671-1-mark.corbin@embecosm.com>
Message-ID: <20180821140509.162e6c49@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 12:06:46 +0100, Mark Corbin wrote:
> Allows the selection of a manual version, custom tarball or custom
> git repository for the toolchain kernel headers. This enables
> toolchains to be built against custom kernel headers without having
> to build a full kernel.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

Thanks for working on this! Looks good overall, but I have a few
possible suggestions of improvement.

First, the commit title should be prefixed with the affected package,
so something like:

	linux-headers: add support for custom kernel headers

or something like that.

>  config BR2_KERNEL_HEADERS_VERSION
>  	bool "Manually specified Linux version"
> +	help
> +	  This option allows you to use a specific official version from
> +	  kernel.org, like 2.6.x, 2.6.x.y, 3.x.y, ...
> +
> +	  Note: you cannot use this option to select a _longterm_ 2.6
> +	  kernel, because these kernels are not located at the standard
> +	  URL at kernel.org. Instead, select "Custom tarball" and
> +	  specify the right URL directly.

Adding this help text is good, but somewhat unrelated. Could you do
that as a separate, preliminary commit ?


> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index 954c6b7978..3c2509e249 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -64,8 +64,18 @@ endef
>  
>  LINUX_HEADERS_POST_PATCH_HOOKS += LINUX_HEADERS_APPLY_LOCAL_PATCHES
>  
> -else # ! BR2_KERNEL_HEADERS_AS_KERNEL
> -
> +else ifeq ($(BR2_KERNEL_HEADERS_CUSTOM_TARBALL),y)
> +LINUX_HEADERS_TARBALL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION))
> +LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_TARBALL)))
> +LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_TARBALL))
> +BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
> +else ifeq ($(BR2_KERNEL_HEADERS_CUSTOM_GIT),y)
> +LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
> +LINUX_HEADERS_SITE = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_REPO_URL))
> +LINUX_HEADERS_SITE_METHOD = git
> +LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
> +BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
> +else
>  LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
>  ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
>  LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
> @@ -80,7 +90,7 @@ ifeq ($(BR2_KERNEL_HEADERS_VERSION),y)
>  BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
>  endif

First, I'm not sure why we bother updating the BR_NO_CHECK_HASH_FOR
variable. I know we already do it, but linux-headers doesn't have
a .hash file, so I don't see the point in doing this. Arnout, you
reworked this in commit 24f650aed2d9d92d8cabf0cb160fcf7964f9811e, why
didn't you just remove the BR_NO_CHECK_HASH_FOR ?

Second, with your change there's quite a bit of duplication between the
code to handle the "same headers as kernel" case and the "custom
version" stuff you've added.

Could you try something along the lines of:

ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
LINUX_HEADERS_CUSTOM_TARBALL_LOCATION_KCONFIG_VAR = BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
LINUX_HEADERS_CUSTOM_REPO_URL_KCONFIG_VAR = BR2_LINUX_KERNEL_CUSTOM_REPO_URL
else
LINUX_HEADERS_CUSTOM_TARBALL_LOCATION_KCONFIG_VAR = BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION
LINUX_HEADERS_CUSTOM_REPO_URL_KCONFIG_VAR = BR2_KERNEL_HEADERS_CUSTOM_REPO_URL
endif

and then use $($(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION_KCONFIG_VAR))
and $($(LINUX_HEADERS_CUSTOM_REPO_URL_KCONFIG_VAR)) to avoid
duplicating all the logic testing if we have a tarball, or a Git repo,
or, etc.

Note that I haven't tried to refactor the code myself, perhaps there
are some obstacles to achieve this, perhaps it makes the code uglier,
but I think it is worth trying.

Also, a few comments after the key "else" and "endif" would help figure
out where each condition starts/stops, at least for the large
conditions, where it's hard to know when they start/stop.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
