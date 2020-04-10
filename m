From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Apr 2020 21:50:18 +0200
Subject: [Buildroot] [PATCH] core/show-info: do not show install types
 for host packages
In-Reply-To: <20200409205855.21194-1-yann.morin.1998@free.fr>
References: <20200409205855.21194-1-yann.morin.1998@free.fr>
Message-ID: <20200410195018.GI29898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2020-04-09 22:58 +0200, Yann E. MORIN spake thusly:
> By their very nature, host packages have no target, staging, or
> images install steps; they have a single install step, that is
> always performed.
> 
> However, we currently report those three types of install, which
> is misleading at best, and really incorrect.
> 
> If we were to report any install type for host package, that would
> be a single one, and it would always be true.
> 
> So, do not report any install type for host packages, as it does
> not make sense to report anything that is always true.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/pkg-utils.mk | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index d324934dba..14101fcc2a 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -112,9 +112,11 @@ define _json-info-pkg-details
>  	"version": "$($(1)_DL_VERSION)",
>  	"licenses": "$($(1)_LICENSE)",
>  	"dl_dir": "$($(1)_DL_SUBDIR)",
> -	"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET)),
> -	"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING)),
> -	"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES)),
> +	$(if $(filter target,$($(1)_TYPE)), \
> +		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
> +		"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING))$(comma) \
> +		"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES))$(comma) \
> +	)

There is more to it than just this, so I'll be sending a revised series
about show-info.

Patch marked as changes requestd in patchwork.

Regards,
Yann E. MORIN.

>  	"downloads": [
>  	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
>  		{
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
