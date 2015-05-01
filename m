From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 17:54:49 +0200
Subject: [Buildroot] [PATCH] doc/manual: fix generating manual after
	legacy overhaul
In-Reply-To: <1430492786-17842-1-git-send-email-yann.morin.1998@free.fr>
References: <1430492786-17842-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5543A1C9.2070801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/15 17:06, Yann E. MORIN wrote:
> Commit 53903a15 (*config: improve handling of BR2_LEGACY) added an
> option to entirely skip legacy entries, by passing a variable in the
> environment.
> 
> Howerver, it mised one location where that variable is also needed,
  However      missed

> which is generating the list of packages and deprecated features for
> inclusion in the manual.
> 
> Fix that by re-using the global $(COMMON_CONFIG_ENV) variable,
> overriding just what we don't want (i.e. br2-external location and
> defconfig path).
> 
> Also, slightly re-order variables so the ones we override come right
> after the common settings, moving the specific pnes at the end.
                                                 ones

 And split into one variable per line.

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  docs/manual/manual.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index d5db2c2..2755582 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -12,8 +12,10 @@ MANUAL_RESOURCES = $(TOPDIR)/docs/images
>  # should not be included in the manual.
>  define MANUAL_GEN_LISTS
>  	$(Q)$(call MESSAGE,"Updating the manual lists...")
> -	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(@D) \
> +	$(Q)$(COMMON_CONFIG_ENV) \
> +		BR2_DEFCONFIG="" \
>  		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
> +		TOPDIR=$(TOPDIR) O=$(@D) \

 Except here you put two variables on a single line...


 Regards,
 Arnout

 Otherwise:
  Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

>  		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
>  endef
>  MANUAL_POST_RSYNC_HOOKS += MANUAL_GEN_LISTS
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
