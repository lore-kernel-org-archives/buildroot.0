From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2015 17:23:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: disable for static build
In-Reply-To: <1438506439-3096-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438506439-3096-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150802152333.GC3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2015-08-02 11:07 +0200, J?rg Krause spake thusly:
> nodejs requires dlopen(), etc.
> 
> Fixes:
> http://autobuild.buildroot.net/results/87d/87dab0186abd7b2737a56b2f939f3aba294e8772/
> http://autobuild.buildroot.net/results/be1/be1010a3a31642d49ec3a118858c77fed2f762b8/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/nodejs/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index c5ec792..69063fc 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -8,17 +8,18 @@ config BR2_PACKAGE_NODEJS
>  	depends on !BR2_ARM_CPU_ARMV4
>  	# uses fork()
>  	depends on BR2_USE_MMU
> +	depends on !BR2_STATIC_LIBS # dlopen, etc.

That's not entirely true. For armv5, nodejs 0.10 does not require
dynamic libraries.

So, maybe something like:

    config BR2_PACKAGE_NODEJS
        depends on !BR2_STATIC_LIBS if BR2_arm && !BR2_ARM_CPU_ARMV5

>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  Event-driven I/O server-side JavaScript environment based on V8.
>  
>  	  http://nodejs.org/
>  
> -comment "nodejs needs a toolchain w/ C++, threads"
> +comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
>  	depends on BR2_USE_MMU
>  	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
>  	depends on !BR2_ARM_CPU_ARMV4
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS

However, I don't see a simple solution here. Maybe just add a second
comment just for the dynamic library requirement?

Regards,
Yann E. MORIN.

>  if BR2_PACKAGE_NODEJS
>  
> -- 
> 2.5.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
