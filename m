From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Jul 2016 22:08:08 +0200
Subject: [Buildroot] [PATCH v2 1/3] aufs: new package
In-Reply-To: <1461936690-1389-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
References: <1461936690-1389-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
Message-ID: <20160714200808.GD3737@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aul, Christian, All,

On 2016-04-29 19:01 +0530, Atul Singh spake thusly:
> From: Christian Stewart <christian@paral.in>
> 
> aufs is a dummy package that downloads the correct
> aufs-standalone sources for patching the kernel with the aufs
> filesystem. The package is not selectable because it does nothing but
> download the sources on default. It is a dependency of the Aufs kernel
> extension.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> [Atul:
>  - Removed the duplicate conditional block.
>  - Updated the license to GPLv2.
>  - Removed the visibilty of package from menuconfig.
>  - Removed dependencies.
>  - Removed the comment.
>  - Changed the name of variable from BR2_PACKAGE_AUFS_STANDALONE_VERSION to BR2_LINUX_KERNEL_EXT_AUFS_VERSION.
>  - Removed the AUFS_INSTALL_STAGING  and AUFS_INSTALL_TARGET  variables.
>  - Removed the BR2_PACKAGE_AUFS_3X and BR2_PACKAGE_AUFS_4X variables.
> ]
> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> ---
[--SNIP--]

Please add a .hash file too:
    http://nightly.buildroot.org/#adding-packages-hash

Although it is "downloaded from a version control system (git,
subversion, etc?)", it is provided by the github download helper, which
in fact will download a tarball and will not do a git-clone. Github now
generates reproducible archives in our experience, so we can/must add a
.hash file.

> diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
> new file mode 100644
> index 0000000..a139547
> --- /dev/null
> +++ b/package/aufs/aufs.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# aufs
> +#
> +# patches for the linux kernel, used by the extension.

Just the package name in the header, please.

> +#
> +################################################################################
> +
> +AUFS_VERSION = aufs$(call qstrip,$(BR2_LINUX_KERNEL_EXT_AUFS_VERSION))

The BR2_LINUX_KERNEL_EXT_AUFS_VERSION does not exist in this patch, it
is only provided with the next patch.

So you can't use it here.

The only way is to squash the two patches into one: they are in fact a
single change, they can't be logically split.

> +AUFS_VERSION_MAJOR = $(firstword $(subst .,$(space),$(call qstrip,$(BR2_LINUX_KERNEL_EXT_AUFS_VERSION))))
> +AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
> +AUFS_LICENSE = GPLv2
> +AUFS_LICENSE_FILES = COPYING
> +
> +ifeq ($(AUFS_VERSION_MAJOR),3)
> +AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
> +AUFS_SITE_METHOD = git
> +else ifeq ($(AUFS_VERSION_MAJOR),4)
> +AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
> +else
> +$(error Unknown aufs major version)
> +endif

As noticed by Christian, this won't work when the aufs extension is not
enabled. You must enclose such checks inside a more stringent test:

ifeq ($(BR2_PACKAGE_AUFS),y)
# Do the checks here
endif # BR_BUILDING

However, I'm not too fan of this after-the-fact checking. But we can't
seriously have a 30+ choice to select the appropriate version, nor can
we even derive the version from that of the kernel... So I guess we'll
have to live with that check... :-/

Regards,
Yann E. MORIN.

> +$(eval $(generic-package))
> -- 
> 2.5.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
