From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Mar 2021 23:56:03 +0100
Subject: [Buildroot] [PATCH 7/8] package/opkg-utils: add opkg-utils as
 target pkg
In-Reply-To: <20210312200534.923-8-ryan.barnett@rockwellcollins.com>
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
 <20210312200534.923-8-ryan.barnett@rockwellcollins.com>
Message-ID: <20210312225603.GK2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2021-03-12 14:05 -0600, Ryan Barnett spake thusly:
> Supports a use case of building container rootfs images where a matching
> target version of the tools is required for repackaging of a installer
>  archive.
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> ---
[--SNIP--]
> diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
> index d7f68b8555..a445c9f49e 100644
> --- a/package/opkg-utils/opkg-utils.mk
> +++ b/package/opkg-utils/opkg-utils.mk
> @@ -10,6 +10,21 @@ OPKG_UTILS_SITE_METHOD = git
>  OPKG_UTILS_LICENSE = GPL-2.0+
>  OPKG_UTILS_LICENSE_FILES = COPYING
>  
> +OPKG_UTILS_DEPENDENCIES += \
> +	bash \
> +	binutils \
> +	bzip2 \
> +	coreutils \
> +	diffutils \
> +	findutils \
> +	grep \
> +	gzip \
> +	lz4 \
> +	python3 \
> +	sed \
> +	tar \
> +	xz

As you explained in a previous commit, opkg-utils only contains scripts
(in various languages, but still scripts), so the dependencies are not
needed at build time.

Regards,
Yann E. MORIN.

>  HOST_OPKG_UTILS_DEPENDENCIES += \
>  	host-coreutils \
>  	host-diffutils \
> @@ -19,8 +34,13 @@ HOST_OPKG_UTILS_DEPENDENCIES += \
>  	$(BR2_PYTHON3_HOST_DEPENDENCY) \
>  	host-xz
>  
> +define OPKG_UTILS_INSTALL_CMDS
> +	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install-utils
> +endef
> +
>  define HOST_OPKG_UTILS_INSTALL_CMDS
>  	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-utils
>  endef
>  
> +$(eval $(generic-package))
>  $(eval $(host-generic-package))
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
