From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jan 2012 18:25:03 +0100
Subject: [Buildroot] [RFC 02/15] legal-info: produce a manifest file
	with licensing info
In-Reply-To: <1327849908-15588-3-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
 <1327849908-15588-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <201201311825.03489.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 29 January 2012 16:11:35 Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
>  dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
> -	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
> +	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR)
 Since legal-info-prepare-manifest already depends on LEGAL_INFO_DIR, this
 is redundant.

[snip]
> +legal-info-prepare-manifest: $(LEGAL_INFO_DIR)
> +	@rm -f $(LEGAL_MANIFEST_CSV)
> +	@echo "package,version,license" >$(LEGAL_MANIFEST_CSV)
> +
 I might be wrong, but I think this won't rebuild the manifest if the
directory already exists.  You'd need a dependency on FORCE (and add the
phony FORCE target).

 Again a minor comment: the clean target is missing here (but it's added
in the next patch).  But for me, the first three patches can be rolled
into one.

> +legal-info: legal-info-prepare-manifest $(TARGETS_LEGAL_INFO)
>  
>  show-targets:
>  	@echo $(TARGETS)
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index 8e73f34..e117223 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -653,8 +653,10 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
>  $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
>  endif
>  
> -$(1)-legal-info:	$(1)-source
> +$(1)-legal-info:	$(1)-source $(LEGAL_INFO_DIR)
>  			@echo -e "$(1)\t$$($(3)_VERSION)\t$$($(3)_LICENSE)"
> +			@echo "$(1),$$($(3)_VERSION),$$($(3)_LICENSE)" \
> +				>>$(LEGAL_MANIFEST_CSV)
 Same here: will the manifest be rebuilt if the directory already exists?

 Regards,
 Arnout

>  
>  $(1)-show-depends:
>  			@echo $$($(2)_DEPENDENCIES)
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
