From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jul 2016 13:11:23 +0200
Subject: [Buildroot] [PATCH 09/12] reproducibility/fs/cpio: generate
 archive with host-cpio
In-Reply-To: <1465918277-30675-9-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465918277-30675-9-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <7b3660bc-84f1-f522-2a8a-1e45bb6221d8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14-06-16 17:31, Gilles Chanteperdrix wrote:
> Using the --reproducible option to generate a reproducible archive.
> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> ---
>  fs/cpio/cpio.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
> index e82167e..4da6648 100644
> --- a/fs/cpio/cpio.mk
> +++ b/fs/cpio/cpio.mk
> @@ -27,9 +27,17 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
>  
>  ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
>  
> +ifneq ($(BR2_REPRODUCIBLE),y)
>  define ROOTFS_CPIO_CMD
>  	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
>  endef
> +else
> +ROOTFS_CPIO_DEPENDENCIES += host-cpio

 Instead of unconditionally building host-cpio, it would be better to check if
the installed cpio supports --reproducible. Cfr. what we do for tar, in
support/dependencies/check-host-tar.{sh,mk}.


 Regards,
 Arnout

> +
> +define ROOTFS_CPIO_CMD
> +	cd $(TARGET_DIR) && find . | $(CPIO_REPRODUCIBLE) --quiet -o -H newc > $@
> +endef
> +endif
>  
>  $(BINARIES_DIR)/rootfs.cpio.uboot: $(BINARIES_DIR)/rootfs.cpio host-uboot-tools
>  	$(MKIMAGE) -A $(MKIMAGE_ARCH) -T ramdisk \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
