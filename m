From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Aug 2014 23:04:10 +0200
Subject: [Buildroot] [PATCH v4 4/4] msgpack: Add dependency on atomic
 intrinsics
In-Reply-To: <1407510572-20603-4-git-send-email-Anton.Kolesov@synopsys.com>
References: <CAAXf6LURyGxEfQR+3g6xriwqUeE1E91Oav2X=r_C3YD66JzpEA@mail.gmail.com>
 <1407510572-20603-1-git-send-email-Anton.Kolesov@synopsys.com>
 <1407510572-20603-4-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140815210410.GE25897@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anton, All,

On 2014-08-08 19:09 +0400, Anton Kolesov spake thusly:
> Msgpack requires GCC built-in atomic functions which are architecture specific
> and may not be implemented.

Well, this patch does a bit more than that: it replaces the dependency
on !ARC with the new generic dependency.

What about enhancing the commit log as thus, for example:

    Msgpack requires GCC built-in atomic functions which are
    architecture specific and may not be implemented.

    Replace the current dependency on !ARC (which was the sole
    architecture so far to not have intrinsics), to the generic
    _HAS_ATOMIC_INTRINSICS dependency.

Otherwise:
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> This fixes:
> http://autobuild.buildroot.net/results/44849a386cefb8899f4560296bfbbd8ea19ee910/
> 
> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
> ---
>  package/msgpack/Config.in        | 7 +++----
>  package/python-msgpack/Config.in | 7 +++----
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
> index b380c58..7d6277f 100644
> --- a/package/msgpack/Config.in
> +++ b/package/msgpack/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_MSGPACK
>  	bool "msgpack"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_arc # atomic builtins
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
>  	help
>  	  MessagePack is an efficient binary serialization format.
>  
> @@ -10,6 +10,5 @@ config BR2_PACKAGE_MSGPACK
>  
>  	  http://msgpack.org/
>  
> -comment "msgpack needs a toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_arc
> +comment "msgpack needs a toolchain w/ C++, atomic intrinsics"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
> index c4b68a3..3b825a1 100644
> --- a/package/python-msgpack/Config.in
> +++ b/package/python-msgpack/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_MSGPACK
>  	depends on BR2_PACKAGE_PYTHON
>  	select BR2_PACKAGE_MSGPACK
>  	depends on BR2_INSTALL_LIBSTDCPP # msgpack
> -	depends on !BR2_arc # msgpack - atomic builtins
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # msgpack
>  	help
>  	  MessagePack (http://msgpack.org/) is a fast, compact binary
>  	  serialization format, suitable for similar data to JSON.
> @@ -12,7 +12,6 @@ config BR2_PACKAGE_PYTHON_MSGPACK
>  
>  	  https://pypi.python.org/pypi/msgpack-python/
>  
> -comment "python-msgpack needs a toolchain w/ C++"
> +comment "python-msgpack needs a toolchain w/ C++, atomic intrinsics"
>  	depends on BR2_PACKAGE_PYTHON
> -	depends on !BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_arc
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> -- 
> 1.8.4.1
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
