From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 19:28:37 +0200
Subject: [Buildroot] [PATCHv3 07/18] pkg-generic: implement source-check
	targets
In-Reply-To: <1429972982-25495-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150425172837.GI4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-25 16:42 +0200, Thomas Petazzoni spake thusly:
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

To be noted: packages hosted at github, when we download a released
tarball, are broken, because the backing-store is AWS, which does not
support the HEAD request. But that is not a change due to this patch, it
was already broken previously.

> ---
>  package/pkg-generic.mk | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a12b868..5a9bcf1 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -579,6 +579,16 @@ endif
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
> +
>  $(1)-show-depends:
>  			@echo $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
>  
> @@ -594,6 +604,11 @@ $(1)-all-source:	$$(foreach p, \
>  				$$(p)-all-source) \
>  			$(1)-source
>  
> +$(1)-all-source-check:	$$(foreach p, \
> +				$$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES), \
> +				$$(p)-all-source-check) \
> +			$(1)-source-check

If you do the little trick I mentioned as a comment to your patch 2,
you'd have to do it here, too.

That would make it mor ereadable.

Regards,
Yann E. MORIN.

>  $(1)-all-external-deps:	$$(foreach p, \
>  				$$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES), \
>  				$$(p)-all-external-deps) \
> @@ -793,6 +808,7 @@ endif
>  	$(1)-all-external-deps \
>  	$(1)-all-legal-info \
>  	$(1)-all-source \
> +	$(1)-all-source-check \
>  	$(1)-build \
>  	$(1)-clean-for-rebuild \
>  	$(1)-clean-for-reconfigure \
> @@ -816,7 +832,8 @@ endif
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
