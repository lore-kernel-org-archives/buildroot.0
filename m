From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Mar 2020 17:43:02 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: fix symlink support
In-Reply-To: <20200303133356.859800-1-antoine.tenart@bootlin.com>
References: <20200303133356.859800-1-antoine.tenart@bootlin.com>
Message-ID: <20200303164302.GB12449@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine, All,

On 2020-03-03 14:33 +0100, Antoine Tenart spake thusly:
> Since Linux-firmware's commit 9cfefbd7fbda ("Remove duplicate symlinks")
> symlinks aren't distributed anymore. They are rather created at
> installation time by a script provided in the project, copy-firmware.sh.
> The description of the symlinks is done in the WHENCE file. Since the
> bump to version 20200122, in commit 48cc1a89ae04, installation for many
> firmwares was broken as Buildroot tried to install missing symlinks from
> Linux-firmware.
> 
> The fix is not only to remove now missing symlinks, but to add logic to
> create those symlinks as kernel modules will depend on them. The
> solution taken by this patch is to create dynamically symlinks based on
> their description in the WHENCE file *and* only if the file they'll
> point to was installed in the target directory.

Thanks for this patch, which basically does what I called for in a
previous review:
    http://lists.busybox.net/pipermail/buildroot/2020-March/275504.html

However, to avoid replicating my previous mistakes, I did a bit more
in-depth analysis of this symlink issue, and it is a bit more involved
than just this patch.

The problem is that we have bunch of LINUX_FIRMWARE_FILES that are
globs, for example:

    37 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO),y)
    38 LINUX_FIRMWARE_FILES += qcom/a*
    39 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom qcom/NOTICE.txt
    40 endif

So, because we have a glob here, the following symlinks will not be
created:

    Link: a300_pfp.fw -> qcom/a300_pfp.fw
    Link: a300_pm4.fw -> qcom/a300_pm4.fw

So, we need to get rid of the globs and only ever use full names.

See another comment below...

> Fixes: 48cc1a89ae04 ("package/linux-firmware: bump to version 20200122")
> Cc: james.hilliard1 at gmail.com
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
> ---
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index f8e95d0648c9..125df74ef68d 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
[--SNIP--]
> @@ -626,4 +614,21 @@ define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
>  	$(LINUX_FIRMWARE_INSTALL_DIRS)
>  endef
>  
> +# Some firmware are distributed as a symlink, for drivers to load them using a
> +# defined name other than the real one. Since 9cfefbd7fbda ("Remove duplicate
> +# symlinks") those symlink aren't distributed in linux-firmware but are created
> +# automatically by its copy-firmware.sh script during the installation, which
> +# parses the WHENCE file where symlinks are described. We follow the same logic
> +# here, adding symlink only for firmwares installed in the target directory.
> +# The grep/sed parsing is taken from the script mentioned before.
> +define LINUX_FIRMWARE_CREATE_SYMLINKS
> +	grep -E '^Link:' $(@D)/WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do \

You can combine the grep and sed into a single sed call:

    sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE

> +		if test -f $(TARGET_DIR)/lib/firmware/$$d; then \
> +			ln -sf $$d $(TARGET_DIR)/lib/firmware/$$f ; \
> +		fi ; \
> +	done
> +endef
> +
> +LINUX_FIRMWARE_POST_INSTALL_TARGET_HOOKS += LINUX_FIRMWARE_CREATE_SYMLINKS

Use of a hook is not really useful here: we are using the generic infra,
so we can write whatever we want in the _INSTALL_TARGET_CMDS anyway, so
just define the macro before _INSTALL_TARGET_CMDS and call it from
there, like the other parts (notice the rename of the macro to match):

    621  define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
    622          mkdir -p $(TARGET_DIR)/lib/firmware
    623          $(LINUX_FIRMWARE_INSTALL_FILES)
    624          $(LINUX_FIRMWARE_INSTALL_DIRS)
    625          $(LINUX_FIRMWARE_INSTALL_SYMLINKS)
    626  endef

Regards,
Yann E. MORIN.

>  $(eval $(generic-package))
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
