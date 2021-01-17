From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 12:25:55 +0100
Subject: [Buildroot] [PATCH v1 1/1] package/screen-fetch: new package
In-Reply-To: <20210114093347.2997231-1-christian@paral.in>
References: <20210114093347.2997231-1-christian@paral.in>
Message-ID: <20210117112555.GE2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2021-01-14 01:33 -0800, Christian Stewart spake thusly:
> Signed-off-by: Christian Stewart <christian@paral.in>

The upstream project is named "screenFetch" not "screen-fetch", so I
renamed it accordingly, to "screenfetch" (i.e. in Buildroot, we follow
upstream name as much as possible, but all in lowercase).

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/Config.in                      |  1 +
>  package/screen-fetch/Config.in         |  9 +++++++++
>  package/screen-fetch/screen-fetch.hash |  2 ++
>  package/screen-fetch/screen-fetch.mk   | 17 +++++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/screen-fetch/Config.in
>  create mode 100644 package/screen-fetch/screen-fetch.hash
>  create mode 100644 package/screen-fetch/screen-fetch.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 5a16814ca8..774a3b9506 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2384,6 +2384,7 @@ comment "Utilities"
>  	source "package/ranger/Config.in"
>  	source "package/rtty/Config.in"
>  	source "package/screen/Config.in"
> +	source "package/screen-fetch/Config.in"
>  	source "package/sudo/Config.in"
>  	source "package/terminology/Config.in"
>  	source "package/time/Config.in"
> diff --git a/package/screen-fetch/Config.in b/package/screen-fetch/Config.in
> new file mode 100644
> index 0000000000..91cea6f01a
> --- /dev/null
> +++ b/package/screen-fetch/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_SCREEN_FETCH
> +	bool "screen-fetch"
> +	depends on BR2_USE_MMU # bash
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> +	select BR2_PACKAGE_BASH # runtime dependency
> +	help
> +	  Screen Fetch is a bash script to display distro info.
> +
> +	  https://github.com/KittyKatt/screenFetch
> diff --git a/package/screen-fetch/screen-fetch.hash b/package/screen-fetch/screen-fetch.hash
> new file mode 100644
> index 0000000000..60f193bab3
> --- /dev/null
> +++ b/package/screen-fetch/screen-fetch.hash
> @@ -0,0 +1,2 @@
> +sha256  aa97dcd2a8576ae18de6c16c19744aae1573a3da7541af4b98a91930a30a3178  screen-fetch-v3.9.1.tar.gz
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/screen-fetch/screen-fetch.mk b/package/screen-fetch/screen-fetch.mk
> new file mode 100644
> index 0000000000..874190faef
> --- /dev/null
> +++ b/package/screen-fetch/screen-fetch.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# screen-fetch
> +#
> +################################################################################
> +
> +SCREEN_FETCH_VERSION = v3.9.1
> +SCREEN_FETCH_SITE = $(call github,KittyKatt,screenFetch,$(SCREEN_FETCH_VERSION))
> +SCREEN_FETCH_LICENSE = GPL-3.0+
> +SCREEN_FETCH_LICENSE_FILES = COPYING
> +
> +define SCREEN_FETCH_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/screenfetch-dev \
> +		$(TARGET_DIR)/usr/bin/screenfetch
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.30.0
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
