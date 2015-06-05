From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2015 00:13:46 +0200
Subject: [Buildroot] [PATCH 08/12] fs/iso9660: support building a real
 iso9660 filesystem
In-Reply-To: <1433430330-2166-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150605221346.GI3641@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-04 17:05 +0200, Thomas Petazzoni spake thusly:
> Until now, the iso9660 filesystem handling only supported using an
> initrd/initramfs to store the root filesystem, which is very different
> from what we do with the other filesystems.
> 
> This commit changes the iso9660 logic to also allow using directly an
> iso9660 filesystem to store the root filesystem. A new option,
> BR2_TARGET_ROOTFS_ISO9660_INITRD, is created to tell the iso9660 that
> we want to use an initrd and not directly the root filesystem in
> iso9660 format. This option defaults to 'y' to preserve the existing
> behavior.

Besides the comments by Samuel, here are mines...

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[--SNIP--]
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 2a8a447..a3572e2 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
[--SNIP--]
> +ifeq ($(BR2_TARGET_ROOTFS_ISO9660_INITRD),y)
> +ROOTFS_ISO9660_USE_INITRD = YES

since we're later using that in an ifeq() clause, maybe we could use 'y'
here...

> +endif
> +
> +ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
> +ROOTFS_ISO9660_USE_INITRD = YES

... and here, so the ifeq() clause looks like the others.

I understand using 'YES' also makes it obvious this is not a kconfig
option, but a Makefile variable, so I would not mind keeping 'YES' if
you prefer.

> +endif
> +
> +ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)

Here, we'd have:

    ifeq ($(ROOTFS_ISO9660_USE_INITRD),y)

which looks more like what we are used to.

> +ROOTFS_ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660

Maybe it would be time to move that to a differently-named directory,
like:
    ROOTFS_ISO9660_TARGET_DIR = $(BUILD_DIR)/rootfs-iso9660.tmp

so it is obvious it is not (and does not conflict with) a package build
directory.

And ultimately, we should really introduce a temproray, scratch location
where anyone is free to drop files/directories at will without polluting
$(BUILD_DIR)  (the downlaod scripts would also benefit from that
scratchable location, btw).

[--SNIP--]
> +# Copy initrd to temporary filesystem if needed
> +ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),)

We usually use positive logic and test against 'y', unless there's no
'else' clause. So, maybe:

    ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
    ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
    else
    blabla
    endif # BR2_TARGET_ROOTFS_INITRAMFS

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
