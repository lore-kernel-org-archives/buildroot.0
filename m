From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 14:14:56 +0200
Subject: [Buildroot] [PATCH v2 01/14] package/systemd: configure nss
 plugins in nsswitch.conf
In-Reply-To: <20200615114825.GZ2346@scaer>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-2-nolange79@gmail.com>
 <20200615114825.GZ2346@scaer>
Message-ID: <CADYdroNsfJ1dvjzRyoG6vEamVdNbDqhBtv9qrGXUm-jqSysakw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 15. Juni 2020 um 13:48 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, All,
>
> On 2020-06-15 09:20 +0200, Norbert Lange spake thusly:
> > This adds configuration of the nsswitch.conf file,
> > it does so by pathing the template provided by systemd.
> >
> > The template is fully populated, the services that are
> > not available are removed.
> >
> > If the plugin nss-compat is not available, the entries
> > will be replaced with nss-files.
>
> systemd is glibc-only, and libnss_compat.so* is provided by glibc. What
> glibc does not provide it?

see: toolchain/toolchain-external/pkg-toolchain-external.mk
you only copy over ibnss_files there.

>
> > nss-systemd is used for the DynamicUser features,
> > which is a defacto necessity for systemd.
> > It handles transient users/groups without
> > touching the /etc/{passwd,group} files on disk.
> >
> > nss-myhostname allows resolving the hostname,
> > again without touching files in /etc.
> > Enabling this feature requires configuring the plugin.
> >
> > nss-resolve is part of resolved, and required for
> > consistent dns lookups.
> >
> > nss-mymachines adds name resolution from
> > containers.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  package/systemd/systemd.mk | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index e61cec80f0..cf6c0f9576 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -472,7 +472,23 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
> >       touch $(TARGET_DIR)/etc/machine-id
> >  endef
> >
> > +define SYSTEMD_NSSCONFIG_HOOK
> > +     [ -r "$$(find $(TARGET_DIR)/usr/lib -name libnss_compat.so.*)" ] || \
>
> As said above, this is supposed to always exist in a glibc-based
> toolchain, which is all that systemd supports, so I don;t see why we
> would want to replace the 'compat' plugin by the 'files' one.

Well, until now, buildroot did use nothing but 'files'. I am not
against changing that,
but I dont complain about having the choice.
the 'compat' plugin doesn't add anything I care about, if it adds IPC
then I would
actually prefer not using it.

>
> > +             sed 's,\bcompat\b,files,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf
>
> We already have a variable that does 'sed -i' :
>
>     $(SED) 's,\bcompat\b,files,g' $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf
>
> > +     [ "$(BR2_PACKAGE_SYSTEMD_RESOLVED)" = "y" ] || \
>
> Usually, we do not test configuration-level conditions in shell, but in
> Makefile:
>
>     ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
>     define SYSTEMD_NSSWITCH_CONF_RESOLVED
>         sed blablabla...
>     endef
>     SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_NSSWITCH_CONF_RESOLVED   # See below, point 3...
>     endif

That's overly fragmented IHMO,
I thought about $(if $(BR2_PACKAGE_SYSTEMD_RESOLVED),sed blahblah),
that would need replacing of the commas.

>
> > +             sed -e 's,\bresolve[[:space:]][[:space:]]*\[[^]]*\][[:space:]]*,,g' \
>
> "[[:space:]][:space:]]*" is equivalent to "[[:space:]]+".
>
> > +             -e 's,\bresolve\b[[:space:]]*,,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf
>
> As I understand it, you are trying to remove the 'resolve' plugin,
> whether it has a follwing "[action]" or not, right? If so, here's my
> proposal of a simpler regexp that cactches both cases:
>
>     's,\bresolve[[:space:]]+(\[[^]]+\])?[[:space:]],,g'

I suppose $(SED) enables extended regex?

>
> > +     [ "$(BR2_PACKAGE_SYSTEMD_MYHOSTNAME)" = "y" ] || \
> > +             sed -e 's,\bmyhostname[[:space:]][[:space:]]*\[[^]]*\][[:space:]]*,,g' \
> > +             -e 's,\bmyhostname\b[[:space:]]*,,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf
>
> Ditto the condition and the sed regexp.
>
> > +     [ "$(BR2_PACKAGE_SYSTEMD_MACHINED)" = "y" ] || \
> > +             sed -e 's,\bmymachines[[:space:]][[:space:]]*\[[^]]*\][[:space:]]*,,g' \
> > +             -e 's,\bmymachines\b[[:space:]]*,,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf
>
> Ditto the condition and the sed regexp.
>
> > +     install -m644 $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf
>
> I'm definitely not happy with all those hacks, because:
>
>  1. /etc/nsswitch.conf is already provided by the glibc package, so
>     overwriting it will not play nicely with per-package directories,

using a separate default for systemd might make sense in the glibc package?
what about your arguments about 'compat' vs 'files' here?

At any rate, the file in /usr/share/factory/etc/nsswitch.conf should
prolly be kept in sync or removed.

>
>  2. we already have other packages that may tweak that file, like:
>     package/nss-mdns/nss-mdns.mk
>     package/nss-myhostname/nss-myhostname.mk
>
>  3. which brings us to the point that this file should be tweaked as a
>     target-finalize hook

kinda like this ?:
https://github.com/nolange/buildroot/commit/237eebe9c29c3b8ab68d3abead52e1b7b08e1649

Note that I am missing the line for mymachines, my sed-foo is too weak
to add that at the correct position.

Norbert
