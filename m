From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 8 Sep 2010 16:48:41 +0200
Subject: [Buildroot] mdev handling
In-Reply-To: <87occ8cnr8.fsf@macbook.be.48ers.dk>
References: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
	<87occ8cnr8.fsf@macbook.be.48ers.dk>
Message-ID: <201009081648.41500.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Yegor, All,

On Wednesday 08 September 2010 16:29:15 Peter Korsgaard wrote:
> >>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:
> 
>  Yegor> AFAIK mdev activation leads only to adding this binary to the rootfs
>  Yegor> tree.
[--SNIP-]
> Isn't this largely obsolete now we have devtmpfs?

Well, devtmpfs has a static naming scheme, default permissions for device
nodes, so it is not sufficient by itself. As the help entry for devtmpfs
states:
 "It provides a fully functional /dev directory, where usually
  udev runs on top, managing permissions and adding meaningful
  symlinks."

So, even from the kernel devels, udev/mdev can/should/must be used to get
a properly managed /dev, even with devtmpfs.

And I don't trust/want the kernel to provide/handle policy. It belongs to
userspace.

Even better, embedded system have a mostly static set of devices, thus a
mostly static set of entries in /dev, and those can go to flash. Entries
for removeable devices (eg. usb sticks) can still go there. Thus you gain
both in flash (no space used by any code, kerenl or userland) and in RAM
(no space used by devtmpfs/tmpfs/ramfs/... and VFS entries).

Really, devtmpfs and mdev/udev are for desktop, where the set of devices is
to easily divergent, IMHO...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
