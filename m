From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Jun 2020 14:14:45 +0200
Subject: [Buildroot] Fwd: [PATCH v2 01/14] package/systemd: configure
 nss plugins in nsswitch.conf
In-Reply-To: <CADYdroN1mjpXYfYN+rxE21S6+tiMGqK53xWVn1bqS_XS6Uwp9A@mail.gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-2-nolange79@gmail.com>
 <20200615114825.GZ2346@scaer>
 <CADYdroNsfJ1dvjzRyoG6vEamVdNbDqhBtv9qrGXUm-jqSysakw@mail.gmail.com>
 <20200615165410.GB2346@scaer>
 <CADYdroPsOpAcuBAmNe1H=N2of1PAZSBjq4=TyO+6hdFniNorTA@mail.gmail.com>
 <CADYdroN1mjpXYfYN+rxE21S6+tiMGqK53xWVn1bqS_XS6Uwp9A@mail.gmail.com>
Message-ID: <20200627121445.GA20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-06-26 00:27 +0200, Norbert Lange spake thusly:
> Seems I missed the reply all,
> would like to know if I can add something like this in *systemd.mk*,
> or if this is against buildroots policy:
> 
> GLIBC_NSS_PLUGIN_RESOLVE = resolve

No, this is not acceptable. Packages must not mess with other packages.

As I already explained, tweaking the nsswitch,conf file *must* be done
as target-finalize hooks, like is already used in systemd to generate
the hwdb for example.

Additionally, if you really want to have the factory nsswitch.conf to be
up-to-date with the one in ./etc, then copy if from the one in /etc
after it has been tweaked.

Regards,
Yann E. MORIN.

> Norbert
> 
> ---------- Forwarded message ---------
> Von: Norbert Lange <nolange79@gmail.com>
> Date: Mo., 15. Juni 2020 um 20:12 Uhr
> Subject: Re: [PATCH v2 01/14] package/systemd: configure nss plugins
> in nsswitch.conf
> To: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> 
> Am Mo., 15. Juni 2020 um 18:54 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
> >
> > Norbert, All,
> >
> > On 2020-06-15 14:14 +0200, Norbert Lange spake thusly:
> > > Am Mo., 15. Juni 2020 um 13:48 Uhr schrieb Yann E. MORIN
> > > <yann.morin.1998@free.fr>:
> > > >
> > > > Norbert, All,
> > > >
> > > > On 2020-06-15 09:20 +0200, Norbert Lange spake thusly:
> > > > > This adds configuration of the nsswitch.conf file,
> > > > > it does so by pathing the template provided by systemd.
> > > > >
> > > > > The template is fully populated, the services that are
> > > > > not available are removed.
> > > > >
> > > > > If the plugin nss-compat is not available, the entries
> > > > > will be replaced with nss-files.
> > > >
> > > > systemd is glibc-only, and libnss_compat.so* is provided by glibc. What
> > > > glibc does not provide it?
> > > see: toolchain/toolchain-external/pkg-toolchain-external.mk
> > > you only copy over ibnss_files there.
> >
> > Aha. But then I think this is more an oversight than a deliberate
> > filtering. In my opinion, the list should include libnss_*.so.*.
> >
> > > > > nss-systemd is used for the DynamicUser features,
> > > > > which is a defacto necessity for systemd.
> > > > > It handles transient users/groups without
> > > > > touching the /etc/{passwd,group} files on disk.
> > > > >
> > > > > nss-myhostname allows resolving the hostname,
> > > > > again without touching files in /etc.
> > > > > Enabling this feature requires configuring the plugin.
> > > > >
> > > > > nss-resolve is part of resolved, and required for
> > > > > consistent dns lookups.
> > > > >
> > > > > nss-mymachines adds name resolution from
> > > > > containers.
> > > > >
> > > > > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > > > > ---
> > > > >  package/systemd/systemd.mk | 16 ++++++++++++++++
> > > > >  1 file changed, 16 insertions(+)
> > > > >
> > > > > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > > > > index e61cec80f0..cf6c0f9576 100644
> > > > > --- a/package/systemd/systemd.mk
> > > > > +++ b/package/systemd/systemd.mk
> > > > > @@ -472,7 +472,23 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
> > > > >       touch $(TARGET_DIR)/etc/machine-id
> > > > >  endef
> > > > >
> > > > > +define SYSTEMD_NSSCONFIG_HOOK
> > > > > +     [ -r "$$(find $(TARGET_DIR)/usr/lib -name libnss_compat.so.*)" ] || \
> > > >
> > > > As said above, this is supposed to always exist in a glibc-based
> > > > toolchain, which is all that systemd supports, so I don;t see why we
> > > > would want to replace the 'compat' plugin by the 'files' one.
> > >
> > > Well, until now, buildroot did use nothing but 'files'. I am not
> > > against changing that,
> > > but I dont complain about having the choice.
> > > the 'compat' plugin doesn't add anything I care about, if it adds IPC
> > > then I would
> > > actually prefer not using it.
> >
> > So I had a look at the nsswitch.conf man page, and the 'compat' plugin
> > is described as:
> >
> >     The NSS "compat" service is similar to "files" except that it
> >     additionally permits special entries in corresponding files for
> >     granting users or members of netgroups access to the system.
> >
> > So, in the context of Buildroot, we can just plain replace 'compat' with
> > 'files' uncondtionally.
> >
> > > > > +             sed 's,\bcompat\b,files,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf
> > > >
> > > > We already have a variable that does 'sed -i' :
> > > >
> > > >     $(SED) 's,\bcompat\b,files,g' $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf
> > > >
> > > > > +     [ "$(BR2_PACKAGE_SYSTEMD_RESOLVED)" = "y" ] || \
> > > >
> > > > Usually, we do not test configuration-level conditions in shell, but in
> > > > Makefile:
> > > >
> > > >     ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
> > > >     define SYSTEMD_NSSWITCH_CONF_RESOLVED
> > > >         sed blablabla...
> > > >     endef
> > > >     SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_NSSWITCH_CONF_RESOLVED   # See below, point 3...
> > > >     endif
> > > That's overly fragmented IHMO,
> >
> > ... but much more in line with how we do it elsewhere.
> >
> > > I thought about $(if $(BR2_PACKAGE_SYSTEMD_RESOLVED),sed blahblah),
> > > that would need replacing of the commas.
> >
> > Alternatively, that could be used, yes, but I still prefer the one-hook
> > per option, even if it is still fragmented.
> >
> > But the conditional options already exist elsewhere in the file, so the
> > corresponding conditional blocks can be re-used and extended. For example,
> > there is already a conditional block for BR2_PACKAGE_SYSTEMD_RESOLVED:
> >
> >     https://git.buildroot.org/buildroot/tree/package/systemd/systemd.mk#n394
> >
> >      ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
> >      define SYSTEMD_INSTALL_RESOLVCONF_HOOK
> >          ln -sf ../run/systemd/resolve/resolv.conf \
> >              $(TARGET_DIR)/etc/resolv.conf
> >      endef
> >      SYSTEMD_CONF_OPTS += -Dnss-resolve=true -Dresolve=true
> >      SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - systemd Resolver
> >     +define SYSTEMD_NSSWITCH_CONF_RESOLVED
> >     +    sed blablabla...
> >     +endef
> >     +SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_NSSWITCH_CONF_RESOLVED
> >      else
> >      SYSTEMD_CONF_OPTS += -Dnss-resolve=false -Dresolve=false
> >      endif
> >
> > > > > +             sed -e 's,\bresolve[[:space:]][[:space:]]*\[[^]]*\][[:space:]]*,,g' \
> > > >
> > > > "[[:space:]][:space:]]*" is equivalent to "[[:space:]]+".
> > > >
> > > > > +             -e 's,\bresolve\b[[:space:]]*,,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf
> > > >
> > > > As I understand it, you are trying to remove the 'resolve' plugin,
> > > > whether it has a follwing "[action]" or not, right? If so, here's my
> > > > proposal of a simpler regexp that cactches both cases:
> > > >
> > > >     's,\bresolve[[:space:]]+(\[[^]]+\])?[[:space:]],,g'
> > > I suppose $(SED) enables extended regex?
> >
> > Unfortunately, it does not (so it matches your usage):
> >
> >     https://git.buildroot.org/buildroot/tree/Makefile#n313
> >
> > Hmm... But see below, using $(SED) might not be a good idea.
> 
> The "below" seems missing, dont see where this is picked up again.
> 
> >
> > [--SNIP--]
> > > >  1. /etc/nsswitch.conf is already provided by the glibc package, so
> > > >     overwriting it will not play nicely with per-package directories,
> > > using a separate default for systemd might make sense in the glibc package?
> > > what about your arguments about 'compat' vs 'files' here?
> >
> > Moot now: switch to using 'files' unconditionally.
> >
> > > At any rate, the file in /usr/share/factory/etc/nsswitch.conf should
> > > prolly be kept in sync or removed.
> >
> > Not sure I understand that one...
> 
> The files should be identical on the rootfs, or just
> /etc/nsswitch.conf should remain.
> 
> >
> > > >  2. we already have other packages that may tweak that file, like:
> > > >     package/nss-mdns/nss-mdns.mk
> > > >     package/nss-myhostname/nss-myhostname.mk
> > > >
> > > >  3. which brings us to the point that this file should be tweaked as a
> > > >     target-finalize hook
> > >
> > > kinda like this ?:
> > > https://github.com/nolange/buildroot/commit/237eebe9c29c3b8ab68d3abead52e1b7b08e1649
> >
> > I still think it should be made to be target-finalize hooks, one for
> > each option.
> >
> > Also, I don;t get why you want to use the one in factory, rather than
> > tweak the existing /etc/nsswitch.conf that has already been installed,
> > like the other nss plugins do.
> 
> I did not know about other nss plugins, I blindly assumed buildroot consequently
> ignored nsswitch.conf.
> I use the one in the factory to use a known template, instead potentially
> messing up after multiple target installs (I know, not official supported,
> but I bet its common to dir-clean a package and make again).
> 
> >
> > And then, at the end. copy the one from /etc/nsswitch.conf over to the
> > one in factory. That last one is a bit more tricky to come up with
> > correctly, as this must be done after all nss plugins have had a chance
> > to tweak nsswitch.conf. So I guess we should extend SYSTEMD_ROOTFS_PRE_CMD_HOOKS
> > with a new hook that copies /etc/nsswitch.conf over to the factory.
> 
> I brought this up before, what about adding a full featured
> /etc/nsswitch.conf in
> either glibc or one of the skeletons?
> 
> Or even crazier, add one with placeholders for *all* packages in buildroot
> in package glibc, and packages wanting to hook
> a nss plugin would set a variable, in the form:
> 
> # (this is in systemd.mk, hope a variable with GLIBC prefix is allowed?)
> GLIBC_NSS_PLUGIN_RESOLVE = resolve
> 
> # this is in glibc.mk
> define GLIBC_INSTALL_NSSWITCH_HOOK
>   sed $(SYSTEMD_PKGDIR)/nsswitch.tmp > $(TARGET_DIR)/etc/nsswitch.conf \
>     -e 's, at resolve@,$(GLIBC_NSS_PLUGIN_RESOLVE),g'
>     ......
> endef
> GLIBC_TARGET_FINALIZE_HOOKS += GLIBC_INSTALL_NSSWITCH_HOOK
> 
> I'd work out the details, so tell me if that's a viable solution.
> The advantages would be that you can have a consistent order of nss
> plugins in the template,
> and that the file is generated at one place, instead in a potentially
> changing order of
> sed's
> 
> The downside of course would be that this place would need to know
> about all nss plugins,
> but if you want to hook up a new plugin you should need to think about
> the correct order
> relative to all other plugins.
> 
> 
> >
> > Regards,
> > Yann E. MORIN.
> >
> > > Note that I am missing the line for mymachines, my sed-foo is too weak
> > > to add that at the correct position.
> 
> Case in point.
> 
> (I hope its not this line you meant with "using $(SED) might not be a
> good idea")
> 
> Norbert

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
