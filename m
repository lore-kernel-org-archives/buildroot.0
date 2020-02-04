From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 4 Feb 2020 21:55:11 +0100
Subject: [Buildroot] [PATCH v3 1/1] toolchain/toolchain-buildroot:
 PPC64(LE) support in musl requires ALTIVEC
In-Reply-To: <20200204192520.2059-1-vfazio@xes-inc.com>
References: <20200131153952.680-1-vfazio@xes-inc.com>
 <20200204192520.2059-1-vfazio@xes-inc.com>
Message-ID: <a49512a3-205a-1a87-2b03-3fc7a1f9850e@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

Le 04/02/2020 ? 20:25, Vincent Fazio a ?crit?:
> musl currently assumes all PPC64(LE) CPUs support ALTIVEC instructions.
> 
> However, there are exceptions (such as the e5500) for which musl builds
> ultimately generate illegal instructions for the targets.
> 
> Disable musl if the PPC64(LE) CPU does not support ALTIVEC instructions.

Maybe the link to the report to the mailing list can be added:
https://www.openwall.com/lists/musl/2020/02/03/10

Otherwise:

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> 
> This patch addresses the issues seen here:
>   https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092743
>   https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092744
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
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
> 
