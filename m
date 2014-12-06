From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 6 Dec 2014 12:59:42 +0100
Subject: [Buildroot] [PATCH 3/3 v2] fs/ext2: add option to specify a
 filesystem label
In-Reply-To: <d98afa0b717cf9585358913fd3d97ba6101d2a2b.1417730349.git.yann.morin.1998@free.fr>
References: <cover.1417730349.git.yann.morin.1998@free.fr>
 <d98afa0b717cf9585358913fd3d97ba6101d2a2b.1417730349.git.yann.morin.1998@free.fr>
Message-ID: <CABbD_XBqeKXndB6LSPqwrOe=xQazQXPVrW4ujK_XP_qsXDSQAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, list,

--- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -18,6 +18,12 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
>  EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
>  endif
>
> +# Not qstrip-ing the variable, because it may contain spaces,
> +# but we must qstrip it when checking.
> +ifneq ($(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_LABEL)),)
> +EXT2_OPTS += -l $(BR2_TARGET_ROOTFS_EXT2_LABEL)
>

Unfortunately this won't work with labels with spaces in them.
I recommend using escaped quotation marks like this:

+EXT2_OPTS += -l \"$(BR2_TARGET_ROOTFS_EXT2_LABEL)\"
>

---

Tested the whole series of 3 together, successfully built different
rootfs.ext images and booted them.
Tested with master branch, x86_64 arch in QEMU, internal toolchain GCC
4.9.2 w/ uclibc, Linux 3.17.4.

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141206/7beb7270/attachment.html>
