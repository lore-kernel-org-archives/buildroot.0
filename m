From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 May 2015 18:18:37 +0200
Subject: [Buildroot] [PATCH] package/efl/libelementary: disable on
 static lib only build
In-Reply-To: <1432389399-12671-1-git-send-email-s.martin49@gmail.com>
References: <1432389399-12671-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150523161837.GB19247@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-05-23 15:56 +0200, Samuel Martin spake thusly:
> libelementary sources include dlfcn.h header when HAVE_FORK symbol is defined;
> this is always the case because elf already depends on BR2_USE_MMU.

Although I understand the thechnical reason to require !STATIC, I fail
to see the how this commit log describes the actual change.

That is, I fail to see why "fork + ELF + MMU" implies we need to depend
on !STATIC.

Also, ELF requiring an MMU is absolutely wrong. You can run ELF files on
MMU-less systems.

Regards,
Yann E. MORIN.

> Fixes:
>   http://autobuild.buildroot.org/results/07c/07c97918dab24215f5c5130a9cd2788adca0a27d/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/efl/libelementary/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
> index c193ef1..4f62592 100644
> --- a/package/efl/libelementary/Config.in
> +++ b/package/efl/libelementary/Config.in
> @@ -1,5 +1,5 @@
> -comment "libelementary needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "libelementary needs a toolchain w/ threads, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>  
>  config BR2_PACKAGE_LIBELEMENTARY
>  	bool "libelementary"
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_LIBELEMENTARY
>  	select BR2_PACKAGE_LIBECORE
>  	select BR2_PACKAGE_LIBEDJE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
> +	depends on !BR2_STATIC_LIBS
>  	help
>  	  Elementary is a widget toolkit and EFL wrapper and convenience
>  	  library to make it easy to build applications and tools with UIs
> -- 
> 2.4.1
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
