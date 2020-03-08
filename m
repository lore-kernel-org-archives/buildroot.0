From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 8 Mar 2020 18:37:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: enable wireguard
In-Reply-To: <20200308144746.6cbfbd8f@windsurf.home>
References: <20200308070741.42542-1-james.hilliard1@gmail.com>
 <20200308144746.6cbfbd8f@windsurf.home>
Message-ID: <20200308173718.GA2885265@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, James,

> On Sun,  8 Mar 2020 00:07:41 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:

> > We also need to select libmnl when building with wireguard support or
> > with nftables.

> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/connman/Config.in  | 5 +++++
> >  package/connman/connman.mk | 9 ++++++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)

> > diff --git a/package/connman/Config.in b/package/connman/Config.in
> > index ac012dda54..614b826f96 100644
> > --- a/package/connman/Config.in
> > +++ b/package/connman/Config.in
> > @@ -33,6 +33,7 @@ config BR2_PACKAGE_CONNMAN_NFTABLES
> >  	bool "nftables"
> >  	depends on BR2_USE_WCHAR
> >  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> > +	select BR2_PACKAGE_LIBMNL

> How is this related to wireguard support ?
Yes.

> >  	select BR2_PACKAGE_NFTABLES
> >  	help
> >  	  Use nftables as firewall.
> > @@ -51,6 +52,10 @@ config BR2_PACKAGE_CONNMAN_WIFI
> >  	  setup). ConnMan detects the start of wpa_supplicant
> >  	  automatically.

> > +config BR2_PACKAGE_CONNMAN_WIREGUARD
> > +	bool "enable wireguard support"
> > +	select BR2_PACKAGE_LIBMNL

> We already had a patch from Petr at
> http://patchwork.ozlabs.org/patch/1246181/ to add Wireguard support,
> but he was also selecting BR2_PACKAGE_WIREGUARD_TOOLS.

> Could you or Petr clarify this ?
configure.ac
found_libmnl="no"
if (test "${firewall_type}" = "nftables" -o \
		"${enable_wireguard}" != "no"); then
	PKG_CHECK_MODULES(LIBMNL, [libmnl >= 1.0.0], [found_libmnl="yes"],
		AC_MSG_ERROR([libmnl >= 1.0.0 not found]))
	AC_SUBST(LIBMNL_CFLAGS)
	AC_SUBST(LIBMNL_LIBS)
fi
AM_CONDITIONAL(LIBMNL, test "${found_libmnl}" != "no")

IMHO this means that libmnl is required for nftables and wireguard.

Kind regards,
Petr
