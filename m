From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2015 17:15:54 +0200
Subject: [Buildroot] [PATCHv4 02/18] pkg-generic: take into account
 patch dependencies in source, external-deps and legal-info
In-Reply-To: <1430041876-16436-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1430041876-16436-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1430041876-16436-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150426151554.GD4809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-26 11:51 +0200, Thomas Petazzoni spake thusly:
> The $(1)-all-{source,external-deps,legal-info} targets currently only
> take care of the dependencies in <pkg>_DEPENDENCIES, but not
> <pkg>_PATCH_DEPENDENCIES. This patch fixes that by introducing a
> <pkg>_FINAL_ALL_DEPENDENCIES. It also reworks the $(1)-show-depends
> target to make use of <pkg>_FINALL_ALL_DEPENDENCIES.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[tested a "make source" and "make external-deps" and "make legal-info"
 on a randpackageconfig]
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 455bdf1..dd8c4c9 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -431,6 +431,7 @@ endif
>  # Eliminate duplicates in dependencies
>  $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
>  $(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
> +$(2)_FINAL_ALL_DEPENDENCIES = $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
>  
>  $(2)_INSTALL_STAGING		?= NO
>  $(2)_INSTALL_IMAGES		?= NO
> @@ -583,7 +584,7 @@ $(1)-show-version:
>  			@echo $$($(2)_VERSION)
>  
>  $(1)-show-depends:
> -			@echo $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
> +			@echo $$($(2)_FINAL_ALL_DEPENDENCIES)
>  
>  $(1)-graph-depends: graph-depends-requirements
>  			@$$(INSTALL) -d $$(GRAPHS_DIR)
> @@ -592,11 +593,14 @@ $(1)-graph-depends: graph-depends-requirements
>  			|tee $$(GRAPHS_DIR)/$$(@).dot \
>  			|dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) -o $$(GRAPHS_DIR)/$$(@).$$(BR_GRAPH_OUT)
>  
> -$(1)-all-source:       $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-source) $(1)-source
> +$(1)-all-source:	$(1)-source
> +$(1)-all-source:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
>  
> -$(1)-all-external-deps:        $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-external-deps) $(1)-external-deps
> +$(1)-all-external-deps:	$(1)-external-deps
> +$(1)-all-external-deps:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-external-deps)
>  
> -$(1)-all-legal-info:   $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-legal-info) $(1)-legal-info
> +$(1)-all-legal-info:	$(1)-legal-info
> +$(1)-all-legal-info:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-legal-info)
>  
>  $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
>  
> -- 
> 2.1.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
