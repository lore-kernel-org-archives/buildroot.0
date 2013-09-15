From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Sep 2013 20:00:14 +0200
Subject: [Buildroot] [PATCH] fs/ubi: add option to use custom volume
 config file
In-Reply-To: <1379215295-1805-1-git-send-email-danomimanchego123@gmail.com>
References: <1379215295-1805-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20130915200014.5543b2a1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sat, 14 Sep 2013 23:21:35 -0400, Danomi Manchego wrote:
> By default, the UBI FS target creates a ubinize configuration
> file on-the-fly, for a single volume.  Add an option to specify
> a custom config file.
> 
> E.g., one might want to deploy a system with a volume for the
> built ubifs image, a volume for a future upgrade image, and a
> volume for user data.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

I believe I'm ok with the general idea. Some comments below, though.

> +config BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
> +	bool "Use custom config file"
> +	help
> +	  Select to use a custom volume configuration file.  Otherwise,
> +	  a configuration file will be generated automatically.

I'd like to have a bit more documentation here, and especially
explicitly mention that we're talking about the configuration file
passed to the 'ubinize' tool. Also, I'm not sure the name 'volume
configuration file' is correct: the ubinize configuration file does not
describe the configuration of one volume, but rather the configuration
of all volumes that will be contained in an UBI "space".

Some maybe something:

	Select this option to use a custom ubinize configuration file,
	rather than the default configuration used by Buildroot (which
	consists in generating an UBI image that contains a single
	volume, itself containing the root filesystem). Passing a
	custom ubinize configuration file will allow you to create
	several volumes.

However, I'd like to add more detail on using the rootfs UBIFS image in
a volume (i.e $@fs in the existing code), but I'm not sure what
suggestion to give to the user: i.e, what image= line should he put in
his custom configuration file?

> +config BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE
> +	string "Configuration file path"
> +	depends on BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
> +	help
> +	  Path to the volume configuration file

Path to the ubinize configuration file.

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
> +else
> +UBI_UBINIZE_PREP_CFG = \
> +	cp fs/ubifs/ubinize.cfg . ; echo "image=$@fs" >> ./ubinize.cfg
> +endif
> +
>  define ROOTFS_UBI_CMD
> -	cp fs/ubifs/ubinize.cfg . ;\

Am I looking wrong, or are we copying ubinize.cfg to the root of the
Buildroot source tree? If that's the case, then it's really really
wrong, as the source tree should be read-only. Instead, we should copy
it to some location in $(O).

> -	echo "image=$@fs" \
> -		>> ./ubinize.cfg ;\
> +	$(UBI_UBINIZE_PREP_CFG) ; \
>  	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) ubinize.cfg ;\
>  	rm ubinize.cfg
>  endef

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
