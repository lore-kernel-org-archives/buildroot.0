From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 11 Aug 2020 21:41:16 +0200
Subject: [Buildroot] SSHD issue between 2015 and 2020 versions
In-Reply-To: <20200811210822.41e1fc62@gmx.net>
References: <CAN34foxnvLRtSV7GM_=PM6vHZyo6HmeXVCSrjDpyTpRNzK7nGQ@mail.gmail.com>
 <20200811000920.18474f68@gmx.net>
 <CAN34fozMdTf65Y9Ks6e4yri=qdy=+S0vOV1M7DZH22aPpULjyw@mail.gmail.com>
 <20200811210822.41e1fc62@gmx.net>
Message-ID: <20200811214116.27072437@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stephen,

On Tue, 11 Aug 2020 21:08:22 +0200, Peter Seiderer via buildroot <buildroot@busybox.net> wrote:

> Hello Stephen,
>
> On Tue, 11 Aug 2020 10:02:16 -0400, Stephen Beckwith via buildroot <buildroot@busybox.net> wrote:
>
> > Peter,
> >   Thank you for your reply.  As I pointed out in the document:
> > 2020 Buildroot creates a "full_users_table.txt" in the
> > output/build/buildroot_fs directory, whereas the 2015 version puts a
> > _users_table.txt in the output/build directory.  In the case of the 2015
> > Buildroot, this file is "empty", whereas the 2020 Buildroot has an entry in
> > this file that seems to be placed there by the Buildroot infrastructure.
> > Why?  (I realize infrastructure changes occur between releases and we're
> > making a might big leap here).
> > I did update the Buildroot configuration via menuconfig (we save off a
> > defconfig) since there are new default options for packages,etc in the new
> > Buildroot release.
> > A "simple build" is not possible, due to the nature of our setup using an
> > external tree for the proprietary code.
> > I did a build from "scratch" (we call extraclean, removes the output
> > directory and does a complete re-setup of the target information we use).
> > This builds fine, without opensshd enabled in the configuration.  I then
> > use menuconfig to enable opensshd (in target packages->networking) and do a
> > "make" here and I get this error at the end when we package up the entire
> > system.  the opensshd itself builds correctly.
> > The contents of the full_users_table.txt file comes from the
> > sshd-sysusers.conf file in the 2020 Buildroot openssh package.  We do NOT
> > use systemd or Device Tree.  Yet this is defined as the OPENSSH_USERS in
> > the opensshd.mk file, how does this then get to the full_users_table.txt???
>
> For a reference see [1] at 'LIBFOO_USERS'...
>
> > I have enclosed the .config file used to build WITH opensshd enabled.
>
> After a quick look at your config file (nothing suspicious) I would suspect
> the content of the overlays/post-build-script (search for sshd there):
>
> BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_SP_DEV_PATH)/src/rootfs-overlay $(BR2_EXTERNAL_SP_DEV_PATH)/platform/mendo/rootfs-overlay"
> BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL_SP_DEV_PATH)/scripts/post_rootfs_build.sh"

In your attachment 'sshd-BR_ML-Post-0810.rtf' you write:

	 - yes there is a sshd user in the passwd file

Do your mean target/etc/passwd? If yes it must(?) come from one of the rootfs-overlays...,
remove the sshd line there (from passwd, shadow and group)...and try again...

Regards,
Peter

>
> And/or the following change of mkusers ([2])...
>
> Regards,
> Peter
>
> [1] https://buildroot.org/downloads/manual/manual.html#generic-package-reference
> [2] https://git.buildroot.net/buildroot/commit/?id=497f7134fca4b111499b2fd23501d7e048303e7c
>
> >
> > I look forward to your reply.
> >
> > Regards,
> > Stephen Beckwith
> >
> >
> > On Mon, Aug 10, 2020 at 6:09 PM Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > > Hello Stephen,
> > >
> > > On Mon, 10 Aug 2020 17:03:05 -0400, Stephen Beckwith <
> > > embeddedsteve at gmail.com> wrote:
> > >
> > > > Please see the attached document that describes an issue that I've
> > > > encountered when migrating from Buildroot 2015.08.1 to Buildroot 2020.02.
> > > > At this point, I cannot include ssh/sshd for inclusion in the system,
> > > which
> > > > is necessary.
> > >
> > > Hard to determine what is causing your failure:
> > >
> > >         mkusers: user 'sshd' already exists with group 'users' (wants
> > > 'sshd')
> > >
> > > Does it happen with an simple build? Or with your re-started one?
> > >
> > > Please provide a .config/defconfig file from your failing buildroot
> > > configuration...
> > >
> > > Regards,
> > > Peter
> > >
> > > >
> > > > Any pointers/suggestions would be greatly appreciated.
> > > >
> > > > Regards,
> > > > Stephen Beckwith
> > >
> > >
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
