From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 21:00:11 +0200
Subject: [Buildroot] [PATCH 2/2] bandwidthd: new package
In-Reply-To: <1406548649-4649-2-git-send-email-nroach44@gmail.com>
References: <1406548649-4649-1-git-send-email-nroach44@gmail.com>
 <1406548649-4649-2-git-send-email-nroach44@gmail.com>
Message-ID: <20140728210011.2df538f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel Roach,

On Mon, 28 Jul 2014 19:57:29 +0800, Nathaniel Roach wrote:

> diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
> new file mode 100644
> index 0000000..7305060
> --- /dev/null
> +++ b/package/bandwidthd/Config.in
> @@ -0,0 +1,39 @@
> +config BR2_PACKAGE_BANDWIDTHD
> +	bool "bandwidthd"
> +	depends on BR2_USE_MMU # fork()

No other toolchain dependency? Can you try building this package with
the following base configuration:

  http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config

> +if BR2_PACKAGE_BANDWIDTHD

Please add an empty new line here.

> +config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
> +	bool "enable postgresql log target support"
> +	select BR2_PACKAGE_POSTGRESQL

When selecting a package, you need to propagate its dependencies. Since
postgresql depends on glibc, you need to propagate this dependency here:

	depends on BR2_TOOLCHAIN_USES_GLIBC # postgresql

> diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
> new file mode 100644
> index 0000000..e294af3
> --- /dev/null
> +++ b/package/bandwidthd/bandwidthd.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# bandwidthd

One new line needed here. See other packages for the format of the
header.

> +################################################################################
> +
> +BANDWIDTHD_VERSION = v2.0.1-auto-r03
> +BANDWIDTHD_SITE = $(call github,nroach44,bandwidthd,$(BANDWIDTHD_VERSION))
> +BANDWIDTHD_CONF_OPT = 
> +BANDWIDTHD_CONF_ENV =

Empty variables not needed.

> +BANDWIDTHD_LICENSE = GPL+

It's rather unfortunate that they do not specify the version of the
GPL. So, I don't think the "+" is in order here. Maybe just:

# GPL version unspecified by upstream authors
BANDWIDTHD_LICENSE = GPL

> +BANDWIDTHD_DEPENDENCIES += gd
> +BANDWIDTHD_DEPENDENCIES += libpng
> +BANDWIDTHD_DEPENDENCIES += libpcap

Just one line:

BANDWIDTHD_DEPENDENCIES = gd libpng libpcap

> +
> +BANDWIDTHD_AUTORECONF = YES
> +
> +ifeq ($(BR2_PACKAGE_BANDWIDTHD_POSTGRESQL),y)
> +BANDWIDTHD_DEPENDENCIES += postgresql
> +BANDWIDTHD_CONF_OPT += --with-postgresql-logging=true
> +else
> +BANDWIDTHD_CONF_OPT += --with-postgresql-logging=false
> +endif
> +
> +$(eval $(autotools-package))

Other than that, looks good. Could you resubmit an updated version
fixing those issues?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
