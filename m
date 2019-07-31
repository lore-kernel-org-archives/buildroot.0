From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 31 Jul 2019 21:43:07 +0200
Subject: [Buildroot] [PATCH 1/2] system: add default to
 BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
In-Reply-To: <20190731160809.GK3194@scaer>
References: <20190722051627.12993-1-petr.vorel@gmail.com>
 <20190731160809.GK3194@scaer>
Message-ID: <20190731194306.GB10819@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> Petr, All,

> On 2019-07-22 07:16 +0200, Petr Vorel spake thusly:
> > Enable BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES if none
> > of non-supported rootfs is selected.

> No, sorry.

> As I explained in another thread, there are valid cases where one does
> not need capabilities (and thus xattrs) on their systems.

> In that case, your change would mean that the defconfig files of those
> people now default to using xattrs, when they previously would not.

OK, agree, thanks for an explanation.
I've set it in patchwork as rejected (+ delegate to you).
I'd still add the second patch (adding "(XATTR)" I find it just by chance, as I
didn't search for "extended attributes", but for XATTR.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > Hi,

> > not sure about cloop, cpio, tar, ubi.

> > Kind regards,
> > Petr

> >  system/Config.in | 1 +
> >  1 file changed, 1 insertion(+)

> > diff --git a/system/Config.in b/system/Config.in
> > index af7d8566d3..842e745cd3 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -196,6 +196,7 @@ config BR2_ROOTFS_STATIC_DEVICE_TABLE

> >  config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
> >  	bool "support extended attributes in device tables"
> > +	default y if !BR2_TARGET_ROOTFS_AXFS && !BR2_TARGET_ROOTFS_CRAMFS && !BR2_TARGET_ROOTFS_ISO9660 && !BR2_TARGET_ROOTFS_ROMFS && !BR2_TARGET_ROOTFS_YAFFS2

> In any case, iff we were to add this, this should be done differently,
> because we do not want to hard-code the list of filesystems here. For
> one, becaise the list is long; and for two, because of filesystems from
> the br2-external trees.

> Instead, we would have to do:

>     config BR2_ROOTFS_SUPPORTS_XATTRS
>         bool

>     config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
>         bool "support extended attributes in device tables"
>         default y if BR2_ROOTFS_SUPPORTS_XATTRS

> and then filesystems would be responsible for setting:

>     config BR2_TARGET_ROOTFS_EXT2
>         bool "ext2/3/4 root filesystem"
>         select BR2_ROOTFS_SUPPORTS_XATTRS

On first (unposted) version I implemented it this way :).

> But again, I think it does not gain much. People who want xattrs will
> know enough to enable it.

> Regards,
> Yann E. MORIN.

Kind regards,
Petr
