From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 12:30:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/uclibc: enable linuxthreads for
 MIPS
In-Reply-To: <20210521095924.52527-1-mgliga@bitdefender.com>
References: <20210521095924.52527-1-mgliga@bitdefender.com>
Message-ID: <20210521103052.GK3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mircea, All,

On 2021-05-21 12:59 +0300, Mircea GLIGA spake thusly:
> Required for systems that do not have FUTEX support in kernel.
> Native POSIX Thread Library (NPTL) relies on futexes, so we need
> to use LinuxThreads instead on that systems.
> 
> Signed-off-by: Mircea GLIGA <mgliga@bitdefender.com>
> ---
>  package/uclibc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index e59fef3c69..ae27bc18fb 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -53,7 +53,7 @@ config BR2_PTHREADS_NATIVE
>  
>  config BR2_PTHREADS
>  	bool "linuxthreads"
> -	depends on BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa
> +	depends on BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa || BR2_mips || BR2_mipsel

I was a bit annoyed by this very logn line, so I took the liberyty to
split it, but then I looked at uclibc-ng for the list of architectures
that still has LT support, and it turns out that almost all do, except:

  - AArch64 (both endianness)
  - riscv64
  - metag (irrelevant for Buildroot)

So I think it would be better to change the way we expose BR2_PTHREADS
for uClibc:

    config BR2_PTHREADS
        bool "linuxthreads"
        depends on !BR2_aarch64 && !BR2_aarch64_be
        depends on !BR2_RISCV_64

Could you please respin with this, please?

Regards,
Yann E. MORIN.

>  	select BR2_TOOLCHAIN_HAS_THREADS
>  
>  config BR2_PTHREADS_NONE
> -- 
> 2.31.1
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
