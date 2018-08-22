From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 18:57:51 +0200
Subject: [Buildroot] [PATCH 2/2] Adding btrfs rootfs option.
In-Reply-To: <d8c27acc-81be-e5f2-08d1-c80a3f9d9a96@codethink.co.uk>
References: <20180821160412.28757-1-robert.heywood@codethink.co.uk>
 <20180821160412.28757-2-robert.heywood@codethink.co.uk>
 <20180821202707.GP15347@scaer>
 <d8c27acc-81be-e5f2-08d1-c80a3f9d9a96@codethink.co.uk>
Message-ID: <20180822165751.GB2404@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert, All,

On 2018-08-22 14:10 +0100, Robert Heywood spake thusly:
> On 21/08/18 21:27, Yann E. MORIN wrote:
> >On 2018-08-21 17:04 +0100, Robert J. Heywood spake thusly:
> >>This patch makes it possible to format the rootfs using btrfs.
> >>Introduces the option; BR2_TARGET_ROOTFS_BTRFS
> >>
> >>When selected, the user is able to specify the filesystem size,
> >>label, options, and node and sector sizes.
> >>The new files are based on fs/ext2/{Config.in,ext2.mk}
> >
> >Nice addition! :-)
> >
> >>Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
> >[--SNIP--]
> >>+config BR2_TARGET_ROOTFS_BTRFS_SIZE_NODE
> >>+	string "btree node size"
> >>+	help
> >>+	  The tree block size in which btrfs stores metadata. The default
> >>+	  value is 16KiB (16384) or the page size, whichever is bigger.
> >
> >How is the page size detected? I'd like to be sure this is detecting the
> >page size of the target, not that of the build machine.
> Good question.
> I guess because the makefile creates a sparse file with fallocate which
> mkfs.btrfs then formats, it won't be able to detect any page size (host or
> otherwise) and so will always be set to a default value of 16384.
> I'll set that in the Config file explicitly.

So, the mkfs.btrfs is a host tool; it has no knowledge of the target at
all, so it can't possibly know the target page size. I believe the node
size should default to 16384, so that we get an explicit sane default.

Users who would change that value would know what they would be doing.

> >>+config BR2_TARGET_ROOTFS_BTRFS_SIZE_SECTOR
> >>+	string "sector size"
> >>+	help
> >>+	  The default value is the page size and is autodetected. If the
> >>+	  sectorsize differs from the page size, the created filesystem
> >>+	  may not be mountable by the kernel. Therefore it is not
> >>+	  recommended to use this option unless you are going to mount it
> >>+	  on a system with the appropriate page size.
> >
> >Given that the filsystem is specifically made for the target that will
> >mount it, does it make sense to ffer that option at all? I.e. if the
> >target uses a 4KiB page size, does it make sense to generatea rootfs
> >that has a different secotr size, and thus not mountable on the target
> >at all?
> >
> >My suggestion: don't add that option.
> >
> 
> On my system (building for a raspi0) it autodetects the sector size to be
> 4k, and the resulting image is bootable. However I'm worried the host won't
> be able to detect the correct value for the target. In such a case I can see
> why it would be useful to set the sector size explicitly.

Well, basically all architectures have a 4K page size, so does your
x86_64 and so does the rpi (0/1/2/3), so the default for your host is
valid for your target.

What architectures have a page-size that is not 4K?

> Is there another place where the sector size is specified? If so, it might
> be better to use the existing value instead.

I would also add a default here, to 4096. Users who want to change
that value would know what they would be doing.

> >>+config BR2_TARGET_ROOTFS_BTRFS_FEATURES
> >>+	string "Filesystem Features"
> >>+	help
> >>+	  A comma separated string of features that can be enabled
> >>+	  during creation time.
> >>+	  For a list of available options, use; `mkfs.btrfs -O list-all`
> >
> >Nice. I guess that has to be done using the host-btrfs we built, as its
> >feature list may be different than the one from the build machine.
> 
> I can change the help text to include the full path to the binary.

    For a list of available options, see:
        .../host/sbin/mkfs.btrfs -O list-all

[--SNIP--]
> >Is fallocate really necessary here? If the host's filesystem is too
> >small to accomodate the image, then the mkfs.btrfs below fill fail; we
> >don't need fallocate to fail.
> >
> >Besides, is fallocate readilly available on all distros?
> >
> >Usually, we use truncate(1) to that effect; see for example:
> >     support/testing/tests/fs/test_ubi.py at 29
> >
> 
> fallocate is used here because (unlike other mkfs programs) you can't
> specify a size and have mkfs.btrfs create an image file for you.

Yeah, I know. I was just questionning the use of fallocate for that,
rather than the usual truncate we use everywhere else.

> It needs a
> sparse file to work with.

Except fallocate will not create a sparse file at all; it will really
allocate all blocks the file needs.

> I'll be happy to change this to truncate, as per your example.

Yes, please, for consistency with the other parts of the code in
Buildroot.

Thanks for the feedback; eager to read your v2. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
