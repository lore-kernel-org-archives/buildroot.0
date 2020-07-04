From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jul 2020 23:38:39 +0200
Subject: [Buildroot] [PATCH v3] package/systemd: register NSS plugins in
 nsswitch.conf
In-Reply-To: <CADYdroNeoJmoR770sFVVhokGRqhnp8nNYEw_E4Hr7fPN1FGahw@mail.gmail.com>
References: <20200703234923.174320-1-nolange79@gmail.com>
 <20200704080025.GC2273@scaer>
 <CADYdroMZwKBuzNKxXvj7muHNMWDAiDNCOXBzEMbq_mkONFf1uw@mail.gmail.com>
 <20200704192738.GD2273@scaer>
 <CADYdroNeoJmoR770sFVVhokGRqhnp8nNYEw_E4Hr7fPN1FGahw@mail.gmail.com>
Message-ID: <20200704213839.GE2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-07-04 22:49 +0200, Norbert Lange spake thusly:
> Am Sa., 4. Juli 2020 um 21:27 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
> > No, that is exactly what target-finalize is for. ROOTFS_PRE_CMD_HOOKS
> > are not here to modify the files, but to fixup the layout is some very
> > rare corner cases (and the rare corner case I am talking about, was
> > exactly having systemd run on a read-only filesystem with a working
> > factory; go check the commit logs for the gory details ;-) ).
> 
> I meant if you need an order like
> systemd (fixup nsswitch.conf) -> mdns4 (fixup nsswitch.conf) ->
> systemd (pickup nsswitch.conf *after all modifications*)
> 
> then you are out of luck, and need to use ROOTFS_PRE_CMD_HOOKS,

Not even, becasue if two packages define ROOTFS_PRE_CMD_HOOKS, then
those are always run in alphabetical order (based on the package name).

So it's back to square one: there is no way to define dependency order
for hooks inside a step.

> or use some weird tricks like in [1], where I re-add PURGE_LOCALES.
> (I will redo those patches, doing that cleanup in systemd.mk).

Yes, I saw it, and I haven't replied yet because:

  - I don't like that nasty trick, but...
  - I don't have an alternative solution to offer. Not yet...

So I'd have to think about it yet more...

> Yeah, I see'n that trickery with tmpfiles.d ;)
> But I guess multiple lists of PRE_CMD / TARGET_FINALIZE HOOKS would ease
> some pains (like adding _EARLY and _LATE variants).

That would not be very helpful either, because we would tehn want to
have early hooks to run before some other early hooks. This is an
endless errand...

And in the end, if as a end-user of Buildroot,there are things you
really want to be done in a specific order, then there always is the
possibility to provide a post-build script.

> Btw, I use a different approach by pre-creating all used directories,
> and mounting /var/tmp as tmpfs. This allows startup without any errors,
> intended for when it's not possible to mount the usual overlayfs for RW access.

It was my understanding that, should /var be read-only, systemd would
automatically mount a tmpfs on it and populate it with its counterpart
from the factory.

Or something along those lines...

> > Thanks for your v4! :-)  I'll handle itm soonish.
> >
> > BTW, I have a new version of dbus-broker that is working and clean; I'll
> > send it later too (test running while I write this email).
> 
> Great, I hope I'll get my stuff upstream in time for systemd 246,
> should be able to build a pretty lean systemd rootfs with ~16MB size
> (~23MB today) then.

I would say that size should not be the driving force ehind those
changes, because 16MiB is already a lot. If you really are after size,
then sysv-init, busybox, or even openrc are better alternatives (busybox
would make for a ~1.5MiB runtime on uClibc, so a minimalist systemd-based
system is already an order of magnitude bigger than that).

Rather, I think the "surface attack", unused components or unwanted
components, is a better approach to sell these changes.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
