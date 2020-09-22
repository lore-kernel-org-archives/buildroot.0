From: vadim4j at gmail.com <vadim4j@gmail.com>
Date: Tue, 22 Sep 2020 23:16:05 +0300
Subject: [Buildroot] [PATCH] package/mstpd: new package
In-Reply-To: <20200922215818.7d3cf75d@windsurf>
References: <20200919201904.15883-1-vadim4j@gmail.com>
 <20200922215818.7d3cf75d@windsurf>
Message-ID: <20200922201605.GA343765@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Sep 22, 2020 at 09:58:18PM +0200, Thomas Petazzoni wrote:
> Hello Vadym,
> 
> Thanks for this contribution. See below for a number of comments.
> 
> On Sat, 19 Sep 2020 23:19:04 +0300
> Vadym Kochan <vadim4j@gmail.com> wrote:
> 
> > diff --git a/package/mstpd/Config.in b/package/mstpd/Config.in
> > new file mode 100644
> > index 0000000000..ac921b0d2b
> > --- /dev/null
> > +++ b/package/mstpd/Config.in
> > @@ -0,0 +1,11 @@
> > +config BR2_PACKAGE_MSTPD
> > +	bool "mstpd"
> > +	select BR2_PACKAGE_BASH # init
> 
Might be a mistake.

> Are you sure bash is needed? For what? I don't see an init script being
> installed.
> 
> > diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
> > new file mode 100644
> > index 0000000000..49dc769509
> > --- /dev/null
> > +++ b/package/mstpd/mstpd.mk
> > @@ -0,0 +1,20 @@
> > +################################################################################
> > +#
> > +# mstpd
> > +#
> > +################################################################################
> > +
> > +MSTPD_VERSION = 0.0.8
> > +MSTPD_SOURCE = $(MSTPD_VERSION).tar.gz
> > +MSTPD_SITE = https://github.com/mstpd/mstpd/archive
> 
> Please use the github macro, since they haven't uploaded their own
> tarball.
> 
> > +MSTPD_LICENSE = GPL-2.0
> 
> The license is actually GPL-2.0+
> 
> > +MSTPD_LICENSE_FILES = LICENSE
> > +MSTPD_AUTORECONF = YES
> > +
> > +# mstpd requires that it is installed into /sbin, not /usr/sbin
> > +MSTPD_CONF_OPTS = \
> > +	--prefix=/ \
> > +	--exec-prefix=/ \
> > +	--sbindir=/sbin
> 
> This doesn't work, because it puts the stuff that normally go into
> /usr/share into /share, and so the manpages are still on the target as
> they are not located at the usual /usr/share/man location.
> 
> ??? share
> ??? ??? doc
> ??? ??? ??? mstpd
> ??? ???     ??? README.VLANs
> ??? ??? man
> ???     ??? man5
> ???     ??? ??? mstpctl-utils-interfaces.5.gz
> ???     ??? man8
> ???         ??? mstpctl.8.gz
> 
> Would it be possible instead to fix things so that it can be installed
> into /usr/sbin ?

I think you are right about the default prefix and --exec-prefix, but
regarding --sbindir it looks like it should point to /sbin because
Linux's bridge implementation calls /sbin/bridge-stp in case the STP
handling is delegated to user space.

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
Vadym Kochan
