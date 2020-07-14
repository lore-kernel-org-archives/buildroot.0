From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 14 Jul 2020 16:22:25 +0200
Subject: [Buildroot] [PATCH] system/skeleton: make /var/run a symlink to
 /run
In-Reply-To: <20200714155207.08d6ffb1@windsurf.home>
References: <20200629104749.46938-1-nolange79@gmail.com>
 <20200714151459.6ee4ca7a@windsurf.home>
 <CADYdroPBcpgMkNme2OP8jz3SX-+3J7eDqp0r8UbWXh_swvNkVQ@mail.gmail.com>
 <20200714155207.08d6ffb1@windsurf.home>
Message-ID: <CADYdroM9wPyVGM2_oAcKcMYBHjYdfEPrd7YKL5QozGP3kDXPHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Di., 14. Juli 2020 um 15:52 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Tue, 14 Jul 2020 15:35:22 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > > Also, was there any specific motivation/issue for this change, or just
> > > make things "nicer" ?
> >
> > Removal of stuff like this:
> > ifeq ($(BR2_INIT_SYSTEMD),y)
> > LTTNG_LIBUST_CONF_OPTS += --with-lttng-system-rundir=/run/lttng
> > endif
>
> I'm confused, this snippet of code is for systemd configurations only,
> and your patch doesn't change anything for systemd-based systems, where
> /var/run was already a symlink to /run.
>
> Could you clarify ?

chronological:

-   Buildroot uses /var/run as RUNTIME directory for SysV, and /run for systemd.
-   I add the lttng patch above to use either /var/run/lttng or /run/lttng
-   I consider doing the same for dbus as I get warnings otherwise
(actually have a post_install script replacing /var/run with /run)
-   I consider it would be alot easier to just use /run everywhere and
add this patch to see if that's accepted, before doing more
if-butt-ing like with lttng

So the end result should be that /var/run is treated as legacy
unconditionally, and packages would always use /run,
and don't depend on a symlink (potentially on a network drive). the
symlink schoul just be a safety net.

Norbert
