From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 12:12:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/dc3dd: disable on riscv32
In-Reply-To: <20210604184706.5069-1-fontaine.fabrice@gmail.com>
References: <20210604184706.5069-1-fontaine.fabrice@gmail.com>
Message-ID: <20210605101207.GM168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-04 20:47 +0200, Fabrice Fontaine spake thusly:
> Disable dc3dd on riscv32 to avoid the following build failure:
> 
> In file included from getdate.y:40:
> verify.h:132:30: error: negative width in bit-field 'verify_error_if_negative_size__'
>   132 |       (struct { unsigned int verify_error_if_negative_size__: (R) ? 1 : -1; }))
>       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You left out the most important part of the error message:

    verify.h:138:61: note: in expansion of macro 'verify_true'
      138 | # define verify(R) extern int (* verify_function__ (void)) [verify_true (R)]
          |                                                             ^~~~~~~~~~~
    getdate.y:116:1: note: in expansion of macro 'verify'
      116 | verify (LONG_MIN <= TYPE_MINIMUM (time_t) && TYPE_MAXIMUM (time_t) <= LONG_MAX);
          | ^~~~~~

This is again the case where riscv32 has never had a 32-bit wide time,
and got 64-bit from the onset.

I've added this extra info to the commit log and applied to master,
thanks.

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results/267151dec9d2328a5f8c61ddf224219a4f617e5c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dc3dd/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
> index 0383897cd5..715451beb7 100644
> --- a/package/dc3dd/Config.in
> +++ b/package/dc3dd/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_DC3DD
>  	bool "dc3dd"
> +	depends on !BR2_RISCV_32
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	help
> @@ -11,5 +12,6 @@ config BR2_PACKAGE_DC3DD
>  	  https://sourceforge.net/projects/dc3dd/
>  
>  comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
> +	depends on !BR2_RISCV_32
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
>  		BR2_TOOLCHAIN_USES_MUSL
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
