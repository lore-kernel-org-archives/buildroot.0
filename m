From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 14:05:43 +0200
Subject: [Buildroot] [RFC for-next] package/gcc: enable secureplt for
 powerpc64
In-Reply-To: <20210517201327.755689-1-romain.naour@gmail.com>
References: <20210517201327.755689-1-romain.naour@gmail.com>
Message-ID: <20210518120543.GC2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2021-05-17 22:13 +0200, Romain Naour spake thusly:
> GCC support enabling secureplt for powerpc64.
> 
> From [1]
> "PowerPC has two PLT models: BSS-PLT and Secure-PLT. BSS-PLT uses
> runtime code generation to generate the PLT stubs. Secure-PLT was
> introduced with GCC 4.1 and Binutils 2.17 (base has GCC 4.2.1 and
> Binutils 2.17), and is a more secure PLT format, using a read-only

gcc 4.1 and binutils 2.17 are really old, now; everything and everyone
has better than that nowadays.

> linkage table, with the dynamic linker populating a non-executable
> index table."
> 
> This option is always enabled by glibc testing script
> called build-many-glibcs.py [1]. This script exist since
> glibc 2.25.
> 
> Runtime tested with qemu_ppc64_e5500_defconfig.

Good enough for me.

> [1] https://reviews.freebsd.org/D20598
> [2] https://sourceware.org/git/?p=glibc.git;a=blob;f=scripts/build-many-glibcs.py;h=9c08ab7b326e6385abb835eb32dd143952a71942;hb=9826b03b747b841f5fc6de2054bf1ef3f5c4bdf3#l345
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Matt Weber <matthew.weber@collins.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> While looking at ppc secureplt issue with BR2_PIC_PIE, I noticed
> that gcc --enable-secureplt option was only used for BR2_powerpc
> although it's also available for powerpc64.
> 
> I don't have a powerpc64 hardware for real testing.
> Test welcome.
> ---
>  package/gcc/gcc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 5e419f7ede..ed9b93e50f 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -231,7 +231,7 @@ endif
>  # Set default to Secure-PLT to prevent run-time
>  # generation of PLT stubs (supports RELRO and
>  # SELinux non-exemem capabilities)
> -ifeq ($(BR2_powerpc),y)
> +ifeq ($(BR2_powerpc)$(BR2_powerpc64),y)
>  HOST_GCC_COMMON_CONF_OPTS += --enable-secureplt
>  endif
>  
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
