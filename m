From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Sep 2013 15:45:30 +0200
Subject: [Buildroot] [PATCH 1/1] iputils: new package
In-Reply-To: <OF635D0B64.199C14BF-ON86257BEB.000D9C69-86257BEB.004AD41E@rockwellcollins.com>
References: <1379533013-13209-1-git-send-email-mlweber1@rockwellcollins.com>
 <523A2AEE.4070606@mind.be>
 <OF635D0B64.199C14BF-ON86257BEB.000D9C69-86257BEB.004AD41E@rockwellcollins.com>
Message-ID: <523AFFFA.7020809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/13 15:37, mlweber1 at rockwellcollins.com wrote:
> Arnout Vandecappelle <arnout@mind.be> wrote on 09/18/2013 05:36:30 PM:
>
>  > From: Arnout Vandecappelle <arnout@mind.be>
>  > To: Matt Weber <mlweber1@rockwellcollins.com>
>  > Cc: buildroot at busybox.net
>  > Date: 09/18/2013 05:36 PM
>  > Subject: Re: [Buildroot] [PATCH 1/1] iputils: new package
>  >
>  > On 18/09/13 21:36, Matt Weber wrote:
>  > > This new package adds full versions of ping/traceroute/etc.
>  > >
>  > > Built against GCC4.7 ARM, x86 uclibc IPv6 and uclibc no IPv6.
>  > >
>  > > Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
>  > > ---
>  > >   package/Config.in          |    1 +
>  > >   package/iputils/Config.in  |    7 +++++
>  > >   package/iputils/iputils.mk |   57 ++++++++++++++++++++++++++++++
>  > ++++++++++++++
>  > >   3 files changed, 65 insertions(+), 0 deletions(-)
>  > >   create mode 100644 package/iputils/Config.in
>  > >   create mode 100644 package/iputils/iputils.mk
>  > >
>  > > diff --git a/package/Config.in b/package/Config.in
>  > > index 973d32c..14ca821 100644
>  > > --- a/package/Config.in
>  > > +++ b/package/Config.in
>  > > @@ -792,6 +792,7 @@ source "package/iproute2/Config.in"
>  > >   source "package/ipsec-tools/Config.in"
>  > >   source "package/ipset/Config.in"
>  > >   source "package/iptables/Config.in"
>  > > +source "package/iputils/Config.in"
>  > >   source "package/iw/Config.in"
>  > >   source "package/kismet/Config.in"
>  > >   source "package/knock/Config.in"
>  > > diff --git a/package/iputils/Config.in b/package/iputils/Config.in
>  > > new file mode 100644
>  > > index 0000000..92bbea9
>  > > --- /dev/null
>  > > +++ b/package/iputils/Config.in
>  > > @@ -0,0 +1,7 @@
>  > > +config BR2_PACKAGE_IPUTILS
>  > > +   bool "iputils"
>  >
>  >   You're missing a couple of select statements here.
>  >
>
> After removing libsysfs and libcap (below) that leaves openssl.  Since
> that's conditional, would something like this be reasonable?
> if BR2_INET_IPV6
>          select BR2_OPENSSL
> endif

  Correct, except that it should be:

	select BR2_OPENSSL if BR2_INET_IPV6

>
>  > > +   help
>  > > +     This package is set of small useful utilities for Linux
> networking.
>  > > +     It includes complete versions of ping, traceroute, etc.
>  > > +
>  > > + http://sourceforge.net/projects/iputils/
>  > > diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
>  > > new file mode 100644
>  > > index 0000000..b4576cc
>  > > --- /dev/null
>  > > +++ b/package/iputils/iputils.mk
>  > > @@ -0,0 +1,57 @@
>  > >
>  >
> +################################################################################
>  > > +#
>  > > +# iputils
>  > > +#
>  > >
>  >
> +################################################################################
>  > > +
>  > > +IPUTILS_VERSION = 20121011
>  > > +IPUTILS_SITE = http://www.skbuff.net/iputils/
>  > > +IPUTILS_SOURCE = iputils-s$(IPUTILS_VERSION).tar.bz2
>  >
>  >   I think the s should be considered part of the version number.
>
> Ok
>
>  >
>  > > +IPUTILS_LICENSE = GPLv2+ BSD-3c
>  > > +# Only included a license file for BSD.
>  > > +IPUTILS_LICENSE_FILES = COPYING
>  > > +
>  > > +IPUTILS_DEPENDENCIES = libcap libsysfs openssl
>  >
>  >   openssl is only needed for ping6. cap and sysfs can be avoided with
>
> I'll update so it's added to the dependencies only when IPv6 is enabled
>
>  > USE_CAP=no and USE_SYSFS=no.
>
> I went back and double checked if I needed those options and I don't.

  Er, if you don't set USE_CAP=no then it will try to link with -lcap, so 
if you don't have libcap in your staging dir it will fail...

[snip]
>  >
>  > > +      CFLAGS+="-D_GNU_SOURCE -Wstrict-prototypes -Wall -
>  > DCAPABILITIES -DUSE_SYSFS"
>  >
>  >   How about CFLAGS="$(TARGET_CFLAGS) $$(CCOPT) $$(GLIBCFIX) $$(DEFINES)"
>  > i.e. reusing the package's make variables.
>
> I don't believe the $$( will expand out.  I tried this quick and they end
> up as $(CCOPT), etc on the build line with a bash command error of not
> found.

  Ah yes forgot about bash... So it should be

CFLAGS="$(TARGET_CFLAGS) \$$(CCOPT) \$$(GLIBCFIX) \$$(DEFINES)"

  With that kind of complexity, I guess it's better to stick with what 
you had... Only, that means that you'll have to add conditions for 
-DCAPABILITIES and -DUSE_SYSFS as well.


  Regards,
  Arnout

>  >
>  > > +
>  > > +define IPUTILS_BUILD_CMDS
>  > > +   $(MAKE) -C $(@D) $(IPUTILS_MAKE_CMDS) DESTDIR=$(STAGING_DIR) $
>  > (IPUTILS_MKTARGETS)
>  >
>  >   The Makefile doesn't use DESTDIR.
>
> Correct, I'll update.
>
> Thanks,
> Matt
>
> [snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
