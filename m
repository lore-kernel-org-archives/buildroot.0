From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 15:35:08 +0200
Subject: [Buildroot] [PATCH] core/pkg-kconfig: use olddefconfig when
 available
In-Reply-To: <1461433564-21311-1-git-send-email-yann.morin.1998@free.fr>
References: <1461433564-21311-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160425153508.43945e3c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Apr 2016 19:46:04 +0200, Yann E. MORIN wrote:
> From: Romain Izard <romain.izard.pro@gmail.com>
> 
> Using 'yes "" | make oldconfig' to regenerate a .config file from an
> existing defconfig does not work reliably in all cases. Specifically, it
> does not work well with tristate choice entries.
> 
> The correct way to do it is to use 'make olddefconfig', but this target
> is not supported in projects that use an old version of kconfig. As
> most projects do not use tristate entries, there is no need for them to
> upgrade.
> 
> 'oldnoconfig' is an alias for 'olddefconfig', but it also is the only
> name for this target between Linux versions 2.6.36 and 3.6.
> 
> Check which targets are supported by the current project, and use the
> appropriate method to regenerate the .config file.
> 
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> [yann.morin.1998 at free.fr: use a shell construct instead of makefile code]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I am sorry, but I had to revert this commit. While it works in simple
situations, it badly breaks the Busybox build in some situations:

  http://autobuild.buildroot.org/?reason=busybox-1.24.2

With just Busybox enabled in a minimal configuration, everything is
fine. Enable "libtirpc" in the configuration, do a full rebuild ->
Busybox will fail to build. I don't know if it's related specifically
to libtirpc or to some of its dependencies, but it fails.

A very quick research couldn't spot the source of the problem, so I
simply reverted for now. Could you work on this and submit a new
version of the patch that addresses this problem?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
