From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jan 2013 23:10:37 +0100
Subject: [Buildroot] [PATCH] new variable <pkg>_CONFIG_FIXUP
In-Reply-To: <1357596078-7762-2-git-send-email-stefan.froberg@petroprogram.com>
References: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357596078-7762-2-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20130107231037.39a798cf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Tue,  8 Jan 2013 00:01:18 +0200, Stefan Fr?berg wrote:
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>

Please add more details to your commit log. I.e, basically, most of your
introduction e-mail contents should go here.

Remember: the contents of your introduction e-mail are not preserved in
the Git history. On the opposite, the commit log is preserved forever
in the Git history, so we want the details to be here.

> ---
>  package/pkg-generic.mk |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a570ad7..a410ad1 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -121,6 +121,14 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
>  	@$(call MESSAGE,"Installing to staging directory")
>  	$($(PKG)_INSTALL_STAGING_CMDS)
>  	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
> +	@$(call MESSAGE,"Fixing package configuration files")

Please show the message only if there are actually files to fixup. Or
maybe just don't display any message at all. Fixing those files is kind
of a detail.

> +	for file in $($(PKG)_CONFIG_FIXUP); do \
> +		if [ -e $(STAGING_DIR)/usr/bin/$${file} ]; then \

No, we should not silently error out if the file doesn't exist, because
it's hiding a mistake of package .mk file. Instead, if the file doesn't
exist, we should loudly error out.

Also, please include an update to the Buildroot manual, either as part
of this patch, or as a separate patch.

Thanks for your work!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
