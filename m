From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 22:01:05 +0200
Subject: [Buildroot] [PATCH 1/3] fmlib: new package
In-Reply-To: <1402412526-24844-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1402412526-24844-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1402412526-24844-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20140610220105.59a27d38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Tue, 10 Jun 2014 08:02:04 -0700, Matt Weber wrote:

> diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
> new file mode 100644
> index 0000000..43f7aa3
> --- /dev/null
> +++ b/package/fmlib/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_FMLIB
> +	bool "fmlib"
> +	depends on BR2_powerpc_e500mc

If your package has 'linux' in its dependencies, then it should
'depends on BR2_LINUX_KERNEL' here, and have a comment about this. See
package/freescale-imx/imx-lib/Config.in for an example.

> +	help
> +	  The Frame Manager library provides an API on top of the Frame Manager driver
> +	  ioctl calls, that provides a user space application with a simple way
> +	  to configure driver parameters and PCD (parse - classify - distribute) rules.

I think the lines are too long here. Wrap to 72 max.

> +FMLIB_VERSION = fsl-sdk-v1.5-rc3
> +FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
> +FMLIB_LICENSE = BSD-c3

We actually use BSD-3c and not BSD-c3. Also, the license should
actually be:

	BSD-3c or GPLv2+

See the COPYING file of the project for details.

> +FMLIB_LICENSE_FILES = COPYING
> +FMLIB_DEPENDENCIES = linux
> +FMLIB_INSTALL_STAGING = YES
> +FMLIB_INSTALL_TARGET = NO

Please add a comment above this like:

# This package installs a static library only, so there's nothing to
# install to the target

> +FMLIB_MAKE_OPTS = \
> +	CC="$(TARGET_CC)" \
> +	CROSS_COMPILE="$(TARGET_CROSS)" \
> +	KERNEL_SRC="$(LINUX_DIR)" \
> +	PREFIX="$(STAGING_DIR)/usr"
> +
> +ifeq ($(BR2_powerpc_e500mc), y)

No space between , and y

> +	FMLIB_ARCHTYPE = ppce500mc
> +endif

That being said, since the package can only be enabled on ppce500mc, do
we really need this condition? Or maybe you're making the thing a bit
more future proof to support the other variants?

> +define FMLIB_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) libfm-$(FMLIB_ARCHTYPE).a
> +endef
> +
> +define FMLIB_INSTALL_STAGING_CMDS
> +	$(FMLIB_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) install-libfm-$(FMLIB_ARCHTYPE)
> +endef
> +
> +$(eval $(generic-package))

Other than that, looks good. Care to fix and resend?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
