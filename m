From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 18:56:58 +0200
Subject: [Buildroot] [PATCH v2] package/coreutils: allow building
 individual binaries
In-Reply-To: <20190410201746.14678-1-mmayer@broadcom.com>
References: <20190410201746.14678-1-mmayer@broadcom.com>
Message-ID: <20190411185658.57ea2a38@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

On Wed, 10 Apr 2019 13:17:46 -0700
Markus Mayer <mmayer@broadcom.com> wrote:

> We add configuration option BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
> so that coreutils can be built and installed as individual binaries.
> It can be used if the target file system doesn't support symlinks or
> symlinks are undesirable.
> 
> The approach is modelled after Busybox's similarly named configuration
> option.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

I tested this, with BR2_ROOTFS_MERGED_USR and got some broken symlinks
in /bin. I believe your patch is not sufficient. Indeed, it doesn't
take care of the following parts of coreutils.mk:

ifeq ($(BR2_ROOTFS_MERGED_USR),)
define COREUTILS_CLEANUP_BIN
        # some things go in /bin rather than /usr/bin
        $(foreach f,$(COREUTILS_BIN_PROGS), \
                rm -f $(TARGET_DIR)/usr/bin/$(f) && \
                ln -sf ../usr/bin/coreutils $(TARGET_DIR)/bin/$(f)
        )
endef
COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP_BIN
endif

This probably needs to be changed to move applets from /usr/bin to /bin
rather than changing the symlinks.

define COREUTILS_CLEANUP
        # link for archaic shells
        ln -fs coreutils $(TARGET_DIR)/usr/bin/[
        # gnu thinks chroot is in bin, debian thinks it's in sbin
        rm -f $(TARGET_DIR)/usr/bin/chroot
        ln -sf ../bin/coreutils $(TARGET_DIR)/usr/sbin/chroot
endef

The symlink logic here also needs to be adjusted I guess.

Could you fix this and retest ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
