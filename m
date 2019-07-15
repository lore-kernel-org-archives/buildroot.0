From: Guo Ren <guoren@kernel.org>
Date: Tue, 16 Jul 2019 07:08:31 +0800
Subject: [Buildroot] [PATCH 1/2] arch/csky: restrict ck610 to the C-SKY
 gcc port
In-Reply-To: <c19ea092f48534429b8d71fe1ae13cb8856008b1.1563098054.git.yann.morin.1998@free.fr>
References: <cover.1563098054.git.yann.morin.1998@free.fr>
 <c19ea092f48534429b8d71fe1ae13cb8856008b1.1563098054.git.yann.morin.1998@free.fr>
Message-ID: <CAJF2gTQz=xo7t2Xjd_p6hGeuiAjUSuUJbXMSDZ2nQDZrjh+w=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Guo Ren <guoren@kernel.org>

On Sun, Jul 14, 2019 at 5:54 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> As Guo explained, upstream gcc does not support abi-v1 (only abi-v2), but
> ck610 needs abi-v1 [0] [1]
>
> To simplify things, we make the whole C-SKY architecture require gcc-9
> or later, and add a single exception in gcc to force the ck610 to use
> the C-SKY port.
>
> [0] http://lists.busybox.net/pipermail/buildroot/2019-July/254386.html
> [1] package/Makefile.in#73
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Romain Naour <romain.naour@gmail.com>
> ---
>  arch/Config.in             | 3 +++
>  arch/Config.in.csky        | 2 ++
>  package/gcc/Config.in.host | 3 +++
>  3 files changed, 8 insertions(+)
>
> diff --git a/arch/Config.in b/arch/Config.in
> index d8d841b1a2..9d1a06872d 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -78,6 +78,9 @@ config BR2_aarch64_be
>  config BR2_csky
>         bool "csky"
>         select BR2_ARCH_HAS_MMU_MANDATORY
> +       # Most variants are support by gcc-9+, except one that is handled as a
> +       # special exception in package/gcc/Config.in.host
> +       select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
>         help
>           csky is processor IP from china.
>           http://www.c-sky.com/
> diff --git a/arch/Config.in.csky b/arch/Config.in.csky
> index 4bdfbfae4b..2cf31c88c6 100644
> --- a/arch/Config.in.csky
> +++ b/arch/Config.in.csky
> @@ -5,6 +5,8 @@ choice
>           Specific CPU variant to use
>
>  config BR2_ck610
> +       # Not supported by upstream gc <= 9, and handled as a special
> +       # exception in package/gcc/Config.in.host
>         bool "ck610"
>
>  config BR2_ck807
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 8b563c8f27..adc12e95ea 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -89,6 +89,9 @@ config BR2_GCC_VERSION_9_X
>         # powerpc spe support has been deprecated since gcc 8.x.
>         # https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
>         depends on !BR2_powerpc_SPE
> +       # C-SKY sk610 needs abiv1, which is not supported in
> +       # upstream gcc
> +       depends on !BR2_ck610
>         select BR2_TOOLCHAIN_GCC_AT_LEAST_9
>
>  endchoice
> --
> 2.20.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
