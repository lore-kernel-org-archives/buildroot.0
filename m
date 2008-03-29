From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sun, 30 Mar 2008 02:04:45 +1100
Subject: [Buildroot] initramfs doesn't need root to create an image
In-Reply-To: <1206802610.3224.180.camel@nigel-x60>
References: <1206773941.3224.126.camel@nigel-x60>
	<20080329140004.GA25949@cloud.net.au>
	<1206799922.3224.157.camel@nigel-x60>
	<87myoh8us4.fsf@macbook.be.48ers.dk>
	<1206802610.3224.180.camel@nigel-x60>
Message-ID: <20080329150445.GA27838@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 29, 2008 at 02:56:50PM +0000, Nigel Kukard wrote:
> >  >> > Attached a patch which removes the requirement on fakeroot & makedevs
> >  >> > and prevents files from being created in /dev instead of devices when
> >  >> > one builds buildroot as a non-priv user.
> >  >> 
> >  >> Why? Was there a problem with fakeroot?
> > 
> >  Nigel> Not fakeroot itself, but you cannot create a device if you're
> >  Nigel> a non-priv user. So ... nothing fails, makedevs generates
> >  Nigel> lovely zero size files instead of devices & fakeroot appears
> >  Nigel> to hide the errors.
> > 
> > But that's the point of fakeroot. Applications run from within
> > fakeroot believes the trickery and sees the (fake) device nodes. I
> > haven't looked into the initramfs stuff, but why wouldn't that work
> > there as well?
> 
> Does fakeroot keep device-special information if you create devices
> inside its environment? ie. if you create a /dev/hda inside a fakeroot
> using mknod, tar it up, exit fakeroot, untar it with admin privs, is it
> still a device special file?

Yes. The ext2 and jffs2 targets use it for that purpose: they use
makedevs to process the device table, then call genext2fs/mkfs.jffs2
within the fakeroot session to create the image.

You can even have the special devices persist across fakeroot sessions
if you tell it to save/load its session to file.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
