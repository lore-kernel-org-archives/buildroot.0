From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 18:47:17 +0200
Subject: [Buildroot] [PATCH] fs/iso9660: add dependencies for make source
In-Reply-To: <CABbD_XBSjcCmHwiVAwA7Ac+H_tFuv_DP9Jp8mfd5KfbuV21pYw@mail.gmail.com>
References: <1413580605-57289-1-git-send-email-kaszak@gmail.com>
 <CAGduivwDurQn5c5Qovk+K6ZUg86cneLCjq7dpEmPJ9x-9ak=Eg@mail.gmail.com>
 <54426BB5.6030903@mind.be>
 <CABbD_XBSjcCmHwiVAwA7Ac+H_tFuv_DP9Jp8mfd5KfbuV21pYw@mail.gmail.com>
Message-ID: <20141018184717.229346e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly Kasza,

On Sat, 18 Oct 2014 16:17:46 +0200, K?roly Kasza wrote:

> >  You should use $(ROOTFS_ISO9660_DEPENDENCIES) here.
> >
> Why? Non of the other rootfs target makefiles use that (fs/*/*.mk).

All the other rootfs target makefiles use <foo>_DEPENDENCIES. Except
that it's taken into account directly by the common filesystem logic in
fs/common.mk. However, iso9660 is special, and therefore we handle the
dependencies manually. But still, there's no need to repeat them twice.
So, in your patch, change:

ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-fakeroot linux rootfs-cpio grub

$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub

To:

ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-fakeroot linux rootfs-cpio grub

$(BINARIES_DIR)/rootfs.iso9660: $(ROOTFS_ISO9660_DEPENDENCIES)

> Technically, the dependencies variable is already at the top, before the
> first make target.

Agreed.

> Regarding the order: I don't really think that matters.

Well, it's indeed just a subjective thing, like most coding style
things. Still, when a core Buildroot contributor such as Arnout
suggests coding style changes, it's usually a good idea to follow suit
to get the patch merged quickly :)

That being said, I agree that we don't enforce any particular order for
the dependencies in the other packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
