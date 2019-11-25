From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 18:32:48 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic: fix reconfigure for
 kconfig packages
In-Reply-To: <20191124231002.32255-1-angelo@amarulasolutions.com>
References: <20191124231002.32255-1-angelo@amarulasolutions.com>
Message-ID: <20191125183248.2a9b409d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Nov 2019 00:10:02 +0100
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> Kconfig based packages are not really reconfigured if the .config file is not
> regenerated in the reconfigure target.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/pkg-generic.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 7d6fa08418..d7a678412e 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -693,6 +693,7 @@ $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
>  $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
>  $(2)_TARGET_ACTUAL_SOURCE =	$$($(2)_DIR)/.stamp_actual_downloaded
>  $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
> +$(2)_TARGET_DOTCONFIG =		$$($(2)_DIR)/.stamp_dotconfig
>  
>  # default extract command
>  $(2)_EXTRACT_CMDS ?= \
> @@ -904,6 +905,7 @@ $(1)-rebuild:		$(1)-clean-for-rebuild $(1)
>  
>  $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
>  			rm -f $$($(2)_TARGET_CONFIGURE)
> +			rm -f $$($(2)_TARGET_DOTCONFIG)

I think this shouldn't be done in pkg-generic.mk, and instead be kept
in pkg-kconfig.mk, which already has some logic to handle reconfigure,
just it doesn't do what you want. I came up with:

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 86d7c14fdb..f1931b87c6 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -175,7 +175,7 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 $(1)-clean-for-reconfigure: $(1)-clean-kconfig-for-reconfigure
 
 $(1)-clean-kconfig-for-reconfigure:
-	rm -f $$($(2)_DIR)/.stamp_kconfig_fixup_done
+	rm -f $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
 
 # Only enable the foo-*config targets when the package is actually enabled.
 # Note: the variable $(2)_KCONFIG_VAR is not related to the kconfig

However, there seems to be some disagreement on IRC where
"foo-reconfigure" on a kconfig package implies that the configuration
of the package is completely regenerated, therefore losing any local
change that may have been done using "foo-menuconfig". We need to sort
out this disagreement before we can merge a patch like this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
