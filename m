From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Tue, 21 Aug 2018 09:53:22 +0200
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BRFC_3/3=5D_toolchain/toolchain-wra?=
 =?iso-8859-1?q?pper=3A_add_BR2=5FRELRO=5FFULL_support?=
In-Reply-To: <1534220803-26737-4-git-send-email-matthew.weber@rockwellcollins.com>
References: <1534220803-26737-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1534220803-26737-4-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <c0c3bc68-6ce8-4ad7-a5a7-d10638de4a42@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ?ter? 14. srpna 2018 6:26:43 CEST, Matt Weber wrote:
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  toolchain/toolchain-wrapper.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index c5eb813..d36771c 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -49,8 +49,9 @@ static char _date_[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
>   * 	-D__TIME__=
>   * 	-D__DATE__=
>   * 	-Wno-builtin-macro-redefined
> + *      -fPIE

nit: this looks like a whitespace error (one too many spaces)

>   */
> -#define EXCLUSIVE_ARGS	6
> +#define EXCLUSIVE_ARGS	7
>  
>  static char *predef_args[] = {
>  #ifdef BR_CCACHE
> @@ -363,6 +364,22 @@ int main(int argc, char **argv)
>  		*cur++ = "-Wno-builtin-macro-redefined";
>  	}
>  
> +#ifdef BR2_RELRO_FULL
> +	/* Combinations of PIE and pic */
> +	for (i = 1; i < argc; i++) {
> +		if (!strcmp(argv[i], "-r") ||
> +		    !strcmp(argv[i], "-fpie") ||
> +		    !strcmp(argv[i], "-fPIE") ||
> +		    !strcmp(argv[i], "-fpic") ||
> +		    !strcmp(argv[i], "-fPIC") ||
> +		    !strcmp(argv[i], "-fno-pic"))
> +			break;
> +	}
> +
> +	if (i == argc)
> +		*cur++ = "-fPIE";
> +#endif
> +
>  	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
>  	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
>  		paranoid = 1;

I needed some more patches to build with the following hardening settings:

BR2_SSP_STRONG=y
BR2_RELRO_FULL=y
BR2_FORTIFY_SOURCE_2=y

- https://patchwork.ozlabs.org/patch/865166/
- https://patchwork.ozlabs.org/patch/865168/ (this one need changes so that 
it touches packages/libzlib/ now)

Then my build failed when building util-linux, see the attached log.

Cheers,
Jan
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: bug-util-linux
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180821/9a27f542/attachment.ksh>
