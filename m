From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 22:30:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: enable wireguard
In-Reply-To: <20200308173718.GA2885265@x230>
References: <20200308070741.42542-1-james.hilliard1@gmail.com>
 <20200308144746.6cbfbd8f@windsurf.home>
 <20200308173718.GA2885265@x230>
Message-ID: <20200308223004.66fc1ca0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 Mar 2020 18:37:18 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> > > diff --git a/package/connman/Config.in b/package/connman/Config.in
> > > index ac012dda54..614b826f96 100644
> > > --- a/package/connman/Config.in
> > > +++ b/package/connman/Config.in
> > > @@ -33,6 +33,7 @@ config BR2_PACKAGE_CONNMAN_NFTABLES
> > >  	bool "nftables"
> > >  	depends on BR2_USE_WCHAR
> > >  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> > > +	select BR2_PACKAGE_LIBMNL  
> 
> > How is this related to wireguard support ?  
> Yes.
> 
> > >  	select BR2_PACKAGE_NFTABLES
> > >  	help
> > >  	  Use nftables as firewall.
> > > @@ -51,6 +52,10 @@ config BR2_PACKAGE_CONNMAN_WIFI
> > >  	  setup). ConnMan detects the start of wpa_supplicant
> > >  	  automatically.  
> 
> > > +config BR2_PACKAGE_CONNMAN_WIREGUARD
> > > +	bool "enable wireguard support"
> > > +	select BR2_PACKAGE_LIBMNL  
> 
> > We already had a patch from Petr at
> > http://patchwork.ozlabs.org/patch/1246181/ to add Wireguard support,
> > but he was also selecting BR2_PACKAGE_WIREGUARD_TOOLS.  
> 
> > Could you or Petr clarify this ?  
> configure.ac
> found_libmnl="no"
> if (test "${firewall_type}" = "nftables" -o \
> 		"${enable_wireguard}" != "no"); then
> 	PKG_CHECK_MODULES(LIBMNL, [libmnl >= 1.0.0], [found_libmnl="yes"],
> 		AC_MSG_ERROR([libmnl >= 1.0.0 not found]))
> 	AC_SUBST(LIBMNL_CFLAGS)
> 	AC_SUBST(LIBMNL_LIBS)
> fi
> AM_CONDITIONAL(LIBMNL, test "${found_libmnl}" != "no")

Then the "select BR2_PACKAGE_LIBMNL" added to
BR2_PACKAGE_CONNMAN_NFTABLES is completely unrelated to wireguard
support. connman needs libmnl if nftables is used *or* if wireguard is
used.

So the missing select BR2_PACKAGE_LIBMNL in
BR2_PACKAGE_CONNMAN_NFTABLES should be added as a separate patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
