From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 Sep 2013 07:38:11 +0300
Subject: [Buildroot] [PATCH] fs/ubi: add option to use custom volume
 config file
In-Reply-To: <1379215295-1805-1-git-send-email-danomimanchego123@gmail.com>
References: <1379215295-1805-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20130915043811.GA11865@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi,

On Sat, Sep 14, 2013 at 11:21:35PM -0400, Danomi Manchego wrote:
> By default, the UBI FS target creates a ubinize configuration
> file on-the-fly, for a single volume.  Add an option to specify
> a custom config file.
> 
> E.g., one might want to deploy a system with a volume for the
> built ubifs image, a volume for a future upgrade image, and a
> volume for user data.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  fs/ubifs/Config.in |   12 ++++++++++++
>  fs/ubifs/ubi.mk    |   12 +++++++++---
>  2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
> index 70ea81e..32ca730 100644
> --- a/fs/ubifs/Config.in
> +++ b/fs/ubifs/Config.in
> @@ -119,6 +119,18 @@ config BR2_TARGET_ROOTFS_UBI_SUBSIZE
>  	  The value provided here is passed to the -s/--sub-page-size
>  	  option of ubinize.
>  
> +config BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
> +	bool "Use custom config file"
> +	help
> +	  Select to use a custom volume configuration file.  Otherwise,
> +	  a configuration file will be generated automatically.
> +
> +config BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE
> +	string "Configuration file path"
> +	depends on BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
> +	help
> +	  Path to the volume configuration file
> +
>  config BR2_TARGET_ROOTFS_UBI_OPTS
>  	string "Additional ubinize options"
>  	help
> diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
> index 08c952c..1304bd5 100644
> --- a/fs/ubifs/ubi.mk
> +++ b/fs/ubifs/ubi.mk
> @@ -14,10 +14,16 @@ UBI_UBINIZE_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_OPTS))
>  
>  ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
>  
> +ifeq ($(BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG),y)
> +UBI_UBINIZE_PREP_CFG = \
> +	cp $(BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE) ./ubinize.cfg

You should check whether BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE is an empty 
string.

> +else
> +UBI_UBINIZE_PREP_CFG = \
> +	cp fs/ubifs/ubinize.cfg . ; echo "image=$@fs" >> ./ubinize.cfg
> +endif
> +
>  define ROOTFS_UBI_CMD
> -	cp fs/ubifs/ubinize.cfg . ;\
> -	echo "image=$@fs" \
> -		>> ./ubinize.cfg ;\
> +	$(UBI_UBINIZE_PREP_CFG) ; \
>  	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) ubinize.cfg ;\
>  	rm ubinize.cfg
>  endef
> -- 
> 1.7.9.5

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
