From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sun, 16 Jun 2013 14:34:47 +0200
Subject: [Buildroot] [PATCH] gpsd: make init script optional
In-Reply-To: <1371382468-5838-1-git-send-email-spdawson@gmail.com>
References: <1371382468-5838-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130616123447.GY16699@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Sun, Jun 16, 2013 at 12:34:28PM +0100, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/gpsd/Config.in | 7 +++++++
>  package/gpsd/gpsd.mk   | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
> index 337f8e7..29e061f 100644
> --- a/package/gpsd/Config.in
> +++ b/package/gpsd/Config.in
> @@ -21,6 +21,13 @@ config BR2_PACKAGE_GPSD_DEVICES
>  	default "/dev/ttyS1"
>  	depends on BR2_PACKAGE_GPSD
>  
> +config BR2_PACKAGE_GPSD_INSTALL_INITSCRIPT
> +	bool "install init script"
> +	default y
> +	depends on BR2_PACKAGE_GPSD
> +	help
> +	  Install a gpsd init script
> +
>  menu "Features"
>  	depends on BR2_PACKAGE_GPSD
>  
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index be2e681..45d1aed 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -207,12 +207,19 @@ define GPSD_INSTALL_TARGET_CMDS
>  		$(SCONS) \
>  		$(GPSD_SCONS_OPTS) \
>  		install)
> +endef
> +
> +define GPSD_INSTALL_INITSCRIPT
>  	if [ ! -f $(TARGET_DIR)/etc/init.d/S50gpsd ]; then \
>  		$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd; \
>  		$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd; \
>  	fi
>  endef
>  
> +ifeq ($(BR2_PACKAGE_GPSD_INSTALL_INITSCRIPT),y)
> +GPSD_POST_INSTALL_TARGET_HOOKS = GPSD_INSTALL_INITSCRIPT
> +endif

You should use GPSD_INSTALL_INIT_SYSV instead.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
