From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 May 2021 22:41:51 +0200
Subject: [Buildroot] [PATCH v3, 1/1] Config.in: enable FORTIFY_SOURCE,
 PIC/PIE, RELRO, SSP by default
In-Reply-To: <20210503182241.38713-1-fontaine.fabrice@gmail.com>
References: <20210503182241.38713-1-fontaine.fabrice@gmail.com>
Message-ID: <20210503204151.GJ2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-03 20:22 +0200, Fabrice Fontaine spake thusly:
> Enhance security by enabling FORTIFY_SOURCE, PIC/PIE, RELRO and SSP by
> default.
> 
> This could help making IoT more secure and fight against the assumption
> that buildroot does not support binary hardening (see
> https://cyber-itl.org/2019/08/26/iot-data-writeup.html)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3:
>  - Drop BR2_ENABLE_SSP comment from Config.in.legacy
>  - Drop condition on second RELRO default (after Yann E. Morin review)
>  - Set BR2_FORTIFY_SOURCE_1 by default (after Yann E. Morin and Matthew
>    Weber review)
> 
> Changes v1 -> v2:
>  - Use RELRO_PARTIAL if toolchain does not support PIE
>  - Enable BR2_FORTIFY_SOURCE_2 by default
> 
>  Config.in        | 6 +++++-
>  Config.in.legacy | 1 -
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index e35a78fb71..6d954e1e0f 100644
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

While discussing this with Matt on IRC, we noticed that SSP-all can have
quite a significant impact on performance, and that SSP-strong (when
available) would be a better default (resorting to SSP-regular
otherwise).

Yes, this decreases the security level Buildroot wil use by default. But
security is always to be balanced against performance, and this is always
a tricky choice to make; I believe relaxing SSP was striking a good
balance (especially since, today, most gcc versions should have
SSP-strong available).

Applied to master, thank you!

Regards,
Yann E. MORIN.

>  	depends on BR2_TOOLCHAIN_HAS_SSP
>  	help
>  	  Enable stack smashing protection support using GCC's
> @@ -789,6 +790,8 @@ comment "Stack Smashing Protection needs a toolchain w/ SSP"
>  
>  choice
>  	bool "RELRO Protection"
> +	default BR2_RELRO_FULL if BR2_TOOLCHAIN_SUPPORTS_PIE
> +	default BR2_RELRO_PARTIAL
>  	depends on BR2_SHARED_LIBS
>  	help
>  	  Enable a link-time protection know as RELRO (RELocation Read
> @@ -825,6 +828,7 @@ comment "RELocation Read Only (RELRO) needs shared libraries"
>  
>  choice
>  	bool "Buffer-overflow Detection (FORTIFY_SOURCE)"
> +	default BR2_FORTIFY_SOURCE_1
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on !BR2_OPTIMIZE_0
>  	help
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 629d02dbf2..4b920b400e 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -3527,7 +3527,6 @@ config BR2_PACKAGE_PYTHON_PYXML
>  	  PyXML is obsolete and its functionality is covered either via
>  	  native Python XML support or python-lxml package.
>  
> -# BR2_ENABLE_SSP is still referenced in Config.in (default in choice)
>  config BR2_ENABLE_SSP
>  	bool "Stack Smashing protection now has different levels"
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
