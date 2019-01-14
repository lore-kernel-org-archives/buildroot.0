From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Jan 2019 21:18:00 +0100
Subject: [Buildroot] [PATCH 1/1] mutt: bump to version 1.11.2
In-Reply-To: <CAMQcK5+jtwSinO1+59FQ7Z2NNAbpJvKTaOtR2QCw8U-VyB21Qw@mail.gmail.com>
References: <20190114191814.8340-1-fontaine.fabrice@gmail.com>
 <CAMQcK5+jtwSinO1+59FQ7Z2NNAbpJvKTaOtR2QCw8U-VyB21Qw@mail.gmail.com>
Message-ID: <CAPi7W819aDj0E=Db3CBe7eJZ2VDmfZV=AD0_Z6pJjP0j6+C4vA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan,

Le lun. 14 janv. 2019 ? 20:32, Ryan Barnett <ryan.barnett@collins.com> a ?crit :
>
> Fabrice,
>
> On Mon, Jan 14, 2019 at 1:18 PM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > Remove patch (rejected upstream:
> > https://gitlab.com/muttmua/mutt/merge_requests/25), an other solution
> > has been preferred:
> > https://gitlab.com/muttmua/mutt/commit/78db40f25c6479b14da5a73adf7207bfbec5ccc5)
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...tatic-build-with-libidn2-and-libunistring.patch | 36 ----------------------
> >  package/mutt/mutt.hash                             |  2 +-
> >  package/mutt/mutt.mk                               |  4 +--
> >  3 files changed, 2 insertions(+), 40 deletions(-)
> >  delete mode 100644 package/mutt/0001-Fix-static-build-with-libidn2-and-libunistring.patch
> >
> > diff --git a/package/mutt/0001-Fix-static-build-with-libidn2-and-libunistring.patch b/package/mutt/0001-Fix-static-build-with-libidn2-and-libunistring.patch
> > deleted file mode 100644
> > index 56b90f5e3b..0000000000
> > --- a/package/mutt/0001-Fix-static-build-with-libidn2-and-libunistring.patch
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -From 1baceb95bd8e6f35c25bc7afdc6a88c8f6264f3f Mon Sep 17 00:00:00 2001
> > -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > -Date: Mon, 20 Aug 2018 19:06:08 +0200
> > -Subject: [PATCH] Fix static build with libidn2 and libunistring
> > -
> > -When libidn2 is statically build with libunistring support, mutt needs
> > -to add -lunistring to LIBS.
> > -To do that, add a call to PKG_CHECK_MODULES to retrieve this information
> > -from libidn2.pc
> > -
> > -Fixes:
> > - - http://autobuild.buildroot.net/results/177da8f4798f69298db5385957184f1c53cca923
> > -
> > -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ----
> > - configure.ac | 4 ++++
> > - 1 file changed, 4 insertions(+)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 29252173..2e69ac19 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -1341,6 +1341,10 @@ AC_ARG_WITH(idn2, AS_HELP_STRING([--with-idn2=@<:@PFX@:>@],[Use GNU libidn2 for
> > -             if test "$with_idn2" != "yes" ; then
> > -               CPPFLAGS="$CPPFLAGS -I$with_idn2/include"
> > -               LDFLAGS="$LDFLAGS -L$with_idn2/lib"
> > -+            else
> > -+              PKG_CHECK_MODULES([LIBIDN2], libidn2,
> > -+                                 [CPPFLAGS="$CPPFLAGS $LIBIDN2_CFLAGS"
> > -+                                 LIBS="$LIBIDN2_LIBS"])
> > -             fi
> > -           fi
> > -         ],
> > ---
> > -2.14.1
> > -
> > diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
> > index 27eeb56804..476773c294 100644
> > --- a/package/mutt/mutt.hash
> > +++ b/package/mutt/mutt.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256 734a3883158ec3d180cf6538d8bd7f685ce641d2cdef657aa0038f76e79a54a0  mutt-1.10.1.tar.gz
> > +sha256 da5cd4c39f228914d3933d8cf3a017c8271fdd9b9d81c6e4fc42ad22e1a28723  mutt-1.11.2.tar.gz
> >  sha256 732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
> > diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
> > index 9918b45e64..55a6ce5ffc 100644
> > --- a/package/mutt/mutt.mk
> > +++ b/package/mutt/mutt.mk
> > @@ -4,14 +4,12 @@
> >  #
> >  ################################################################################
> >
> > -MUTT_VERSION = 1.10.1
> > +MUTT_VERSION = 1.11.2
> >  MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
> >  MUTT_LICENSE = GPL-2.0+
> >  MUTT_LICENSE_FILES = GPL
> >  MUTT_DEPENDENCIES = host-pkgconf ncurses
>
> Can the dependency on 'host-pkgconf' be removed since mutt doesn't
> depend on besides the patch being removed?
Indeed, thanks for spotting this, I'll send a v2.
>
> Per the comment in your MR from mutt -
> https://gitlab.com/muttmua/mutt/merge_requests/25
>
> >  MUTT_CONF_OPTS = --disable-doc --disable-smtp
> > -# We're patching configure.ac
> > -MUTT_AUTORECONF = YES
> >
> >  ifeq ($(BR2_PACKAGE_LIBICONV),y)
> >  MUTT_DEPENDENCIES += libiconv
> > --
> > 2.14.1
>
> Thanks,
> -Ryan
>
>  ---
> Ryan Barnett | Sr Systems Engineer | Commercial Avionics
> COLLINS AEROSPACE
> 400 Collins Rd NE, Cedar Rapids, IA 52498 USA
> ryan.barnett at collins.com | collinsaerospace.com
Best Regards,

Fabrice
