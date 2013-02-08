From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Feb 2013 16:32:29 +0100
Subject: [Buildroot] [PATCH] aircrack-ng: new package
In-Reply-To: <1360340189-4409-1-git-send-email-laurent.cans@gmail.com>
References: <1360340189-4409-1-git-send-email-laurent.cans@gmail.com>
Message-ID: <20130208163229.553918e3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Laurent Cans,

Thanks, this looks pretty good; A few comments below.

On Fri,  8 Feb 2013 17:16:29 +0100, Laurent Cans wrote:
> Aircrack-ng is a set of tools for auditing wireless security.
> 
> Although the last version is 1.1, I choose to package last svn version due to a fixed bug which fix a failed compilation.

Please wrap lines at ~80 columns.

> diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
> new file mode 100644
> index 0000000..1efa8e6
> --- /dev/null
> +++ b/package/aircrack-ng/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_AIRCRACK_NG
> +	bool "aircrack-ng"
> +	depends on BR2_LARGEFILE
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_WI
> +	help
> +	  A set of tools for auditing wireless networks
> +
> +	  http://www.aircrack-ng.org/

Since your package depends on BR2_LARGEFILE, you must add a comment:

comment "aircrack-ng needs a toolchain with largefile support"
	depends on !BR2_LARGEFILE

Like we do for all other packages.

> diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
> new file mode 100644
> index 0000000..29f638c
> --- /dev/null
> +++ b/package/aircrack-ng/aircrack-ng.mk
> @@ -0,0 +1,34 @@
> +#############################################################
> +#
> +# Aircrack-ng
> +#
> +#############################################################
> +AIRCRACK_NG_VERSION = 2245

One empty line between the header and the first variable definition.

> +AIRCRACK_NG_SITE = http://trac.aircrack-ng.org/svn/trunk
> +AIRCRACK_NG_SITE_METHOD = svn
> +AIRCRACK_NG_LICENSE = GPLv2

License is GPLv2+

> +AIRCRACK_NG_LICENSE_FILES = LICENSE
> +AIRCRACK_NG_DEPENDENCIES = openssl
> +
> +ifeq($(BR2_PACKAGE_SQLITE),y)
> +      AIRCRACK_NG_OPTS = sqlite=true
> +      AIRCRACK_NG_DEPENDENCIES += sqlite
> +endif

The src/Makefile contains:

ifeq ($(subst TRUE,true,$(filter TRUE true,$(sqlite) $(SQLITE))),true)
	LIBSQL		= -L/usr/local/lib -lsqlite3
else
	LIBSQL		=
endif

This -L/usr/local/lib isn't really nice since this is not where sqlite
will be installed, and it may cause issues when cross-compiling.

> +
> +define AIRCRACK_NG_BUILD_CMDS
> +      $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) $(AIRCRACK_NG_OPTS) all
> +endef

Use $(TARGET_CONFIGURE_OPTS) :

	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(AIRCRACK_NG_OPTS) all

And ditto for the other commands.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
