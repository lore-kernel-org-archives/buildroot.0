From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Mar 2019 19:08:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5enginio: needs ssl
In-Reply-To: <15021595-fc4a-db63-2868-2263f7af7fe1@mind.be>
References: <20190309222953.7785-1-fontaine.fabrice@gmail.com>
 <20190312232910.5c88999a@windsurf>
 <CAPi7W80-SshJCY0yMoxFu71ZBXYUsi4s_6y+LU7RdvwJcRvg7Q@mail.gmail.com>
 <15021595-fc4a-db63-2868-2263f7af7fe1@mind.be>
Message-ID: <CAPi7W80=5U7ujs_M98HbQKgop0j-pyjeq7sp_6i9Ep_W2myuKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Le mar. 26 mars 2019 ? 23:52, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>
>
> On 13/03/2019 00:06, Fabrice Fontaine wrote:
> > Hello Thomas,
> > Le mar. 12 mars 2019 ? 23:29, Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> a ?crit :
> >>
> >> Hello Fabrice,
> >>
> >> On Sat,  9 Mar 2019 23:29:53 +0100
> >> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >>
> >>> Remove select on BR2_PACKAGE_QT5BASE and BR2_PACKAGE_OPENSSL to avoid a
> >>> circular dependency
> >>
> >> I don't really understand where the "circular dependency" is.
> >>
> >> To me it seems like the problem is rather:
> >>
> >> """
> >> Qt 5.6 SSL support is no longer available with OpenSSL since the bump
> >> of OpenSSL to 1.1.x. Therefore selecting Qt5 and OpenSSL does not
> >> guarantee that qt5base will be built with SSL support. Due to this, the
> >> build of qt5enginio currently fails on Qt 5.6.
> >> """
> >>
> >>> diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
> >>> index 102058e7c5..cce0f2a1cb 100644
> >>> --- a/package/qt5/qt5enginio/Config.in
> >>> +++ b/package/qt5/qt5enginio/Config.in
> >>> @@ -1,7 +1,6 @@
> >>>  config BR2_PACKAGE_QT5ENGINIO
> >>>       bool "qt5enginio"
> >>> -     select BR2_PACKAGE_OPENSSL
> >>> -     select BR2_PACKAGE_QT5BASE
> >>> +     depends on BR2_PACKAGE_QT5BASE_OPENSSL
> >>
> >> Either we do this, or:
> >>
> >>         select BR2_PACKAGE_OPENSSL if BR2_PACKAGE_QT5_VERSION_LATEST
> >>         select BR2_PACKAGE_LIBRESSL if BR2_PACKAGE_QT5_VERSION_5_6
> > I tried this, but I assume that I must add the dependencies of
> > libressl if QT 5.6 is true, for example like this:
> >
> > depends on !BR2_PACKAGE_QT5_VERSION_5_6 || \
> >                 (BR2_PACKAGE_QT5_VERSION_5_6 && \
> >                 (!BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL && \
> >                 !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)))
> >
> > But then, this creates the following circular dependency:
> >
> > package/sqlcipher/Config.in:1:error: recursive dependency detected!
> > package/sqlcipher/Config.in:1: symbol BR2_PACKAGE_SQLCIPHER depends on
> > BR2_PACKAGE_SQLITE
> > package/sqlite/Config.in:1: symbol BR2_PACKAGE_SQLITE is selected by
> > BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM
> > package/qt5/qt5base/Config.in:104: symbol
> > BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM is part of choice <choice>
> > package/qt5/qt5base/Config.in:88: choice <choice> contains symbol <choice>
> > package/qt5/qt5base/Config.in:88: choice <choice> contains symbol
> > BR2_PACKAGE_QT5BASE
> > package/qt5/qt5base/Config.in:1: symbol BR2_PACKAGE_QT5BASE is
> > selected by BR2_PACKAGE_QT5ENGINIO
> > package/qt5/qt5enginio/Config.in:1: symbol BR2_PACKAGE_QT5ENGINIO
> > depends on BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> > package/openssl/Config.in:1: symbol
> > BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL is selected by
> > BR2_PACKAGE_SQLCIPHER
> >
> > Did I made a mistake? Shouldn't we add the libressl dependencies?
>
>  Whaa, kconfig...
>
>  How about just depending on QT5_LATEST || BR2_PACKAGE_QT5BASE_OPENSSL? Or does
> that also give a circular dependency?
Yes, adding the select suggested by Thomas and the above dependencies
also give a circular dependency.
The issue is that we can't select BR2_PACKAGE_LIBRESSL without adding
a circular dependency because of the
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL option that can be selected by
any package that can't work with libressl.
Currently, this option is selected by 4 packages: sqlcipher,
wpa_supplicant, tpm2-tss and softether.
So until this option is removed (if the above packages can work with
libressl), I think my current patch is the only solution.
>
>  Regards,
>  Arnout
>
>
> >>
> >> Best regards,
> >>
> >> Thomas
> >> --
> >> Thomas Petazzoni, CTO, Bootlin
> >> Embedded Linux and Kernel engineering
> >> https://bootlin.com
> > Best Regards,
> >
> > Fabrice
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
Best Regards,

Fabrice
