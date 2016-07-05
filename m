From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 09:56:40 +0200
Subject: [Buildroot] [PATCH v2] m68k: binfmt flat configuration fixes
In-Reply-To: <20160704185139.GA16333@waldemar-brodkorb.de>
References: <20160704185139.GA16333@waldemar-brodkorb.de>
Message-ID: <20160705095640.39b98219@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jul 2016 20:51:39 +0200, Waldemar Brodkorb wrote:
> The situation looks like following for elf2flt and binfmt FLAT: Only gcc for
> bfin/m68k implements -msep-data so we should depend on m68k and bfin.  When the
> default is used on m68k, broken binaries are produced, which mainly end up in
> SIGILL, so do not use it for m68k.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - bfin has sep-data support, recognized by Thomas Petazzoni
> ---
>  arch/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index 1fdd36a..08cffdb 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -360,11 +360,13 @@ choice
>  
>  config BR2_BINFMT_FLAT_ONE
>  	bool "One memory region"
> +	depends on !BR2_m68k
>  	help
>  	  All segments are linked into one memory region.
>  
>  config BR2_BINFMT_FLAT_SEP_DATA
>  	bool "Separate data and code region"
> +	depends on BR2_m68k || BR2_bfin

This dependency also applies to BR2_BINFMT_FLAT_SHARED, so I've fixed
that, changed the commit log to reflect this additional change and
applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
