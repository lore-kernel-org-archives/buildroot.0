From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Dec 2019 16:47:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/dropbear: group post-extract
 hooks with their call site
In-Reply-To: <20191220153405.19108-1-patrickdepinguin@gmail.com>
References: <20191220153405.19108-1-patrickdepinguin@gmail.com>
Message-ID: <20191220164734.61ac625e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 20 Dec 2019 16:34:04 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The organization of dropbear.mk was no longer very clear: for some
> post-extract blocks, the block was separated from the place where it was
> enabled, but for others they were grouped.
> 
> Regroup all blocks with their call site.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/dropbear/dropbear.mk | 31 ++++++++++++++-----------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 7cbc16bc3d..8e09786bf0 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -70,21 +70,26 @@ endif
>  define DROPBEAR_ENABLE_REVERSE_DNS
>  	echo '#define DO_HOST_LOOKUP 1'                 >> $(@D)/localoptions.h
>  endef
> +ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
> +DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
> +endif

The hook definition should be within the condition as well, and
similarly for the other cases.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
