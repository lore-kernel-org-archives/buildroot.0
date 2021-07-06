From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Jul 2021 21:50:48 +0200
Subject: [Buildroot] [PATCH v2 08/18] package/pkg-generic.mk: move
 python fixup to generic package infrastructure
In-Reply-To: <20210706142501.951345-9-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-9-herve.codina@bootlin.com>
Message-ID: <20210706195048.GO2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-07-06 16:24 +0200, Herve Codina spake thusly:
> Fixing _sysconfigdata*.{py,pyc} was previously done by python package
> infrastructure. Some packages use python stuff without using python
> package infrastructure.
> These packages perform overwrites and need the specific python fixup
> to fix them.
> 
> In order to be sure to fix all of these packages, the python fixup
> is moved to the generic package infrastructure and applied to all
> packages.
> This follows the same principle as for the .la libtool files fixup.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
> Changes v1 to v2:
>  - Used '... -print0 | xargs -0 -r ...' construction.
>  - Used '-deleted' to remove files.
> 
>  package/pkg-generic.mk | 17 +++++++++++++++++
>  package/pkg-python.mk  | 12 ------------
>  2 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 6fbd4006da..8c19522fd8 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -103,6 +103,21 @@ define fixup-libtool-files
>  endef
>  endif
>  
> +# Make sure python _sysconfigdata*.py files only reference the current
> +# per-package directory.
> +
> +# $1: package name (lower case)
> +# $2: staging or host directory of the package
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +define fixup-python-files
> +	$(Q)find $(2) \( -path '$(2)/lib/python*' -o -path '$(2)/usr/lib/python*' \) \
> +		-name "_sysconfigdata*.py" -print0 | xargs -0 --no-run-if-empty \
> +		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(1)/:g"
> +	$(Q)find $(2) \( -path '$(2)/lib/python*' -o -path '$(2)/usr/lib/python*' \) \
> +		-name "_sysconfigdata*.pyc" -delete

Those two find commands are not equivalent to the original ones.

Before, we had:
    find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* [...]

After, we'd have, after replacing $(2):
    find $(HOST_DIR) \( -path '$(HOST_DIR)/lib/python*' -o -path '$(HOST_DIR)/usr/lib/python*' \) [...]
    find $(STAGING_DIR) \( -path '$(STAGING_DIR)/lib/python*' -o -path '$(STAGING_DIR)/usr/lib/python*' \) [...]

So this is slightly different... I don't get why you needed to duplicate
the calls, calling the macro twice... And even then, it would have still
been simpler to pass the two locations as starting points to find:

    find $(HOST_DIR)/lib/python* $(HOST_DIR)/usr/lib/python* [...]
    find $(STAGING_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* [...]

But really, $(HOST_DIR)/usr is just a symlink to . so there is no reason
to search it. Also, previously $(STAGING_DIR)/lib/ was not in the search
list, but now it is...

> +endef
> +endif
> +
>  # Functions to collect statistics about installed files
>  
>  # $(1): base directory to search in
> @@ -254,6 +269,8 @@ $(BUILD_DIR)/%/.stamp_configured:
>  	@$(call pkg_size_before,$(HOST_DIR),-host)
>  	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
>  	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
> +	$(call fixup-python-files,$(NAME),$(HOST_DIR))
> +	$(call fixup-python-files,$(NAME),$(STAGING_DIR))
>  	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))

Even if the libtool fixups are not moved to the new _POST_PREPARE_HOOKS,
I still find it sad that we do not leverage those new hooks for the new
fixups... :-/

But since I said "OK-ish" in my previous review, I am going to stand by
it. A little reluctantly still... :-/

But then, re-reading the above about the two find commands: if you had
just moved the macro out of pkg-python.mk and into here, and just added:
    $(2)_POST_PREPARE_HOOKS += PKG_PYTHON_FIXUP_SYSCONFIGDATA

Then that would have been much simpler: 1) you would not have changed
the breadth of the search, and 2) you would have used the new hooks.

Oh, but you need the package name, that is passed as $(1)? No problem,
it is already available as $($(PKG)_NAME), like was done in the original
fixup macro (see below).

>  	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
>  	$($(PKG)_CONFIGURE_CMDS)
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 1e4fd5ba33..e6b81bdfd3 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -92,16 +92,6 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>  	--root=/ \
>  	--single-version-externally-managed
>  
> -ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> -define PKG_PYTHON_FIXUP_SYSCONFIGDATA
> -	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
> -		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
> -		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g"
> -	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
> -		-name "_sysconfigdata*.pyc" -delete
> -endef
> -endif
> -
>  ################################################################################
>  # inner-python-package -- defines how the configuration, compilation
>  # and installation of a Python package should be done, implements a
> @@ -246,8 +236,6 @@ $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/$$($(2)_NEEDS_HOST_PYTHON)
>  endif
>  endif
>  
> -$(2)_PRE_CONFIGURE_HOOKS += PKG_PYTHON_FIXUP_SYSCONFIGDATA

See here: the fixup macro was already a hook! ;-)

Regards,
Yann E. MORIN.

>  #
>  # Build step. Only define it if not already defined by the package .mk
>  # file.
> -- 
> 2.31.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
