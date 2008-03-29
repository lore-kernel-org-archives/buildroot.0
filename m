From: Nigel Kukard <nkukard@lbsd.net>
Date: Sat, 29 Mar 2008 16:02:54 +0000
Subject: [Buildroot] initramfs doesn't need root to create an image
In-Reply-To: <20080329150445.GA27838@cloud.net.au>
References: <1206773941.3224.126.camel@nigel-x60>
	<20080329140004.GA25949@cloud.net.au>
	<1206799922.3224.157.camel@nigel-x60>
	<87myoh8us4.fsf@macbook.be.48ers.dk>
	<1206802610.3224.180.camel@nigel-x60>
	<20080329150445.GA27838@cloud.net.au>
Message-ID: <1206806574.13558.6.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> > > But that's the point of fakeroot. Applications run from within
> > > fakeroot believes the trickery and sees the (fake) device nodes. I
> > > haven't looked into the initramfs stuff, but why wouldn't that work
> > > there as well?
> > 
> > Does fakeroot keep device-special information if you create devices
> > inside its environment? ie. if you create a /dev/hda inside a fakeroot
> > using mknod, tar it up, exit fakeroot, untar it with admin privs, is it
> > still a device special file?
> 
> Yes. The ext2 and jffs2 targets use it for that purpose: they use
> makedevs to process the device table, then call genext2fs/mkfs.jffs2
> within the fakeroot session to create the image.
> 
> You can even have the special devices persist across fakeroot sessions
> if you tell it to save/load its session to file.

Well then, there we go ... a even better solution to my perl script  :)

Let me see what I can hack up. The reason why the kernel's cpio image
generation does not work is because its run from outside fakeroot.

Moving the cpio archive generation out of the kernel builds' hands (by
merely providing it a .cpio to use for the initramfs) is going to more
than likely make the initramfs target very very similar to the cpio one,
with the exception of the kernel config changes of course. As you said,
fakeroot does everything the kernel scripts do and actually better.

Anyone got any thoughts on cpio & initramfs being merged into one target
(directory)? a pseudo target of sorts where initramfs's config option is
added to cpio's config.in, when selected enables cpio and sets the path
of the cpio archive?

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080329/ed6aef41/attachment-0001.pgp 
