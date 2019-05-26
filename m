From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 22:44:52 +0200
Subject: [Buildroot] [PATCH V2 3/9] arch/csky: Add toolchain build
 framework.
In-Reply-To: <1557305915-11247-3-git-send-email-guoren@kernel.org>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
 <1557305915-11247-3-git-send-email-guoren@kernel.org>
Message-ID: <20190526224452.64efb0f7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 May 2019 16:58:29 +0800
guoren at kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> Enable csky buildroot build toolchain in framework.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  arch/Config.in      | 1 -
>  package/Makefile.in | 9 +++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index d82803c..db1199c 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -77,7 +77,6 @@ config BR2_aarch64_be
>  
>  config BR2_csky
>  	bool "csky"
> -	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT

The ordering is not good: you can't remove this "select" until all the
toolchain components have C-SKY support added. So this patch should
come later in the series, it should actually be one of the last patch,
and should be: "arch/csky: enable internal toolchain backend" or
something like that.

> diff --git a/package/Makefile.in b/package/Makefile.in
> index dc818a2..f05b9cc 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -70,6 +70,15 @@ ABI := $(ABI)hf
>  endif
>  endif
>  
> +# For C-SKY abiv1 & abiv2
> +ifeq ($(BR2_csky),y)
> +ifeq ($(BR2_ck610),y)
> +ABI = abiv1
> +else
> +ABI = abiv2
> +endif
> +endif

This should be a separate patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
