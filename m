From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Sep 2017 12:30:32 +0200
Subject: [Buildroot] [PATCH v2 05/11] package/glibc: needs kernel
 headers >= 3.10 on powerpc64le
In-Reply-To: <20170902205423.21288-6-romain.naour@gmail.com>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-6-romain.naour@gmail.com>
Message-ID: <20170910103032.GF3536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-09-02 22:54 +0200, Romain Naour spake thusly:
> Since glibc 2.26, kernel headers >= 3.10 are needed on powerpc64le [1].
> In order to prepare the glibc bump to this version, we don't allow to
> build a Buildroot toolchain with kernel headers older than 3.10.
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=c2ff5ec13fca1bdd1cd646a0260808386d7bd7ff
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-buildroot/Config.in | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index f47001f..8ffad61 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -45,7 +45,8 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
>  		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
>  		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
> -		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
> +		   BR2_powerpc     || BR2_powerpc64  || \
> +		   (BR2_powerpc64le && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10) || \

I would leave this section about architectures totally intact, and add
the dependency later, right after the 3.2 one:

    depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
    depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le

Regards,
Yann E. MORIN.

>  		   BR2_sh          || BR2_sparc64    || BR2_x86_64 || \
>  		   BR2_microblaze || BR2_nios2
>  	depends on BR2_USE_MMU
> @@ -65,6 +66,11 @@ comment "glibc needs a toolchain w/ dynamic library, kernel headers >= 3.2"
>  	depends on BR2_USE_MMU
>  	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>  
> +# glibc >= 2.26 require kernel headers >= 3.10 on powerpc64le.
> +comment "glibc on powerpc64le needs a toolchain w/ headers >= 3.10"
> +	depends on BR2_powerpc64le
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> +
>  config BR2_TOOLCHAIN_BUILDROOT_MUSL
>  	bool "musl"
>  	depends on BR2_aarch64	  || BR2_arm     || BR2_armeb     || BR2_i386 || \
> -- 
> 2.9.5
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
