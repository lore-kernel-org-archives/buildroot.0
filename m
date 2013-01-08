From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 22:10:05 +0100
Subject: [Buildroot] [PATCH] new variable <pkg>_CONFIG_FIXUP
In-Reply-To: <1357596078-7762-2-git-send-email-stefan.froberg@petroprogram.com>
References: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357596078-7762-2-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <50EC8B2D.5000506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/07/13 23:01, Stefan Fr?berg wrote:
> Signed-off-by: Stefan Fr?berg<stefan.froberg@petroprogram.com>
> ---
>   package/pkg-generic.mk |    8 ++++++++
>   1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a570ad7..a410ad1 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -121,6 +121,14 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
>   	@$(call MESSAGE,"Installing to staging directory")
>   	$($(PKG)_INSTALL_STAGING_CMDS)
>   	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
> +	@$(call MESSAGE,"Fixing package configuration files")
> +	for file in $($(PKG)_CONFIG_FIXUP); do \
> +		if [ -e $(STAGING_DIR)/usr/bin/$${file} ]; then \
> +			$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \

 The \' are redundant, just put ' (it's already between double quotes).

> +				-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
> +				$(STAGING_DIR)/usr/bin/$${file} ;\
> +		fi \
> +	done

 Since sed -i is used, you can actually pass all files together. 
Something like:

if [ "$($(PKG)_CONFIG_FIXUP)" ]; then \
	$(SED) ... \
		$(addprefix $(STAGING_DIR)/usr/bin,$($(PKG)_CONFIG_FIXUP))); \
fi


 Regards,
 Arnout

>   	$(Q)touch $@
> 
>   # Install to images dir


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
