From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Sep 2020 22:33:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/kbd: needs gcc 4.9
In-Reply-To: <20200908194545.75939-1-fontaine.fabrice@gmail.com>
References: <20200908194545.75939-1-fontaine.fabrice@gmail.com>
Message-ID: <20200908203306.GZ14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-09-08 21:45 +0200, Fabrice Fontaine spake thusly:
> kbd uses _Generic since version 2.2.90 and
> https://github.com/legionus/kbd/commit/da5feb8fd90c3a0df9d505d4604c629d051d3d7d
> 
> However, _Generic is not available until gcc 4.9:
> https://gcc.gnu.org/wiki/C11Status
> 
> As a result, build with gcc 4.8 fails on:
> 
> setleds.c:352:3: warning: implicit declaration of function '_Generic' [-Wimplicit-function-declaration]
>    ndefflags = BITMASK_SET(BITMASK_UNSET(odefflags, ndef), nval);
>    ^
> setleds.c:22:2: error: expected expression before 'unsigned'
>   unsigned char: (unsigned char)(~(x)) \
>   ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b74ecdda44543da1d47fa2c027fb046a3ca1e2d1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/kbd/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/kbd/Config.in b/package/kbd/Config.in
> index 6cf2fc0dc6..0099bc750c 100644
> --- a/package/kbd/Config.in
> +++ b/package/kbd/Config.in
> @@ -2,7 +2,11 @@ config BR2_PACKAGE_KBD
>  	bool "kbd"
>  	# Uses fork()
>  	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Generic
>  	help
>  	  Keytable files and keyboard utilities.
>  
>  	  http://kernel.org/pub/linux/utils/kbd/
> +
> +comment "kbd needs a toolchain w/ gcc >= 4.9"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

You forgot the MMU dependency in the comment, so I added it and pushed
to master, thanks!

Regards,
Yann E. MORIN.

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
