From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 23:01:34 +0200
Subject: [Buildroot] [PATCH 07/11] package/pkg-generic.mk: move
 pkg_size_{before, after} and check_bin_arch functions
In-Reply-To: <20200430095249.782597-8-thomas.petazzoni@bootlin.com>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
 <20200430095249.782597-8-thomas.petazzoni@bootlin.com>
Message-ID: <20200501210134.GC15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-30 11:52 +0200, Thomas Petazzoni spake thusly:
> These functions are no longer using the GLOBAL_INSTRUMENTATION_HOOKS
> mechanism, so it doesn't make much sense for them to be in the section
> of pkg-generic.mk related to those hooks.

I think this would no longer be the case if you do as I suggested in
patch 5...

I'd like to keep the instrumentation, well, instrumentation...

Regards,
Yann E. MORIN.

> Move them to the "Helper functions" section.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-generic.mk | 66 +++++++++++++++++++++---------------------
>  1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 2ae269bb3d..6e06d735ad 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -55,39 +55,6 @@ define step_time
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  
> -# Hooks to collect statistics about installed files
> -
> -# $(1): base directory to search in
> -# $(2): suffix of file (optional)
> -define pkg_size_before
> -	cd $(1); \
> -	LC_ALL=C find . -not -path './$(STAGING_SUBDIR)/*' \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
> -		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(2).before
> -endef
> -
> -# $(1): base directory to search in
> -# $(2): suffix of file (optional)
> -define pkg_size_after
> -	cd $(1); \
> -	LC_ALL=C find . -not -path './$(STAGING_SUBDIR)/*' \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
> -		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(2).after
> -	LC_ALL=C comm -13 \
> -		$($(PKG)_DIR)/.files-list$(2).before \
> -		$($(PKG)_DIR)/.files-list$(2).after \
> -		| sed -r -e 's/^[^,]+/$($(PKG)_NAME)/' \
> -		> $($(PKG)_DIR)/.files-list$(2).txt
> -	rm -f $($(PKG)_DIR)/.files-list$(2).before
> -	rm -f $($(PKG)_DIR)/.files-list$(2).after
> -endef
> -
> -define check_bin_arch
> -	support/scripts/check-bin-arch -p $($(PKG)_NAME) \
> -		-l $($(PKG)_DIR)/.files-list.txt \
> -		$(foreach i,$($(PKG)_BIN_ARCH_EXCLUDE),-i "$(i)") \
> -		-r $(TARGET_READELF) \
> -		-a $(BR2_READELF_ARCH_NAME)
> -endef
> -
>  # This hook checks that host packages that need libraries that we build
>  # have a proper DT_RPATH or DT_RUNPATH tag
>  define check_host_rpath
> @@ -135,6 +102,39 @@ define fixup-libtool-files
>  endef
>  endif
>  
> +# Functions to collect statistics about installed files
> +
> +# $(1): base directory to search in
> +# $(2): suffix of file (optional)
> +define pkg_size_before
> +	cd $(1); \
> +	LC_ALL=C find . -not -path './$(STAGING_SUBDIR)/*' \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
> +		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(2).before
> +endef
> +
> +# $(1): base directory to search in
> +# $(2): suffix of file (optional)
> +define pkg_size_after
> +	cd $(1); \
> +	LC_ALL=C find . -not -path './$(STAGING_SUBDIR)/*' \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
> +		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(2).after
> +	LC_ALL=C comm -13 \
> +		$($(PKG)_DIR)/.files-list$(2).before \
> +		$($(PKG)_DIR)/.files-list$(2).after \
> +		| sed -r -e 's/^[^,]+/$($(PKG)_NAME)/' \
> +		> $($(PKG)_DIR)/.files-list$(2).txt
> +	rm -f $($(PKG)_DIR)/.files-list$(2).before
> +	rm -f $($(PKG)_DIR)/.files-list$(2).after
> +endef
> +
> +define check_bin_arch
> +	support/scripts/check-bin-arch -p $($(PKG)_NAME) \
> +		-l $($(PKG)_DIR)/.files-list.txt \
> +		$(foreach i,$($(PKG)_BIN_ARCH_EXCLUDE),-i "$(i)") \
> +		-r $(TARGET_READELF) \
> +		-a $(BR2_READELF_ARCH_NAME)
> +endef
> +
>  ################################################################################
>  # Implicit targets -- produce a stamp file for each step of a package build
>  ################################################################################
> -- 
> 2.25.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
