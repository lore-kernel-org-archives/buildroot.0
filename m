From: Chien-Yu Chen <torus0@gmail.com>
Date: Wed, 16 Jul 2008 14:01:01 -0500
Subject: [Buildroot] buildroot size ballooned
In-Reply-To: <d6cda7730807161150u3c5589d6ld94ca37dfef26c27@mail.gmail.com>
References: <mailman.29.1216219095.1344.buildroot@uclibc.org>
	<487E1442.2040004@acsatlanta.com>
	<d6cda7730807161150u3c5589d6ld94ca37dfef26c27@mail.gmail.com>
Message-ID: <dbc6d8cc0807161201u41c6ac1fg4e27a617a01b9e0b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had a similiar problem.  I found out what's going on, but can only use a
dirty trick to avoid the problem...

I enabled initramfs support...so when compiling, kernel compiling in the
filesystem build up so far.  then everytime I modify the root file system
and make, somehow, kernel compiling keep the original cpio image from the
previous make, and attach a new copy of the new file system.  so the kernel
keep on growing, thus the resulting output file system keep on getting
bigger.

so what I did is to bypass the fakeroot part, since I have a valid
filesystem ready by the time kernel is compiled, I take the final kernel
image, run it through grub and mkisofs to generate the CD image I want.  I
eventually want to put it on flash drive...but so far this works for me.

chen

On Wed, Jul 16, 2008 at 1:50 PM, Thiago A. Corr?a <thiago.correa@gmail.com>
wrote:

> Most likely there are new packages being enabled on the defconfig. Did
> you check that?
>
> On Wed, Jul 16, 2008 at 12:31 PM, Joseph G. Boike
> <joe.boike@acsatlanta.com> wrote:
> >
> >> Date: Tue, 15 Jul 2008 21:52:10 -0600
> >> From: "Nathanael D. Noblet" <nathanael@gnat.ca>
> >> Subject: Re: [Buildroot] buildroot size ballooned
> >> To: "Joseph G. Boike" <joe.boike@acsatlanta.com>
> >> Cc: build root <buildroot@uclibc.org>
> >> Message-ID: <487D706A.30908@gnat.ca>
> >> Content-Type: text/plain; charset=ISO-8859-1; format=flowed
> >>
> >> Joseph G. Boike wrote:
> >>
> >>> Hi, my buildroot filesize had been around 3-4M (w/ r 22508)
> >>> With r 225765 and building using at91sam9260dfc_defconfig the filesize
> >>> has jumped to ~14M.
> >>> Any thoughts on why?
> >>> (I have kernel 2.6.26 now.  The kernel size has been fairly consistent
> >>> around 1.5M.)
> >>>
> >>
> >>
> >> No idea, but a clarification, are you talking about buildroot's
> >> outputted final rootfs, or buildroot project in svn?
> >>
> >>
> > The final output file (rootfs.arm-2008xxxx.ext2.gz) to be burned into my
> > serial flash.
> > Regards,
> > Joe
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>



-- 
Any MicroSoft extension file will directly go to trash without any warning
and regret.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080716/e3abfb5a/attachment.htm 
