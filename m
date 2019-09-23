From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Sep 2019 15:10:29 +0200
Subject: [Buildroot] [PATCH 1/1] fs/cpio: make initramfs init script
 survive 'console=' kernel argument
In-Reply-To: <80e3e080-0af3-99de-ff8f-9de5e3dca8a6@exertus.fi> (Timo Ketola's
 message of "Mon, 23 Sep 2019 10:58:45 +0000")
References: <80e3e080-0af3-99de-ff8f-9de5e3dca8a6@exertus.fi>
Message-ID: <87tv93w43e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Timo" == Timo Ketola <Timo.Ketola@exertus.fi> writes:

 > When booting with 'console=<empty>' in the kernel command line (as e.g.
 > U-Boot does with silent flags in effect), opening /dev/console fails.
 > That is fatal in the /init script and kernel will panic. It is also
 > needless, because the kernel tries to open it anyway (well, as long as
 > we have console node in initramfs /dev; cpio.mk creates that alright).

Also when devtmpfs is used? We manually mount devtmpfs in the initramfs,
so the kernel presumably cannot have opened /dev/console before
executing /init, and we do not add a static device node for
/dev/console.


 > Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
 > ---
 >  fs/cpio/init | 4 +---
 >  1 file changed, 1 insertion(+), 3 deletions(-)

 > diff --git a/fs/cpio/init b/fs/cpio/init
 > index dbe09ac..72b2401 100755
 > --- a/fs/cpio/init
 > +++ b/fs/cpio/init
 > @@ -1,7 +1,5 @@
 >  #!/bin/sh
 >  # devtmpfs does not get automounted for initramfs
 >  /bin/mount -t devtmpfs devtmpfs /dev
 > -exec 0</dev/console
 > -exec 1>/dev/console
 > -exec 2>/dev/console
 > +
 >  exec /sbin/init "$@"
 > -- 
 > 2.7.4
 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
