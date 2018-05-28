From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 May 2018 22:49:12 +0200
Subject: [Buildroot] [PATCH v3 3/5] uboot: zynqmp: allow to use custom
 psu_init files
In-Reply-To: <1525364617-23633-4-git-send-email-luca@lucaceresoli.net>
References: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
 <1525364617-23633-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <20180528224912.539b05f6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 May 2018 18:23:35 +0200, Luca Ceresoli wrote:

> +ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
> +
> +ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_DIR)),)

It'd be nice to have an intermediate UBOOT_ZYNQMP_PSU_INIT_DIR variable
instead of calculating its qstripped value twice.

> +define UBOOT_ZYNQMP_COPY_PSU_INIT
> +# In U-Boot's board/xilinx/zynqmp/Makefile the bundled psu_init_gpl.c
> +# has precedence over ours if placed in a subdir whose name matches
> +# CONFIG_DEFAULT_DEVICE_TREE. Delete them all to be sure we use ours.
> +	rm -f $(@D)/board/xilinx/zynqmp/*/psu_init*.[ch]
> +	cp $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_DIR))/psu_init_gpl.[ch] \
> +	   $(@D)/board/xilinx/zynqmp/

However, the bigger question is why do we need this in the first
place ? This is in fact just patching the U-Boot source code. Why not
use a patch instead ? Aren't people in general anyway going to have
their own custom U-Boot Git tree, in which they will version control
their psu_init files ?

Since this really looks like a specialized patching step, I'm not sure
it really makes sense to add this. Unless you can convince me
otherwise :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
