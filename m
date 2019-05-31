From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 16:34:57 +0200
Subject: [Buildroot] [PATCH v3] package/dosfstools: introduce custom
 install routine
In-Reply-To: <20190530234226.28013-1-mmayer@broadcom.com>
References: <20190530234226.28013-1-mmayer@broadcom.com>
Message-ID: <20190531163457.7b5a978c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch.

On Thu, 30 May 2019 16:42:26 -0700
Markus Mayer <mmayer@broadcom.com> wrote:

> -ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),)
> -define DOSFSTOOLS_REMOVE_FATLABEL
> -	rm -f $(addprefix $(TARGET_DIR)/sbin/,dosfslabel fatlabel)
> +ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),y)
> +define DOSFSTOOLS_INSTALL_FATLABEL
> +	install -c -p $(DOSFSTOOLS_BUILDDIR)src/fatlabel $(TARGET_DIR)/sbin

Please use:

	$(INSTALL) -D -m 0755 $(@D)/src/fatlabel $(TARGET_DIR)/sbin/fatlabel

since that's what we use everywhere for insatllation.

> +# Actual installation happens via the post install hooks. Define a no-op install
> +# command, so we don't end up calling "make install."
> +define DOSFSTOOLS_INSTALL_TARGET_CMDS
> +	@/bin/true

Nope, that's not how we want to do it. Instead, we want this:

define DOSFSTOOLS_INSTALL_TARGET_CMDS
	$(DOSFSTOOLS_INSTALL_FATLABEL)
	$(DOSFSTOOLS_INSTALL_FSCK_FAT)
	$(DOSFSTOOLS_INSTALL_MKFS_FAT)
endef

and of course, not register the DOSFSTOOLS_INSTALL_* defines as
post-install target hooks.

I'm also wondering if we could factorize the logic a bit, but I'm not
sure it's worth the effort. It would give something like this:

DOSFSTOOLS_INSTALL_FILES_$(BR2_PACKAGE_DOSFSTOOLS_FATLABEL) += fatlabel
DOSFSTOOLS_INSTALL_SYMLINKS_$(BR2_PACKAGE_DOSFSTOOLS_FATLABEL) += dosfslabel:fatlabel

DOSFSTOOLS_INSTALL_FILES_$(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT) += fsck.fat
DOSFSTOOLS_INSTALL_SYMLINKS_$(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT) += fsck.vfat:fsck.fat fsck.mkdos:fsck.fat dosfsck:fsck.fat

DOSFSTOOLS_INSTALL_FILES_$(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT) += mkfs.fat
DOSFSTOOLS_INSTALL_SYMLINKS_$(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT) += mkdosfs:mkfs.fat mkfs.msdos:mkfs.fat mkfs.vfat:mkfs.fat

define DOSFSTOOLS_INSTALL_TARGET_CMDS
	$(foreach f,$(DOSFSTOOLS_INSTALL_FILES_y), \
		$(INSTALL) -D -m 0744 $(@D)/src/$(f) $(TARGET_DIR)/sbin/$(f)
	)

	$(foreach l,$(DOSFSTOOLS_INSTALL_SYMLINKS_y), \
		ln -s $(word 2,$(subst :, ,$(l))) $(TARGET_DIR)/sbin/$(word 1,$(subst :, ,$(l)))
	)
endef

But admittedly, it becomes a bit hackish, and we don't do that anywhere
in Buildroot today. So probably sticking to three
DOSFSTOOLS_INSTALL_<foo> defines is better for now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
