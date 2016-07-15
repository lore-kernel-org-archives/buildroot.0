From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Jul 2016 18:12:17 +0200
Subject: [Buildroot] [PATCH v6 1/2] ts4800-mbrboot: new package
In-Reply-To: <1468594860-14932-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1468594860-14932-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1468594860-14932-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <20160715161217.GG3692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick, All,

On 2016-07-15 11:00 -0400, Patrick Keroulas spake thusly:
> This MBR routine is based on TS' original bootloader.  It is loaded by
> the bootrom stored in the companion FPGA, and chainloads an executable
> located at the beginning of the first non-fs (0xda) partition.
> 
> Signed-off-by: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> ---
[--SNIP--]
> diff --git a/package/ts4800-mbrboot/Config.in b/package/ts4800-mbrboot/Config.in
> new file mode 100644
> index 0000000..556b0ec
> --- /dev/null
> +++ b/package/ts4800-mbrboot/Config.in

The firmware stuff is more for firmware blobs that need to be loaded
into a device (e.g. a WiFi dongle, and ehternet card, a GPU...);

ts4800-mbrboot is really a bootloader, so it should probably go to boot/
rather than package/ and be added in the bootloader menu.

> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_TS4800_MBRBOOT
> +	bool "ts4800-mbrboot"
> +	depends on BR2_ARM_CPU_ARMV7A
> +	help
> +	  This package generate the ts4800 bootloader.

Please add a homepage (or if none, the github repo).

> diff --git a/package/ts4800-mbrboot/ts4800-mbrboot.mk b/package/ts4800-mbrboot/ts4800-mbrboot.mk
> new file mode 100644
> index 0000000..825a66b
> --- /dev/null
> +++ b/package/ts4800-mbrboot/ts4800-mbrboot.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# ts4800-mbrboot
> +#
> +################################################################################
> +
> +TS4800_MBRBOOT_VERSION = master

Don;t use 'master' as it is a moving target: today, it points to a
specific chageset, but tomorrow it may well point to another, thus
rendering the build non-reproducible.

Please use a tag or the sha1 of a commit, like:

    TS4800_MBRBOOT_VERSION = cf8f7072ed5a4a4e48fcb9841b2e31e519ec5dca

Otherwise looks sane.

Regards,
Yann E. MORIN.

> +TS4800_MBRBOOT_SITE = $(call github,embeddedarm,ts4800-mbrboot,$(TS4800_MBRBOOT_VERSION))
> +TS4800_MBRBOOT_LICENSE = BSD-2c
> +TS4800_MBRBOOT_LICENSE_FILES = LICENSE
> +
> +define TS4800_MBRBOOT_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef
> +
> +define TS4800_MBRBOOT_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/mbrboot.bin $(BINARIES_DIR)/mbrboot.bin
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
