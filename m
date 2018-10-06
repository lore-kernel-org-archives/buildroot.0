From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 6 Oct 2018 19:36:34 +0200
Subject: [Buildroot] [PATCH] xapian: new package
In-Reply-To: <CANQCQpbJmQ7Vk6-265viJksFRuBe+y_EsFPk9dDA-6Jwn9xqyw@mail.gmail.com>
References: <1538818604-4576-1-git-send-email-gilles.talis@gmail.com>
 <CANQCQpbJmQ7Vk6-265viJksFRuBe+y_EsFPk9dDA-6Jwn9xqyw@mail.gmail.com>
Message-ID: <CAKcgs2yp_29bOmqDeHmYMYtrA1S7Af+_cfDx7zHWXPkqbuUj1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Thanks for your review.
Le sam. 6 oct. 2018 ? 16:14, Matthew Weber
<matthew.weber@rockwellcollins.com> a ?crit :
>
> Gilles,
>
> On Sat, Oct 6, 2018 at 4:37 AM Gilles Talis <gilles.talis@gmail.com> wrote:
> >
> > Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> > ---
> >  DEVELOPERS                 |  1 +
> >  package/Config.in          |  1 +
> >  package/xapian/Config.in   | 13 +++++++++++++
> >  package/xapian/xapian.hash |  3 +++
> >  package/xapian/xapian.mk   | 14 ++++++++++++++
> >  5 files changed, 32 insertions(+)
> >  create mode 100644 package/xapian/Config.in
> >  create mode 100644 package/xapian/xapian.hash
> >  create mode 100644 package/xapian/xapian.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 74bc703..dbb55c8 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -886,6 +886,7 @@ F:  package/leptonica/
> >  F:     package/ocrad/
> >  F:     package/tesseract-ocr/
> >  F:     package/webp/
> > +F:     package/xapian/
> >
> >  N:     Giulio Benetti <giulio.benetti@micronovasrl.com>
> >  F:     package/sunxi-mali-mainline/
> > diff --git a/package/Config.in b/package/Config.in
> > index 17627ad..80823e3 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1657,6 +1657,7 @@ endif
> >         source "package/tinycbor/Config.in"
> >         source "package/tz/Config.in"
> >         source "package/tzdata/Config.in"
> > +       source "package/xapian/Config.in"
> >  endmenu
> >
> >  menu "Security"
> > diff --git a/package/xapian/Config.in b/package/xapian/Config.in
> > new file mode 100644
> > index 0000000..c1d952d
> > --- /dev/null
> > +++ b/package/xapian/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_XAPIAN
> > +       bool "xapian"
> > +       depends on BR2_INSTALL_LIBSTDCPP
> > +       depends on BR2_USE_MMU # fork()
> > +       select BR2_PACKAGE_ZLIB
> > +       help
> > +         Xapian is an open Source search engine Library
> > +         It is a highly adaptable toolkit which allows developers to easily add
> > +         advanced indexing and search facilities to their own applications.
> > +         It has built-in support for several families of weighting models and also
> > +         supports a rich set of boolean query operators.
> > +
> > +         https://xapian.org/
>
> Please run the following and fix the warnings (space/tabs)
> ./utils/check-package package/xapian/*
>
Thanks. I'll do that. Seems like I missed that part.

> > diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
> > new file mode 100644
> > index 0000000..4fd0dd1
> > --- /dev/null
> > +++ b/package/xapian/xapian.hash
> > @@ -0,0 +1,3 @@
> > +# locally computed
> > +sha256 13f08a0b649c7afa804fa0e85678d693fd6069dd394c9b9e7d41973d74a3b5d3 xapian-core-1.4.7.tar.xz
> > +sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42 COPYING
> > diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
> > new file mode 100644
> > index 0000000..63f9119
> > --- /dev/null
> > +++ b/package/xapian/xapian.mk
> > @@ -0,0 +1,14 @@
> > +################################################################################
> > +#
> > +# xapian
> > +#
> > +################################################################################
> > +
> > +XAPIAN_VERSION = 1.4.7
> > +XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
> > +XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
> > +XAPIAN_LICENSE = GPL-2.0+
> > +XAPIAN_LICENSE_FILES = COPYING
> > +XAPIAN_INSTALL_STAGING = YES
>
> XAPIAN_DEPENDENCIES = zlib
>
> Looking at the vagrant file for building this, it looks like there
> maybe a few different language bindings and configurations.  Are there
> any configuration opts you'd want to disable before building?
> (examples or test files?)
Actually, the most relevant configuration options that could be
disabled are related to internal databases management. I am not really
interested in disable them right now.

> Any additional dependencies to list out?
> https://git.xapian.org/?p=xapian;a=blob;f=Vagrantfile;h=8a7b7bcd4b04d180fff8c40bb0e064160300685b;hb=HEAD#l12
The only required dependency I could find is zlib. So no additional
dependencies to list out.

>
> I ran a test-pkg build and didn't see anything in the initial few
> tests.  I'll let it go and see if there is anything that pops up.
> ./utils/test-pkg -c xapian.cfg -d xapian_wip -a
> #   xapian.cfg would just contain your  BR2_PACKAGE_XAPIAN=y
>
> Output:
>                 armv5-ctng-linux-gnueabi [ 1/47]: OK
>               armv7-ctng-linux-gnueabihf [ 2/47]: OK
>                         br-aarch64-glibc [ 3/47]: OK
>                            br-arcle-hs38 [ 4/47]: OK
>                             br-arm-basic [ 5/47]: SKIPPED
>                   br-arm-cortex-a9-glibc [ 6/47]: OK
>
Thanks. I did run test-pkg only for the minimal 6 configurations and
did not find any obvious issue.

I'll send out a v2 shortly.

> Matt
