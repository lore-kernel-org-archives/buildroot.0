From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 21:22:01 +0100
Subject: [Buildroot] [PATCH 1/3] aufs: new package
In-Reply-To: <1458801105-24612-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
References: <1458801105-24612-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
Message-ID: <20160326212201.41d7a2e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for picking up the work on this series. I had a look at
it, as I was hoping to be able to apply it, but this aufs thing is a
quite complicated packaging task. I'll review you, and ask some
questions about it as well. I'm Cc'ing Yann, who might provide some
additional hints on some specific problems.

On Thu, 24 Mar 2016 12:01:45 +0530, Atul Singh wrote:
> From: Christian Stewart <christian@paral.in>
> 
> aufs is a metapackage that downloads the correct
> aufs-standalone sources for patching the kernel with the aufs

We don't have the notion of metapackage in Buildroot. So I would just
say a "dummy package" or something like that.

> filesystem. The package is not selectable because it does nothing but

In practice, this is not what your patch does: your patch makes the
package selectable, which is wrong. So your commit log is good from
that point of view, but not the patch itself. Read on below.

> download the sources on default. It is a dependency of the Aufs kernel
> extension.
> 
> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>

You should preserve Christian Signed-off-by before yours, and indicate
what you have changed compared to Christian version. Something like:

Signed-off-by: Christian...
[Atul:
 - changed this
 - changed that
 - and this other thing]
Signed-off-by: Atul ...

> diff --git a/package/aufs/Config.in b/package/aufs/Config.in
> new file mode 100644
> index 0000000..51f2c91
> --- /dev/null
> +++ b/package/aufs/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_AUFS
> +	bool "aufs"

This should be just "bool" so that the package is indeed not visible in
menuconfig.

> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Not needed. This package doesn't build anything, so there is no reason
to carry this type of dependencies.

> diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
> new file mode 100644
> index 0000000..3cdbffc
> --- /dev/null
> +++ b/package/aufs/aufs.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# aufs
> +#
> +# patches for the linux kernel, used by the extension.
> +#
> +################################################################################
> +
> +# linux-headers default to a 4.x

What does this comment means?

> +AUFS_VERSION = aufs$(call qstrip,$(BR2_PACKAGE_AUFS_STANDALONE_VERSION))

I think the variable containing the version, since it's located in
linux/Config.ext.in, should be named BR2_LINUX_KERNEL_EXT_AUFS_VERSION.

> +AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
> +AUFS_LICENSE = GPLv2
> +AUFS_LICENSE_FILES = COPYING
> +AUFS_INSTALL_STAGING = YES
> +AUFS_INSTALL_TARGET = NO

Remove those two lines, they are completely useless, since the package
is not installing anything.

> +ifeq ($(BR2_PACKAGE_AUFS_3X),y)
> +AUFS_MAJOR_VERSION = aufs3
> +AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
> +AUFS_SITE_METHOD = git
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUFS_4X),y)
> +AUFS_MAJOR_VERSION = aufs4
> +endif

I think the BR2_PACKAGE_AUFS_3X and BR2_PACKAGE_AUFS_4X options are
useless, since you can guess that from the
BR2_LINUX_KERNEL_EXT_AUFS_VERSION option. I've tried something like
this:

AUFS_VERSION = aufs$(call qstrip,$(BR2_LINUX_KERNEL_EXT_AUFS_VERSION))
AUFS_VERSION_MAJOR = $(firstword $(subst .,$(space),$(call qstrip,$(BR2_LINUX_KERNEL_EXT_AUFS_VERSION))))

ifeq ($(AUFS_VERSION_MAJOR),3)
AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
AUFS_SITE_METHOD = git
else ifeq ($(AUFS_VERSION_MAJOR),4)
AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
else
$(error Unknown aufs major version)
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
