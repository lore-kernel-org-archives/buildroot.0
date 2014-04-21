From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Apr 2014 19:32:58 +0200
Subject: [Buildroot] [PATCH 1/1] libdrm: needs threads
In-Reply-To: <1398101284-31520-1-git-send-email-romain.naour@openwide.fr>
References: <1398101284-31520-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140421173258.GG3359@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-04-21 19:28 +0200, Romain Naour spake thusly:
> libdrm select libpthread-stubs that needs threads support.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1da/1dad13110312a44b40b9ee4050b265de1f3c8a42/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/libdrm/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
> index 72cf5f8..fdb541e 100644
> --- a/package/libdrm/Config.in
> +++ b/package/libdrm/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBDRM
>  	bool "libdrm"
>  	select BR2_PACKAGE_LIBPTHREAD_STUBS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
>  	depends on BR2_LARGEFILE
>  	help
>  	  Direct Rendering Manager
> @@ -59,5 +60,6 @@ endmenu
>  
>  endif
>  
> -comment "libdrm needs a toolchain w/ largefile"
> +comment "libdrm needs a toolchain w/ largefile, threads"
>  	depends on !BR2_LARGEFILE
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

This should be:
    depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS

Otherwise, the comment is only visible when both are not set, while we
want to see the comment as soon as at least one is not set.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
