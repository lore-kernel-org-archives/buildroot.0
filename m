From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 21:49:05 +0100
Subject: [Buildroot] [PATCH] aoetools: new package
In-Reply-To: <1516007331-17509-1-git-send-email-sergio.prado@e-labworks.com>
References: <1516007331-17509-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20180115214905.10772c21@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Jan 2018 07:08:51 -0200, Sergio Prado wrote:
> The aoetools are programs for users of the ATA over Ethernet (AoE)
> network storage protocol, a simple protocol for using storage over an
> ethernet LAN.
> 
> Tested on Beaglebone Black.
> 
> Build tested with test-pkg.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

I've applied, but after fixing a number of issues, see below.

> diff --git a/package/aoetools/Config.in b/package/aoetools/Config.in
> new file mode 100644
> index 000000000000..25623743b884
> --- /dev/null
> +++ b/package/aoetools/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_AOETOOLS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	bool "aoetools"

The bool property goes before the depends on. This is reported by
check-package.

> +	help
> +	  The aoetools are programs for users of the ATA over Ethernet (AoE)
> +	  network storage protocol, a simple protocol for using storage over
> +	  an ethernet LAN.

The lines here are too long. This is also reported by check-package.

> diff --git a/package/aoetools/aoetools.mk b/package/aoetools/aoetools.mk
> new file mode 100644
> index 000000000000..e11a4f72f924
> --- /dev/null
> +++ b/package/aoetools/aoetools.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# aoetools
> +#
> +################################################################################
> +
> +AOETOOLS_VERSION = 37
> +AOETOOLS_SITE = https://github.com/OpenAoE/aoetools/archive

You should have used the github helper here, since there is no tarball
uploaded by the maintainer.

> +AOETOOLS_LICENSE = GPLv2

This should have been GPL-2.0, which is the SPDX license code for the
GPLv2.

> +AOETOOLS_LICENSE_FILES = COPYING
> +
> +define AOETOOLS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)

And here, I've changed to use $(TARGET_CONFIGURE_OPTS) instead of just
CC, so that the CFLAGS are properly passed/used.

One thing I didn't fix is that the aoe-stat script installed by this
package uses /bin/bash in its shebang, so it won't work because this
package doesn't depend on bash. Does this script really needs bash?
Should we remove it in a post-install target hook? Something else?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
