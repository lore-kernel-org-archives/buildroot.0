From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Sep 2020 11:24:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: add
 BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
In-Reply-To: <20200906080028.2351575-1-fontaine.fabrice@gmail.com>
References: <20200906080028.2351575-1-fontaine.fabrice@gmail.com>
Message-ID: <20200906092411.GL14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-09-06 10:00 +0200, Fabrice Fontaine spake thusly:
> makedumpfile only defines KV_BASE in makedumpfile.h with the following
> architectures:
>  - aarch64
>  - arm
>  - x86
>  - x86_64
>  - powerpc32

You forgot pp64 in this list, so I added it. ;-)

>  - s390
>  - ia64
>  - sparc64
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0e20c17bd604ee1168cc379061c120a2d8263e5f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/makedumpfile/Config.in | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
> index 8ae8579cea..a90ccbdf3c 100644
> --- a/package/makedumpfile/Config.in
> +++ b/package/makedumpfile/Config.in
> @@ -1,9 +1,19 @@
> +config BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64 || BR2_aarch64_be
> +	default y if BR2_arm || BR2_armeb
> +	default y if BR2_i386 || BR2_x86_64
> +	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> +	default y if BR2_sparc64
> +
>  comment "makedumpfile needs a uClibc or glibc toolchain w/ wchar, dynamic library"
> +	depends on BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
>  	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
>  		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
>  
>  config BR2_PACKAGE_MAKEDUMPFILE
>  	bool "makedumpfile"
> +	depends on BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS # dlopen
>  	depends on BR2_USE_WCHAR
> -- 
> 2.28.0
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
