From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Jun 2014 18:20:09 +0200
Subject: [Buildroot] [PATCH 1/5] freescale-imx: bump to version
	3.10.17-1.0.0
In-Reply-To: <1403150639-29382-2-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403150639-29382-2-git-send-email-bisson.gary@gmail.com>
Message-ID: <20140619162009.GA3534@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2014-06-18 21:03 -0700, Gary Bisson spake thusly:
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Please, provide a detailed commit log.

This patch does more than 'just' bumping the version, since it:
  - bumps the version,
  - adds a new package (imx-vpu),
  - changes the build commands of imx-libs,
  - breaks libfslvpuwrap as it changed versionning scheme.

I have a few comments for each parts, see below.

I'm a bit sceptic as to whether we should introduce imx-vpu in this
patch, or introduce it with its own patch... Peter, what's your opinion?

> diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
> index 39ffa8a..843ba61 100644
> --- a/package/freescale-imx/freescale-imx.mk
> +++ b/package/freescale-imx/freescale-imx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FREESCALE_IMX_VERSION = 3.5.7-1.0.0
> +FREESCALE_IMX_VERSION = 3.10.17-1.0.0

This change breaks libfslvpuwrap, because it does not exist in this new
version.

I think it would be better to bump libfslvpywrap before this bump, or at
least:
 1- change libfslvpuwrap to use its own version string (3.5.7-1.0.0)
 2- bump the freescale packages (this patch) to 3.10.17-1.0.0
 3- bump libfslvpuwrap to its own version number.

It might even make sense to do patch 2+3 together...

>  FREESCALE_IMX_SITE    = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
>  
>  include $(sort $(wildcard package/freescale-imx/*/*.mk))
> diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
> index 4f605d7..253ed31 100644
> --- a/package/freescale-imx/imx-lib/imx-lib.mk
> +++ b/package/freescale-imx/imx-lib/imx-lib.mk
> @@ -6,18 +6,19 @@
>  
>  IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
>  IMX_LIB_SITE    = $(FREESCALE_IMX_SITE)
> -IMX_LIB_LICENSE = Freescale License (vpu), LGPLv2.1+ (the rest)
> +IMX_LIB_LICENSE = LGPLv2.1+
>  IMX_LIB_LICENSE_FILES = EULA
> -IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).bin
> +IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).tar.gz

Yeah! They switched! :-)

>  IMX_LIB_INSTALL_STAGING = YES
>  
>  # imx-lib needs access to imx-specific kernel headers
>  IMX_LIB_DEPENDENCIES += linux
>  IMX_LIB_INCLUDE = \
> +	-I$(LINUX_DIR)/include/uapi \
> +	-I$(LINUX_DIR)/include \
>  	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
> -	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
> -	-idirafter $(LINUX_DIR)/include
> +	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include

This change is dubious. We really do want the include dirs from the
kernel to only come _after_ the standard search dirs, hence the existing
-idirafter directive.

Searching in the kernel dir is ugly, because those are non-sanitised
headers, and we do favour headers from the toolchain (which are
userland-clean) over those from the kernel tree.

Also, I think only using the uapi include dir should be enough.

> diff --git a/package/freescale-imx/imx-vpu/Config.in b/package/freescale-imx/imx-vpu/Config.in
> new file mode 100644
> index 0000000..e3e5823
> --- /dev/null
> +++ b/package/freescale-imx/imx-vpu/Config.in
> @@ -0,0 +1,53 @@
> +comment "imx-vpu needs an imx-specific Linux kernel to be built"
> +	depends on BR2_arm && !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_IMX_VPU
> +	bool "imx-vpu"
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_arm # Only relevant for i.MX
> +	help
> +	  Library of userspace helpers specific for the Freescale i.MX
> +	  platform. It wraps the kernel interfaces for the i.MX platform
> +	  Video Processing Unit (VPU) driver. It requires a kernel that
> +	  includes the i.MX specific headers to be built.
> +
> +	  This library is provided by Freescale as-is and doesn't have
> +	  an upstream.
> +
> +if BR2_PACKAGE_IMX_VPU
> +choice
> +	prompt "i.MX platform"
> +
> +config BR2_PACKAGE_IMX_VPU_PLATFORM_IMX25_3STACK
> +	bool "imx25-3stack"
> +
> +config BR2_PACKAGE_IMX_VPU_PLATFORM_IMX27ADS
> +	bool "imx27ads"
> +
> +config BR2_PACKAGE_IMX_VPU_PLATFORM_IMX37_3STACK
> +	bool "imx37-3stack"
> +
> +config BR2_PACKAGE_IMX_VPU_PLATFORM_IMX50
> +	bool "imx50"
> +
> +config BR2_PACKAGE_IMX_VPU_PLATFORM_IMX51
> +	bool "imx51"
> +
> +config BR2_PACKAGE_IMX_VPU_PLATFORM_IMX53
> +	bool "imx53"
> +
> +config BR2_PACKAGE_IMX_VPU_PLATFORM_IMX6Q
> +	bool "imx6q"
> +
> +endchoice

We already have this choice in the imx-lib package:
  - if it no longer relevant to imx-lib, just remove it from imx-lib
    and keep it in imx-vpu
  - if it is still valide for imx-lib, then we should make it a common
    choice, valid for both imx-lib and imx-vpu.

In the latter case, you'd have to move it into:
    package/freescale-imx/Config.in

Rename options so they are no longer imx-lib specific, and use those
new options both in imx-lib and imx-vpu. The new names could be somethng
like (for example, with i.MX6Q):
    BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q

Also applies to the following block, of course:

> +config BR2_PACKAGE_IMX_VPU_PLATFORM
> +	string
> +	default "IMX25_3STACK" if BR2_PACKAGE_IMX_VPU_PLATFORM_IMX25_3STACK
> +	default "IMX27ADS" if BR2_PACKAGE_IMX_VPU_PLATFORM_IMX27ADS
> +	default "IMX37_3STACK" if BR2_PACKAGE_IMX_VPU_PLATFORM_IMX37_3STACK
> +	default "IMX50" if BR2_PACKAGE_IMX_VPU_PLATFORM_IMX50
> +	default "IMX51" if BR2_PACKAGE_IMX_VPU_PLATFORM_IMX51
> +	default "IMX53" if BR2_PACKAGE_IMX_VPU_PLATFORM_IMX53
> +	default "IMX6Q" if BR2_PACKAGE_IMX_VPU_PLATFORM_IMX6Q
> +endif
> diff --git a/package/freescale-imx/imx-vpu/imx-vpu-0001-fix-IOSystemInit-failure.patch b/package/freescale-imx/imx-vpu/imx-vpu-0001-fix-IOSystemInit-failure.patch
> new file mode 100644
> index 0000000..b73a959
> --- /dev/null
> +++ b/package/freescale-imx/imx-vpu/imx-vpu-0001-fix-IOSystemInit-failure.patch
> @@ -0,0 +1,21 @@
> +[PATCH] fix IOSystemInit failure

Please provide a more detailed comit log. Why do we need this?

> +Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> +---
> + vpu/vpu_io.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/vpu/vpu_io.c b/vpu/vpu_io.c
> +index 8cbb571..14759da 100644
> +--- a/vpu/vpu_io.c
> ++++ b/vpu/vpu_io.c
> +@@ -265,7 +265,7 @@ int IOSystemInit(void *callback)
> + 		goto err;
> + 	}
> + 
> +-	if (IOGetVirtMem(&bit_work_addr) <= 0)
> ++	if (IOGetVirtMem(&bit_work_addr) == -1)
> + 		goto err;
> + #endif
> + 	UnlockVpu(vpu_semap);
> +
> diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
> new file mode 100644
> index 0000000..fb72203
> --- /dev/null
> +++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
> @@ -0,0 +1,57 @@
> +################################################################################
> +#
> +# imx-vpu
> +#
> +################################################################################
> +
> +IMX_VPU_VERSION = $(FREESCALE_IMX_VERSION)
> +IMX_VPU_SITE    = $(FREESCALE_IMX_SITE)
> +IMX_VPU_LICENSE = Freescale License
> +IMX_VPU_LICENSE_FILES = EULA
> +IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
> +
> +IMX_VPU_INSTALL_STAGING = YES
> +
> +# imx-vpu needs access to imx-specific kernel headers
> +IMX_VPU_DEPENDENCIES += linux
> +IMX_VPU_INCLUDE = \
> +	-I$(LINUX_DIR)/include/uapi \
> +	-I$(LINUX_DIR)/include

Again, I believe this should be -idirafter instead of -I .

> +IMX_VPU_MAKE_ENV = \
> +	$(TARGET_MAKE_ENV) \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
> +	PLATFORM=$(BR2_PACKAGE_IMX_VPU_PLATFORM) \
> +	INCLUDE="$(IMX_VPU_INCLUDE)"
> +
> +# The archive is a shell-self-extractor of a bzipped tar. It happens
> +# to extract in the correct directory (imx-vpu-x.y.z)
> +# The --force makes sure it doesn't fail if the source dir already exists.
> +# The --auto-accept skips the license check - not needed for us
> +# because we have legal-info
> +# Since there's a EULA in the bin file, extract it to imx-vpu-x.y.z/EULA
> +#
> +define IMX_VPU_EXTRACT_CMDS
> +	awk 'BEGIN      { start=0; } \
> +	     /^EOEULA/  { start = 0; } \
> +	                { if (start) print; } \
> +	     /<<EOEULA/ { start=1; }'\
> +	    $(DL_DIR)/$(IMX_VPU_SOURCE) > $(@D)/EULA
> +	cd $(BUILD_DIR); \
> +	sh $(DL_DIR)/$(IMX_VPU_SOURCE) --force --auto-accept
> +endef
> +
> +define IMX_VPU_BUILD_CMDS
> +	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D)
> +endef
> +
> +define IMX_VPU_INSTALL_STAGING_CMDS
> +	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(STAGING_DIR) install
> +endef
> +
> +define IMX_VPU_INSTALL_TARGET_CMDS
> +	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(TARGET_DIR) install
> +endef
> +
> +$(eval $(generic-package))

Otherwise, looks good.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
