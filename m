From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 23:05:14 +0100
Subject: [Buildroot] [PATCH 1/5] Makefile: add media image generation
In-Reply-To: <20150319000445.GD4578@free.fr>
References: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1426632719-4807-2-git-send-email-vivien.didelot@savoirfairelinux.com>
 <20150319000445.GD4578@free.fr>
Message-ID: <550B481A.4090708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/03/15 01:04, Yann E. MORIN wrote:
> As discussed on IRC, I wonder why you need to add a new target in the
> top-level Makefile, rather than re-use the filesystem infra. something
> like:
> 
> fs/Config.in
> 
>     # Existing filesystems, up to:
>     source "fs/yaffs2/Config.in"
>     commet "Aggregate filesystems"  # Or whatever prompt that has meaning
>     source "fs/genimage/Config.in"
> 
> 
> fs/genimage/Config.in
> 
>     config BR2_TARGET_ROOTFS_GENIMAGE
>         bool "genimage"
>         select BR2_PACKAGE_HOST_GENIMAGE
> 
>     config BR2_TARGET_ROOTFS_GENIMAGE_CFG
>         string "path to genimage config files"
>         depends on BR2_TARGET_ROOTFS_GENIMAGE
> 
> 
> fs/genimge/genimage.mk
> 
>     ROOTFS_GENIMAGE_DEPENDENCIES = host-genimage
>     ROOTFS_GENIMAGE_DEPENDENCIES += $(if $(BR2_TARGET_ROOTFS_EXT2),rootfs-ext2)
>     ROOTFS_GENIMAGE_DEPENDENCIES += $(if $(BR2_TARGET_ROOTFS_SQUASHFS),rootfs-squashfs)
>     # And so on...
> 
>     define ROOTFS_GENIMAGE_CMD
>         $(foreach cfg,$(call qstrip,$(BR2_TARGET_ROOTFS_GENIMAGE_CFG)),\
>             TMPDIR="$$(mktemp -d $(BUILD_DIR)/.genimage.XXXXXXXXXX)" || exit 1; \
>             $(INSTALL) -d -m 0755 $${TMPDIR}/{root,tmp} || exit 1; \
>             $(EXTRA_ENV) $(HOST_DIR)/usr/bin/genimage \
>                 --rootpath $(TARGET_DIR) \
>                 --tmppath $${RMPDIR}/tmp \
>                 --inputpath $(BIANRIES_DIR) \
>                 --outputpath $(BIANRIES_DIR) \
>                 --config $(cfg) || exit 1; \
>             rm -rf $${TMPDIR} || exit 1$(sep))
>     endef
> 
> 
> And then there's no need to add another top-level Makefile rule.

 But this approach looks more complicated, and if a new fs target is added the
genimage thing also has to be updated... So I'm more in favour of the original
proposal.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
