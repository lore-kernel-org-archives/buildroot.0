From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 15 Jan 2014 22:31:24 +0100
Subject: [Buildroot] [PATCH] Add gpm (general purpose mouse) server
	package
In-Reply-To: <1389806830-24712-1-git-send-email-julien.boibessot@free.fr>
References: <1389806830-24712-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <52D6FE2C.5020500@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 15/01/2014 18:27, julien.boibessot at free.fr a ?crit :
> From: Julien Boibessot <julien.boibessot@armadeus.com>
>
> To test it:
> * configure a getty on tty1 (virtual Framebuffer terminal)
> * plug USB keyboard and mouse, login in tty1
> * launch gpm: gpm -m /dev/input/mouse0 -t imps2
> * mouse cut & paste should work on terminal
> * launch gpm-root from this terminal
> * Ctrl+mouse buttons should open text menus
>
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> ---
>   package/Config.in     |    1 +
>   package/gpm/Config.in |   20 ++++++++++++++++++++
>   package/gpm/gpm.mk    |   39 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 60 insertions(+), 0 deletions(-)
>   create mode 100644 package/gpm/Config.in
>   create mode 100644 package/gpm/gpm.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 78c0e06..d52c65e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -290,6 +290,7 @@ source "package/fmtools/Config.in"
>   source "package/freescale-imx/Config.in"
>   source "package/fxload/Config.in"
>   source "package/gadgetfs-test/Config.in"
> +source "package/gpm/Config.in"
>   source "package/gpsd/Config.in"
>   source "package/gptfdisk/Config.in"
>   source "package/gvfs/Config.in"
> diff --git a/package/gpm/Config.in b/package/gpm/Config.in
> new file mode 100644
> index 0000000..b60f4a3
> --- /dev/null
> +++ b/package/gpm/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_GPM
> +	bool "gpm mouse server"
> +	help
> +	  "gpm" means general purpose mouse (server) and provides mouse support
> +	  for Linux virtual consoles.
> +	  gpm-root (to draw menus in current virtual console; config file in
> +	  /etc/gpm-root.conf) and disable-paste (to disable paste buffer for
> +	  security reasons), will also be installed.
> +
> +	  http://www.nico.schottelius.org/software/gpm/
> +
> +if BR2_PACKAGE_GPM
> +
> +config BR2_PACKAGE_GPM_INSTALL_TEST_TOOLS
> +	bool "install gpm test tools also"
> +	help
> +	  Install gpm test tools (get-versions, mev, hltest, mouse-test,
> +	  display-buttons & display-coords).
> +
> +endif
> diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
> new file mode 100644
> index 0000000..49ac8df
> --- /dev/null
> +++ b/package/gpm/gpm.mk
> @@ -0,0 +1,39 @@
> +#############################################################
> +#
> +# gpm
> +#
> +#############################################################
> +
> +GPM_VERSION = 1.20.7
> +GPM_SOURCE = gpm-$(GPM_VERSION).tar.bz2
> +GPM_SITE = http://www.nico.schottelius.org/software/gpm/archives/
> +GPM_LICENSE = GPLv2+
> +GPM_LICENSE_FILES = COPYING
> +
> +GPM_INSTALL_STAGING = YES
> +
> +# To generate missing configure:
> +define GPM_AUTOGEN_CALL
> +	cd $(@D); ./autogen.sh
> +endef
> +
> +GPM_PRE_CONFIGURE_HOOKS += GPM_AUTOGEN_CALL
> +
> +define GPM_REMOVE_TEST_TOOLS_FROM_TARGET
> +	for tools in mev hltest mouse-test display-buttons \
> +			get-versions display-coords; do \
> +		rm -f $(TARGET_DIR)/usr/bin/$$tools ; \
> +	done
> +endef
> +
> +ifeq ($(BR2_PACKAGE_GPM_INSTALL_TEST_TOOLS),)
> +GPM_POST_INSTALL_TARGET_HOOKS += GPM_REMOVE_TEST_TOOLS_FROM_TARGET
> +endif
> +
> +define GPM_INSTALL_GPM_ROOT_CONF_ON_TARGET
> +	$(INSTALL) -m 0644 -D $(@D)/conf/gpm-root.conf $(TARGET_DIR)/etc/
> +endef
> +
> +GPM_POST_INSTALL_TARGET_HOOKS += GPM_INSTALL_GPM_ROOT_CONF_ON_TARGET
> +
> +$(eval $(autotools-package))
May I suggest you to test gpm package with different toolchain 
configuration ?

It won't build in static case (BR2_PREFER_STATIC_LIB=y):
"i686-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic 
object `lib/libgpm.so.2'
collect2: error: ld returned 1 exit status"

There is also some errors about missing gpm.h in these files: (wrong path)
display-buttons.c
display-coords.c
get-versions.c
||
And It would be good to disable the doc installation on target.

Thank for your contribution (I was working on gpm package too ;-) )

Best regards,
Romain Naour
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140115/2df28d9a/attachment-0001.html>
