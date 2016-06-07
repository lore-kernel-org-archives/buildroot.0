From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jun 2016 23:13:07 +0200
Subject: [Buildroot] [PATCH v2 next 3/7] binutils: handle ARC more
	atomically
In-Reply-To: <1464693078-15767-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1464693078-15767-1-git-send-email-Vincent.Riera@imgtec.com>
 <1464693078-15767-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160607211307.GE3775@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2016-05-31 12:11 +0100, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>  - This patch didn't exist in v1.
> 
>  package/binutils/Config.in.host | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index efdc840..c7cf094 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -2,25 +2,34 @@ comment "Binutils Options"
>  
>  choice
>  	prompt "Binutils Version"
> -	depends on !BR2_arc
>  	default BR2_BINUTILS_VERSION_2_25_X
>  	help
>  	  Select the version of binutils you wish to use.
>  
>  	config BR2_BINUTILS_VERSION_2_24_X
> +		bool "binutils 2.24"
> +		# ARC support is not upstream yet
> +		depends on !BR2_arc
>  		# supported, but broken on Nios-II and powerpc64le
>  		depends on !BR2_nios2 && !BR2_powerpc64le
>  		# Unsupported for MIPS R6
>  		depends on !BR2_mips_32r6 && !BR2_mips_64r6
>  		# Unsupported ARM cores
>  		depends on !BR2_cortex_a17
> -		bool "binutils 2.24"
>  
>  	config BR2_BINUTILS_VERSION_2_25_X
>  		bool "binutils 2.25.1"
> +		# ARC support is not upstream yet
> +		depends on !BR2_arc
>  
>  	config BR2_BINUTILS_VERSION_2_26_X
>  		bool "binutils 2.26"
> +		# ARC support is not upstream yet
> +		depends on !BR2_arc
> +
> +	config BR2_BINUTILS_VERSION_ARC
> +		bool "arc-2016.03"
> +		depends on BR2_arc

As discussed on IRC, you should also use this new symbol to set the
default value (not a patch!):

     config BR2_BINUTILS_VERSION
         string
    -    default "arc-2016.03" if BR2_arc
    +    default "arc-2016.03" if BR2_BINUTILS_VERSION_ARC
         default "2.24"        if BR2_BINUTILS_VERSION_2_24_X
         default "2.25.1"      if BR2_BINUTILS_VERSION_2_25_X
         default "2.26"        if BR2_BINUTILS_VERSION_2_26_X

With that added, you can add my:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  endchoice
>  
> -- 
> 2.7.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
