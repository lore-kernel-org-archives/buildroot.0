From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 09:26:56 +0100
Subject: [Buildroot] [PATCH] package/openocd: disable on blackfin
In-Reply-To: <1420489989-21356-1-git-send-email-s.martin49@gmail.com>
References: <1420489989-21356-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150106092656.4bfe90ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon,  5 Jan 2015 21:33:09 +0100, Samuel Martin wrote:
> The "_" symbol prefix added by the blackfin toolchain causes "undefined
> symbol" failures during the configuration.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/e90/e90b4d5ad79d99487f21c9d18581e8eba7034501/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/openocd/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/openocd/Config.in b/package/openocd/Config.in
> index 7c140c7..9543c03 100644
> --- a/package/openocd/Config.in
> +++ b/package/openocd/Config.in
> @@ -1,5 +1,9 @@
>  config BR2_PACKAGE_OPENOCD
>  	bool "openocd"
> +	# disable openocd on blackfin because it triggers "undefined symbol" error
> +	# becasue of the "_" prefix:
> +	# http://autobuild.buildroot.org/results/e90/e90b4d5ad79d99487f21c9d18581e8eba7034501/
> +	depends on !BR2_bfin
>  	help
>  	  OpenOCD - Open On-Chip Debugger
>  

This seems weird because the "_" prefix normally only causes issues
when linking C code against assembly code. If you're only linking C
code against C code, it *should* be fully transparent.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
