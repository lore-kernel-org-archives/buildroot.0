From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Oct 2013 19:27:19 +0200
Subject: [Buildroot] [PATCH 2/2] manual: move the manual rsync directory
 under $(O)/build/
In-Reply-To: <1381072055-26797-2-git-send-email-s.martin49@gmail.com>
References: <1381072055-26797-1-git-send-email-s.martin49@gmail.com>
 <1381072055-26797-2-git-send-email-s.martin49@gmail.com>
Message-ID: <5252EEF7.1090308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/06/13 17:07, Samuel Martin wrote:
> This patch just moves the manual source/build directory in $(O)/build/
> (currently this location is $(O)/docs/manual/.build/, which is removed
> at this end of the manual generation).
>
> This location is used to:
> - generate the package list files
> - rsync the *.txt source from docs/manual/
>
> The output manuals are still generated in $(O)/docs/manual/, so the release
> target is unchanged.
>
> Moving the manual source/build directory is more consistent with the rest
> of how Buildroot works.
> This also avoid to remove the *.txt that are generated and are actually
> used by a2x, this is very helpful for investigating
> asdciidoc/dblatex/texlive related issues.
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

>
> ---
> Changes v1 -> v2:
> - split patch content
> - detail a bit more the commit message
> ---
>   docs/manual/manual.mk | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index d092d3f..84acaae 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -1,6 +1,8 @@
> +MANUAL_BUILDDIR = $(BUILD_DIR)/buildroot-manual
>   manual-update-lists:
>   	$(Q)$(call MESSAGE,"Updating the manual lists...")
> -	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
> +	$(Q)mkdir -p $(MANUAL_BUILDDIR)
> +	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(MANUAL_BUILDDIR) \
>   		$(TOPDIR)/support/scripts/gen-manual-lists.py
>
>   ################################################################################
> @@ -26,11 +28,10 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
>   			   $$($(call UPPERCASE,$(1))_SOURCES) \
>   			   manual-update-lists
>   	$(Q)$(call MESSAGE,"Generating $(5) $(1)...")
> -	$(Q)mkdir -p $$(@D)/.build
> -	$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
> +	$(Q)mkdir -p $$(@D) $(MANUAL_BUILDDIR)
> +	$(Q)rsync -au docs/$(1)/*.txt $(MANUAL_BUILDDIR)
>   	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
> -	        -D $$(@D) $$(@D)/.build/$(1).txt
> -	-$(Q)rm -rf $$(@D)/.build
> +		-D $$(@D) $(MANUAL_BUILDDIR)/$(1).txt
>   endef
>
>   ################################################################################
> @@ -49,7 +50,7 @@ $(call GENDOC_INNER,$(1),text,txt,text,text)
>   $(call GENDOC_INNER,$(1),epub,epub,epub,ePUB)
>   clean: $(1)-clean
>   $(1)-clean:
> -	$(Q)$(RM) -rf $(O)/docs/$(1)
> +	$(Q)$(RM) -rf $(O)/docs/$(1) $(MANUAL_BUILDDIR)
>   .PHONY: $(1) $(1)-clean manual-update-lists
>   endef
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
