From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2015 13:23:33 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <55EFFD38.5010104@mind.be>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFFD38.5010104@mind.be>
Message-ID: <20150909132333.5bbaf57c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Luca,

On Wed, 9 Sep 2015 11:34:48 +0200, Arnout Vandecappelle wrote:
> On 08-09-15 23:28, Luca Ceresoli wrote:
> > First, we need the BR2_ROOTFS_STATIC_DEVICE_TABLE just like the static
> > /dev management, in order to have the very basic devices such as /dev/null
> > and /dev/console until mdev is enabled.
> 
>  Actually, I don't think this is a good idea: we're asking the user to configure
> a static device table which is not going to be used anyway.
> 
>  I think it's better to move /dev/null and /dev/console to device_table.txt -
> i.e., include them in every rootfs. It just increases the size with a few
> hundred bytes, it doesn't hurt because devtmpfs is normally automounted over it
> right away, and it is better for the cpio/initramfs case because you won't get
> the 'Unable to open initial console' message anymore (I think). Plus, the
> redirects can be removed from fs/cpio/init since they'll be automatic.
> 
>  What do the other developers think?

I would prefer to keep /dev/null and /dev/console in a special device
table, used only for the mdev without devtmpfs case, but not make it
configurable.

So, I would actually not make the option BR2_ROOTFS_STATIC_DEVICE_TABLE
visible for the BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY case, and
instead force using a minimal, hard-coded, device table in this case.
There is no reason whatsoever to have anything else but /dev/null
and /dev/zero in the mdev without devtmpfs case.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
