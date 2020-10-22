From: =?utf-8?B?SGVydsOpIENPRElOQQ==?= <Herve.CODINA@celad.com>
Date: Thu, 22 Oct 2020 11:18:11 +0000
Subject: [Buildroot] [PATCH] Makefile: be careful what we remove from
 saved defconfig
In-Reply-To: <20201021200828.3376405-1-yann.morin.1998@free.fr>
References: <20201021200828.3376405-1-yann.morin.1998@free.fr>
Message-ID: <c1726e11-aa4c-4d54-ccd5-0bbc7b645ea2@celad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/10/2020 22:08, Yann E. MORIN wrote:
> When we savedefconfig, we remove BR2_DEFCONFIG (f71a621d91e, savedefconfig:
> Remove BR2_DEFCONFIG from saved defconfig file) and BR2_DL_DIR (36edacce9c2,
> Makefile: exclude BR2_DL_DIR from savedefconfig), because their meaning
> is only valid locally.
> 
> However, we were not careful to really match the exact variables, so we
> could match arbitrary options.
> 
> For example, these config options would all be dropped:
> 
>      BR2_DEFCONFIG="toto"
>      BR2_DL_DIR="titi"
>      BR2_PACKAGE_SABR2_DEFCONFIG="tutu"
>      BR2_PACKAGE_SABR2_DL_DIR=y
> 
> While the first two are indeed the ones we want to drop, the last two
> are options (whatever their meaning or how poorly named they are) of the
> hypothetical 'sabr2' package, and we want to keep those in a defconfig.
> 
> When cleaning the just-saved defconfig, be sure to anchor the patterns to
> the beginning of the line.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Sven Oliver Moll <buildroot@svol.li>
> Cc: Herve Codina <Herve.CODINA@celad.com>

Oups, my bad.

Acked-by: Herve Codina <Herve.CODINA@celad.com>

Best regards,
Herve Codina

> ---
>   Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index d1d19d8f40..d4751e278e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1027,8 +1027,8 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>   	@$(COMMON_CONFIG_ENV) $< \
>   		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
>   		$(CONFIG_CONFIG_IN)
> -	@$(SED) '/BR2_DEFCONFIG=/d' \
> -		-e '/BR2_DL_DIR=/d' \
> +	@$(SED) '/^BR2_DEFCONFIG=/d' \
> +		-e '/^BR2_DL_DIR=/d' \
>   		$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)>   
>   .PHONY: defconfig savedefconfig update-defconfig
> 
