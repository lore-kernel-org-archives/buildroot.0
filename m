From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 15 Jul 2020 15:53:12 +0200
Subject: [Buildroot] [PATCH] system/skeleton: make /var/run a symlink to
 /run
In-Reply-To: <20200715154338.1e52ffe5@windsurf.home>
References: <20200629104749.46938-1-nolange79@gmail.com>
 <20200714151459.6ee4ca7a@windsurf.home>
 <CADYdroPBcpgMkNme2OP8jz3SX-+3J7eDqp0r8UbWXh_swvNkVQ@mail.gmail.com>
 <20200714155207.08d6ffb1@windsurf.home>
 <CADYdroM9wPyVGM2_oAcKcMYBHjYdfEPrd7YKL5QozGP3kDXPHA@mail.gmail.com>
 <20200715154338.1e52ffe5@windsurf.home>
Message-ID: <CADYdroN0JsN4BS6QWX-wruwSrnBQSZmWBy1FTzPYej6tygdxNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mi., 15. Juli 2020 um 15:43 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Tue, 14 Jul 2020 16:22:25 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > chronological:
> >
> > -   Buildroot uses /var/run as RUNTIME directory for SysV, and /run for systemd.
> > -   I add the lttng patch above to use either /var/run/lttng or /run/lttng
> > -   I consider doing the same for dbus as I get warnings otherwise
> > (actually have a post_install script replacing /var/run with /run)
> > -   I consider it would be alot easier to just use /run everywhere and
> > add this patch to see if that's accepted, before doing more
> > if-butt-ing like with lttng
>
> But then, you have to anyway tweak lttng to pass:
>
> LTTNG_LIBUST_CONF_OPTS += --with-lttng-system-rundir=/run/lttng
>
> but unconditionally, and no longer depending on whether systemd is used
> or not. Correct ?

That's the idea, yes.

> But... /run is already a tmpfs in sysv-based systems, so what prevents
> today from using /run/lttng even for sysv based systems ?

Ok, I missed that bit, thought it would have unrelated /run and
/var/run directories.
So this patch is just a cleanup then, and buildroot already *always*
uses a tmpfs /run (with compatibilty symlink /var/run),
and I can use /run with lttng and dbus whether this cleanup is merged or not?

I'd redo the patch with those removed, if you agree:

package/skeleton-init-openrc/skeleton/var/run
package/skeleton-init-sysv/skeleton/var/run

Or do nothing if you dont ;)
My new argument would be that this would prevent false assumptions (like mine).

Norbert
