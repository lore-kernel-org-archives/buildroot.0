From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 14:30:47 +0200
Subject: [Buildroot] [PATCH] package/aircrack-ng: powerpc arch requires
 altivec
In-Reply-To: <20180814021937.22330-1-matthew.weber@rockwellcollins.com>
References: <20180814021937.22330-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180814143047.167c3c26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Mon, 13 Aug 2018 21:19:37 -0500, Matt Weber wrote:
> The powerpc support in this package requires an arch with altivec
> accelerator support.  The package is currently just building powerpc
> assuming a Power8\Altivec.
> 
> Fixes
> http://autobuild.buildroot.net/results/87e82a5e8d0b1c1ff10ec3e59d25bcd56b329075
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/aircrack-ng/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
> index f3e2bc4ef1..48e743a174 100644
> --- a/package/aircrack-ng/Config.in
> +++ b/package/aircrack-ng/Config.in
> @@ -4,6 +4,8 @@ config BR2_PACKAGE_AIRCRACK_NG
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	depends on BR2_POWERPC_CPU_HAS_ALTIVEC  || \
> +		!(BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le)

This looks like the wrong fix. The Altivec code in Aircrack-ng is not
mandatory, just like the ARM NEON code is not mandatory. There is some
other issue that causes the build failure.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
