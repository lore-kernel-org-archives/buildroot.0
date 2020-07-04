From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jul 2020 21:27:38 +0200
Subject: [Buildroot] [PATCH v3] package/systemd: register NSS plugins in
 nsswitch.conf
In-Reply-To: <CADYdroMZwKBuzNKxXvj7muHNMWDAiDNCOXBzEMbq_mkONFf1uw@mail.gmail.com>
References: <20200703234923.174320-1-nolange79@gmail.com>
 <20200704080025.GC2273@scaer>
 <CADYdroMZwKBuzNKxXvj7muHNMWDAiDNCOXBzEMbq_mkONFf1uw@mail.gmail.com>
Message-ID: <20200704192738.GD2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-07-04 19:15 +0200, Norbert Lange spake thusly:
> Am Sa., 4. Juli 2020 um 10:00 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
> > On 2020-07-04 01:49 +0200, Norbert Lange spake thusly:
> > > This supports 4 plugins, each will be added at the right
> > > spot if enabled, based on the template coming with systemd.
[--SNIP--]
> > >  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> > > +     SYSTEMD_ADD_NSSCONFIG_HOOK \
> > As I already said: ths must be a target-finalize hook, not a
> > post-install hook.
> I missed that, but I still don't see the argument for that,
> did post a v4 as I dont want to get stuck on that.
> 
> If the NSSCONFIG_HOOK needs to run after glibc is installed,
> this could and IMHO should be done by a dependency to glibc?

This has nothing to do on a dependency to glibc: glibc is part of the
toolchain, and the dependency to the toolchain is a given for all target
packages: it is enfirced by the infrastructure. And so, glibc is always
built and installed before any target package.

However, there are three other nss plugins, and they already do the
nsswith.conf tweaks as a target-finalize hook.

So, for consistency with those, systemd must also do the tweaking as a
target-finalize hook. But that is not the main reason...

The main reason is per-paclkage directories and top-level parallel build.

nsswitch.conf is a file installed by one package, so opther packages
should not modify it during their build/install steps, otherwise this
will play badly with per-package directories, which is needed for
top-level parallel build.

Indeed, systemd and nss-pam-ldap (for example) have no dependency one on
the other (and that's OK, because there actually is no dependency,
runtime or build time, so we don't want to introduce it).

So, they would each get their own private copy of nsswitch.conf, and the
one seen and modified by systemd will not contain the changes in the one
seen and modified by nss-pam-ldap, and conversely.

But at the end, each per-package target/ dir are collected to eventually
form the final and complete target/ directory.

And now we have an issue: the nsswitch.conf from two packages are
different, and the last to be copied will win, thus anihilating the
changes from a previous package.

But the target-finalize hooks are called after this gathering of ppd
target/ is done, so it works on the final and definitive nsswitch.conf.

TL;DR: if you need to modify the file of another package, do it in a
target-finalize hook.

> There aren't that much "phases" in buildroot, if you want to operate on
> the final nsswitch.cfg you now only have PRE_CMD_HOOKS left.

No, that is exactly what target-finalize is for. ROOTFS_PRE_CMD_HOOKS
are not here to modify the files, but to fixup the layout is some very
rare corner cases (and the rare corner case I am talking about, was
exactly having systemd run on a read-only filesystem with a working
factory; go check the commit logs for the gory details ;-) ).

Thanks for your v4! :-)  I'll handle itm soonish.

BTW, I have a new version of dbus-broker that is working and clean; I'll
send it later too (test running while I write this email).

Regards,
Yann E. MORIN.

> Norbert
> 
> >
> > Regards,
> > Yann E. MORIN.
> >
> > >       SYSTEMD_INSTALL_INIT_HOOK \
> > >       SYSTEMD_INSTALL_MACHINEID_HOOK \
> > >       SYSTEMD_INSTALL_RESOLVCONF_HOOK
> > > --
> > > 2.27.0
> > >
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
