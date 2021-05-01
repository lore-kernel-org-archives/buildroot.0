From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 May 2021 00:01:49 +0200
Subject: [Buildroot] [PATCH v2, 1/1] Config.in: enable FORTIFY_SOURCE,
 PIC/PIE, RELRO, SSP by default
In-Reply-To: <20210425124156.2394741-1-fontaine.fabrice@gmail.com>
References: <20210425124156.2394741-1-fontaine.fabrice@gmail.com>
Message-ID: <20210501220149.GH2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

+Adam who poked me on IRC... ;-)

On 2021-04-25 14:41 +0200, Fabrice Fontaine spake thusly:
> Enhance security by enabling FORTIFY_SOURCE, PIC/PIE, RELRO and SSP by
> default.
> 
> This could help making IoT more secure and fight against the assumption
> that buildroot does not support binary hardening (see
> https://cyber-itl.org/2019/08/26/iot-data-writeup.html)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Use RELRO_PARTIAL if toolchain does not support PIE
>  - Enable BR2_FORTIFY_SOURCE_2 by default
> 
>  Config.in | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index e35a78fb71..db6d4f01b4 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -715,6 +715,7 @@ comment "Security Hardening Options"
>  
>  config BR2_PIC_PIE
>  	bool "Build code with PIC/PIE"
> +	default y
>  	depends on BR2_SHARED_LIBS
>  	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
>  	help
> @@ -727,7 +728,7 @@ comment "PIC/PIE needs a toolchain w/ PIE"
>  
>  choice
>  	bool "Stack Smashing Protection"
> -	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
> +	default BR2_SSP_ALL
>  	depends on BR2_TOOLCHAIN_HAS_SSP
>  	help
>  	  Enable stack smashing protection support using GCC's
> @@ -789,6 +790,8 @@ comment "Stack Smashing Protection needs a toolchain w/ SSP"
>  
>  choice
>  	bool "RELRO Protection"
> +	default BR2_RELRO_FULL if BR2_TOOLCHAIN_SUPPORTS_PIE
> +	default BR2_RELRO_PARTIAL if !BR2_TOOLCHAIN_SUPPORTS_PIE

Not your fault, but this relro-full conflates two things: actual relro,
and bind-now. The two are supposedly orthogonal: it is possible to do
bind-now without relro (and obviously, the reverse).

Second nit: the second default entry does not need to have a condition:
kconfig will stop on the first default entry which condition is met, so
the second default entry would only apply if the first did not meet its
condition.

>  	depends on BR2_SHARED_LIBS
>  	help
>  	  Enable a link-time protection know as RELRO (RELocation Read
> @@ -825,6 +828,7 @@ comment "RELocation Read Only (RELRO) needs shared libraries"
>  
>  choice
>  	bool "Buffer-overflow Detection (FORTIFY_SOURCE)"
> +	default BR2_FORTIFY_SOURCE_2

This one however is the most problematic: fortify level 2 changes the
behaviour of some glibc functions, so programs that were conforming may
start to fail with level 2.

Level 1, on the other hand, does not change any function behaviour, so
if we want to enable fortify by default, that would be level 1.

I'll sit on this patch yet a little bit, and barring better arguments,
I'll apply it, with fortify downgraded to level 1, before the end of the
WE.

Regards,
Yann E. MORIN.

>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on !BR2_OPTIMIZE_0
>  	help
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
