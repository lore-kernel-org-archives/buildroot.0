From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 29 Jun 2017 20:58:27 +0200
Subject: [Buildroot] [PATCH v2] rauc: new package
In-Reply-To: <20170628214009.23484-1-yurovsky@gmail.com>
References: <20170628060724.12026-1-yurovsky@gmail.com>
 <20170628214009.23484-1-yurovsky@gmail.com>
Message-ID: <20170629205827.086b687a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andrey,

On Wed, 28 Jun 2017 14:40:09 -0700, Andrey Yurovsky <yurovsky@gmail.com> wrote:

> RAUC is the Robust Auto-Update Controller developed by the folks at
> Penguintronix. It supports updating embedded systems from the network

Typo: s/Penguintronix/Pengutronix/ and some more occurrences below...

Regards,
Peter

 
> (ex: HawkBit) or from a disk and provides a d-bus interface.
> 
> Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
> ---
>  DEVELOPERS                  |  3 +++
>  package/Config.in           |  1 +
>  package/Config.in.host      |  1 +
>  package/rauc/Config.in      | 37 +++++++++++++++++++++++++++++++++++++
>  package/rauc/Config.in.host |  9 +++++++++
>  package/rauc/rauc.hash      |  3 +++
>  package/rauc/rauc.mk        | 36 ++++++++++++++++++++++++++++++++++++
>  7 files changed, 90 insertions(+)
>  create mode 100644 package/rauc/Config.in
>  create mode 100644 package/rauc/Config.in.host
>  create mode 100644 package/rauc/rauc.hash
>  create mode 100644 package/rauc/rauc.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9e421f4..7600cb5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -95,6 +95,9 @@ F:	package/python-scandir/
>  F:	package/python-simplegeneric/
>  F:	package/python-traitlets/
>  
> +N:  Andrey Yurovsky <yurovsky@gmail.com>
> +F:  package/rauc
> +
>  N:	Andy Kennedy <andy.kennedy@adtran.com>
>  F:	package/libunwind/
>  
> diff --git a/package/Config.in b/package/Config.in
> index f69f67f..fdfcd02 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1865,6 +1865,7 @@ menu "System tools"
>  	source "package/psmisc/Config.in"
>  	source "package/pwgen/Config.in"
>  	source "package/quota/Config.in"
> +	source "package/rauc/Config.in"
>  	source "package/rsyslog/Config.in"
>  	source "package/runc/Config.in"
>  	source "package/s6/Config.in"
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 38f919a..0932b9f 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -39,6 +39,7 @@ menu "Host utilities"
>  	source "package/python-lxml/Config.in.host"
>  	source "package/qemu/Config.in.host"
>  	source "package/raspberrypi-usbboot/Config.in.host"
> +	source "package/rauc/Config.in.host"
>  	source "package/s6-rc/Config.in.host"
>  	source "package/sam-ba/Config.in.host"
>  	source "package/squashfs/Config.in.host"
> diff --git a/package/rauc/Config.in b/package/rauc/Config.in
> new file mode 100644
> index 0000000..f63ab54
> --- /dev/null
> +++ b/package/rauc/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_PACKAGE_RAUC
> +	bool "rauc"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	depends on BR2_USE_WCHAR # glib2
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_DBUS # run-time dependency
> +	help
> +	  RAUC is the Robust Auto-Update Controller developed by
> +	  Penguintronix. It supports updating embedded Linux
> +	  systems over the network or from disks and provides a
> +	  d-bus interface.
> +
> +	  http://rauc.io/
> +
> +if BR2_PACKAGE_RAUC
> +
> +config BR2_PACKAGE_RAUC_NETWORK
> +	bool "network support"
> +	select BR2_PACKAGE_LIBCURL
> +	help
> +	  This option enables support for updating firmware over
> +	  the network using libcurl.
> +
> +config BR2_PACKAGE_RAUC_JSON
> +	bool "JSON output support"
> +	select BR2_PACKAGE_JSON_GLIB
> +	help
> +	  This option enables support for providing output in
> +	  JSON format.
> +
> +endif
> +
> +comment "rauc needs a toolchain w/ wchar, threads"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU
> diff --git a/package/rauc/Config.in.host b/package/rauc/Config.in.host
> new file mode 100644
> index 0000000..e45406e
> --- /dev/null
> +++ b/package/rauc/Config.in.host
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HOST_RAUC
> +	bool "host rauc"
> +	help
> +	  RAUC is the Robust Auto-Update Controller developed by
> +	  Penguintronix. Enable this option to build the rauc
> +	  host tool which may be used to generate firmware
> +	  bundles that are handled by the target rauc service.
> +
> +	  http://rauc.io/
> diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
> new file mode 100644
> index 0000000..78c3e27
> --- /dev/null
> +++ b/package/rauc/rauc.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated, after verifying against
> +# https://github.com/rauc/rauc/releases/download/v0.1.1/rauc-0.1.1.tar.xz.asc
> +sha256 d2901d493f1d3210aef6411e83b02edac3a678d6d825d71a1c61b5b6afc7e478 rauc-0.1.1.tar.xz
> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> new file mode 100644
> index 0000000..12819d9
> --- /dev/null
> +++ b/package/rauc/rauc.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# rauc
> +#
> +################################################################################
> +
> +RAUC_VERSION = 0.1.1
> +RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
> +RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
> +RAUC_LICENSE = LGPL-2.1
> +RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
> +
> +ifeq ($(BR2_PACKAGE_RAUC_NETWORK),y)
> +RAUC_CONF_OPTS += --enable-network
> +RAUC_DEPENDENCIES += libcurl
> +else
> +RAUC_CONF_OPTS += --disable-network
> +endif
> +
> +ifeq ($(BR2_PACKAGE_RAUC_JSON),y)
> +RAUC_CONF_OPTS += --enable-json
> +RAUC_DEPENDENCIES += json-glib
> +else
> +RAUC_CONF_OPTS += --disable-json
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +# configure uses pkg-config --variable=systemdsystemunitdir systemd
> +RAUC_DEPENDENCIES += systemd
> +endif
> +
> +HOST_RAUC_DEPENDENCIES = host-pkgconf
> +HOST_RAUC_CONF_OPTS += --disable-network --disable-json --disable-service
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
