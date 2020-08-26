From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 26 Aug 2020 10:17:11 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: ensure tmpfiles.d/legacy.conf
 is installed
In-Reply-To: <CAMWSM7iPMw-i3CFBa3YZjPN01rSDyNO1_FEYenHx5nhSp0YQ8A@mail.gmail.com>
References: <20200825000246.4035-1-joseph.kogut@gmail.com>
 <20200825104313.6691deaa@windsurf.home>
 <CADYdroN4Zo-OeMxiKny7=snTELUr=1pBbvjC1puVAprfsco77w@mail.gmail.com>
 <CAMWSM7iPMw-i3CFBa3YZjPN01rSDyNO1_FEYenHx5nhSp0YQ8A@mail.gmail.com>
Message-ID: <CADYdroPNd=9CQ_Uzn_2F7Fp2Kf+1egTtZn9_D=dxxznAOdpZsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mi., 26. Aug. 2020 um 03:51 Uhr schrieb Joseph Kogut
<joseph.kogut@gmail.com>:
>
> Hi Norbert,
>
> On Tue, Aug 25, 2020 at 5:58 AM Norbert Lange <nolange79@gmail.com> wrote:
> >
> > Am Di., 25. Aug. 2020 um 10:43 Uhr schrieb Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com>:
> > >
> > > Hello,
> > >
> > > I'm adding Norbert Lange in Cc, since he has done quite a bit of
> > > systemd work in Buildroot recently. Norbert, could you review the below
> > > patch ?
> > >
> > > Also, Norbert, I think it would be nice if you could add yourself in
> > > the DEVELOPERS file for package/systemd/. You have been very active
> > > recently in improving our systemd package, and it would be good to have
> > > someone review systemd related patches.
> > >
> > > Thanks!
> > >
> > > Thomas
> > >
> > > On Mon, 24 Aug 2020 17:02:46 -0700
> > > Joseph Kogut <joseph.kogut@gmail.com> wrote:
> > >
> > > > Systemd doesn't install tmpfiles.d/legacy.conf when sysv compatiblity
> > > > isn't enabled. This config sets up /var/lock, which many programs such
> > > > as uboot's fw_printenv/setenv still depend on by default.
> > > >
> > > > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > > > ---
> > > >  package/systemd/systemd.mk | 10 +++++++++-
> > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > > > index e356cb1add..8454993823 100644
> > > > --- a/package/systemd/systemd.mk
> > > > +++ b/package/systemd/systemd.mk
> > > > @@ -512,10 +512,18 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
> > > >       touch $(TARGET_DIR)/etc/machine-id
> > > >  endef
> > > >
> > > > +# systemd doesn't install legacy.conf without sysv-compat
> > > > +# This config ensures /var/lock is created
> > > > +define SYSTEMD_INSTALL_LEGACY_CONF_HOOK
> > > > +     $(INSTALL) -D -m 0644 $(@D)/tmpfiles.d/legacy.conf \
> > > > +             $(TARGET_DIR)/usr/lib/tmpfiles.d
> > > > +endef
> > > > +
> > > >  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> > > >       SYSTEMD_INSTALL_INIT_HOOK \
> > > >       SYSTEMD_INSTALL_MACHINEID_HOOK \
> > > > -     SYSTEMD_INSTALL_RESOLVCONF_HOOK
> > > > +     SYSTEMD_INSTALL_RESOLVCONF_HOOK \
> > > > +     SYSTEMD_INSTALL_LEGACY_CONF_HOOK
> > > >
> > > >  define SYSTEMD_INSTALL_IMAGES_CMDS
> > > >       $(SYSTEMD_INSTALL_BOOT_FILES)
> > >
> > >
> > >
> > > --
> > > Thomas Petazzoni, CTO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> >
> > Not sure what I should add here, technically the patch is fine.
> >
> > - Should BR support /var/lock?
> > Then probably adding you own buildroot.conf to one of the skeletons
> > would be better (handle /var/lock and /var/run at a central spot)
> >
>
> I'm unfamiliar with any technical discussion around this. The Linux
> documentation [1] itself specifies that lock files should be stored at
> /var/lock. It seems odd to me that this path would be expected not to
> exist at all. Do you have any insight? I might add, this same approach
> was adopted by Arch Linux [2] some time ago.

/run holds the runtime state, /var is a bad fit for locks, indicated
by /var/lock
already being a symlink. Most distros use /run/lock as backing storage,
aswell as systemd and openrc, see for ex.  [1].

Nowadays you should use flock, those uucp locks for serial ports are a
thing long past, it is weird that it's still in the Linux docs.
For ex I dont know of any Linux related tools (util-linux, etc.) using
lockfiles.

Note that the legacy.conf also creates the /var/run -> /run symlink,
which is actually still often needed (even if it should go away aswell),
and that Arch is a more "general" distro.

Said /var/run symlink comes from buildroot skeleton, and I would
put /var/lock there too (solve it for all init systems).
systemd-tmpfiles further can be disabled in
buildroot, I dont think thats a good idea and should be mandatory,
but some action is necessary.

>
> > If not, then patching out its uses should be the long-term goal. I am
> > not sure I agree with Joseph that many packages use /var/lock,
> > even less so if you use a systemd rootfs (only know of a few busybox
> > and if-updown services that do).
> >
>
> Admittedly, I'm not sure how many packages actually still use
> /var/lock. One would need to download and extract every package
> supported by buildroot to have an accurate picture. In my build
> directory, I grepped for it and found references in alsa-utils,
> busybox, linux-pam, and uboot-tools, the last of which this patch
> attempted to fix.
>
> Would it be preferable to patch uboot-tools to default to /run/lock? What
> are the technical reasons for this? It seems equivalent to me to
> symlink /var/lock -> ../run/lock, and prevents applications which
> haven't yet been updated to use the new path from breaking
> inexplicably.

Yeah, it's a legacy workaround in other words. Question is, if everyone
should be blessed with that workaround. BR also adds systemd service files
instead of using upstream init scripts.
There are distros which have separate /run/lock and /var/lock directories,
(thanks to FHS allowing this), so those apps don't really lock systemwide there.

And for a technical reason, you are needlessly depending on the blockdevice
that's continuously written to.

Norbert

>
> > Being the guy that spent time removing all those legacy files I am
> > prolly biased then it comes to the right answer;
> >
> > Norbert
>
> [1] https://www.kernel.org/doc/Documentation/admin-guide/devices.rst
> [2] https://github.com/archlinux/svntogit-packages/blob/febacd7859ba2556df1122c89fcdc7383676514f/trunk/PKGBUILD#L195

[1] - https://wiki.debian.org/ReleaseGoals/RunDirectory
