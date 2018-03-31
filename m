From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 21:04:23 +0200
Subject: [Buildroot] [PATCH 13/15 v4] fs: run packages' filesystem hooks
 in a copy of target/
In-Reply-To: <193b195e0bb305f01ccedd565a517635a975b154.1522487149.git.yann.morin.1998@free.fr>
References: <cover.1522487149.git.yann.morin.1998@free.fr>
 <193b195e0bb305f01ccedd565a517635a975b154.1522487149.git.yann.morin.1998@free.fr>
Message-ID: <cbd0a228-12b8-9a72-f4bc-311f4c95d001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-03-18 11:05, Yann E. MORIN wrote:
> Currently, some packages may regigter hooks to be run just before and
> judt after the generic tarball image is generated, because they need to
> prepare the filesystem for read-only or read-write operation.
> 
> However, this means that, if any of the hooks or the image generation
> fails, the target directory is left in a dangling, inconsistent state.
> 
> We fix that by doing a copy of target/, run the hooks on that copy,
> generate the generic tarball image out of that, and get rid of the copy.
> 
> This way, we can guarantee consistency of the target directory, and we
> can even ditch support for post-fs hooks (those that restore target/).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  fs/common.mk                                    |  7 +++++--
>  support/testing/tests/core/test_post_scripts.py | 23 +++++++++++++----------
>  2 files changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index f3d42519f6..8bb26f1146 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -58,17 +58,20 @@ endef
>  .PHONY: rootfs-common
>  rootfs-common: $(ROOTFS_COMMON_TAR)
>  
> +# Emulate being in a filesystem, so that we can have our own TARGET_DIR.
> +ROOTFS_COMMON_TARGET_DIR = $(FS_DIR)/target
> +
>  ROOTFS_COMMON_DEPENDENCIES = \
>  	host-fakeroot host-makedevs \
>  	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
>  
> -# When doing the common tarball, we're not really doing a rootfs.
> -$(ROOTFS_COMMON_TAR): ROOTFS=
> +$(ROOTFS_COMMON_TAR): ROOTFS=COMMON
>  $(ROOTFS_COMMON_TAR): FAKEROOT_SCRIPT=$(FS_DIR)/fakeroot.fs
>  $(ROOTFS_COMMON_TAR): $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
>  	@$(call MESSAGE,"Generating common rootfs tarball")
>  	rm -rf $(FS_DIR)
>  	mkdir -p $(FS_DIR)
> +	rsync -au $(BASE_TARGET_DIR)/ $(TARGET_DIR)

 This would benefit a lot from using the --link-dest= that we will also use in
PPS, in my opinion.

 Regards,
 Arnout

>  	echo '#!/bin/sh' > $(FAKEROOT_SCRIPT)
>  	echo "set -e" >> $(FAKEROOT_SCRIPT)
>  	echo "chown -h -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
