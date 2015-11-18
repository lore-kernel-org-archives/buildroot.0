From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 18 Nov 2015 16:40:17 +0100
Subject: [Buildroot] [PATCH 15/21 RFC] core/pkg-generic: add macro to
 hardlink-or-copy
In-Reply-To: <13184d01305cbba2861610b0e54ffa3895c8a2f0.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <13184d01305cbba2861610b0e54ffa3895c8a2f0.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <564C9BE1.6010008@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>   package/pkg-generic.mk | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 544ae5c..82fbeb0 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -305,6 +305,24 @@ endif
>   endef
>
>   ################################################################################
> +# hardlink-copy -- hardlink source and destination if possible, otherwise
> +# do a simple copy
> +#
> +# argument 1 is the source
> +# argument 2 is the destination *directory*
> +#
> +# example:
> +#   $(call hard-link-copy,source,destination)
> +#
> +# Note: we make that a single command, so se can:
> +#  - use '$(Q)' in front of it and properly silence the whole macro,
> +#  - use '|| exit 1' after it, so we can exit on error in compound commands.
> +################################################################################
> +define hardlink-copy
> +	{ mkdir -p $(2) && { cp -l $(1) $(2) 2>/dev/null || cp $(1) $(2); } }
> +endef
> +

Good idea! But wouldn't it fit better in pkg-utils.mk? Indeed it's very
generic.

-- 
Luca
