From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Dec 2018 22:05:19 +0100
Subject: [Buildroot] [PATCH v4 3/3] fs/common.mk: make sure that static
 devices from packages are created
In-Reply-To: <20181203210508.27831-4-thomas.petazzoni@bootlin.com>
References: <20181203210508.27831-1-thomas.petazzoni@bootlin.com>
 <20181203210508.27831-4-thomas.petazzoni@bootlin.com>
Message-ID: <606d6e8b-873c-2bb1-e3fb-861df79d819c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/12/2018 22:05, Thomas Petazzoni wrote:
> The static devices defined by packages are currently added to the full
> device table when two conditions are met:
> 
>  (1) ROOTFS_DEVICE_TABLES is non-empty
>  (2) BR2_ROOTFS_DEVICE_CREATION_STATIC=y
> 
> (2) is obviously correct. However, depending on (1) is not correct: if
> the user doesn't provide any custom permission table and custom device
> table, then ROOTFS_DEVICE_TABLES will be empty.
> 
> So instead, move the addition of the package-defined static devices
> outside of condition (1), and have it only under condition (2).

 It's been like this since 2012, so probably this doesn't matter to anyone (most
likely because for static device creation, you *must* have a static devices
table so the ROOTFS_DEVICE_TABLES condition will be true).

 Still, it's cleaner this way, that's why I applied.

 However...

> 
> Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 077ce8903e..a560417c6c 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -61,10 +61,10 @@ endif
>  	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) > $(ROOTFS_FULL_DEVICES_TABLE)
>  ifneq ($(ROOTFS_DEVICE_TABLES),)
>  	cat $(ROOTFS_DEVICE_TABLES) >> $(ROOTFS_FULL_DEVICES_TABLE)
> +endif
>  ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
>  	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(ROOTFS_FULL_DEVICES_TABLE)
>  endif

 This is still conflicting with the purpose of patch 2/3: the package device
tables are still overriding the user-specified global device table.

 Regards,
 Arnout


> -endif
>  
>  rootfs-common-show-depends:
>  	@echo $(ROOTFS_COMMON_DEPENDENCIES)
> 
