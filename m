From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jan 2012 23:10:06 +0100
Subject: [Buildroot] [RFC 03/15] legal-info: save source tarballs for
	all packages
In-Reply-To: <1327849908-15588-4-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
 <1327849908-15588-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <201201312310.06332.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 29 January 2012 16:11:36 Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 Darn, I've been adding Reviewed-by tags even though I said I wouldn't :-)

[snip]
> @@ -633,7 +635,8 @@ endif
>  
>  clean:
>  	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
> -		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging
> +		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
> +		$(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR)
 $(REDIST_SOURCES_DIR) is a subdir of $(LEGAL_INFO_DIR), so doesn't need
to be cleaned twice.

>  
>  distclean: clean
>  ifeq ($(DL_DIR),$(TOPDIR)/dl)
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index e117223..0d7e081 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -653,10 +653,11 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
>  $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
>  endif
>  
> -$(1)-legal-info:	$(1)-source $(LEGAL_INFO_DIR)
> +$(1)-legal-info:	$(1)-source $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR)
>  			@echo -e "$(1)\t$$($(3)_VERSION)\t$$($(3)_LICENSE)"
>  			@echo "$(1),$$($(3)_VERSION),$$($(3)_LICENSE)" \
>  				>>$(LEGAL_MANIFEST_CSV)
> +			@cp $(DL_DIR)/$$($(3)_SOURCE) $(REDIST_SOURCES_DIR)

 Actually, for local and override packages (of which you said they are not
supported at the moment), $(1)-source should create a tar file.

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
