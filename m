From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Jun 2014 18:58:40 +0200
Subject: [Buildroot] [PATCH 1/2] at91bootstrap3: bump to v3.6.2
In-Reply-To: <1402839229-13076-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1402839229-13076-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140615165840.GC3568@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-15 15:33 +0200, Thomas Petazzoni spake thusly:
> In preparation to add support for the SAMA5D3 Xplained board, this
> commit bumps the version of the at91bootstrap3 bootloader to
> v3.6.2.
[--SNIP--]
> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> index 4f74b1d..07df75d 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.mk
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
[--SNIP--]
> @@ -47,7 +45,7 @@ define AT91BOOTSTRAP3_BUILD_CMDS
>  endef
>  
>  define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
> -	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPT) -C $(@D) bootstrap
> +	cp $(@D)/binaries/*.bin $(BINARIES_DIR)

Some of the bootloaders install their files in a sub-directory of
$(BINARIES_DIR) (for example rpi-userland, syslinux...), while others
(such as this one) install their files directly in $(BINARIES_DIR), and
still others install their files in $(TARGET_DIR)/boot (eg. grub.)

Sometime ago, I proposed a patch to install the rpi-userland files in
$(TARGET_DIR)/boot, but that was refused, on the principle that the boot
partition should not necesarily be exposed/mounted on the running
system. That's however what grub1 does.

Also, there is a new convention being ironed out, about how the boot
files should be layed out. It's The Boot Loader Specification, defined
at FDO: http://www.freedesktop.org/wiki/Specifications/BootLoaderSpec/

This specification is mostly geared toward "classical PC" (desktop and
servers, and clearly embedded systems are a bit left-out. However, for
the parts of the specification that make sense, I think we should follow.

At one point, it states:

    ---8<---
    This placeholder file system shall be determined during installation
    time, and an fstab entry for it shall be created mounting it to /boot.
    ---8<---

So, here are a few questions, probably in the order we should decide:

  - should we instate a policy on where bootloaders install their files?

If 'no', then we can just stop here. If 'yes', then here are a few more
questions:

  - should we follow The Boot Loader Specification when it makes sense,
    ie. boot files that are installed on a filesystem should be
    installed in $(TARGET_DIR)/boot ?

  - if installing files in $(BINARIES_DIR), should we instate a policy
    to install them in a sub-dir? What shall that sub-dir be named?
    Currently, when followed, the behaviour is to install in a sub-dir
    named after the bootloader (eg. $(BINARIES_DIR)/rpi-userland).
    Should we stick to that, or just name that directory
    $(BINARIES_DIR)/boot ?

Here are my answers:
  - yes, we should follow the spec when it makes sense
  - yes, boot filesresiding on a filesystem should be installed in
    $(TARGET_DIR)/boot
  - when not installing in$(TARGET_DIR)/boot, we should install boot
    files in $(BINARIES_DIR)/boot. We can provide a symlink 
    bootloader-name -> boot.

(Note, this is not considered a show-stopper for this patch to go in or
not, just random thoughts it spurred in my head. ;-) )

Regards,
Yann E. MORIN.

>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.0.0
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
