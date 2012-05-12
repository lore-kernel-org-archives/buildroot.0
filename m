From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 May 2012 01:10:08 +0200
Subject: [Buildroot] [PATCH v3 01/22] legal-info: infrastructure to
 collect legally-relevant material
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <4FAEEDD0.6020602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/12 22:12, Luca Ceresoli wrote:
> This allows to automatically collect material that may be needed to comply with
> the license of packages that Buildroot prepares for the target device.
>
> The core of the implementation is made by the following parts:
>   - in package/pkg-utils.mk some helper functions are defined for common actions
>     such as generating a warning, producing info about a package etc;
>   - in package/pkg-gentargets.mk, within the GENTARGETS framework, a new
>     <PKG>-legal-info target produces all the info for a given package;
>   - Makefile implements the top-level targets:
>     - legal-info-prepare creates the output directory and produces legal info
>       about Buildroot itself and the toolchain, which mostly means just warning
>       the user that this is not implemented;
>     - legal-info, the only target that is supposed to be used directly, depends
>       on all of the above and finishes things by producing the README files from
>       the various pieces.
>
> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>

  Looks great!

  Any chance that this can still go into the 2012.05 release?  I have one customer
who would be really pleased with that...

  Except for the dirs dependency, I think it can go in as it is.  But of course I
do have some optional remarks :-)

> +TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
> +		$(filter-out host-makedevs,\
> +		$(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))

  I guess host-makedevs is filtered out here because it has no tar file?
In that case, the same should be done for makedevs and mcookie.  But maybe
it's better to define the SITE_METHOD of these packages as local.  Then they
will be registered as "not saved" in the manifest.

[snip]
> +legal-info-clean:
> +	@rm -fr $(LEGAL_INFO_DIR)

  We usually use '$(RM) -r', I think.

> +
> +legal-info-prepare: $(LEGAL_INFO_DIR)

  I would add an announcement here:
	@$(call MESSAGE,"Collecting legal info")

> +	@$(call legal-license-file,buildroot,COPYING,COPYING)
> +	@$(call legal-manifest,package,version,license,license files,source archive)

  I would Capitalize the titles.

> +	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved)
> +	@$(call legal-warning,the Buildroot source code has not been saved)
> +	@$(call legal-warning,the toolchain has not been saved)
> +	@cp $(CONFIG_DIR)/.config $(LEGAL_INFO_DIR)/buildroot.config
[snip]
> +$(2)_RAWNAME			=  $(patsubst host-%,%,$(1))

  Not for this patch, but it would be better to add an argument to
GENTARGETS for the lowercase non-host name.

  Also, the %/.stamp_patched target could reuse this variable.

>
>
> +ifneq ($$($(3)_LICENSE),PROPRIETARY)
> +ifneq ($$($(3)_SITE_METHOD),local)
> +ifneq ($$($(3)_SITE_METHOD),override)
> +# Packages that have a tarball need it downloaded and extracted beforehand
> +$(1)-legal-info:	$(1)-extract $(REDIST_SOURCES_DIR)
> +endif
> +endif
> +endif

  I would combine these conditions with the ones below for setting
_MANIFEST_TARBALL.  Or you could put it as

ifneq ($$($(2)_MANIFEST_TARBALL),not saved)
$(1)-legal-info:	$(1)-extract $(REDIST_SOURCES_DIR)
endif

  BTW, why is it $(3)_LICENSE here and $(2)_LICENSE below?

> +
>   $(1)-show-depends:
>   			@echo $$($(2)_DEPENDENCIES)
>
> @@ -412,6 +436,47 @@ else
>   $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
>   endif
>
> +# Set values used later for legal-info manifest
> +ifneq ($$($(2)_LICENSE),PROPRIETARY)
> +ifneq ($$($(2)_SITE_METHOD),local)
> +ifneq ($$($(2)_SITE_METHOD),override)
> +$(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
> +ifneq ($(call qstrip,$$($(2)_LICENSE_FILES)),)

  Why is there a qstrip here?  The variable is defined in a .mk
file so doesn't contain quotes, right?

> +$(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
> +endif
> +endif
> +endif
> +endif
> +# defaults for packages without tarball or license files
> +$(2)_MANIFEST_TARBALL ?= not saved
> +$(2)_MANIFEST_LICENSE_FILES ?= not saved
> +
> +# legal-info: produce legally relevant info.
> +$(1)-legal-info:
> +ifeq ($$($(2)_LICENSE),PROPRIETARY)
> +# Proprietary packages: nothing to save
> +else ifeq ($$($(2)_SITE_METHOD),local)
> +# Packages without a tarball: don't save and warn
> +	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
> +else ifeq ($$($(2)_SITE_METHOD),override)
> +	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)
> +else
> +# Other packages
> +# Save license files if defined
> +ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)
> +	@$(call legal-license-nofiles,$$($(2)_RAWNAME))
> +	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
> +else
> +	@for F in $$($(2)_LICENSE_FILES); do \
> +		$(call legal-license-file,$$($(2)_RAWNAME),$$$${F},$$($(2)_DIR)/$$$${F}); \
> +		done
> +endif
> +# Copy the source tarball (just hardlink if possible)
> +	@cp -l $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR) 2>/dev/null || \
> +	   cp $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR)

  Genius!

> +endif
> +	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL))
> +

  I'm not sure if it would work, but maybe this could be moved out
of the GENTARGETS and defined as a pattern rule, like all the other
stuff.  That saves a lot of double $$.

[snip]

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
