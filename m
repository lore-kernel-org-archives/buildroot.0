From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Jun 2014 18:51:46 +0200
Subject: [Buildroot] Check root file system at boot time
In-Reply-To: <1402072948875-71738.post@n4.nabble.com>
References: <1401897756168-71600.post@n4.nabble.com>
 <20140604170914.GA3325@free.fr>
 <1401963933710-71653.post@n4.nabble.com>
 <20140605192113.GE3553@free.fr>
 <1402062388810-71727.post@n4.nabble.com>
 <20140606162737.GB3481@free.fr>
 <1402072948875-71738.post@n4.nabble.com>
Message-ID: <20140606165146.GC3481@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pedro, All,

On 2014-06-06 09:42 -0700, psnsilva spake thusly:
> I am generating the ext4 file system within buildroot. What I did here was,
> after the first boot, to force the check every boot issuing the command
> "tune2fs -C 2 -c 1 /dev/mmcblk0p2". But seems like I have no need for doing
> it.

Ah, OK. No it is not needed. Upon mounted an uncleanly unmounted
filesystem, the kernel will (try to) repair it.

Note however, that if the filesystem is that badly damaged that the
kernel can't even repair it, your screwed. fsck might have a better
chance of fixing the filesystem.

Really, if you expect the filesystem to be often uncleanly unmounted.
you should switch to a read-only filesystem for your / mountpoint (eg.
squashfs). An alternative would be to use a flash-optimised filesystem,
like jffs2, which is designed to recover from untimely power failures to
start with. But jffs2 can sit on a block device, you'd need a reverse
translation layer (eg. blockmtd) to emulate a flash on a block device.

Or, if your filesystem is small enough, put it entirely in an initramfs,
so it is purely in RAM (and only mount your persistent-data filesystem
from the SDcard.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
