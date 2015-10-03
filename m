From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 3 Oct 2015 23:42:52 +0200
Subject: [Buildroot] [PATCH] system/system.mk: modify fstab according to
	GENERIC_REMOUNT_ROOTFS_RW
In-Reply-To: <55A454A8.2070706@mind.be>
References: <1426339255-72888-1-git-send-email-kaszak@gmail.com>
 <55A454A8.2070706@mind.be>
Message-ID: <CAGduivwxRDNFgpFHGki2cFdPVTk2AZN5Dg3TSA90XCJUs06R0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Karoly,

This patch doesn't apply anymore since everything in system.mk has been
moved to a new 'skeleton' package.
I have respinned it a little bit, you can find it here:
http://lists.busybox.net/pipermail/buildroot/2015-October/140904.html

You patch has been marked as superseeded.

Thank you very much



On Tue, Jul 14, 2015 at 2:15 AM, Arnout Vandecappelle <arnout@mind.be>
wrote:

> On 03/14/15 14:20, Karoly Kasza wrote:
> > Currently, if BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is set
> > /etc/inittab will run a remount on / to make it writable.
> > But in /etc/fstab the /dev/root entry is always mounted as rw, so the
> above
> > command is useless, BR will always mount /dev/root writable.
> >
> > This patch adds a modification to /etc/fstab based on the value of
> > BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW, making BR once again to
> > enable readonly root builds OOB.
> >
> > Also, remounting in either case seems mainingless, if /etc/fstab is not
> > setting /dev/root readonly by default - which can be an alternative
> solution.
> >
> > Signed-off-by: Karoly Kasza <kaszak@gmail.com>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  Regards,
>  Arnout
>
> > ---
> >  system/system.mk |    8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/system/system.mk b/system/system.mk
> > index 4a1eb4a..a390b6e 100644
> > --- a/system/system.mk
> > +++ b/system/system.mk
> > @@ -106,14 +106,18 @@ TARGET_FINALIZE_HOOKS += SYSTEM_GETTY
> >  endif
> >
> >  ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
> > -# Find commented line, if any, and remove leading '#'s
> > +# Find commented line in inittab, if any, and remove leading '#'s
> > +# Rewrite fstab to mount /dev/root rw if set to ro
> >  define SYSTEM_REMOUNT_RW
> >       $(SED) '/^#.*-o remount,rw \/$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
> > +     $(SED) '/^\/dev\/root.*ro,.*/s~ro,~rw,~' $(TARGET_DIR)/etc/fstab
> >  endef
> >  else
> > -# Find uncommented line, if any, and add a leading '#'
> > +# Find uncommented line in inittab, if any, and add a leading '#'
> > +# Rewrite fstab to mount /dev/root ro if set to rw
> >  define SYSTEM_REMOUNT_RW
> >       $(SED) '/^[^#].*-o remount,rw \/$$/s~^~#~'
> $(TARGET_DIR)/etc/inittab
> > +     $(SED) '/^\/dev\/root.*rw,.*/s~rw,~ro,~' $(TARGET_DIR)/etc/fstab
> >  endef
> >  endif
> >  TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_RW
> >
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151003/637cf3a5/attachment.html>
