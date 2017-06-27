From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Jun 2017 23:56:46 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: remove redundant
 condition
In-Reply-To: <c6c63dde7bd2a853d5ef41869f6bc3266db0c05a.1498586236.git.baruch@tkos.co.il>
References: <3d0e4832c2a187a5bd63ac094c11e2b237661cd5.1498586236.git.baruch@tkos.co.il>
 <c6c63dde7bd2a853d5ef41869f6bc3266db0c05a.1498586236.git.baruch@tkos.co.il>
Message-ID: <8c2ac64a-eb85-e868-36cc-a139aa10f6e1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-06-17 19:57, Baruch Siach wrote:
> TOOLCHAIN_EXTERNAL_MUSL_LD_LINK is empty when BR2_TOOLCHAIN_EXTERNAL_MUSL is
> not set. No need to add another condition.
> 
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 8460e37d095f..2c87a367e67b 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -587,9 +587,7 @@ define $(2)_INSTALL_STAGING_CMDS
>  	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
>  endef
>  
> -ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
>  $(2)_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
> -endif

 Actually, we (almost) always put both the definition of the hook and the
assignment to the _HOOKS variable under the relevant condition. So instead of
this, I'd just move the assignment to the definition of the hook and keep it
under the same condition. But of course, that's not possible, because the
assignment is in the inner-toolchain-external-package macro and we don't want to
define the hook inside that macro. Therefore, I would make the definition of
TOOLCHAIN_EXTERNAL_MUSL_LD_LINK unconditional, and add the conditions only here.

 Regards,
 Arnout

>  
>  # Even though we're installing things in both the staging, the host
>  # and the target directory, we do everything within the
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
