From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 21:07:48 +0200
Subject: [Buildroot] [PATCH] Create /dev/null device node when building
 a cpio rootfs
In-Reply-To: <535FF178.2090507@mind.be>
References: <1398784378-20251-1-git-send-email-dan.moulding@rackwareinc.com>
 <1398784378-20251-2-git-send-email-dan.moulding@rackwareinc.com>
 <535FF178.2090507@mind.be>
Message-ID: <20140716210748.1a0cc066@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 29 Apr 2014 20:37:44 +0200, Arnout Vandecappelle wrote:

> > diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
> > index 771306c..8648ed9 100644
> > --- a/fs/cpio/cpio.mk
> > +++ b/fs/cpio/cpio.mk
> > @@ -22,6 +22,7 @@ define ROOTFS_CPIO_ADD_INIT
> >  endef
> >  
> >  PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)
> > +PACKAGES_PERMISSIONS_TABLE += /dev/null c 666 0 0 1 3 - - -$(sep)
> 
>  How is this issue limited to the cpio rootfs? You'll have the same issue
> with any rootfs, right?

Yes. The mdev support makes the assumption that devtmpfs support is
available in the kernel.

>  So perhaps a better solution is to move /dev/console and /dev/null from
> device_table_dev.txt to device_table.txt.

Not really:

 * In the initramfs case, /dev/console is needed. For static /dev, it's
   already there. For non-static /dev, we have to have a
   static /dev/console until our init script mounts devtmpfs. So it's
   really an initramfs specific issue.

 * For the non-initramfs case. For static /dev, it's already there. For
   non-static /dev, devtmpfs is mounted *before* init is started,
   so /dev/console is also already there.

>  Note that if we do that, we can revert e1ebae70 and perhaps even
> 10a130f9. Actually, 10a130f9 can probably already be reverted, since
> e1ebae70 should have the same effect.

I agree. Would you mind sending a patch reverting 10a130f9 ?

Also, since we seem to agree that the patch proposed by Dan was not
needed, I've marked http://patchwork.ozlabs.org/patch/343880/ as
Rejected in our patch tracking system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
