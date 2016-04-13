From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 23:32:22 +0200
Subject: [Buildroot] [PATCH 01/15] fs: add genimage infra
In-Reply-To: <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <570EBAE6.1080000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/13/16 22:03, Ezequiel Garcia wrote:
> Currently, all the boards using genimage are using the same
> command incantation. Therefore, let's introduce a new filesystem
> infra to factorize them and allow easier genimage setup.
>
> This commit adds a new genimage infra, by calling genimage
> with a user-provided config file. The user is still responsible
> of enabling the apropriate rootfs filesystem images.

  And for enabling dosfstools/mtools (as observed by Thomas).

>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>   fs/Config.in            |  1 +
>   fs/genimage/Config.in   | 20 ++++++++++++++++++++
>   fs/genimage/genimage.mk | 21 +++++++++++++++++++++
>   3 files changed, 42 insertions(+)
>   create mode 100644 fs/genimage/Config.in
>   create mode 100644 fs/genimage/genimage.mk
>
> diff --git a/fs/Config.in b/fs/Config.in
> index 51ccf28169ef..94fe1446047f 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -5,6 +5,7 @@ source "fs/cloop/Config.in"
>   source "fs/cpio/Config.in"
>   source "fs/cramfs/Config.in"
>   source "fs/ext2/Config.in"
> +source "fs/genimage/Config.in"

  I think this shouldn't be done alphabetically, but really at the end.

>   source "fs/initramfs/Config.in"
>   source "fs/iso9660/Config.in"
>   source "fs/jffs2/Config.in"
> diff --git a/fs/genimage/Config.in b/fs/genimage/Config.in
> new file mode 100644
> index 000000000000..749494652464
> --- /dev/null
> +++ b/fs/genimage/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_TARGET_ROOTFS_GENIMAGE
> +	bool "full system image using genimage"
> +	help
> +	  Generate a full system image using the genimage tool
> +	  and a user-provided configuration file. The image generated
> +	  will contain a partition table and will be ready to be copied
> +	  onto storage media, such as MMC, NAND or NOR devices.
> +
> +	  Keep in mind that you probably require to enable a rootfs
> +	  filesystem image, according to the genimage config file that you
> +	  provide.

  And to select mtools/dosfstools. Thomas proposed to add an option for that. 
For me, either an explicit genimage option or just adding the help text for it 
is OK.

> +
> +if BR2_TARGET_ROOTFS_GENIMAGE
> +
> +config BR2_TARGET_ROOTFS_GENIMAGE_CFG
> +	string "genimage config file"
> +	help
> +	  Genimage user configuration file.
> +
> +endif # BR2_TARGET_ROOTFS_GENIMAGE
> diff --git a/fs/genimage/genimage.mk b/fs/genimage/genimage.mk
> new file mode 100644
> index 000000000000..17c146b6b519
> --- /dev/null
> +++ b/fs/genimage/genimage.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# Generate a system image using genimage
> +#
> +################################################################################
> +
> +ROOTFS_GENIMAGE_DEPENDENCIES = host-genimage
> +
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

  Variable name should be ROOTFS_GENIMAGE_TMP

> +
> +define ROOTFS_GENIMAGE_CMD
> +	$(RM) -rf ${GENIMAGE_TMP} &&		\

  && is not needed, treat it as two separate commands.
  -f is not needed, it is already in $(RM).
  All variables should use $(), not ${} (below as well).

> +	$(HOST_DIR)/usr/bin/genimage		\

  We don't generally align \ (annoying whitespace changes when you add a line).

> +		--rootpath ${TARGET_DIR}	\
> +		--tmppath ${GENIMAGE_TMP}	\
> +		--inputpath ${BINARIES_DIR}	\
> +		--outputpath ${BINARIES_DIR}	\
> +		--config ${BR2_TARGET_ROOTFS_GENIMAGE_CFG}
> +endef
> +
> +$(eval $(call ROOTFS_TARGET,genimage))

  I think that, like for initramfs, the infra has little to offer here. And it 
is in fact in the way, because (as observed by Thomas) you'll want to add

rootfs-genimage: $(TARGETS_ROOTFS)

which leads to a circular dependency.

  So to make sure that it happens in the right order, I think you need something 
like:

rootfs-genimage: $(TARGETS_ROOTFS) $(ROOTFS_GENIMAGE_DEPENDENCIES)
	$(RM) -r $(ROOTFS_GENIMAGE_TMP)
	$(HOST_DIR)/usr/bin/genimage \
		...

ifeq ($(BR2_TARGET_ROOTFS_GENIMAGE),y)

target-post-image: rootfs-genimage

# Make sure the genimage dependencies appear in graph-depends
show-targets:
	@echo $(ROOTFS_GENIMAGE_DEPENDENCIES)

ifeq ($(wildcard $(BR2_TARGET_ROOTFS_GENIMAGE_CFG),))
$(error $(BR2_TARGET_ROOTFS_GENIMAGE_CFG) does not exist)

endif




  However, I'm afraid that we're moving a bit too fast after all. There are 
several open issues still:

- Do post-image scripts come before or after genimage?
- What with the dosfstools/mtools dependency?
- Should we support genimage.cfg files that are generated from a post-image script?
- Should we support several genimage.cfg files, producing several images (e.g. a 
NAND and a SD image)?

  So, the current approach works well for the bundled defconfigs, but for real 
use cases I think it's a bit too limited to be practical after all.

  Therefore, at least as a first step, I guess it's better to just move the 
script to a common place, e.g. to package/genimage/post-image.sh. Let it take a 
single argument for the genimage.cfg file, and add some documentation to the manual.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
