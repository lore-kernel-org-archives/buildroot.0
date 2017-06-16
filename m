From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 16 Jun 2017 13:18:07 +0200
Subject: [Buildroot] [PATCH 8/8] Makefile: unconfigured "make toolchain"
 should report error
In-Reply-To: <20170614221135.17470-9-arnout@mind.be>
References: <20170614221135.17470-1-arnout@mind.be>
 <20170614221135.17470-9-arnout@mind.be>
Message-ID: <331314ed-c276-03df-0bb4-aed65880e5c6@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 15/06/2017 00:11, Arnout Vandecappelle (Essensium/Mind) wrote:
> As reported by Alessandro Power on StackOverflow [1], the behaviour
> of "make toolchain" in an unconfigured tree is misleading.
> 
> When .config doesn't exist, we don't read in the package .mk files, so
> "make <package>" doesn't work:
> 
>     $ make busybox
>     make: *** No rule to make target 'busybox'.  Stop.
> 
> However, for "linux" and "toolchain", the corresponding file (or
> actually directory) already exists. So instead, we get:
> 
>     $ make linux
>     make: Nothing to be done for 'linux'.
> 
> This is confusing, because it looks as if the build succeeded.
> 
> The obvious solution would be to make linux and toolchain PHONY targets
> when .config doesn't exist. However, that actually does the reverse,
> because then a rule _does_ exist for them and since they don't have
> dependencies, make will consider them to be ready.
> 
> Instead, we could define linux and toolchain as targets and make them
> depend on menuconfig. But then their behaviour is different from other
> packages.
> 
> So instead, we add a catch-all rule when .config doesn't exist. This
> rule will be triggered whenever the user requests a target that is not
> explicitly defined and prints a more user-friendly error message. To
> make this work correctly, we have to make sure that any valid target
> has commands so it avoids the catch-all rule.
> 
> [1] https://stackoverflow.com/questions/44521150
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> This solution is admittedly a bit fragile... I also have a patch for
> the alternative "define linux and toolchain as targets that depend
> on menuconfig".
> ---
>  Makefile                | 15 ++++++++++++++-
>  package/doc-asciidoc.mk |  4 +++-
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 88d98e0405..6eab289c00 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -813,6 +813,19 @@ else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>  
>  all: menuconfig
>  
> +%:
> +	@echo 'Please configure Buildroot first (e.g. "make menuconfig")' 1>&2
> +	@exit 1
> +
> +# Since linux and toolchain already exist as directories, we must force them to
> +# fall under the catch-all rule defined above
> +linux toolchain: FORCE
> +FORCE: ;
> +
> +# .config doesn't exist yet but is -include'd above, so make will try to rebuild
> +# it with the catch-all rule. Add an explicit rule to avoid that.
> +$(BR2_CONFIG): ;
> +
>  endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>  
>  # configuration
> @@ -937,7 +950,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
>  # separate output directory. This allows convenient use of make in the
>  # output directory.
>  .PHONY: outputmakefile
> -outputmakefile:
> +outputmakefile: ;

The ';' code looks a bit like black magic to non-make-gurus. And since
there are several sprinkled in the code, a verbose comment on why it is
needed is not quite doable. Moreover it's easy to forget to put one when
adding new targets.

So IMO the alternative solution is better for both readability and
maintainability.

>  ifeq ($(NEED_WRAPPER),y)
>  	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
>  endif
> diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
> index be92496c2e..89317910a6 100644
> --- a/package/doc-asciidoc.mk
> +++ b/package/doc-asciidoc.mk
> @@ -18,6 +18,9 @@ asciidoc-check-dependencies-pdf:
>  		exit 1; \
>  	fi
>  
> +# catch-all pattern rule for when there are no dependencies
> +asciidoc-check-dependencies-%: ;
> +
>  # PDF generation is broken because of a bug in xsltproc program provided
>  # by libxslt <=1.1.28, which does not honor an option we need to set.
>  # Fortunately, this bug is already fixed upstream:
> @@ -59,7 +62,6 @@ $(1): $(1)-$(5)
>  .PHONY: $(1)-$(5)
>  $(1)-$(5): $$(O)/docs/$(1)/$(1).$(6)
>  
> -asciidoc-check-dependencies-$(5):
>  .PHONY: $(1)-check-dependencies-$(5)
>  # Single line, because splitting a foreach is not easy...
>  $(1)-check-dependencies-$(5): asciidoc-check-dependencies-$(5)
> 

-- 
Luca
