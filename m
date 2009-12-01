From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 1 Dec 2009 12:42:45 -0600
Subject: [Buildroot] Trying to build in an usual place: /opt instead of /
In-Reply-To: <5cd84ac80912010618n334b9ecck27b26d2b493dca39@mail.gmail.com>
References: <5cd84ac80912010510k26f4af64x6234af2e35adbde1@mail.gmail.com>
	<5cd84ac80912010610m79367ab8y592538cc0dac1823@mail.gmail.com>
	<5cd84ac80912010618n334b9ecck27b26d2b493dca39@mail.gmail.com>
Message-ID: <200912011242.47113.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue December 1 2009, Olivier Perron wrote:
> [...]
> >>>
> >>
> >> Why not using chroot ?
> >>
> >
> > Because I still need to access /dev ?
> >
> 
> Hum... bad answer !
> # mkdir /opt/dev
> # mount -o bind /dev /opt/dev
> before chrooting should do the trick.
> 

You don't need that, unless you want the changes made in
the chroot/dev to show up outside of the chroot.

Just initialize the device nodes in chroot/dev, they will
work just fine there (the kernel uses the device numbers,
not the path).

Presuming a bare busybox in chroot/bin - (/opt/test/bin)
Here is the short version:

mount -t proc proc /opt/test/proc
mount -t sysfs sysfs /opt/test/sys
chroot /opt/test /bin/busybox sh
/bin/busybox --install -s
mdev -s

Your done.  Have fun.

Mike
> Yes, I will try the chroot route then.
> 
> Anyway, if someone knows how to do what I wanted to do in first place,
> please tell me: I'd love to learn what I failed to do !
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
