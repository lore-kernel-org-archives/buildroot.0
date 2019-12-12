From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 11:19:20 +0100
Subject: [Buildroot] [PATCH v4 01/13] new recipe : host-systemd
In-Reply-To: <20191212075400.1499536-2-jeremy.rosen@smile.fr>
References: <20191212075400.1499536-1-jeremy.rosen@smile.fr>
 <20191212075400.1499536-2-jeremy.rosen@smile.fr>
Message-ID: <20191212111920.297bdca6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this work, very useful!

On Thu, 12 Dec 2019 08:53:48 +0100
J?r?my Rosen <jeremy.rosen@smile.fr> wrote:

> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 8f1d6fc0c0..81761b33a4 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -199,7 +199,6 @@ config BR2_PACKAGE_SYSTEMD_HOSTNAMED
>  config BR2_PACKAGE_SYSTEMD_HWDB
>  	bool "enable hwdb installation"
>  	default y
> -	select BR2_PACKAGE_HOST_EUDEV # for udevadm, during target-finalize
>  	help
>  	  Enables hardware database installation to /usr/lib/udev/hwdb.d
>  
> diff --git a/package/systemd/Config.in.host b/package/systemd/Config.in.host
> new file mode 100644
> index 0000000000..219f24239e
> --- /dev/null
> +++ b/package/systemd/Config.in.host
> @@ -0,0 +1,3 @@
> +# Select this if you need host systemd tools (e.g. systemctl)
> +config BR2_PACKAGE_HOST_SYSTEMD
> +	bool
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index a292a7512b..ad16b58ceb 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -204,6 +204,11 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
>  SYSTEMD_CONF_OPTS += -Dhwdb=true
> +define SYSTEMD_BUILD_HWDB
> +	$(HOST_DIR)/bin/udevadm hwdb --update --root $(TARGET_DIR)
> +endef

I think this change could be a separate patch, no? Or is the udevadm
binary installed by host-systemd conflicting with the one installed by
host-eudev ?

Should be explained in the commit log.

> +SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_BUILD_HWDB
> +
>  else
>  SYSTEMD_CONF_OPTS += -Dhwdb=false
>  endif
> @@ -551,3 +556,96 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
>  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
>  
>  $(eval $(meson-package))

We normally have both meson-package and host-meson-package macro
invocations at the end of .mk files.

> +#
> +# Host-systemd configuration
> +#
> +#Options tweaked for buildroot
> +HOST_SYSTEMD_CONF_OPTS= \
> +	-Dsplit-bin=true \
> +	-Dsplit-usr=false \
> +	--prefix=/usr \

This should really be:

	--prefix=$(HOST_DIR)

> +	--libdir=lib \
> +	--sysconfdir=/etc \
> +	--localstatedir=/var

But in fact, all these options are already passed by the
host-meson-package infrastructure. Why are you overriding them ?

> +#disable everything else

Space after #

> +HOST_SYSTEMD_CONF_OPTS+= \

Space before +=


> +HOST_SYSTEMD_DEPENDENCIES = \
> +	host-util-linux \
> +	host-patchelf \
> +	host-libcap \
> +	host-gperf
> +
> +# Fix RPATH After installation
> +# * systemd provides a install_rpath instruction to meson because the binaries need to link with
> +#   libsystemd which is not in a standard path
> +# * meson can only replace the RPATH, not append to it
> +# * the original rpatch is thus lost.

rpatch -> rpath

> +# * the original path had been tweaked by buildroot vial LD_FLAGS to add $(HOST_DIR)/lib

vial -> via

LD_FLAGS -> LDFLAGS

> +# * thus re-tweak rpath after the installation for all binaries that need it

I must admit I don't really understand what's going on here. Can't you
simply do something like this:

HOST_SYSTEMD_CONF_ENV = \
	LDFLAGS="$(HOST_LDFLAGS) -Wl,-rpath,$(HOST_DIR)/lib/systemd"

and that's it ?

> +#buildroot detects incorrect RPATH, so adding new binaries should be safe (it won't compile
> +#unless properly integrated).

Space after #, and lines are too long.

> +HOST_SYSTEMD_HOST_TOOLS = \
> +	systemd-analyze  systemd-mount systemctl udevadm
> +
> +define HOST_SYSTEMD_FIX_RPATH
> +	$(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
> +		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
> +	)
> +endef
> +
> +HOST_SYSTEMD_POST_INSTALL_HOOKS +=  HOST_SYSTEMD_FIX_RPATH
> +HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)

With the correct --prefix=$(HOST_DIR) passed by the default
host-meson-package infrastructure, this DESTDIR=$(HOST_DIR) should no
longer be necessary.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
