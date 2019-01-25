From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Jan 2019 00:57:49 +0100
Subject: [Buildroot] [PATCH] jemalloc: allow on MIPS64
In-Reply-To: <20190125205052.31200-1-patrickdepinguin@gmail.com>
References: <20190125205052.31200-1-patrickdepinguin@gmail.com>
Message-ID: <b125a6d7-aee7-d700-43e5-06d0d390c9f7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/01/2019 21:50, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> jemalloc uses architecture #ifdefs to determine LG_QUANTUM and gives an
> error when an unsupported architecture is used.
> For this reason, Buildroot commit 3baf996c6a2b57ffaaa4627c1e04ff67c30e9754
> introduced BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS.
> 
> In the jemalloc sources, 'mips' is checked via '__mips__' which is set both
> for 32-bit as 64-bit MIPS (including MIPS64 n32).
> However, the Buildroot arch selection only includes 32-bit MIPS via BR2_mips
> and BR2_mipsel.
> 
> Update the arch selection to support MIPS64.

 OK, it builds like that, but is it really going to work correctly? Most arches
define it as 4, only 32-bit ARM, or1k (which is always 32-bit) and mips define
it as 3. So is 3 really the correct value for mips64?

 Note that a value can also be passed with --with-lg-quantum config option for
unsupported arches.

 Regards,
 Arnout


> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/jemalloc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
> index c3fd8e34b8..edb582d203 100644
> --- a/package/jemalloc/Config.in
> +++ b/package/jemalloc/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
>  	default y if BR2_arm || BR2_armeb
>  	default y if BR2_aarch64 || BR2_aarch64_be
>  	default y if BR2_i386 || BR2_x86_64
> -	default y if BR2_mips || BR2_mipsel
> +	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>  	default y if BR2_sparc64
>  	default y if BR2_powerpc
>  	default y if BR2_sh4 || BR2sh4eb || BR2_sh4a || BR2_sh4aeb
> 
