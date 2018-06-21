From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jun 2018 10:48:45 +0200
Subject: [Buildroot] [RFC PATCH v4 4/9] libgtk3: remove patch to disable
 atk-bridge support
In-Reply-To: <CAMWSM7jSxBUZWWayCT_GcxP23P7PBw_PrfD8MnVDfERT_EqK3w@mail.gmail.com>
References: <20180610205417.13963-1-joseph.kogut@gmail.com>
 <20180614224820.27126-1-joseph.kogut@gmail.com>
 <20180614224820.27126-5-joseph.kogut@gmail.com>
 <20180615215331.56328861@windsurf>
 <CAMWSM7jSxBUZWWayCT_GcxP23P7PBw_PrfD8MnVDfERT_EqK3w@mail.gmail.com>
Message-ID: <20180621104845.4bcc2c68@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Jun 2018 11:05:03 -0700, Joseph Kogut wrote:

> > Could we instead keep them optional, by improving this patch ? We
> > really try to keep dependencies to a reasonable level in Buildroot, so
> > it would be nice if we could avoid making those mandatory dependencies
> > of libgtk3.
> >  
> 
> That's a great point, and it's something I hadn't thought of. Would
> you recommend selectively applying the patch to disable the dependency
> on atk-bridge, or some other approach?
> 
> Are there any examples of selectively applying patches that I can use
> as a reference?

We don't want to apply patches conditionally. Instead the patch
*itself* should be smarter, and only use atk if available.

> > > ---- a/configure.ac
> > > -+++ b/configure.ac
> > > -@@ -1349,11 +1349,7 @@
> > > - # Check for Accessibility Toolkit flags
> > > - ########################################
> > > -
> > > --if test x$enable_x11_backend = xyes; then
> > > --   ATK_PACKAGES="atk atk-bridge-2.0"
> > > --else
> > > --   ATK_PACKAGES="atk"
> > > --fi
> > > -+ATK_PACKAGES="atk"
> > > -
> > > - PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)

A rough idea is something like this:

PKG_CHECK_MODULES(ATK, atk)

if test x$enable_x11_backend = xyes; then
	PKG_CHECK_MODULES(ATK_BRIDGE, atk-bridge-2.0,
			  AC_DEFINE([HAVE_ATK_BRIDGE], [1]); ATK_BRIDGE_PACKAGE=atk-bridge-2.0)
fi

In configure.ac, add $ATK_BRIDGE_PACKAGE in:

GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES epoxy >= epoxy_required_version"

And in gtkaccessibility.c, use #ifdef HAVE_ATK_BRIDGE instead of #ifdef
GDK_WINDOWING_X11 to guard the include of <atk-bridge.h> and the call
to atk_bridge_adaptor_init().

Of course, those are rough guidelines, you will probably need to adjust
stuff to actually make it work :-)

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
