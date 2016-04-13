From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:24:54 +0200
Subject: [Buildroot] [PATCH 01/15] fs: add genimage infra
In-Reply-To: <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20160413222454.0730add8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Apr 2016 17:03:26 -0300, Ezequiel Garcia wrote:

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
> +
> +define ROOTFS_GENIMAGE_CMD
> +	$(RM) -rf ${GENIMAGE_TMP} &&		\
> +	$(HOST_DIR)/usr/bin/genimage		\
> +		--rootpath ${TARGET_DIR}	\
> +		--tmppath ${GENIMAGE_TMP}	\
> +		--inputpath ${BINARIES_DIR}	\
> +		--outputpath ${BINARIES_DIR}	\
> +		--config ${BR2_TARGET_ROOTFS_GENIMAGE_CFG}
> +endef
> +
> +$(eval $(call ROOTFS_TARGET,genimage))

A genimage.cfg file typically references some filesystem images like
ext2/3/4 images. But I don't see anything in your implementation that
ensures that the filesystem images that are used by the genimage.cfg
file are produced *before* the genimage image is created. Am I missing
something ?

Also, I think the infra should probably handle the dosfstools/mtools
dependency that we need for many platforms to build a small FAT
filesystem. So maybe a sub-option like
BR2_TARGET_ROOTFS_GENIMAGE_BUILDS_FATFS or something like that, that
would just select the appropriate packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
