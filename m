From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 17:58:21 +0200
Subject: [Buildroot] [PATCH 09/27] package/boost: work around gcc bug
 85180 for boost-fiber option
In-Reply-To: <20190614210346.121013-10-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-10-giulio.benetti@micronovasrl.com>
Message-ID: <20190619175821.422e1e0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:28 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x the build hangs due to gcc bug
> 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
> shows up when building boost with boost-fiber enabled and optimization
> but not when building with -O0. To work around this, if
> BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y and boost-fiber is selected we force
> using -O0.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/boost/Config.in | 5 ++---
>  package/boost/boost.mk  | 4 ++++
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 783e86dc09..88b964847f 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -137,7 +137,6 @@ config BR2_PACKAGE_BOOST_FIBER
>  	# since mips32r2/mips64r2.
>  	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
> -	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180

Since we are probably not going to allow building boost-context on
Microblaze, I think this patch should simply be to remove the
BR2_TOOLCHAIN_HAS_GCC_BUG_85180 dependency. Indeed, this option already
has the BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS dependency that
prevents from being selected on Microblaze.

If we ever add Microblaze to BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS,
and the gcc bug is still there, then we will see build failures and we
can fix them at this point.

> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
> +BOOST_TARGET_CXXFLAGS += -O0
> +endif

Also, this choice had the drawback that Boost was always built with -O0
on Microblaze, even if the Fiber module was not selected.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
