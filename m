From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 09 Aug 2015 20:13:01 +0200
Subject: [Buildroot] [PATCH] toolchain/external: better check for gcc-5
In-Reply-To: <1439118702-5376-1-git-send-email-yann.morin.1998@free.fr>
References: <1439118702-5376-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1439143981.12501.14.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

On So, 2015-08-09 at 13:11 +0200, Yann E. MORIN wrote:
> gcc will always report a three-digit version sting, like 4.9.3 or 
> 5.1.0.
> 
> For gcc before 5, we want to check the first two digits, while 
> starting
> with gcc 5, we are only concerned about the first digit.
> 
> So, change our matching code to test for the leading part of the 
> version
> string, up to the first dot after as-many version digit we're 
> interested
> in.
> 
> Note: we're adding the dot in the .mk code rather than in the Kconfig
> symbol, because it seemed cleaner to do so.
> 
> Reported-by: J?rg Krause <joerg.krause@embedded.rocks>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/helpers.mk | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 018f3ed..7c70d35 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -191,16 +191,12 @@ check_kernel_headers_version = \
>  #   - eat all the remaining chars on the line
>  #   - replace by the matched expression
>  #
> -# - s/\.[[:digit:]]+$//
> -#   - eat a dot followed by as many digits as possible up to the end
> -#     of line
> -#   - replace with nothing
> -#
>  check_gcc_version = \
>  	expected_version="$(strip $2)" ; \
> -	real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) 
> ([^[:space:]]+).*/\1/; s/\.[[:digit:]]+$$//;'` ; \
> -	if [ "$${real_version}" != "$${expected_version}" ] ; then \
> -		echo "Incorrect selection of gcc version: expected 
> $${expected_version}, got $${real_version}" ; \
> +	real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) 
> ([^[:space:]]+).*/\1/;'` ; \
> +	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; 
> then \
> +		printf "Incorrect selection of gcc version: expected 
> %s.x, got %s\n" \
> +			"$${expected_version}" "$${real_version}" ; 
> \
>  		exit 1 ; \
>  	fi
>  

Many thanks! This works fine for my gcc 5.2.0 toolchain. Although, it
is already commited and applied:

Tested-by: J?rg Krause <joerg.krause@embedded.rocks>
