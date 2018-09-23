From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Sep 2018 12:24:12 +0200
Subject: [Buildroot] [PATCH 1/1] minizip: bump to version 2.5.3
In-Reply-To: <87d0t4j3qk.fsf@tkos.co.il>
References: <20180922205824.3917-1-fontaine.fabrice@gmail.com>
 <87d0t4j3qk.fsf@tkos.co.il>
Message-ID: <CAPi7W82L+hgThoVZ-dW35r2oRG+2Sv+7MUU22KkwyqwLrXRRcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch,

Le dim. 23 sept. 2018 ? 05:24, Baruch Siach <baruch@tkos.co.il> a ?crit :

> Hi Fabrice,
>
> Fabrice Fontaine writes:
> > - Move to cmake infrastructure
> > - Do not enforce zlib dependency
> > - Add optional bzip2 dependency
> > - Add mandatory host-pkgconf and libbsd dependency
> > - Add hash for license file
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/minizip/Config.in    |  8 ++++++++
> >  package/minizip/minizip.hash |  3 ++-
> >  package/minizip/minizip.mk   | 21 +++++++++++++++++----
> >  3 files changed, 27 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/minizip/Config.in b/package/minizip/Config.in
> > index 7205e0007e..440f2e170c 100644
> > --- a/package/minizip/Config.in
> > +++ b/package/minizip/Config.in
> > @@ -1,5 +1,9 @@
> >  config BR2_PACKAGE_MINIZIP
> >       bool "minizip"
> > +     depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
> > +     depends on BR2_USE_WCHAR # libbsd
> > +     select BR2_PACKAGE_LIBBSD
> >       select BR2_PACKAGE_ZLIB
>
> This select is no longer needed since zlib is now an optional dependency.
>
Indeed, thanks for your review. I also forget to  update --enable-demos. I
will send a v2.

>
> baruch
>
> >       help
> >         Enables to extract files from a .zip archive file.
> > @@ -13,3 +17,7 @@ config BR2_PACKAGE_MINIZIP_DEMOS
> >       depends on BR2_PACKAGE_MINIZIP
> >       help
> >         Enable miniunzip/minizip binary tools.
> > +
> > +comment "minizip needs a toolchain w/ threads, wchar"
> > +     depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> > +     depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> > diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
> > index 718026c1f6..f77d40a02c 100644
> > --- a/package/minizip/minizip.hash
> > +++ b/package/minizip/minizip.hash
> > @@ -1,2 +1,3 @@
> >  # Locally computed
> > -sha256
> 5666b5ee3e85dfd2dd119970613c12e6267d31813f07d3ffa5d359fe272cb6d1
> minizip-1.1.tar.gz
> > +sha256
> 0afe6528f530cc9c1440053a7bbff53087e86f849e145d233464052c730431e9
> minizip-2.5.3.tar.gz
> > +sha256
> 87642305968765a4030fd202ff7006afa67274da7f9bde84506e51ae58ecc2b4  LICENSE
> > diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
> > index bcd6cc928f..20563cfabe 100644
> > --- a/package/minizip/minizip.mk
> > +++ b/package/minizip/minizip.mk
> > @@ -4,13 +4,26 @@
> >  #
> >
> ################################################################################
> >
> > -MINIZIP_VERSION = 1.1
> > +MINIZIP_VERSION = 2.5.3
> >  MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
> > -MINIZIP_DEPENDENCIES = zlib
> > -MINIZIP_AUTORECONF = YES
> > +MINIZIP_DEPENDENCIES = host-pkgconf libbsd
> >  MINIZIP_INSTALL_STAGING = YES
> >  MINIZIP_CONF_OPTS = $(if $(BR2_PACKAGE_MINIZIP_DEMOS),--enable-demos)
> >  MINIZIP_LICENSE = Zlib
> >  MINIZIP_LICENSE_FILES = LICENSE
> >
> > -$(eval $(autotools-package))
> > +ifeq ($(BR2_PACKAGE_BZIP2),y)
> > +MINIZIP_DEPENDENCIES += bzip2
> > +MINIZIP_CONF_OPTS += -DUSE_BZIP2=ON
> > +else
> > +MINIZIP_CONF_OPTS += -DUSE_BZIP2=OFF
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_ZLIB),y)
> > +MINIZIP_DEPENDENCIES += zlib
> > +MINIZIP_CONF_OPTS += -DUSE_ZLIB=ON
> > +else
> > +MINIZIP_CONF_OPTS += -DUSE_ZLIB=OFF
> > +endif
> > +
> > +$(eval $(cmake-package))
>
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180923/36415f65/attachment.html>
