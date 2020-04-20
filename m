From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 23:40:19 +0200
Subject: [Buildroot] [PATCH v4 1/1] toolchain/toolchain-buildroot:
 PPC64(LE) support in musl requires ALTIVEC
In-Reply-To: <20200204213548.20234-1-vfazio@xes-inc.com>
References: <20200204192520.2059-1-vfazio@xes-inc.com>
 <20200204213548.20234-1-vfazio@xes-inc.com>
Message-ID: <20200420214019.GR5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

On 2020-02-04 15:35 -0600, Vincent Fazio spake thusly:
> musl currently assumes all PPC64(LE) CPUs support ALTIVEC instructions.
> 
> However, there are exceptions (such as the e5500) for which musl builds
> ultimately generate illegal instructions for the targets.
> 
> Disable musl if the PPC64(LE) CPU does not support ALTIVEC instructions.
> 
> This patch addresses the issues seen here:
>   https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092743
>   https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092744

It's a bit unfortunate that the boot log are not visible in the job
output, though...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> musl mailing list thread:
>   https://www.openwall.com/lists/musl/2020/02/03/10
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
> 
> Changes v3 -> v4:
>   - document musl mailing list thread (suggested by Romain)
> 
> Changes v2 -> v3:
>   - change to 'depends on' semantics (suggested by Romain)
> 
> Changes v1 -> v2:
>   - clarify commit message (suggested by Matthew)
>   - add job logs (suggested by Romain)
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  toolchain/toolchain-buildroot/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index a980f766ac..8c33b2b4dd 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -86,6 +86,7 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
>  		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
>  		   BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
>  	depends on !BR2_powerpc_SPE # not supported, build breaks
> +	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
>  	# sh2 nommu is supported by musl, but we don't have support
>  	# for it in Buildroot.
>  	depends on BR2_USE_MMU
> -- 
> 2.25.0
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
