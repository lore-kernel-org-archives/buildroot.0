From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:17:30 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-kconfig: support alternative
 .config location
In-Reply-To: <1473705627-32589-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1473705627-32589-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1473705627-32589-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160912221730.6b167675@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 20:40:26 +0200, Eric Le Bihan wrote:

> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index b0f5178..46e1bef 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -36,6 +36,7 @@ $(2)_KCONFIG_EDITORS ?= menuconfig
>  $(2)_KCONFIG_OPTS ?=
>  $(2)_KCONFIG_FIXUP_CMDS ?=
>  $(2)_KCONFIG_FRAGMENT_FILES ?=
> +$(2)_KCONFIG_DOTCONFIG ?= $$($(2)_DIR)/.config

I think I'd prefer if this variable contained the path of the .config
relative to the source directory of the package. I.e just:

$(2)_KCONFIG_DOTCONFIG ?= .config

here

>  
>  # The config file as well as the fragments could be in-tree, so before
>  # depending on them the package should be extracted (and patched) first.
> @@ -91,9 +92,10 @@ endef
>  # fragments are merged together to .config, after the package has been patched.
>  # Since the file could be a defconfig file it needs to be expanded to a
>  # full .config first.
> -$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
> +$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)

$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)

here

>  	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
>  		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
> +		mkdir -p $$(dir $$(@)); \

It's not immediately clear why you need this. Are there cases where the
directory containing the .config may not exist? If so, it should be
explained in the commit log. And you can replace $$(dir $$(@)) by
$$(@D).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
