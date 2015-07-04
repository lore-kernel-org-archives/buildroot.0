From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:30:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-kconfig: define
 KCONFIG_EDITORS_MAKE_ENV
In-Reply-To: <20150702212031.GH3838@free.fr>
References: <1435848100-5762-1-git-send-email-talz@ezchip.com>
 <20150702175937.4733d060@free-electrons.com>
 <20150702212031.GH3838@free.fr>
Message-ID: <20150704143014.21a3e1c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 2 Jul 2015 23:20:32 +0200, Yann E. MORIN wrote:

> On 2015-07-02 17:59 +0200, Thomas Petazzoni spake thusly:
> > On Thu, 2 Jul 2015 17:41:40 +0300, Tal Zilcer wrote:
> > 
> > >  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): @D=$$($(2)_DIR)
> > >  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
> > > -	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> > > +	$$($(2)_KCONFIG_EDITORS_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> > 
> > I actually don't think adding a KCONFIG_EDITORS_MAKE_ENV variable is
> > really useful here. Since it's a bunch of host tools, maybe we should
> > just:
> > 
> > 	$$(HOST_MAKE_ENV) $$(MAKE) -C ...
> 
> I do agree with Thomas here.

Except that it doesn't work: HOST_MAKE_ENV defines:

        PKG_CONFIG_SYSROOT_DIR="/" \
        PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"

So this is perfectly OK to force pkg-config to find libraries built for
the host instead of the target. However, since we're passing
PKG_CONFIG_LIBDIR, we completely override the default pkg-config search
path, so it does not even check for libraries installed system-wide, it
only searches for libraries we have installed in $(HOST_DIR). And since
Qt is not built by us, it doesn't work.

Using PKG_CONFIG_PATH would allow to search for the host installed
libraries. However, our pkg-config wrapper enforces the use of the
cross-PKG_CONFIG_LIBDIR if no PKG_CONFIG_LIBDIR value is passed.

Bottom line, using $(HOST_MAKE_ENV) is clearly not sufficient to solve
the problem.

So we have to decide whether we want to use the system-provided
pkg-config, or our own pkg-config. But since linux does not depend on
host-pkgconf, maybe we should simply just use the one available on the
system, since we anyway don't build ncurses/qt/gtk ourselves for the
configuration interfaces. If that's what we want to do, I would then
suggest to do pass any variable in the make environment.

Yann, what do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
