From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 7 Jun 2020 22:05:49 +0200
Subject: [Buildroot] [PATCH 08/10] package/systemd: add hook to update
 journalctl catalogs
In-Reply-To: <20200607155652.GS13972@scaer>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-9-nolange79@gmail.com>
 <20200607155652.GS13972@scaer>
Message-ID: <CADYdroMLYXxMQvJKt6NGR0k+vMpfOK_jOGXh1mDoLRZyKz+XWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am So., 7. Juni 2020 um 17:57 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, All,
>
> On 2020-02-06 10:36 +0100, Norbert Lange spake thusly:
> > journald supports catalog files, or rather a binary database of
> > those.
> > This add a hook to create said database from the available
> > catalog source files (which are not needed afterwards).
> >
> > One ugly workaround is or ensuring that PURGE_LOCALES is
> > called before, we do this by adding this hook
> > (will then run twice during the finalize target step).
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  package/systemd/systemd.mk | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 6ea25e3363..8db3a1b117 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -500,6 +500,16 @@ define SYSTEMD_PRESET_ALL
> >  endef
> >  SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
> >
> > +define SYSTEMD_UPDATE_CATALOGS
> > +     $(HOST_DIR)/bin/journalctl --root=$(TARGET_DIR) --update-catalog
> > +endef
> > +
> > +# SYSTEMD_UPDATE_CATALOGS needs to run after PURGE_LOCALES
> > +ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> > +SYSTEMD_TARGET_FINALIZE_HOOKS += PURGE_LOCALES
> > +endif
> > +SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_UPDATE_CATALOGS
> > +
> >  SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> >  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> >
> > @@ -577,6 +587,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
> >  #   $(HOST_DIR)/lib
> >  # * thus re-tweak rpath after the installation for all binaries that need it
> >  HOST_SYSTEMD_HOST_TOOLS = \
> > +     journalctl \
>
> Why are you adding journalctl to this list?

Been some months or a year, can only speculate, might be that I
originally had to enable building this tool aswell (before rebases).

>
> This list is only used to fix the RPATH in the prgrams. If the programs
> do not need the RPATH, we don;t need to fix them up.
>
> This list is not about identifying the host tools we are using (indeed,
> most entries in that list are not used at all).
>
> If however, you foudn a case where journalctl needs an RPATH entry,
> then:
>   - explain why: identify the libraries involved, and add explicit
>     dependencies on the packages providign those libraries,
>   - send that change in a separate patch.

Ok. I believe most if not all of systemd's tools depend on
libsystemd-*-245.so. If that's the case then a regex might be easier?

% for s in system* journa*; do readelf -d $s | grep -q
libsystemd-shared-245.so && echo $s; done
systemd-analyze
systemd-ask-password
systemd-cat
systemd-cgls
systemd-cgtop
systemd-delta
systemd-detect-virt
systemd-escape
systemd-id128
systemd-machine-id-setup
systemd-mount
systemd-notify
systemd-nspawn
systemd-path
systemd-run
systemd-socket-activate
systemd-stdio-bridge
systemd-tmpfiles
systemd-tty-ask-password-agent
systemd-umount
journalctl


Norbert
