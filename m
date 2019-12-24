From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 24 Dec 2019 19:03:36 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/frotz: new package
In-Reply-To: <20190912184013.17316-2-huth@tuxfamily.org>
References: <20190912184013.17316-1-huth@tuxfamily.org>
 <20190912184013.17316-2-huth@tuxfamily.org>
Message-ID: <ab8d50c3-3158-6691-ee14-fc9abdf1db0f@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 9/12/19 8:40 PM, Thomas Huth wrote:
> Frotz is an interpreter for old Infocom adventures and other Z-code games.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>   DEVELOPERS               |  1 +
>   package/Config.in        |  1 +
>   package/frotz/Config.in  | 10 ++++++++++
>   package/frotz/frotz.hash |  5 +++++
>   package/frotz/frotz.mk   | 29 +++++++++++++++++++++++++++++
>   5 files changed, 46 insertions(+)
>   create mode 100644 package/frotz/Config.in
>   create mode 100644 package/frotz/frotz.hash
>   create mode 100644 package/frotz/frotz.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7604cfe2b7..c8805fef7b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2229,6 +2229,7 @@ F:	toolchain/
>   
>   N:	Thomas Huth <huth@tuxfamily.org>
>   F:	package/ascii-invaders/
> +F:	package/frotz/
>   
>   N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>   F:	arch/Config.in.arm
> diff --git a/package/Config.in b/package/Config.in
> index 7d915ea4d7..92ec3ca66e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -252,6 +252,7 @@ menu "Games"
>   	source "package/doom-wad/Config.in"
>   	source "package/flare-engine/Config.in"
>   	source "package/flare-game/Config.in"
> +	source "package/frotz/Config.in"
>   	source "package/gnuchess/Config.in"
>   	source "package/lbreakout2/Config.in"
>   	source "package/ltris/Config.in"
> diff --git a/package/frotz/Config.in b/package/frotz/Config.in
> new file mode 100644
> index 0000000000..59b6d0007d
> --- /dev/null
> +++ b/package/frotz/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_FROTZ
> +	bool "frotz"
> +	select BR2_PACKAGE_NCURSES
> +	help
> +	  Frotz is an interpreter for old Infocom adventure games and
> +	  other Z-code games. Note that frotz can not be run as root.
> +	  You must add a normal user to your buildroot configuration to
> +	  be able to use it.
> +
> +	  https://661.org/proj/if/frotz/
> diff --git a/package/frotz/frotz.hash b/package/frotz/frotz.hash
> new file mode 100644
> index 0000000000..8bb15eab03
> --- /dev/null
> +++ b/package/frotz/frotz.hash
> @@ -0,0 +1,5 @@
> +# Locally calculated
> +sha512 c3aeb1bca227db7b759be880c1fe14e3d46c79eae3f2891d2472ff1e1b17b2153b2e400d537d54dce68011079e230fe8176ebb7547b2ecbc30e44f2b7423c285  frotz-2.44.tar.bz2
> +
> +# Hash for license file
> +sha512 aee80b1f9f7f4a8a00dcf6e6ce6c41988dcaedc4de19d9d04460cbfb05d99829ffe8f9d038468eabbfba4d65b38e8dbef5ecf5eb8a1b891d9839cda6c48ee957  COPYING
> diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
> new file mode 100644
> index 0000000000..97e2eaf21f
> --- /dev/null
> +++ b/package/frotz/frotz.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# Frotz
> +#
> +################################################################################
> +
> +FROTZ_VERSION = 2.44
> +FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
> +FROTZ_SITE = https://gitlab.com/DavidGriffith/frotz/-/archive/$(FROTZ_VERSION)
> +FROTZ_DEPENDENCIES = ncurses
> +FROTZ_LICENSE = GPL-2.0+
> +FROTZ_LICENSE_FILES = COPYING
> +
> +define FROTZ_POST_EXTRACT_FIXUP
> +	( sed -i 's/$	ar rc/	\$$\(AR\) rc/g' $(@D)/Makefile ; \
> +	  sed -i 's/$	ranlib/	\$$\(RANLIB\)/g' $(@D)/Makefile ; \
> +	  sed -i 's/$	strip/	\$$\(STRIP\)/g' $(@D)/Makefile )
> +endef

Here you should provide a patch(and send it upstream) instead of this hack.

> +FROTZ_POST_EXTRACT_HOOKS += FROTZ_POST_EXTRACT_FIXUP
> +
> +define FROTZ_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr CONFIG_DIR=/etc -C $(@D)
> +endef
> +
> +define FROTZ_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/frotz $(TARGET_DIR)/usr/bin/frotz
> +endef
> +
> +$(eval $(generic-package))
> 

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
