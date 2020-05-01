From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 23:23:18 +0200
Subject: [Buildroot] [PATCH 08/11] package/pkg-generic.mk: detect files
 overwritten in TARGET_DIR and HOST_DIR
In-Reply-To: <20200430095249.782597-9-thomas.petazzoni@bootlin.com>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
 <20200430095249.782597-9-thomas.petazzoni@bootlin.com>
Message-ID: <20200501212318.GD15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-30 11:52 +0200, Thomas Petazzoni spake thusly:
> With per-package directory support, it is absolutely critical that a
> given package does not overwrite files already installed by another
> package. However, we currently don't have anything in Buildroot that
> detects this situation.
> 
> We used to have check-uniq-files, but it was dropped in commit
> 2496189a4207173e4cd5bbab90256f911175ee57.
> 
> This commit is a new implementation of such a detection, which is
> based on calculating and verifying MD5 hashes of installed files: the
> calculation is done at the beginning of the configure step, the
> verification during the newly introduced "install" step that takes
> place after all installation steps.
> 
> Due to this calculation and verification having some overhead, it is
> only enabled when BR2_PER_PACKAGE_DIRECTORIES=y. Note that having
> BR2_PER_PACKAGE_DIRECTORIES=y also means that on average the HOST_DIR
> and TARGET_DIR contain less files than on non-per-package build: we
> only have in HOST_DIR and TARGET_DIR the dependencies of the current
> package being built. This helps a bit in mitigating the additional
> cost of this verification.

That paragraph mixes two things: the condition and the mitigation, but
misses explaining why we have that condition. What about:

    Due to this calculation and verification having some overhead, it is
    only enabled when BR2_PER_PACKAGE_DIRECTORIES=y. Indeed, without
    BR2_PER_PACKAGE_DIRECTORIES=y, the build order is guaranteed, and
    sequential, and thus files that are overwritten while always be so
    in order: adding to files, as well as replacing file will always be
    visible to subsequent packages. But with BR2_PER_PACKAGE_DIRECTORIES=y,
    this no longer works when we end up doing the final aggregation of
    target/ and staging/ and host/ : files will only have the content of
    the last dependency chain copied during the aggregation.

    BR2_PER_PACKAGE_DIRECTORIES=y also means that on average the
    HOST_DIR and TARGET_DIR contain less files [...]

> Note that we are not handling separately HOST_DIR and STAGING_DIR,
> like we're doing with the pkg_size_{before,after} functions. Instead,
> the verification on HOST_DIR walks down into the STAGING_DIR.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-generic.mk | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 6e06d735ad..82af4afaee 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -102,6 +102,27 @@ define fixup-libtool-files
>  endef
>  endif
>  
> +# Functions to detect overwritten files
> +
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +# $(1): base directory to search in
> +# $(2): suffix of file (optional)
> +define pkg_detect_overwrite_before
> +	cd $(1); \
> +	LC_ALL=C find . -type f -exec md5sum {} \; > $($(PKG)_DIR)/.files$(2).md5
> +endef

We don;t care about having absolute or relative filenames stores in the
.md5 file, so:

    LC_ALL=C find $(1) -type f -exec md5sum {} \; > $($(PKG)_DIR)/.files$(2).md5

> +# $(1): base directory to search in
> +# $(2): suffix of file (optional)
> +define pkg_detect_overwrite_after
> +	cd $(1); \
> +	if test -s $($(PKG)_DIR)/.files$(2).md5 ; then \
> +		LC_ALL=C md5sum --quiet -c $($(PKG)_DIR)/.files$(2).md5 || \

Ditto.

> +		{ echo "ERROR: package $($(PKG)_NAME) has overwritten files installed by a previous package, aborting."; exit 1; } ; \

Do we absolutely want that to be a hard-error?

There are cases where modified files are not a problem. For example, the
gun info database is updated with each package that install info pages,
but we don;t care about that database, neither on target or staging, nor
on host.

Regards,
Yann E. MORIN.

> +	fi
> +endef
> +endif
> +
>  # Functions to collect statistics about installed files
>  
>  # $(1): base directory to search in
> @@ -235,6 +256,8 @@ $(BUILD_DIR)/%/.stamp_configured:
>  	@$(call pkg_size_before,$(TARGET_DIR))
>  	@$(call pkg_size_before,$(STAGING_DIR),-staging)
>  	@$(call pkg_size_before,$(HOST_DIR),-host)
> +	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
> +	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
>  	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
>  	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
>  	$($(PKG)_CONFIGURE_CMDS)
> @@ -360,6 +383,8 @@ $(BUILD_DIR)/%/.stamp_installed:
>  	@$(call pkg_size_after,$(STAGING_DIR),-staging)
>  	@$(call pkg_size_after,$(HOST_DIR),-host)
>  	@$(call check_bin_arch)
> +	@$(call pkg_detect_overwrite_after,$(TARGET_DIR))
> +	@$(call pkg_detect_overwrite_after,$(HOST_DIR),-host)
>  	$(Q)touch $@
>  
>  # Remove package sources
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
