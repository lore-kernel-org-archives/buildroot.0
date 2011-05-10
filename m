From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2011 09:16:59 +0200
Subject: [Buildroot] [PATCH 1/3] Makefile.package.in: Makes it possible
 to override the default extract commands
In-Reply-To: <1305008226-8906-2-git-send-email-a@awn.dk>
References: <1305008226-8906-1-git-send-email-a@awn.dk>
	<1305008226-8906-2-git-send-email-a@awn.dk>
Message-ID: <20110510091659.5274152c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Allan,

On Tue, 10 May 2011 08:17:04 +0200
"Allan W. Nielsen" <a@awn.dk> wrote:

> When using GENTARGETS (or macroes depending on it), there is no way of
> specifying a custom extraction procedure. When using the patch one can
> simply define $(PACKAGE_NAME)_EXTRACT_CMDS which will override the
> default. If non is defined it will fall back to the default extract
> procedure.

I like the feature added by this patch (it is needed for strange
packages), but I'm not sure about the implementation.

> -# Unpack the archive
> +# Unpack the archive using custom commands
> +$(BUILD_DIR)/%/.stamp_custom_extracted:
> +	@$(call MESSAGE,"Extracting - custom")
> +	$(Q)mkdir -p $(@D)
> +	$($(PKG)_EXTRACT_CMDS)
> +	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
> +	$(Q)touch $@
> +
> +# Unpack the archive using default commands
>  $(BUILD_DIR)/%/.stamp_extracted:
> -	@$(call MESSAGE,"Extracting")
> +	@$(call MESSAGE,"Extracting - default")
>  	$(Q)mkdir -p $(@D)
>  	$(Q)$(if $($(PKG)_SOURCE),$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
>  	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -)

Instead of having two different stamp files, isn't possible to define
the extract step as follows :

> +$(BUILD_DIR)/%/.stamp_extracted:
> +	@$(call MESSAGE,"Extracting")
> +	$(Q)mkdir -p $(@D)
> +	$($(PKG)_EXTRACT_CMDS)
> +	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
> +	$(Q)touch $@

And then have the $(PKG)_EXTRACT_CMDS variable be define to the default
value, unless it has already been defined ?

Note that I haven't looked closely whether it was possible or not. But
if it is, then I would prefer such an implementation.

Thanks for doing this work!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
