From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 13:54:58 +0100
Subject: [Buildroot] [PATCH 1/3] package/libopenssl: move target arch
 selection to Config.in
In-Reply-To: <20191027102420.15560-2-thomas.petazzoni@bootlin.com>
References: <20191027102420.15560-1-thomas.petazzoni@bootlin.com>
 <20191027102420.15560-2-thomas.petazzoni@bootlin.com>
Message-ID: <20191230125458.GO26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-10-27 11:24 +0100, Thomas Petazzoni spake thusly:
> The logic to select the proper OpenSSL target arch in libopenssl.mk is
> not easy to read, so let's move it to Config.in where we have some
> nice constructs for that kind of value selection.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/libopenssl/Config.in     | 29 ++++++++++++++++++++++++++
>  package/libopenssl/libopenssl.mk | 35 +-------------------------------
>  package/openssl/Config.in        |  2 ++
>  3 files changed, 32 insertions(+), 34 deletions(-)
>  create mode 100644 package/libopenssl/Config.in
> 
> diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
> new file mode 100644
> index 0000000000..732da5b4ef
> --- /dev/null
> +++ b/package/libopenssl/Config.in
> @@ -0,0 +1,29 @@
> +# 4xx PowerPC cores seem to have trouble with openssl's ASM
> +# optimizations
> +config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC

Why 'LINUX' in the option name?

> +	bool
> +	default y if BR2_powerpc
> +	depends on !BR2_powerpc_401
> +	depends on !BR2_powerpc_403
> +	depends on !BR2_powerpc_405
> +	depends on !BR2_powerpc_405fp
> +	depends on !BR2_powerpc_440
> +	depends on !BR2_powerpc_440fp
> +
> +config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
> +	string
> +	# Use "gcc" minimalistic target to disable DSO
> +	# no-asm is needed with generic architectures such as gcc, see
> +	# https://github.com/openssl/openssl/issues/9839
> +	default "gcc no-asm"			if BR2_STATIC_LIBS
> +	# Doesn't work for thumb-only (Cortex-M?)
> +	default "linux-armv4"			if BR2_ARM_CPU_HAS_ARM
> +	default "linux-aarch64"			if BR2_aarch64

So I know you just transposed the existing logic from Makefile to
Kconfig. Yet, I'd like to point at how fragile this ordering is.

The arm vs. aarch64 situation works because BR2_ARM_CPU_HAS_ARM is never
selected by an armv8 CPU when it works in 64bit mode.

I think a more reliable way would have been something like:

    config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_ARM
        bool
        default y if BR2_arm || BR2_armeb
        depends on BR2_ARM_CPU_HAS_ARM

and then:

    default "linux-armv4"  if BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_ARM

But since that patch was just a transposition from Makefiel to Kconfig,
I've left it as-is and applied to master.

> +	default "linux-ppc"			if BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
> +	default "linux-ppc64"			if BR2_powerpc64
> +	default "linux-ppc64le"			if BR2_powerpc64le
> +	default "linux-x86_64"			if BR2_x86_64
> +	# no-asm is needed with generic architectures such as
> +	# linux-generic32, see
> +	# https://github.com/openssl/openssl/issues/9839
> +	default "linux-generic32 no-asm"
[--SNIP--]
> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> index a64660bea3..4d37a3ecf9 100644
> --- a/package/openssl/Config.in
> +++ b/package/openssl/Config.in
> @@ -43,6 +43,8 @@ config BR2_PACKAGE_LIBOPENSSL_ENGINES
>  	help
>  	  Install additional encryption engine libraries.
>  
> +source "package/libopenssl/Config.in"

Amybe it makes sense to move BR2_PACKAGE_LIBOPENSSL_BIN there too?

Regards,
Yann E. MORIN.

>  endif
>  
>  config BR2_PACKAGE_LIBRESSL
> -- 
> 2.21.0
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
