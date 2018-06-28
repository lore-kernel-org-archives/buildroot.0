From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 21:37:48 +0200
Subject: [Buildroot] [PATCH 1/2] wampcc: new package
In-Reply-To: <20180628135009.20421-1-neumann@teufel.de>
References: <20180626214044.47839797@windsurf.home>
 <20180628135009.20421-1-neumann@teufel.de>
Message-ID: <20180628213748.086bb791@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied, after fixing a few issues, see below.

On Thu, 28 Jun 2018 15:50:08 +0200, Sven Neumann wrote:
> Signed-off-by: Sven Neumann <neumann@teufel.de>
> ---
>  package/Config.in          |  1 +
>  package/wampcc/Config.in   | 19 +++++++++++++++++++
>  package/wampcc/wampcc.hash |  3 +++
>  package/wampcc/wampcc.mk   | 14 ++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/wampcc/Config.in
>  create mode 100644 package/wampcc/wampcc.hash
>  create mode 100644 package/wampcc/wampcc.mk

The entry to the DEVELOPERS file was still missing. I know it was in
your second patch, but the addition of wampcc to DEVELOPERS should have
been with this patch.

> diff --git a/package/wampcc/Config.in b/package/wampcc/Config.in
> new file mode 100644
> index 0000000000..e7cf6b26fd
> --- /dev/null
> +++ b/package/wampcc/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_WAMPCC
> +	bool "wampcc"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_barrier_*
> +	depends on BR2_USE_MMU # fork()
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4

Those dependencies come from libuv, some instead of "fork()" and
"pthread_barrier_" which are the reason for libuv to have those
dependencies, we prefer to have the reason for wampcc to have those
dependencies, i.e the fact that it selects libuv. So:

	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv

and so on.

Also, another dependency was missing: BR2_TOOLCHAIN_HAS_GCC_BUG_64735.
The C++ code uses std::shared_future, which doesn't work on gcc < 7.x
on some architectures.

As I said above, I fixed those issues and applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
