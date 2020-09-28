From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Sep 2020 21:47:39 +0200
Subject: [Buildroot] [PATCH 2/2] package/zstd: link programs dynamically
 with libzstd to save space
In-Reply-To: <20200928114228.23637-2-patrickdepinguin@gmail.com>
References: <20200928114228.23637-1-patrickdepinguin@gmail.com>
 <20200928114228.23637-2-patrickdepinguin@gmail.com>
Message-ID: <20200928194739.GN11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Second review, as I forgot to read down to the end before replying...

On 2020-09-28 13:42 +0200, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Even when a shared libzstd is built, the zstd command-line programs are
> statically linked with libzstd, causing a large rootfs footprint.
> 
> While the cmake backend in zstd already supported a flag
> ZSTD_PROGRAMS_LINK_SHARED, the make backend did not.
> 
> This commit adds support for ZSTD_PROGRAMS_LINK_SHARED in the make system
> and applies it for the target compilation, unless only static libs are
> supported.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
[--SNIP--]
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index 35002da332..c7b224b002 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -43,9 +43,19 @@ ZSTD_INSTALL_LIBS = install-static
>  else ifeq ($(BR2_SHARED_LIBS),y)
>  ZSTD_BUILD_LIBS = libzstd
>  ZSTD_INSTALL_LIBS = install-shared
> +ZSTD_OPTS += ZSTD_PROGRAMS_LINK_SHARED=1
>  else
>  ZSTD_BUILD_LIBS = libzstd.a libzstd
>  ZSTD_INSTALL_LIBS = install-static install-shared
> +ZSTD_OPTS += ZSTD_PROGRAMS_LINK_SHARED=1
> +endif
> +
> +# The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
> +# one. Building a multi-threaded binary with a library (which defaults to
> +# single-threaded) gives a runtime error when compressing files.
> +# The 'lib' makefile provides specific '%-mt' targets for this purpose.
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
>  endif

This last part seems unrelated, and should be in its own patch. If not,
then it should be explained in the commit log.

Regards,
Yann E. MORIN.

>  define ZSTD_BUILD_CMDS
> -- 
> 2.26.2
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
