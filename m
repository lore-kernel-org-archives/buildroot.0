From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 04 Nov 2012 14:10:38 +0100
Subject: [Buildroot] [PATCHv2 01/10] manual: add section about storing
 the configuration.
In-Reply-To: <1351063027-13800-2-git-send-email-arnout@mind.be>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
 <1351063027-13800-2-git-send-email-arnout@mind.be>
Message-ID: <5096694E.9070205@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle (Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>
> Reuse part of board-support.txt, and remove that one because it
> was unused.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

A few nitpicking notes below, but I like it globally. Thanks for
working for improving the docs!

Note also I have no comments about the last section ("Step-by-step
instructions for storing configuration outside the buildroot tree") as
I always work inside the tree.

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

> diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
> new file mode 100644
> index 0000000..44de356
> --- /dev/null
> +++ b/docs/manual/customize-store.txt
> @@ -0,0 +1,249 @@
> +Storing the configuration
> +-------------------------
> +[[customize-store]]
> +
> +When you have a buildroot configuration that you are satisfied with
> +and you want to move to share it with others, put it under revision

s/to move //

> +control or move on to a different buildroot project, you need to store
> +the configuration so it can be rebuilt later. The configuration that
> +needs to be stored consists of the buildroot configuration, the
> +configuration files for packages that you use (kernel, busybox,
> +uClibc, ...), and your rootfs modifications.
> +
> +Basics for storing the configuration
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +[[customize-store-basics]]
> +
> +Buildroot configuration
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> +For storing the buildroot configuration itself, buildroot offers the
> +following command: +make savedefconfig+
> +
> +This strips the buildroot configuration down by removing configuration
> +options that are at their default value. The result is stored in a file
> +called +defconfig+. Copy this file to +foo_defconfig+ in the +configs+
> +directory. The configuration can then be rebuilt by running
> ++make foo_defconfig+
> +
> +Alternatively, you can copy the file to any other place and rebuild with
> ++make BR2_DEFCONFIG=<path-to-defconfig> defconfig+

The space before defconfig is wrong. Either:
+make BR2_DEFCONFIG=<path-to-defconfig>/defconfig+
or
+make BR2_DEFCONFIG=<path-to-defconfig-file>+
(I prefer the latter)

> +
> +
> +Other package configuration
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The configuration files for busybox, the linux kernel, uClibc and
> +crosstool-NG should be stored as well. For each of these, a
> +buildroot configuration option exists to point to an input configuration
> +file, e.g. +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+.  To save their
> +configuration, set those configuration options to a path outside
> +your output directory.  Then, copy the configuration files
> +to that path.

You may add an example dir, such as
board/<mycompany>/<myboard>/linux.config.

PS: I see this exmaple is present later in "Creating you board
support". I would still add an example here to clarify.

> +
> +Make sure that you create a configuration file 'before' changing
> +the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+ etc. options.  Otherwise,
> +buildroot will try to access this config file, which doesn't exist
> +yet, and will fail.

It's not very clear what "create a config file" means. You might
clarify by appending " by building the package at least once".
You actyally only need to run make <foo>-configure, but I don't know
how to explain it clearly.

...snip...

> +
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
> +1. Write the configuration files:
> +   * +make linux-update-defconfig+
> +   * +make busybox-update-config+
> +   * +cp <output>/build/build-toolchain/.config board/<manufacturer>/<boardname>/ctng.config+
> +   * +make uclibc-update-config+
> +   * +cp <output>/build/at91bootstrap3-*/.config board/<manufacturer>/<boardname>/at91bootstrap3.config+

Same as above: before *-update-*config, you have to build the relevant
packages (or at least configure them successfully).

> +1. Create +board/<manufacturer>/<boardname>/fs-overlay+ and fill it

I would clarify that fs-overlay is a directory, not a file. Just adding
a trailing '/' would be fine.

> +   with additional files you need on your rootfs, e.g.
> +   +board/<manufacturer>/<boardname>/etc/inittab+.
> +1. Create a post-build script
> +   +board/<manufacturer>/<boardname>/post-build.sh+.  It should contain
> +   the following command:
> ++
> +------------
> +rsync -a --exclude .empty --exclude '*~' ${0%/*}/fs-overlay $1
> +------------

Unnecessarily complex for docs IMHO, I'd rather use cp here.
But I don't care that much as this line is being removed in the next
patch, which I hope to see committed.

> ++
> +1. Set +BR2_ROOTFS_POST_BUILD_SCRIPT+ to +board/<manufacturer>/<boardname>/post-build.sh+
> +1. If additional setuid permissions have to be set or device nodes have
> +   to be created, create +board/<manufacturer>/<boardname>/device_table.txt+
> +   and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
> +1. +make savedefconfig+ to save the buildroot configuration.
> +1. +cp defconfig configs/<boardname>_defconfig+
> +1. To add patches to the linux build, set +BR2_LINUX_KERNEL_PATCH+ to
> +   +board/<manufacturer>/<boardname>/patches/linux+ and add your

Same as above: I would clarify that fs-overlay is a directory, not a file.
Just adding a trailing '/' would be fine.

> +   patches in that directory. Each patch should be called
> +   +linux-<num>-<description>.patch+. Similar for U-Boot, barebox,
> +   at91bootstrap and at91bootstrap3.
> +1. If you need modifications to other packages, or if you need to add
> +   packages, do that directly in the +packages/+ directory.

Append ", following the instructions in xref:adding-packages[]".

Luca
