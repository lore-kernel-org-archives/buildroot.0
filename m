From: Nigel Kukard <nkukard@lbsd.net>
Date: Sat, 29 Mar 2008 14:12:02 +0000
Subject: [Buildroot] initramfs doesn't need root to create an image
In-Reply-To: <20080329140004.GA25949@cloud.net.au>
References: <1206773941.3224.126.camel@nigel-x60>
	<20080329140004.GA25949@cloud.net.au>
Message-ID: <1206799922.3224.157.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> > Attached a patch which removes the requirement on fakeroot & makedevs
> > and prevents files from being created in /dev instead of devices when
> > one builds buildroot as a non-priv user.
> 
> Why? Was there a problem with fakeroot?

Not fakeroot itself, but you cannot create a device if you're a non-priv
user. So ... nothing fails, makedevs generates lovely zero size files
instead of devices & fakeroot appears to hide the errors.

My patch is initramfs specific and doesn't touch, remove or alter any of
the other target root filesystem types. It removes the requirement for
both fakeroot and makedevs for initramfs image generation. Real devices
aren't created, the cpio manifest is modified in such a way that the
result cpio archive contains the devices. The manifest is normally
generated from the actual files/devices found. My patch takes the
manifest (minus the devices as makedevs isn't run) parses the device
table and outputs the manifest with what makedevs would of generated,
with the uid/gid defaulting to 0 if not overridden by makedevs.

> The ext2 and jffs2 targets both use fakeroot, although the generator
> tools can do privilege squashing and handle device tables themselves.
> Next week I need to add ubifs support, and currently the generator tool
> does not have device table support fwiw.

I only touched initramfs image generation. If you see something I
missed, or error in my perl script, feel free to let me know so I can
fix it  :)  I've tested it with both the generic device list, my own
device list, as root and as a non-priv user with no errors, the
resulting initramfs image when booted contains all the devices
specified.

-N

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080329/bd44a0d2/attachment.pgp 
