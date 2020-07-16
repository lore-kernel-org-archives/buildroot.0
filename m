From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 16 Jul 2020 11:42:50 +0200
Subject: [Buildroot] [PATCH] system/skeleton: make /var/run a symlink to
 /run
In-Reply-To: <20200715173831.702c9448@windsurf.home>
References: <20200629104749.46938-1-nolange79@gmail.com>
 <20200714151459.6ee4ca7a@windsurf.home>
 <CADYdroPBcpgMkNme2OP8jz3SX-+3J7eDqp0r8UbWXh_swvNkVQ@mail.gmail.com>
 <20200714155207.08d6ffb1@windsurf.home>
 <CADYdroM9wPyVGM2_oAcKcMYBHjYdfEPrd7YKL5QozGP3kDXPHA@mail.gmail.com>
 <20200715154338.1e52ffe5@windsurf.home>
 <CADYdroN0JsN4BS6QWX-wruwSrnBQSZmWBy1FTzPYej6tygdxNQ@mail.gmail.com>
 <20200715173831.702c9448@windsurf.home>
Message-ID: <CADYdroPg29OoZBSyp6pNdFTzk5Z57-OpZaRZ_po_b5m0-GEV0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mi., 15. Juli 2020 um 17:38 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Wed, 15 Jul 2020 15:53:12 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > > But... /run is already a tmpfs in sysv-based systems, so what prevents
> > > today from using /run/lttng even for sysv based systems ?
> >
> > Ok, I missed that bit, thought it would have unrelated /run and
> > /var/run directories.
> > So this patch is just a cleanup then, and buildroot already *always*
> > uses a tmpfs /run (with compatibilty symlink /var/run),
> > and I can use /run with lttng and dbus whether this cleanup is merged or not?
> >
> > I'd redo the patch with those removed, if you agree:
> >
> > package/skeleton-init-openrc/skeleton/var/run
> > package/skeleton-init-sysv/skeleton/var/run
> >
> > Or do nothing if you dont ;)
> > My new argument would be that this would prevent false assumptions (like mine).
>
> OK, the more I look into this, the more I'm confused. To me, it seems
> like in both systemd *and* non-systemd cases, /var/run is already a
> symlink to /run, but just implemented in a different way.
>
> For the systemd case, we have:
>
>         ln -s ../run $(TARGET_DIR)/var/run
>
> in package/skeleton-init-systemd/skeleton-init-systemd.dmk.
>
> For the sysv/openrc case, we have the skeleton itself that contains:
>
> $ ls -l package/skeleton-init-sysv/skeleton/var/run
> lrwxrwxrwx 1 thomas thomas 6 26 mars  17:10 package/skeleton-init-sysv/skeleton/var/run -> ../run
> $ ls -l package/skeleton-init-openrc/skeleton/var/run
> lrwxrwxrwx 1 thomas thomas 6 18 mai   17:32 package/skeleton-init-openrc/skeleton/var/run -> ../run
>
> So, it all cases, /var/run is already a symlink to /run. Am I missing
> something here ?
>
> So, if anything needs to be done, it's just cleaning up that and doing
> it in the same way for all init systems, perhaps in a common place.

I thought about it some more, I think it's fine the way it is for now.
Sometime later I'd remove the logic in systemd as tmpfilesd already
will create the link - but only if sysv compatibility is enabled.
(Still working on a systemd patch to allow tmpfilesd be executed safely
on the host, then this can be cleaned up).

> But
> we need to be careful, skeleton-init-systemd.mk has some
> special/complex logic to handle /var and generate a
> /etc/tmpfiles.d/var-factory.conf to generate the contents of /var at
> boot time when the rootfs is read only and therefore the entire /var is
> in tmpfs.

Yeah.. about that...

First it's weird that a generic option (REMOUNT_ROOTFS_RW) does more than
just remounting the rootfs. This should be its own option.

Then it is already broken or atleast insanely fragile.

-   it kills previous files in /usr/share/factory/var
-   it doesn't handle symlinks (just think of /var already containing
a symlink into that factory),
    especially relative ones.
-   it has sideeffects with tmpfile .confs that are ordered before and
touch /var
-   it has sideeffects with other PRE_CMD_HOOKS touching /var

Whatever the reason was, that this got included, it seems to be a very
narrow and specialised usecase,
and hurting everything else.

With systemd 246 it's possible to boot into a complete ro rootfs,
basic services will work (course you can't write to /var).
A tmpfs overlay or a script + service that creates a bind mount seems
a way better solution to me.

Norbert.

PS.
I tried to ping you in regards to the fakeroot 1.24 upgrade:
http://lists.busybox.net/pipermail/buildroot/2020-May/282161.html
