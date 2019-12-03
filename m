From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Dec 2019 09:53:04 +0100
Subject: [Buildroot] [PATCH] boot/boot-wrapper-aarch64: bump version and
 add gicv3 support
In-Reply-To: <20191203084957.20157-1-jank@cadence.com>
References: <20191203084957.20157-1-jank@cadence.com>
Message-ID: <20191203095304.5798b260@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan,

On Tue, 3 Dec 2019 03:49:57 -0500
Jan Kotas <jank@cadence.com> wrote:

> This patch bumps the boot wrapper for aarch64 to the latest version.
> It also adds an option to use GICv3 (such as GIC-500).
> Handling of the DTB has been also improved.
> 
> Signed-off-by: Jan Kotas <jank@cadence.com>

Thanks a lot for your contribution! However, it should be three
separate patches:

 - One bumping the version

 - One tweaking the DTB handling

 - One adding the GICv3 option


> -BOOT_WRAPPER_AARCH64_VERSION = 4266507a84f8c06452109d38e0350d4759740694
> +BOOT_WRAPPER_AARCH64_VERSION = fd74c8cbd0e17483d2299208cad9742bee605ca7
>  BOOT_WRAPPER_AARCH64_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
>  BOOT_WRAPPER_AARCH64_LICENSE = BSD-3-Clause
>  BOOT_WRAPPER_AARCH64_LICENSE_FILES = LICENSE.txt
> @@ -15,19 +15,11 @@ BOOT_WRAPPER_AARCH64_INSTALL_IMAGES = YES
>  # Makefile.
>  BOOT_WRAPPER_AARCH64_AUTORECONF = YES
>  
> -BOOT_WRAPPER_AARCH64_DTB = /arch/arm64/boot/dts/$(basename $(call qstrip,$(BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS))).dtb
> -
> -# Fixup the path to the DTB in configure.ac. In the future, this
> -# should hopefully be made more configurable by the
> -# boot-wrapper-aarch64 developers.
> -define BOOT_WRAPPER_AARCH64_FIX_DTB_NAME
> -	$(SED) 's%^KERN_DTB=.*%KERN_DTB=$(BOOT_WRAPPER_AARCH64_DTB)%' $(@D)/configure.ac
> -endef
> -
> -BOOT_WRAPPER_AARCH64_PRE_PATCH_HOOKS += BOOT_WRAPPER_AARCH64_FIX_DTB_NAME
> +BOOT_WRAPPER_AARCH64_DTB = $(LINUX_DIR)/arch/arm64/boot/dts/$(basename $(call qstrip,$(BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS))).dtb
>  
>  BOOT_WRAPPER_AARCH64_CONF_OPTS = \
>  	--with-kernel-dir=$(LINUX_DIR) \
> +	--with-dtb=$(BOOT_WRAPPER_AARCH64_DTB) \

This indeed looks nicer than the patch hook we had.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
