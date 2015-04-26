From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2015 17:20:28 +0200
Subject: [Buildroot] [PATCHv4 07/18] pkg-generic: implement source-check
	targets
In-Reply-To: <1430041876-16436-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1430041876-16436-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1430041876-16436-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150426152028.GE4809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-26 11:51 +0200, Thomas Petazzoni spake thusly:
> This commits extends the common package infrastructure with the
> $(1)-source-check and $(1)-all-source-check targets.
> 
> The $(1)-source-check target simply calls the newly added
> SOURCE_CHECK macro on all items to be downloaded.
> 
> The $(1)-all-source-check target will depend on the
> $(1)-all-source-check targets of all dependent packages and the
> $(1)-source-check target of the current package, which allows to do a
> recursive source-check in the dependency tree.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index d7e3ca9..2176771 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -580,6 +580,16 @@ endif
>  $(1)-show-version:
>  			@echo $$($(2)_VERSION)
>  
> +$(1)-source-check:
> +ifeq ($$($(2)_OVERRIDE_SRCDIR),)
> +	$$(foreach p,$$($(2)_SOURCE) $$($(2)_EXTRA_DOWNLOADS) $$($(2)_PATCH),\
> +		$$(if $$(findstring ://,$$(p)),\
> +			$$(call SOURCE_CHECK,$$(p)),\
> +			$$(call SOURCE_CHECK,$$($(2)_SITE:/=)/$$(p)))$$(sep))
> +else
> +	test -d $$($(2)_OVERRIDE_SRCDIR)
> +endif

Why don;t you split this inside the OVERRIDE_SRCDIR condition, just
above, along with the current $(1)-source ?

Regards,
Yann E. MORIN.

>  $(1)-show-depends:
>  			@echo $$($(2)_FINAL_ALL_DEPENDENCIES)
>  
> @@ -593,6 +603,9 @@ $(1)-graph-depends: graph-depends-requirements
>  $(1)-all-source:	$(1)-source
>  $(1)-all-source:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
>  
> +$(1)-all-source-check:	$(1)-source-check
> +$(1)-all-source-check:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source-check)
> +
>  $(1)-all-external-deps:	$(1)-external-deps
>  $(1)-all-external-deps:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-external-deps)
>  
> @@ -788,6 +801,7 @@ endif
>  	$(1)-all-external-deps \
>  	$(1)-all-legal-info \
>  	$(1)-all-source \
> +	$(1)-all-source-check \
>  	$(1)-build \
>  	$(1)-clean-for-rebuild \
>  	$(1)-clean-for-reconfigure \
> @@ -811,7 +825,8 @@ endif
>  	$(1)-rsync \
>  	$(1)-show-depends \
>  	$(1)-show-version \
> -	$(1)-source
> +	$(1)-source \
> +	$(1)-source-check
>  
>  endif # $(2)_KCONFIG_VAR
>  endef # inner-generic-package
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
