From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 21:31:50 +0100
Subject: [Buildroot] [PATCH 2/3] aufs-util: new package
In-Reply-To: <1458801150-24657-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
References: <1458801150-24657-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
Message-ID: <20160326213150.190c238d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 12:02:30 +0530, Atul Singh wrote:
> From: Christian Stewart <christian@paral.in>
> 
> Adding the aufs-util utilities. Uses the linux header version settings
> to guess the correct version of aufs-util but ultimately relies on the
> user to enter the correct version of aufs-util to use.
> 
> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>

Same Signed-off-by comment.

> +if BR2_PACKAGE_AUFS_UTIL
> +
> +config BR2_PACKAGE_AUFS_UTIL_VERSION
> +	string "aufs-util branch"
> +	default "see_help_to define_this"

Leave the default to empty.

> +	help
> +	  Aufs-util repository branch must be selected and
> +	  match the current kernel version.  Review the
> +	  following page to determine what branch number
> +	  is valid.
> +
> +	  https://sourceforge.net/p/aufs/aufs-util/ci/master/tree/
> +
> +endif
> diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
> new file mode 100644
> index 0000000..e181548
> --- /dev/null
> +++ b/package/aufs-util/aufs-util.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# aufs-util
> +#
> +################################################################################
> +
> +# linux-headers

What does this comment mean?

> +AUFS_UTIL_VERSION = aufs$(call qstrip,$(BR2_PACKAGE_AUFS_UTIL_VERSION))
> +AUFS_UTIL_SITE = http://git.code.sf.net/p/aufs/aufs-util
> +AUFS_UTIL_SITE_METHOD = git
> +AUFS_UTIL_DEPENDENCIES = linux
> +AUFS_UTIL_LICENSE = GNU

This is not a correct license.

> +AUFS_UTIL_LICENSE_FILES = COPYING
> +
> +# Slight hack for a bug with aufsmvdown
> +# Remove user setting from install command
> +define AUFS_UTIL_CONFIGURE_CMDS
> +	$(SED) 's/\.a\[/\.stbr\[/g' $(@D)/aumvdown.c
> +	$(SED) 's/\-o root \-g root //g' $(@D)/Makefile
> +endef

Please use patches to fix those problems, not some horrible SED
commands.

> +define AUFS_UTIL_BUILD_CMDS
> +	$(MAKE) -C $(LINUX_BUILDDIR) headers_install

This is clearly not acceptable, you cannot invoke Linux's
headers_install target from here.

Indeed, the problem is that aufs-util need the aufs-specific kernel
headers to build. And to be honest, I am not sure how to handle that
properly. I believe the easiest is to simply add
-I$(LINUX_DIR)/include/uapi/ to the CFLAGS when building aufs-util. We
already do something like that in
package/freescale-imx/imx-lib/imx-lib.mk:

        -I$(LINUX_DIR)/drivers/mxc/security/rng/include \
        -I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
        -idirafter $(LINUX_DIR)/include/uapi

> +	$(MAKE) -C $(@D) CPPFLAGS="-I $(LINUX_BUILDDIR)/usr/include/" HOSTCC="$(CC)" HOSTLD="$(LD)" INSTALL="$(INSTALL)" all

CC and LD are not defined by Buildroot. Also, with this invocation, all
aufs-util binaries are built for the host machine, not for the target,
which is most likely wrong.

Please make sure that the binaries that are produced are indeed built
with the cross-compiler, for the target architecture.

Could you rework those patches to take into account the comments?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
