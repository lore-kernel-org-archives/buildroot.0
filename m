From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 13 Jul 2015 12:11:47 +0200
Subject: [Buildroot] [PATCH v2] linux: add AUFS kernel extension
In-Reply-To: <1424007190-5878-1-git-send-email-bos@je-eigen-domein.nl>
References: <1424007190-5878-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <55A38EE3.3090000@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Floris,

Le 15/02/2015 14:33, Floris Bos a ?crit :
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> 
> ---
> Changes v1 -> v2:
> - Fix AUFS version may not be empty check
> ---
>  linux/Config.ext.in     | 19 +++++++++++++++++++
>  linux/linux-ext-aufs.mk | 24 ++++++++++++++++++++++++
>  package/aufs/Config.in  | 11 +++++++++++
>  package/aufs/aufs.mk    | 17 +++++++++++++++++
>  4 files changed, 71 insertions(+)
>  create mode 100644 linux/linux-ext-aufs.mk
>  create mode 100644 package/aufs/Config.in
>  create mode 100644 package/aufs/aufs.mk
> 
> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> index 8f15687..04fe7a1 100644
> --- a/linux/Config.ext.in
> +++ b/linux/Config.ext.in
> @@ -29,6 +29,25 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
>  	  Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
>  	  and verify that your kernel version in buildroot matches.
>  
> +# AUFS
> +config BR2_LINUX_KERNEL_EXT_AUFS
> +	bool "AUFS patch"
> +	select BR2_PACKAGE_AUFS
> +	help
> +	  AUFS patch
> +
> +	  This option patches the kernel.
> +	  You need to enable CONFIG_AUFS_FS in kernel configuration seperately.

s/seperately/separately/

> +
> +	  http://aufs.sourceforge.net/
> +
> +config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
> +	depends on BR2_LINUX_KERNEL_EXT_AUFS
> +	string "AUFS version"
> +	help
> +	  AUFS git branch, e.g. aufs3.18.1+
> +	  Needs to match your kernel version.
> +
>  # RTAI
>  config BR2_LINUX_KERNEL_EXT_RTAI
>  	bool "RTAI Real-time patch"
> diff --git a/linux/linux-ext-aufs.mk b/linux/linux-ext-aufs.mk
> new file mode 100644
> index 0000000..c3ff2dc
> --- /dev/null
> +++ b/linux/linux-ext-aufs.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +# Linux aufs extension
> +#
> +# Patch the linux kernel with aufs extension
> +################################################################################
> +

The linux-ext-aufs.mk should be converted to use the new linux-ext infra
introduced in 2015.05.

> +ifeq ($(BR2_LINUX_KERNEL_EXT_AUFS),y)

This can be removed

> +# Add dependency to aufs package (download helper for the aufs source)
> +LINUX_DEPENDENCIES += aufs

Use LINUX_EXTENSIONS to use linux-ext infra, so the aufs dependency is added to
the linux package.

> +
> +AUFS_PATCHES = kbuild base mmap standalone
> +
> +define AUFS_PREPARE_KERNEL
> +	$(foreach p,$(AUFS_PATCHES),./support/scripts/apply-patches.sh $(LINUX_DIR) $(AUFS_DIR) *$(p).patch;)

I think $(TOPDIR)/support should be used instead of ./support

> +	cp -af $(AUFS_DIR)/fs $(AUFS_DIR)/Documentation $(LINUX_DIR)
> +	cp -af $(AUFS_DIR)/include/uapi/linux/aufs_type.h \
> +		$(LINUX_DIR)/include/uapi/linux
> +	cp -af $(AUFS_DIR)/include/uapi/linux/aufs_type.h \
> +		$(STAGING_DIR)/usr/include/linux
> +endef
> +

> +LINUX_PRE_PATCH_HOOKS += AUFS_PREPARE_KERNEL

This can be removed, since it's automatically added by the linux-ext infra.

> +
> +endif #BR2_LINUX_KERNEL_EXT_AUFS

This can be removed

> diff --git a/package/aufs/Config.in b/package/aufs/Config.in
> new file mode 100644
> index 0000000..d924278
> --- /dev/null
> +++ b/package/aufs/Config.in
> @@ -0,0 +1,11 @@
> +# Prompt-less option, because this package is not doing anything
> +# except downloading the AUFS sources. The real work is done by a
> +# Linux extension.
> +config BR2_PACKAGE_AUFS
> +	bool
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  AUFS
> +	  This is only the download helper for the kernel patch.
> +
> +	  http://aufs.sourceforge.net/
> diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
> new file mode 100644
> index 0000000..83dd00f
> --- /dev/null
> +++ b/package/aufs/aufs.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# AUFS download helper
> +#
> +################################################################################
> +
> +AUFS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_AUFS_VERSION))
> +AUFS_SITE = git://git.code.sf.net/p/aufs/aufs3-standalone

There is a new aufs4 git repository [1] for latest 4.x kernel, it would be good
to support these kernel too.

Also there was a patch to add aufs-utils [2]. By reading the aufs-util's README
[3] it would be good to complete your series to add aufs-util in Buildroot.

"These utilities are always necessary for aufs.
If you forget to install them, your aufs may not work correctly."

Thanks !

Best regards,
Romain Naour

[1] git://github.com/sfjro/aufs4-standalone.git
[2] http://lists.busybox.net/pipermail/buildroot/2014-July/102997.html
[3] http://sourceforge.net/p/aufs/aufs-util/ci/aufs3.14/tree/README

> +AUFS_LICENSE = GPLv2
> +
> +ifeq ($(BR2_LINUX_KERNEL_EXT_AUFS),y)
> +ifeq ($(AUFS_VERSION),)
> +$(error BR2_LINUX_KERNEL_EXT_AUFS_VERSION must be set to the AUFS branch matching your kernel, e.g. "aufs3.18.1+")
> +endif
> +endif
> +
> +$(eval $(generic-package))
> 
