From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:54:15 +0100
Subject: [Buildroot] [PATCH 2/2] aufs: initial release (selects
 aufs-utils)
In-Reply-To: <1406576065-20263-2-git-send-email-mail@steffenhoenig.com>
References: <1406576065-20263-1-git-send-email-mail@steffenhoenig.com>
 <1406576065-20263-2-git-send-email-mail@steffenhoenig.com>
Message-ID: <20141123215415.5cc12226@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Steffen,

Sorry for the very late feedback about your patches. Are you still
interested in getting aufs merged in Buildroot?

On Mon, 28 Jul 2014 21:34:25 +0200, steffenhoenig wrote:

> diff --git a/package/aufs/Config.in b/package/aufs/Config.in
> new file mode 100644
> index 0000000..e7842bd
> --- /dev/null
> +++ b/package/aufs/Config.in
> @@ -0,0 +1,36 @@
> +config BR2_PACKAGE_AUFS
> +        bool "aufs"
> +        select BR2_PACKAGE_AUFS_UTILS

Why do you select BR2_PACKAGE_AUFS_UTILS here? My understanding is that
the dependency is the other way around: you cannot build aufs-utils
until the aufs package has installed the aufs_type.h header file.

> +        help
> +          Aufs3 -- advanced multi layered unification filesystem version 3.x
> +
> +comment "aufs needs a Linux kernel to be built"
> +    depends on !BR2_LINUX_KERNEL

So there should be a "depends on BR2_LINUX_KERNEL" under the main aufs
config option, above.

> +
> +if BR2_PACKAGE_AUFS
> +
> +choice 
> +    prompt "version"
> +
> +config BR2_PACKAGE_AUFS_LATEST_VERSION
> +    bool "aufs3.15"
> +
> +config BR2_PACKAGE_AUFS_CUSTOM_VERSION
> +    bool "custom version"
> +    help
> +      This option allows to use a specific aufs kernel patch set
> +
> +      Note: you need to insert the version string like aufs3.12, aufs3.9, ...
> +
> +endchoice
> +
> +config BR2_PACKAGE_AUFS_CUSTOM_VERSION_VALUE
> +    string ""
> +    depends on BR2_PACKAGE_AUFS_CUSTOM_VERSION
> +
> +config BR2_PACKAGE_AUFS_VERSION
> +    string
> +    default "aufs3.15" if BR2_PACKAGE_AUFS_LATEST_VERSION
> +    default BR2_PACKAGE_AUFS_CUSTOM_VERSION_VALUE \
> +        if BR2_PACKAGE_AUFS_CUSTOM_VERSION
> +endif

I don't think this complexity is necessary. Having a "latest" version
for aufs doesn't make a lot of sense, because nobody wants the "latest"
version: everybody wants a version that matches the kernel version
being used.

So I believe, you can replace that by a single "string" config option:

config BR2_PACKAGE_AUFS_VERSION
	string "version"
	help
	  Specify aufs3.9, aufs3.13, aufs3.17 or any other existing
	  aufs version.

> +AUFS_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_VERSION))
> +AUFS_LICENCSE = GPLv2

LICENSE.

> +AUFS_LICENSE_FILES = COPYING
> +
> +AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
> +AUFS_SITE_METHOD = git
> +
> +AUFS_DEPENDENCIES = linux
> +AUFS_INSTALL_STAGING = YES
> +
> +AUFS_PATCHES = kbuild base mmap standalone
> +
> +define AUFS_BUILD_CMDS
> +    $(foreach p,$(AUFS_PATCHES),./support/scripts/apply-patches.sh $(LINUX_DIR) $(@D) *$(p).patch;)

This cannot work, because AUFS_BUILD_CMDS will be executed *after* the
Linux kernel has been built. So it's too late to patch the kernel.

Since aufs needs to patch the kernel, you'll have to handle it as a
"Linux kernel extension", taking example on what we've done for RTAI in
linux/linux-ext-rtai.mk. I can help with this, but before doing too
much work, I'd like to make sure you are still interested in aufs.

> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) aufs.ko
> +endef
> +
> +define AUFS_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) -f scripts/Makefile.host \
> +		scripts/unifdef

Why?

> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) usr/include/linux/aufs_type.h

This should be part of AUFS_BUILD_CMDS.

> +	$(INSTALL) -p -m 0644 $(@D)/usr/include/linux/aufs_type.h \
> +		$(STAGING_DIR)/usr/include/linux
> +endef
> +
> +define AUFS_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) install
> +endef
> +
> +$(eval $(generic-package))

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
