From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 May 2016 19:48:53 +0200
Subject: [Buildroot] [PATCH next 3/4] binutils: select the appropriate
 BR2_TOOLCHAIN_BINUTILS_AT_LEAST_X_Y
In-Reply-To: <1464351957-50031-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1464351957-50031-1-git-send-email-Vincent.Riera@imgtec.com>
 <1464351957-50031-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160527174853.GC3624@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2016-05-27 13:25 +0100, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/binutils/Config.in.host | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index efdc840..09d1602 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -2,25 +2,38 @@ comment "Binutils Options"
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
> +		select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
>  
>  	config BR2_BINUTILS_VERSION_2_25_X
>  		bool "binutils 2.25.1"
> +		# ARC support is not upstream yet
> +		depends on !BR2_arc
> +		select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
>  
>  	config BR2_BINUTILS_VERSION_2_26_X
>  		bool "binutils 2.26"
> +		# ARC support is not upstream yet
> +		depends on !BR2_arc
> +		select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_26
> +
> +	config BR2_BINUTILS_VERSION_ARC
> +		bool "arc-2016.03"
> +		depends on BR2_arc
> +		select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_26

This patch does two things;

  - add the binutils-at-least options
  - change the way we handle the ARC stuff

It should be split in two patches.

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
