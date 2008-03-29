From: Nigel Kukard <nkukard@lbsd.net>
Date: Sat, 29 Mar 2008 14:56:50 +0000
Subject: [Buildroot] initramfs doesn't need root to create an image
In-Reply-To: <87myoh8us4.fsf@macbook.be.48ers.dk>
References: <1206773941.3224.126.camel@nigel-x60>
	<20080329140004.GA25949@cloud.net.au>
	<1206799922.3224.157.camel@nigel-x60>
	<87myoh8us4.fsf@macbook.be.48ers.dk>
Message-ID: <1206802610.3224.180.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>  >> > Attached a patch which removes the requirement on fakeroot & makedevs
>  >> > and prevents files from being created in /dev instead of devices when
>  >> > one builds buildroot as a non-priv user.
>  >> 
>  >> Why? Was there a problem with fakeroot?
> 
>  Nigel> Not fakeroot itself, but you cannot create a device if you're
>  Nigel> a non-priv user. So ... nothing fails, makedevs generates
>  Nigel> lovely zero size files instead of devices & fakeroot appears
>  Nigel> to hide the errors.
> 
> But that's the point of fakeroot. Applications run from within
> fakeroot believes the trickery and sees the (fake) device nodes. I
> haven't looked into the initramfs stuff, but why wouldn't that work
> there as well?

Does fakeroot keep device-special information if you create devices
inside its environment? ie. if you create a /dev/hda inside a fakeroot
using mknod, tar it up, exit fakeroot, untar it with admin privs, is it
still a device special file?

If it is (which would be damn awesome), then with a few less lines of
modifications and minus my perl script we can take the cpio file
generation out of the kernel build and do it ourselves in the fakeroot.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080329/3e0cca85/attachment.pgp 
