From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 22:40:38 +0100
Subject: [Buildroot] [NEXT 01/26] cpe-info: new make target
In-Reply-To: <1519697441-54194-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180227224038.30ae1e48@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 20:10:16 -0600, Matt Weber wrote:
> Similar to make legal-info, produce a csv delimited
> file containing all selected packages CPE
> identification.
> 
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  Makefile               | 17 ++++++++++++++++-
>  package/pkg-generic.mk | 12 ++++++++++++
>  package/pkg-utils.mk   |  8 ++++++++
>  3 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index ec39bcd..7eda990 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -146,7 +146,7 @@ nobuild_targets := source %-source \
>  	clean distclean help show-targets graph-depends \
>  	%-graph-depends %-show-depends %-show-version \
>  	graph-build graph-size list-defconfigs \
> -	savedefconfig printvars
> +	savedefconfig printvars cpe-info %-cpe-info
>  ifeq ($(MAKECMDGOALS),)
>  BR_BUILDING = y
>  else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
> @@ -230,6 +230,7 @@ LEGAL_MANIFEST_CSV_TARGET = $(LEGAL_INFO_DIR)/manifest.csv
>  LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
>  LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
>  LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
> +CPE_MANIFEST_CSV = $(BASE_DIR)/cpe-manifest.csv
>  
>  ################################################################################
>  #
> @@ -788,6 +789,19 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
>  		mv .legal-info.sha256 legal-info.sha256)
>  	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
>  
> +.PHONY: cpe-info-clean
> +cpe-info-clean:
> +	@rm -f $(CPE_MANIFEST_CSV)
> +
> +.PHONY: cpe-info-prepare
> +cpe-info-prepare:
> +	@$(call MESSAGE,"Gathering CPE info")
> +	@$(call cpe-manifest,CPE ID,CVE PATCHED,PACKAGE,VERSION,SOURCE SITE)
> +
> +.PHONY: cpe-info
> +cpe-info: cpe-info-clean cpe-info-prepare $(foreach p,$(PACKAGES),$(p)-cpe-info)
> +	@echo "CPE info produced in $(CPE_MANIFEST_CSV)"
> +
>  .PHONY: show-targets
>  show-targets:
>  	@echo $(sort $(PACKAGES)) $(sort $(TARGETS_ROOTFS))
> @@ -1047,6 +1061,7 @@ help:
>  	@echo '  source                 - download all sources needed for offline-build'
>  	@echo '  external-deps          - list external packages used'
>  	@echo '  legal-info             - generate info about license compliance'
> +	@echo '  cpe-info               - generate info about security CPE identification'
>  	@echo '  printvars              - dump all the internal variables'
>  	@echo
>  	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a2a12e7..8622787 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -830,6 +830,17 @@ else
>  $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
>  endif
>  
> +$(1)-cpe-info: PKG=$(2)
> +$(1)-cpe-info:
> +ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> +	@$$(call MESSAGE,"Collecting cpe info")
> +ifeq ($$(call qstrip,$$($(2)_CPE_ID)),)
> +	$(Q)$$(call cpe-manifest,"unknown",$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
> +else
> +	$(Q)$$(foreach id,$$($(2)_CPE_ID),$$(call cpe-manifest,$$(id),$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))$$(sep))
> +endif
> +endif

A question is: do we need a new make target, or can an external script
do the same thing ?

After all, "make printvars" gives you pretty much the needed
information. All what is missing is that you can't easily get the list
of selected packages in the current configuration, but that would be
useful for me for the pkg-stats script as well. So a "make
show-packages" or "make list-packages" could be useful.

Perhaps that's how we can make our two different needs converge: by
having external scripts rather than adding more stuff to the package
infrastructure. A ./utils/cpe-report script could do pretty much what
you've done here.

Thoughts ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
