From: Alexander Yohananov <yohananov@gmail.com>
Date: Tue, 8 Mar 2011 17:10:06 +0200
Subject: [Buildroot] lockfile-progs depends on liblockfile
In-Reply-To: <20110308153646.047f791a@surf>
References: <AANLkTinAu+081B7_fk46-a6e0P0rqbMiMfYqo3k96b0E@mail.gmail.com>
	<20110308153646.047f791a@surf>
Message-ID: <AANLkTinr7mP=NFLXcdnSM8g-69vDZziEEKQNocnX_OkC@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

It would great if I could send it by my own, but I'm not sure I know what "a
proper patch" looks like.
Do I need to prepare it using git diff as you do, or just diff is enough?
Will the directory structure be kept as in buildroot tree?
a/package/lockfile-progs/lockfile-progs.mk or a/lockfile-progs.mk will be
sufficient?

Could you guide me on it a little bit?

Thank you in advance, Alexander.



On Tue, Mar 8, 2011 at 4:36 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello Alexander,
>
> On Tue, 8 Mar 2011 16:22:57 +0200
> Alexander Yohananov <yohananov@gmail.com> wrote:
>
> > --- a/lockfile-progs.mk 2011-03-08 15:40:51.145037713 +0200
> > +++ b/lockfile-progs.mk 2011-03-08 15:39:35.032038246 +0200
> > @@ -11,6 +11,8 @@
> >   $(addprefix lockfile-,check create remove touch) \
> >   $(addprefix mail-,lock touchlock unlock)
> >
> > +LOCKFILE_PROGS_DEPENDENCIES = liblockfile
> > +
> >  define LOCKFILE_PROGS_BUILD_CMDS
> >   $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> >  endef
>
> Correct. lockfile-progs already selects the liblockfile package in its
> Config.in file, but does not depend on it in its .mk file, which is
> wrong. Your fix is correct.
>
> > The other possible fix is to add liblockfile to dependencies list in
> > usbmount.mk:
> > USBMOUNT_DEPENDENCIES = udev lockfile-progs liblockfile (I don't know
> > whether the order is important)
>
> No, that wouldn't work. By doing so, you wouldn't have the guarantee
> that liblockfile is built before lockfile-progs, so the compilation of
> the latter could still fail.
>
> > The problem exists on buildroot-2010.11, but since buildroot-2011.02
> > contains exactly the same usbmount, lockfile-progs and liblockfile it
> > apparently will appear there as well.
>
> Yes, this issue hasn't been fixed in the latest version.
>
> Do you want to send a proper patch so we can keep your attribution, or
> do you want me to send a patch, mentioning your name ?
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110308/f3107219/attachment-0001.html>
