From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2020 19:05:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: ffi needs dynamic library
In-Reply-To: <20200823145320.3967619-1-fontaine.fabrice@gmail.com>
References: <20200823145320.3967619-1-fontaine.fabrice@gmail.com>
Message-ID: <20200823170510.GI8728@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-08-23 16:53 +0200, Fabrice Fontaine spake thusly:
> FFI support in php has been added with commit
> e16f05c0f00081d446ebee56d9f3ad3cf41da1ae, it depends on dynamic library
> otherwise the build will fail on:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.5.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ext/ffi/ffi.o: in function `zim_FFI_cdef':
> ffi.c:(.text+0xe78): undefined reference to `DL_LOAD'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3380b7b6777d1c5fcb53c855b003466fa3bf2079
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Your 3 php-related patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/php/Config.ext | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index 33a6455366..3a86bf95b7 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -424,12 +424,13 @@ config BR2_PACKAGE_PHP_EXT_XSL
>  
>  config BR2_PACKAGE_PHP_EXT_FFI
>  	bool "FFI"
> +	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_LIBFFI
>  	help
>  	  Foreign Function Interface support
>  
> -comment "PHP FFI extension needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "PHP FFI extension needs a toolchain w/ threads, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>  
>  endmenu
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
