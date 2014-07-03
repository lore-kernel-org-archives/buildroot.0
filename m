From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 03 Jul 2014 07:42:29 +0200
Subject: [Buildroot] [PATCH] infra: /usr support: STAGING_DIR can be
	outside BASE_DIR
In-Reply-To: <4f110d39879dacbf50a8.1404135990@localhost>
References: <4f110d39879dacbf50a8.1404135990@localhost>
Message-ID: <53B4ED45.1070704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/06/14 15:46, Thomas De Schampheleire wrote:
> If the user sets a custom BR2_HOST_DIR, then STAGING_DIR is not under
> BASE_DIR. The .pc/.la file fixup commands incorrectly made this assumption
> and thus should be corrected.
> 
> Additionally, this patch rewords the comment in pkg-autotools that explains
> the replacements.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  package/pkg-autotools.mk |  23 ++++++++++++-----------
>  package/pkg-generic.mk   |   5 +++--

 Doesn't QT5_LA_PRL_FILES_FIXUP need this as well?

 Also, perhaps you should mention in the commit message the for -> xargs change.


 Regards,
 Arnout


>  2 files changed, 15 insertions(+), 13 deletions(-)
> 
> diff -r 5471dd6af081 -r 4f110d39879d package/pkg-autotools.mk
> --- a/package/pkg-autotools.mk	Sun Jun 29 12:39:06 2014 -0300
> +++ b/package/pkg-autotools.mk	Mon Jun 30 15:46:20 2014 +0200
> @@ -267,25 +267,26 @@
>  # Most autotools packages install libtool .la files alongside any
>  # installed libraries. These .la files sometimes refer to paths
>  # relative to the sysroot, which libtool will interpret as absolute
> -# paths to host libraries instead of the target libraries. Since we
> -# configure with --prefix=/usr, such absolute paths start with
> -# /usr. So we add $(STAGING_DIR) in front of any path that starts with
> -# /usr.
> +# paths to host libraries instead of the target libraries. Since this
> +# is not what we want, these paths are fixed by prefixing them with
> +# $(STAGING_DIR).  As we configure with --prefix=/usr, this fix
> +# needs to be applied to any path that starts with /usr.
>  #
> -# To protect against the case that the output directory itself is
> -# under /usr, we first substitute away any occurences of the output
> -# directory to @BASE_DIR at .
> +# To protect against the case that the output or staging directories
> +# themselves are under /usr, we first substitute away any occurrences
> +# of these directories as @BASE_DIR@ and @STAGING_DIR at . Note that
> +# STAGING_DIR can be outside BASE_DIR when the user sets BR2_HOST_DIR
> +# to a custom value.
>  #
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
>  	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
> -	for i in $$$$(find $$(STAGING_DIR)/usr/lib* -name "*.la"); do \
> +	find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs \
>  		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
> +			-e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
>  			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
>  			-e "s:@STAGING_DIR@:$$(STAGING_DIR):g" \
> -			-e "s:@BASE_DIR@:$$(BASE_DIR):g" \
> -			$$$$i; \
> -	done
> +			-e "s:@BASE_DIR@:$$(BASE_DIR):g"
>  endef
>  endif
>  
> diff -r 5471dd6af081 -r 4f110d39879d package/pkg-generic.mk
> --- a/package/pkg-generic.mk	Sun Jun 29 12:39:06 2014 -0300
> +++ b/package/pkg-generic.mk	Mon Jun 30 15:46:20 2014 +0200
> @@ -202,9 +202,10 @@
>  	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
>  		$(call MESSAGE,"Fixing package configuration files") ;\
>  			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
> +				-e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
>  				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
> -				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
> -				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
> +				-e "s,-I/usr/,-I at STAGING_DIR/usr/,g" \
> +				-e "s,-L/usr/,-L at STAGING_DIR/usr/,g" \
>  				-e "s, at STAGING_DIR@,$(STAGING_DIR),g" \
>  				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
>  				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
