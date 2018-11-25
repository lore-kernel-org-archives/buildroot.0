From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Nov 2018 18:57:02 +0100
Subject: [Buildroot] [PATCH next v6 09/10] package/pkg-generic: make
 libtool .la files compatible with per-package directories
In-Reply-To: <20181123145815.13008-10-thomas.petazzoni@bootlin.com>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-10-thomas.petazzoni@bootlin.com>
Message-ID: <20181125175702.GD28830@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-23 15:58 +0100, Thomas Petazzoni spake thusly:
> Libtool .la files unfortunately contain a number of absolute paths,
> which now refer to per-package directories. Due to this, when building
> package A, .la files may contain absolute paths referring to
> directories in package B per-package sysroot. This causes some -L
> flags referring to other sysroot from being added, which doesn't work
> as the linker no longer realizes that such paths are within its
> sysroot.
> 
> To fix this, we introduce a replacement step of .la files in the
> configure step, to make sure all paths refer to this package
> per-package directory.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Since I really want this topic to come to a conclusion sooner than
later, and since the solution is good-enough for now:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Howerver, see below...

> ---
>  package/pkg-generic.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index b1f0cdf34a..17909f4a61 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -222,6 +222,12 @@ $(BUILD_DIR)/%/.stamp_configured:
>  	@$(call step_start,configure)
>  	@$(call MESSAGE,"Configuring")
>  	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +	# Make sure .la files only reference the current per-package
> +	# directory
> +	$(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
> +		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]*/:$(PER_PACKAGE_DIR)/$(NAME)/:g"
> +endif

I don't find it very clean that we shoe-horn such preparation in the
generic rules; I'd rather we use a hook mechanism, which we can define
for the prepare-per-package-directory macro to call.

For example:

    define PER_PKG_CONFIGURE_FIXUP_LA_FILES
        Blabla your big find command
    endef
    PER_PACKAGE_CONFIGURE_PREPARE_HOOKS += PER_PKG_CONFIGURE_FIXUP_LA_FILES

And then:

    # $(1): step to prepare for
    # $(2): space-separated list of dependencies to grab
    define prepare-per-package-directory
        mkdir -p $(HOST_DIR) $(TARGET_DIR)
        $(foreach pkg,$(2),\
            rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
                $(PER_PACKAGE_DIR)/$(pkg)/host/ \
                $(HOST_DIR)$(sep))
        $(foreach pkg,$(2),\
            rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
            $(PER_PACKAGE_DIR)/$(pkg)/target/ \
            $(TARGET_DIR)$(sep))
        $(foreach hook,$(PER_PACKAGE_$(call UPPER,$(1))_PREPARE_HOOKS),$(call $(hook))$(sep))
    endef

And then you'd just have to call prepare-per-package-directory with one
of:

    $(call prepare-per-package-directory,source,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
    $(call prepare-per-package-directory,extract,$($(PKG)_FINAL_EXTRACT_DEPENDENCIES))
    $(call prepare-per-package-directory,patch,$($(PKG)_FINAL_PATCH_DEPENDENCIES))
    $(call prepare-per-package-directory,configure,$($(PKG)_FINAL_DEPENDENCIES))

>  	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))

ternatively, we could change this line to be able to run hooks before
the package-registered hooks:

    $(foreach hook,\
        $($(PKG)_EARLY_PRE_CONFIGURE_HOOKS) $($(PKG)_PRE_CONFIGURE_HOOKS),\
        $(call $(hook))$(sep))

and earlier:

    $(2)_EARLY_PRE_CONFIGURE_HOOKS += \
        PER_PKG_PREPARE_DIRECTORY_FOR_CONFIGURE \
        PER_PKG_CONFIGURE_FIXUP_LA_FILES

And so on for each steps, no?

But again: I'm pretty much OK with the patch as is, because it is better
than nothing, and it would be awesome to have that in early December, so
it is part of the next LTS.

(Unrelated note: why do we $(call $(hook)) instead of just $($(hook)) ?)

Regards,
Yann E. MORIN.

>  	$($(PKG)_CONFIGURE_CMDS)
>  	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
> @@ -875,6 +881,7 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
>  $$($(2)_TARGET_INSTALL_HOST):		PKG=$(2)
>  $$($(2)_TARGET_BUILD):			PKG=$(2)
>  $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
> +$$($(2)_TARGET_CONFIGURE):		NAME=$(1)
>  $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
>  $$($(2)_TARGET_RSYNC):			PKG=$(2)
>  $$($(2)_TARGET_PATCH):			PKG=$(2)
> -- 
> 2.19.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
