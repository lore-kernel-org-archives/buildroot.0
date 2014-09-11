From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Sep 2014 23:57:34 +0200
Subject: [Buildroot] [PATCH 1/1] Adds ipmitool,
 a command-line interface to IPMI-enabled devices.
In-Reply-To: <1410443366-22146-1-git-send-email-bos@je-eigen-domein.nl>
References: <1410443366-22146-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20140911235734.2b609e11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

The title of the commit should be:

	ipmitool: new package

On Thu, 11 Sep 2014 15:49:26 +0200, Floris Bos wrote:

> diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
> new file mode 100644
> index 0000000..300a553
> --- /dev/null
> +++ b/package/ipmitool/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_IPMITOOL
> +	bool "ipmitool"
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_OPENSSL

This looks wrong: I was able to build the ipmitool package without
openssl. So openssl seems like an optional dependency, not a mandatory
one. The fact that David Bachelart was also able to build ipmitool
without openssl seems to confirm this.

> +	help
> +	  IPMItool provides a simple command-line interface to IPMI-enabled devices.
> +
> +	  http://sourceforge.net/projects/ipmitool/
> +
> +if BR2_PACKAGE_IPMITOOL
> +
> +config BR2_PACKAGE_IPMITOOL_IPMIEVD
> +	bool "ipmievd"
> +	help
> +	  IPMI event daemon for sending events to syslog
> +
> +endif
> diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
> new file mode 100644
> index 0000000..2d96549
> --- /dev/null
> +++ b/package/ipmitool/ipmitool.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# ipmitool
> +#
> +################################################################################
> +
> +IPMITOOL_VERSION = 1.8.14
> +IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
> +IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPMITOOL_VERSION)
> +IPMITOOL_LICENSE = BSD-3c
> +IPMITOOL_LICENSE_FILES = COPYING
> +IPMITOOL_DEPENDENCIES = openssl

So this should be handled like readline, as an optional dependency.

> +
> +ifeq ($(BR2_PACKAGE_READLINE),y)
> +IPMITOOL_DEPENDENCIES += readline
> +endif
> +
> +ifneq ($(BR2_PACKAGE_IPMITOOL_IPMIEVD),y)

Or, better, use positive logic:

ifeq ($(BR2_PACKAGE_IPMITOOL_IPMIEVD),)

> +define IPMITOOL_REMOVE_IPMIEVD
> +	$(RM) -f $(TARGET_DIR)/usr/sbin/ipmievd
> +endef
> +IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_REMOVE_IPMIEVD
> +endif
> +
> +$(eval $(autotools-package))

Other than that, looks good to me. Care to fix those issues and resend?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
