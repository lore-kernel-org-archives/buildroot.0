From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 22:17:22 +0100
Subject: [Buildroot] [PATCH] package/brltty: use host pkg-config when
 building host tools
In-Reply-To: <20200219233748.680423-1-thomas.petazzoni@bootlin.com>
References: <20200219233748.680423-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200226221722.3cf50471@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Feb 2020 00:37:47 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> brltty builds host tools which rely on the expat library, and
> pkg-config is used to detect the expat library.
> 
> Since commit cd16e18584066d2817d3acb3822e173f9f23455e ("pkgconf:
> always keep system libs"), the wrapper script added
> --keep-system-libs, which adds a -L$(STAGING_DIR)/usr/lib to the
> pkg-config results instead of just -lexpat. So, previously, by chance,
> the pkg-config result for the target expat was "good enough" for the
> host expat as well. But now that -L$(STAGING_DIR)/usr/lib is added, it
> breaks the build in all sort of ways as obviously building host
> binaries with the library search path pointing to $(STAGING_DIR) is
> not a good idea.
> 
> To fix that, this commit adjusts the brltty build system so that the
> PKG_CONFIG_FOR_BUILD variable is used when using pkg-config to build
> host binaries.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/5a64dfb845389882c366b6c91aaf5868c090a802/
> 
> Many thanks to the initial work from Fabrice Fontaine at
> http://patchwork.ozlabs.org/patch/1238163/ which provided an initial
> starting point for this investigation.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...ss-PKG_CONFIG_FOR_BUILD-to-the-nativ.patch | 38 +++++++++++++++++++
>  package/brltty/brltty.mk                      |  3 ++
>  2 files changed, 41 insertions(+)
>  create mode 100644 package/brltty/0003-mk4build-also-pass-PKG_CONFIG_FOR_BUILD-to-the-nativ.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
