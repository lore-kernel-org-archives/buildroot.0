From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 22 Sep 2020 23:20:04 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/postgresql: needs locale
 command
In-Reply-To: <cb3d6427-c511-4b5d-56b0-6cd0a9fecb81@mind.be>
References: <20200920150659.7562-1-ps.report@gmx.net>
 <20200920150659.7562-2-ps.report@gmx.net>
 <20200921102013.622616ed@windsurf>
 <20200921220400.1717794e@gmx.net>
 <cb3d6427-c511-4b5d-56b0-6cd0a9fecb81@mind.be>
Message-ID: <20200922232004.354d1852@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Mon, 21 Sep 2020 23:22:24 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Peter,
>
> On 21/09/2020 22:04, Peter Seiderer wrote:
> > Hello Thomas,
> >
> > On Mon, 21 Sep 2020 10:20:13 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> >
> >> Hello,
> >>
> >> On Sun, 20 Sep 2020 17:06:58 +0200
> >> Peter Seiderer <ps.report@gmx.net> wrote:
> >>
> >>> Running (as e.g. /etc/init.d/S50postgresql does):
> >>>
> >>>   su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql'
> >>>
> >>> gives the following warning:
> >>>
> >>>   performing post-bootstrap initialization ... sh: locale: not found
> >>>   1970-01-01 01:13:43.498 UTC [246] WARNING:  no usable system locales were found
> >>>   ok
> >>
> >> What is the situation with uClibc and musl toolchains ? Do they provide
> >> the "locale" command as well ?
> >
> > - uclibc without BR2_TOOLCHAIN_BUILDROOT_LOCALE: no warning, no locale command ([1])
> > - uclicc with BR2_TOOLCHAIN_BUILDROOT_LOCALE: no warning, locale command installed on target
> > - musl: 'locale: not found' warning, no locale commmand
> >
> > But it is 'only' a warning... and easy to fix for gcc/buildroot toolchain...
> >
> >>
> >> What about external glibc toolchains ? Do we install/copy the locale
> >> tool to the target ?
>
>  I checked - no, we don't install it, even if it is part of the toolchain sysroot.
>
> > Do not know...., but it is only a warning...
>
>  It is only a warning, but this patch is meant to get rid of that warning, no?
> If this series only fixes that warning for the internal toolchain, I don't think
> it's very useful.

Get rid of the warning for one use case (where it is easy to fix) ;-)

>
>  But probably toolchain-external-pkg.mk should be fixed to install locale if
> available, just like we do for ldd. And maybe also ldconfig and getconf (the
> other two glibc utils we install) should be handled in the same way?

Will take a look...

>
>
> > Regards,
> > Peter
> >
> > [1] The usage of the locale command depends on 'HAVE_LOCALE_T' which depends
> > on the availability of the locale_t type (see postgresql-12.4/config/c-library.m4
> > and postgresql-12.4/src/backend/commands/collationcmds.c)
>
>  We could instead prepopulate the cache variable pgac_cv_type_locale_t with the
> presence of the locale binary in the target directory. Something like:
>
> POSTGRESQL_CONF_ENV += pgac_cv_type_locale_t=$(if $(wildcard
> $(TARGET_DIR)/usr/bin/locale),yes,no)
>
>  This is assuming that the presence of the locale executable corresponds with
> the availability of locales (which is apparently not the case for musl, but I
> think that that should be considered a bug in our musl integration). But at
> least for glibc and uClibc it seems to be correct.

I believe false assumption, locale_t type availability (and the availability of
different locale definitions) does not automatically mean the locale command will
be available (see glibc case without  BR2_PACKAGE_GLIBC_UTILS, and without
BR2_SYSTEM_ENABLE_NLS before patch 1)...

>
>  This solution also removes the need for patch 1/3, which I thought was a bit
> iffy anyway.

See above and any reasons why the locale command should be bound to NSL support?

Regards,
Peter

>
>  Regards,
>  Arnout
