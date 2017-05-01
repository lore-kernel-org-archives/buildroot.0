From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 1 May 2017 21:33:51 +0200
Subject: [Buildroot] [PATCH] daemon: new package
In-Reply-To: <d5dadc5047888dabaabd88b4f3b885558d30c0b7.1493666251.git.baruch@tkos.co.il>
References: <d5dadc5047888dabaabd88b4f3b885558d30c0b7.1493666251.git.baruch@tkos.co.il>
Message-ID: <8ff50b7e-e18d-39bb-ba93-12b9f78cda2d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 01/05/2017 ? 21:17, Baruch Siach a ?crit :
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---

[...]

> diff --git a/package/daemon/Config.in b/package/daemon/Config.in
> new file mode 100644
> index 000000000000..30954e77edc7
> --- /dev/null
> +++ b/package/daemon/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_DAEMON
> +	bool "daemon"
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  Daemon turns other process into daemons.
> +
> +	  http://www.libslack.org/daemon/
> diff --git a/package/daemon/daemon.hash b/package/daemon/daemon.hash
> new file mode 100644
> index 000000000000..32308ea3f773
> --- /dev/null
> +++ b/package/daemon/daemon.hash
> @@ -0,0 +1,3 @@
> +# md5 from http://www.libslack.org/daemon/; sha256 locally calculated
> +md5 6cd0a28630a29ac279bc501f39baec66 daemon-0.6.4.tar.gz
> +sha256 c4b9ea4aa74d55ea618c34f1e02c080ddf368549037cb239ee60c83191035ca1 daemon-0.6.4.tar.gz
> diff --git a/package/daemon/daemon.mk b/package/daemon/daemon.mk
> new file mode 100644
> index 000000000000..6b858ceb142d
> --- /dev/null
> +++ b/package/daemon/daemon.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# daemon
> +#
> +################################################################################
> +
> +DAEMON_VERSION = 0.6.4
> +DAEMON_SITE = http://libslack.org/daemon/download
> +DAEMON_LICENSE = GPL-2.0+
> +DAEMON_LICENSE_FILES = LICENSE
> +
> +define DAEMON_CONFIGURE_CMDS
> +	(cd $(@D); ./config)
> +endef
> +
> +define DAEMON_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef

Almost good, except nothing is installed in TARGET_DIR :)

DAEMON_INSTALL_TARGET_CMDS is missing.

Best regards,
Romain

> +
> +$(eval $(generic-package))
> 
