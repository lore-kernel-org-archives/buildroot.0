From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Thu, 19 Sep 2013 08:37:18 -0500
Subject: [Buildroot] [PATCH 1/1] iputils: new package
In-Reply-To: <523A2AEE.4070606@mind.be>
References: <1379533013-13209-1-git-send-email-mlweber1@rockwellcollins.com>
 <523A2AEE.4070606@mind.be>
Message-ID: <OF635D0B64.199C14BF-ON86257BEB.000D9C69-86257BEB.004AD41E@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote on 09/18/2013 05:36:30 PM:

> From: Arnout Vandecappelle <arnout@mind.be>
> To: Matt Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net
> Date: 09/18/2013 05:36 PM
> Subject: Re: [Buildroot] [PATCH 1/1] iputils: new package
> 
> On 18/09/13 21:36, Matt Weber wrote:
> > This new package adds full versions of ping/traceroute/etc.
> >
> > Built against GCC4.7 ARM, x86 uclibc IPv6 and uclibc no IPv6.
> >
> > Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> > ---
> >   package/Config.in          |    1 +
> >   package/iputils/Config.in  |    7 +++++
> >   package/iputils/iputils.mk |   57 ++++++++++++++++++++++++++++++
> ++++++++++++++
> >   3 files changed, 65 insertions(+), 0 deletions(-)
> >   create mode 100644 package/iputils/Config.in
> >   create mode 100644 package/iputils/iputils.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index 973d32c..14ca821 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -792,6 +792,7 @@ source "package/iproute2/Config.in"
> >   source "package/ipsec-tools/Config.in"
> >   source "package/ipset/Config.in"
> >   source "package/iptables/Config.in"
> > +source "package/iputils/Config.in"
> >   source "package/iw/Config.in"
> >   source "package/kismet/Config.in"
> >   source "package/knock/Config.in"
> > diff --git a/package/iputils/Config.in b/package/iputils/Config.in
> > new file mode 100644
> > index 0000000..92bbea9
> > --- /dev/null
> > +++ b/package/iputils/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_IPUTILS
> > +   bool "iputils"
> 
>   You're missing a couple of select statements here.
>

After removing libsysfs and libcap (below) that leaves openssl.  Since 
that's conditional, would something like this be reasonable?
if BR2_INET_IPV6
        select BR2_OPENSSL
endif
 
> > +   help
> > +     This package is set of small useful utilities for Linux 
networking.
> > +     It includes complete versions of ping, traceroute, etc.
> > +
> > +     http://sourceforge.net/projects/iputils/
> > diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> > new file mode 100644
> > index 0000000..b4576cc
> > --- /dev/null
> > +++ b/package/iputils/iputils.mk
> > @@ -0,0 +1,57 @@
> > 
> 
+################################################################################
> > +#
> > +# iputils
> > +#
> > 
> 
+################################################################################
> > +
> > +IPUTILS_VERSION = 20121011
> > +IPUTILS_SITE = http://www.skbuff.net/iputils/
> > +IPUTILS_SOURCE = iputils-s$(IPUTILS_VERSION).tar.bz2
> 
>   I think the s should be considered part of the version number.

Ok

> 
> > +IPUTILS_LICENSE = GPLv2+ BSD-3c
> > +# Only included a license file for BSD.
> > +IPUTILS_LICENSE_FILES = COPYING
> > +
> > +IPUTILS_DEPENDENCIES = libcap libsysfs openssl
> 
>   openssl is only needed for ping6. cap and sysfs can be avoided with 

I'll update so it's added to the dependencies only when IPv6 is enabled

> USE_CAP=no and USE_SYSFS=no.

I went back and double checked if I needed those options and I don't.

> 
> > +# Build after busybox so target ends up with this package's full
> > +# versions of the applications instead of busybox applets.
> > +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> > +IPUTILS_DEPENDENCIES += busybox
> > +endif
> > +
> > +define IPUTILS_IPV6_TARGET_CMDS
> 
>   I guess you mean INSTALL_TARGET_CMDS.
> 
>   Also, this define should be in a BR2_INET_IPV6 condition and the 
> conditions below should be removed.

Ok

> 
> > +   $(INSTALL) -D -m 755 $(@D)/ping6       $(TARGET_DIR)/bin/ping6
> > +   $(INSTALL) -D -m 755 $(@D)/tracepath6 $(TARGET_DIR)/bin/tracepath6
> > +   $(INSTALL) -D -m 755 $(@D)/traceroute6 
$(TARGET_DIR)/bin/traceroute6
> > +endef
> > +IPUTILS_IPV6_MKTARGETS = ping6 tracepath6 traceroute6
> > +
> > +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> > +ifneq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),y)
> > +define IPUTILS_IPV6_TARGET_CMDS
> > +endef
> > +define IPUTILS_IPV6_MKTARGETS
> > +endef
> > +endif
> > +endif
> > +
> > +IPUTILS_MKTARGETS = arping clockdiff ping rarpd rdisc tftpd 
> tracepath $(IPUTILS_IPV6_MKTARGETS)
> 
>   Define this variable before the IPv6 stuff, and append to it inside 
the 
> IPv6 condition. Then you don't need the additional variable.

Ok

> 
>   Also, I would prefer if the variable was called IPUTILS_MAKE_OPT, so 
it 
> is the same as what is used by autotools.

Sure.

> 
> > +
> > +IPUTILS_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS) KERNEL_INCLUDE=$
> (STAGING_DIR)/usr/include/linux \
> 
>   This can also be part of the _MAKE_OPT variable.
> 
>   Since you're not building the module, the KERNEL_INCLUDE isn't used, 
right?

Correct, I'll remove.

> 
> > +      CFLAGS+="-D_GNU_SOURCE -Wstrict-prototypes -Wall -
> DCAPABILITIES -DUSE_SYSFS"
> 
>   How about CFLAGS="$(TARGET_CFLAGS) $$(CCOPT) $$(GLIBCFIX) $$(DEFINES)"
> i.e. reusing the package's make variables.

I don't believe the $$( will expand out.  I tried this quick and they end 
up as $(CCOPT), etc on the build line with a bash command error of not 
found.

> 
> > +
> > +define IPUTILS_BUILD_CMDS
> > +   $(MAKE) -C $(@D) $(IPUTILS_MAKE_CMDS) DESTDIR=$(STAGING_DIR) $
> (IPUTILS_MKTARGETS)
> 
>   The Makefile doesn't use DESTDIR.

Correct, I'll update.

Thanks,
Matt

[snip]
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130919/666add8a/attachment.html>
