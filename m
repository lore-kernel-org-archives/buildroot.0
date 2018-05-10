From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 May 2018 10:40:58 +0200
Subject: [Buildroot] [RFC PATCH 1/7] pkg-meson: new infrastructure
In-Reply-To: <20180509224128.GA11938@ned>
References: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
 <20180507105741.31747-2-eric.le.bihan.dev@free.fr>
 <20180507170256.2ef06b2f@windsurf> <20180507193850.GA15375@ned>
 <20180507214356.3a087000@windsurf> <20180507221244.GC15375@ned>
 <c0524a93-eaad-3e61-f8bc-f9b17271d468@mind.be>
 <20180509224128.GA11938@ned>
Message-ID: <20180510104058.5bee486b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Thu, 10 May 2018 00:41:28 +0200, Eric Le Bihan wrote:

> I added $$(HOST_CONFIGURE_OPTS), CFLAGS="$$(HOST_CFLAGS)" and
> LDFLAGS="$$(HOST_LDFLAGS)"

HOST_CONFIGURE_OPTS already contains CFLAGS=$(HOST_CFLAGS) and
LDFLAGS=$(HOST_LDFLAGS), so there is no need to use them in addition to
$(HOST_CONFIGURE_OPTS).

> before invoking Meson (as done in pkg-autotools.mk) and now it
> politely informs me that it will take these flags into account:

I don't understand why we are passing CFLAGS=$(HOST_CFLAGS) and
LDFLAGS=$(HOST_LDFLAGS) in pkg-autotools.mk, it seems totally useless
since they are already in $(HOST_CONFIGURE_OPTS).

They have been here in pkg-autotools.mk since we reworked the autotools
infrastructure on top of the generic package infrastructure, back in
2009. It's however later that CFLAGS and LDFLAGS have been added in
HOST_CONFIGURE_OPTS.

This should be fixed.

> The recommended workaround is to define install_rpath [4] in for the
> executable target, but this requires patching the sources of the
> Meson-based package when building its host variant, which does not sound
> very sensible.
> 
> So it looks like the workaround used in NixOS [5], i.e. patching the
> host variant of Meson itself to remove the RPATH strip step, is
> preferable until upstream Meson settles on this topic. I'll send another
> patch for the meson package where this step is done in a post-extract
> hook of the host variant.

Why not a patch against Meson itself ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
