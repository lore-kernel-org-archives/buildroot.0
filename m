From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 May 2014 21:50:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] fio: disable on nios2 because of
 missing fallocate64()
In-Reply-To: <1400527410-4637-1-git-send-email-frank@frajasalo.de>
References: <1400527410-4637-1-git-send-email-frank@frajasalo.de>
Message-ID: <20140519195051.GC3508@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

On 2014-05-19 21:23 +0200, Frank Bergmann spake thusly:
> The fallocate() function is replaced by fallocate64() while compiling
> with LARGE_FILE flags. Current nios2 toolchain is missing the fallocate64()
> function.

It would have been nice to have autobuilders referneces:

Fixes:
    http://autobuild.buildroot.net/results/9cd/9cd30031a40f768f6090cfba44c880fb2406672b
    http://autobuild.buildroot.net/results/7da/7da32ca8178aa6bada06dfaea38e9e693fba0db2
    http://autobuild.buildroot.net/results/0ef/0ef7358289bff2a5f9efda27115eddb379c1a0b9
    [...]

> Signed-off-by: Frank Bergmann <frank@frajasalo.de>

With the aforementioned autobuilders references:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - don't use an architecture-specific patch
>   - disable whole package for nios (suggested by Thomas Petazzoni)
> 
> Signed-off-by: Frank Bergmann <frank@frajasalo.de>
> ---
>  package/fio/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/fio/Config.in b/package/fio/Config.in
> index be99f25..5a20b85 100644
> --- a/package/fio/Config.in
> +++ b/package/fio/Config.in
> @@ -12,6 +12,9 @@ config BR2_PACKAGE_FIO
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_UCLIBC && \
>  		!BR2_UCLIBC_VERSION_0_9_31 && \
>  		!BR2_UCLIBC_VERSION_0_9_32
> +	# fio uses fallocate() which gets fallocate64() while compiling
> +	# with *LARGE_FILE* flags but fallocate64() is not available on nios2
> +	depends on !BR2_nios2
>  	help
>  	  fio is an I/O tool meant to be used both for benchmark
>  	  and stress/hardware verification.
> @@ -20,3 +23,4 @@ config BR2_PACKAGE_FIO
>  
>  comment "fio needs a toolchain w/ largefile, threads"
>  	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_nios2
> -- 
> 1.9.1
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
