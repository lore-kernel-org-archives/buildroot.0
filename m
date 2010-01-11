From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 11 Jan 2010 09:26:55 -0500
Subject: [Buildroot] [PATCH 2/2] A package for the cdfs kernel module
In-Reply-To: <1263060047.18571.9.camel@venture>
References: <1263060047.18571.9.camel@venture>
Message-ID: <a038bef51001110626h6a5ad413s8d7c21fb58eb404d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 9, 2010 at 1:00 PM, Clark Rawlins <clark.rawlins@escient.com> wrote:
> A package to build the CDfs kernel module.
> This (psudo) filesystem provides access to the
> audio tracks on an audio CD as well as all the
> sessions on a data cd as separate ISO files. ?These
> files can be mounted via the loopback device
> to gain acess to all of the files on any session.
>
> Signed-off-by: Clark Rawlins <clark.rawlins@escient.com>
> ---
> ?package/kernel-modules/cdfs/Config.in | ? ?7 +++++++
> ?package/kernel-modules/cdfs/cdfs.mk ? | ? 31 +++++++++++++++++++++++++++++++
> ?2 files changed, 38 insertions(+), 0 deletions(-)
> ?create mode 100644 package/kernel-modules/cdfs/Config.in
> ?create mode 100644 package/kernel-modules/cdfs/cdfs.mk
>
> diff --git a/package/kernel-modules/cdfs/Config.in b/package/kernel-modules/cdfs/Config.in
> new file mode 100644
> index 0000000..5321171
> --- /dev/null
> +++ b/package/kernel-modules/cdfs/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_CDFS
> + ? ? ? bool "cdfs"
> + ? ? ? depends on BR2_PACKAGE_LINUX
> + ? ? ? help
> + ? ? ? ? The CDFS filesystem for Linux.
> +
> + ? ? ? ? http://users.elis.ugent.be/~mronsse/cdfs/
> diff --git a/package/kernel-modules/cdfs/cdfs.mk b/package/kernel-modules/cdfs/cdfs.mk
> new file mode 100644
> index 0000000..5c01369
> --- /dev/null
> +++ b/package/kernel-modules/cdfs/cdfs.mk
> @@ -0,0 +1,31 @@
> +#############################################################
> +#
> +# cdfs
> +#
> +#############################################################
> +CDFS_VERSION=2.6.27

It might be good to have this change with BR2_KERNEL_CURRENT_VERSION.
Looking at the url I guess its not a 1 to 1 mapping and I'm not sure
how easy it would be implement in a makefile. Anyway just a
suggestion.

> +CDFS_SOURCE=cdfs-$(CDFS_VERSION).tar.bz2
> +CDFS_SITE=http://users.elis.ugent.be/~mronsse/cdfs/download
> +CDFS_LINUX_VERSION=$(strip $(subst ",,$(BR2_KERNEL_CURRENT_VERSION)))
> +CDFS_KDIR=/lib/modules/$(CDFS_LINUX_VERSION)/kernel/fs/cdfs
> +CDFS_BINARY=cdfs.ko
> +CDFS_TARGET_BINARY=$(CDFS_KDIR)/$(CDFS_BINARY)
> +CDFS_DEPENDENCIES=linux26
> +
> +define CDFS_BUILD_CMDS
> + ? ? ? $(MAKE) -C $(LINUX26_DIR) $(LINUX26_MAKE_FLAGS) SUBDIRS=$(@D) modules
> +endef
> +
> +define CDFS_INSTALL_TARGET_CMDS
> + ? ? ? install -d $(TARGET_DIR)/$(CDFS_KDIR)
> + ? ? ? install $(@D)/$(CDFS_BINARY) $(TARGET_DIR)/$(CDFS_KDIR)
> + ? ? ? $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -a -b $(TARGET_DIR) -v $(CDFS_LINUX_VERSION)
> +endef
> +
> +define CDFS_CLEAN_CMDS
> + ? ? ? -rmdir -rf $(TARGET_DIR)/$(CDFS_KDIR)
> + ? ? ? -rm -rf $(@D)/*.o
> + ? ? ? -rm -rf $(@D)/*.ko
> +endef
> +
> +$(eval $(call GENTARGETS,package,cdfs))
> --
> 1.6.3.3
>

Hmm. Just thinking out loud but this seems like a good candidate for a
KMODTARGETS built on top of the generic system. I guess the benefit of
having such a target depends on having more out of tree modules.
