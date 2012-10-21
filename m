From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 21 Oct 2012 17:05:40 +0200
Subject: [Buildroot] [PATCH 01/10] manual: add section about storing the
	configuration.
In-Reply-To: <1350776731-8467-2-git-send-email-arnout@mind.be>
References: <1350776731-8467-1-git-send-email-arnout@mind.be>
 <1350776731-8467-2-git-send-email-arnout@mind.be>
Message-ID: <CAHXCMM+qPKy0qUefqnr3V5jiy7ffR1AO_aNnKiW7LBT_YfV01Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

2012/10/21 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>
> Reuse part of board-support.txt, and remove that one because it
> was unused.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  docs/manual/adding-packages-directory.txt |    1 +
>  docs/manual/board-support.txt             |   35 -----
>  docs/manual/customize-store.txt           |  241 +++++++++++++++++++++++++++++
>  docs/manual/customize.txt                 |    2 +
>  4 files changed, 244 insertions(+), 35 deletions(-)
>  delete mode 100644 docs/manual/board-support.txt
>  create mode 100644 docs/manual/customize-store.txt
>
[...]
> +Step-by-step instructions for storing configuration inside the buildroot tree
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +To store the configuration for a specific product, device or
> +application, it is advisable to use the same conventions as for the
> +board support: put the buildroot defconfig in the +configs+ directory,
> +and any other files in a subdirectory of the +boards+ directory.  This
> +section gives step-by-step instructions about how to do that. Of course,
> +you can skip the steps that are not relevant for your use case.
> +
> +1. +make menuconfig+ to configure toolchain, packages and kernel.
I think you don't need to use explicit numbering here and everywhere
below, which should force to "1. ..."  each item.

Note that I haven't try to build the doc with this patch, I'm just referring to:
http://www.methods.co.nz/asciidoc/userguide.html#_numbered_lists

> +1. +make linux-menuconfig+ to update the kernel config, similar for
> +   other configuration.
> +1. +mkdir -p board/<manufacturer>/<boardname>+
> +1. Set the following options to +board/<manufacturer>/<boardname>/<package>.config+
> +   (as far as they are relevant):
> +   * +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
> +   * +BR2_PACKAGE_BUSYBOX_CONFIG+
> +   * +BR2_TOOLCHAIN_CTNG_CONFIG+
> +   * +BR2_UCLIBC_CONFIG+
> +   * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
I think that we could/should/have to add such option for barebox too.
I've cooked a patch for that and I'll post it shortly.

> +1. Write the configuration files:
> +   * +make linux-update-defconfig+
> +   * +make busybox-update-config+
> +   * +cp <output>/build/build-toolchain/.config board/<manufacturer>/<boardname>/ctng.config+
> +   * +make uclibc-update-config+
> +   * +cp <output>/build/at91bootstrap3-*/.config board/<manufacturer>/<boardname>/at91bootstrap3.config+
humm... I may be a bit nit, but I would prefer fill the
board/<manufacturer>/<boardname> directory with all these config.
files _before_ setting the corresponding options, so I would swap this
step with the previous one.

> +1. Create +board/<manufacturer>/<boardname>/fs-overlay+ and fill it
> +   with additional files you need on your rootfs, e.g.
> +   +board/<manufacturer>/<boardname>/etc/inittab+.
> +1. Create a post-build script
> +   +board/<manufacturer>/<boardname>/post-build.sh+.  It should contain
> +   the following command:
> ++
> +------------
> +rsync -a --exclude .empty --exclude '*~' ${0%/*}/fs-overlay $1
> +------------
> ++
> +1. Set +BR2_ROOTFS_POST_BUILD_SCRIPT+ to +board/<manufacturer>/<boardname>/post-build.sh+
> +1. If additional setuid permissions have to be set or device nodes have
> +   to be created, create +board/<manufacturer>/<boardname>/device_table.txt+
> +   and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
> +1. +make savedefconfig+ to save the buildroot configuration.
> +1. +cp defconfig configs/<boardname>_defconfig+
> +
> +

In the following, I won't repeat all the previous points I've already mentioned.

> +Step-by-step instructions for storing configuration outside the buildroot tree
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +When you use buildroot in different projects, you may want to keep
> +each project separate from buildroot itself. This requires an extra
> +script or Makefile, but is otherwise easy to do with buildroot.
> +Take the following steps (very similar to storing configuration inside
> +the buildroot tree).
> +
> +1. +make menuconfig+ to configure toolchain, packages and kernel.
> +1. +make linux-menuconfig+ to update the kernel config, similar for
> +   other configuration.
> +1. +mkdir -p <path-to-board-directory>+
> +1. Set the following options to +$(BOARDDIR)/<package>.config+
> +   (as far as they are relevant):
> +   * +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
> +   * +BR2_PACKAGE_BUSYBOX_CONFIG+
> +   * +BR2_TOOLCHAIN_CTNG_CONFIG+
> +   * +BR2_UCLIBC_CONFIG+
> +   * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
> +1. Write the configuration files:
> +   * +make linux-update-defconfig+
> +   * +make busybox-update-config+
> +   * +cp <output>/build/build-toolchain/.config <path-to-board-directory>/ctng.config+
> +   * +make uclibc-update-config+
> +   * +cp <output>/build/at91bootstrap3-*/.config <path-to-board-directory>/at91bootstrap3.config+
> +1. Create +<path-to-board-directory>/fs-overlay+ and fill it
> +   with additional files you need on your rootfs, e.g.
> +   +<path-to-board-directory>/etc/inittab+.
> +1. Create a post-build script
> +   +<path-to-board-directory>/post-build.sh+.  It should contain
> +   the following command:
> ++
> +------------
> +rsync -a --exclude .empty --exclude '*~' ${0%/*}/fs-overlay $1
> +------------
> ++
> +1. Set +BR2_ROOTFS_POST_BUILD_SCRIPT+ to +$(BOARDDIR)/post-build.sh+
> +1. If additional setuid permissions have to be set or device nodes have
> +   to be created, create +<path-to-board-directory>/device_table.txt+
> +   and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
> +1. +make savedefconfig+ to save the buildroot configuration.
> +1. +cp defconfig <path-to-board-directory>/buildroot.config+
> +1. Create a script or Makefile in the board directory that calls
> +   buildroot:
> ++
> +------------
> +make -C <path-to-buildroot> O=<path-to-board-directory>/output BR2_DEFCONFIG=<path-to-board-directory>/buildroot.config defconfig
> +make -C <path-to-buildroot> O=<path-to-board-directory>/output BOARDDIR=<path-to-board-directory>
> +------------
Rather a (rhetoric) question or a feature request ;-) than a comment:
since this script/makefile is located at the root of the board
directory, how about automatically resolve the
<path-to-board-directory>?

> ++
> +1. If you have additional proprietary binaries that are compiled
> +   outside of buildroot, you can copy them into the rootfs as
> +   part of +post-build.sh+
> +1. If you need additional packages that are not available in buildroot
> +   and that you don't want to make available (e.g. proprietary
> +   applications), set +BR2_PACKAGE_OVERRIDE_FILE+ to
> +   +$(BOARDDIR)/local.mk+. Add the following to +local.mk+ to
> +   add package 'foo': +include foo/foo.mk+.  Add the following in
> +   +foo.mk+ (see xref:adding-packages-mk[Adding packages to buildroot]):
> ++
> +------------
> +BR2_PACKAGE_FOO     = y
> +FOO_OVERRIDE_SRCDIR = $(BOARDDIR)/foo
> +
> +define FOO_BUILD_CMDS
> +        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define FOO_INSTALL_TARGET_CMDS
> +        $(INSTALL) -D -m 0755 $(@D)/foo $(TARGET_DIR)/usr/bin/foo
> +endef
> +
> +$(eval $(generic-package))
> +------------
> ++
> +The +BR2_PACKAGE_FOO=y+ makes sure the package is always selected,
> +so there is no need for a +Config.in+ file. The +FOO_OVERRIDE_SRCDIR+
> +tells buildroot to fetch the sources from the +foo+ directory, and
> +also makes sure that they are re-synchronized when you call +make
> +foo-rebuild+
> ++
> +1. To add patches to the linux build, set +BR2_LINUX_KERNEL_PATCH+ to
> +   +$(BOARDDIR)/patches/linux+ and add your patches in that directory.
> +   Similar for U-Boot, barebox, at91bootstrap and at91bootstrap3.
This point is also true for board supported in BR, except that all
patches belong to the board/<manufacturer>/<boardname> directory.
So, either move this point up in the "Creating your own board support"
section and/or add the corresponding point to the "Step-by-step
instructions for storing configuration inside the buildroot tree"
section.

> +1. To add patches for some other package 'foo', put them in the
> +   +patches/foo+ directory and add the following to +local.mk+:
> ++
> +------------
> +define FOO_LOCAL_PATCHES
> +support/scripts/apply-patches.sh $(@D) $(BOARDDIR)/patches/foo foo-\*.patch
> +endef
> +
> +FOO_POST_PATCH_HOOKS += FOO_LOCAL_PATCHES
> +------------
> diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
> index e8235de..6bd5811 100644
> --- a/docs/manual/customize.txt
> +++ b/docs/manual/customize.txt
> @@ -10,3 +10,5 @@ include::customize-uclibc-config.txt[]
>  include::customize-kernel-config.txt[]
>
>  include::customize-toolchain.txt[]
> +
> +include::customize-store.txt[]
> --
> 1.7.10.4


Regards,

-- 
Sam
