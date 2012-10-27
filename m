From: David Bonnin <dboml@free.fr>
Date: Sat, 27 Oct 2012 15:32:20 +0200
Subject: [Buildroot] [PATCH] Add "make target-clean" to clean TARGET_DIR
In-Reply-To: <1351334065-8602-1-git-send-email-sho@relinux.de>
References: <508BAD52.4030000@free.fr>
 <1351334065-8602-1-git-send-email-sho@relinux.de>
Message-ID: <508BE264.2030608@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For me, cleaning TARGET_DIR is enough.
Cleaning .stamp_staging_installed isn't necessary.
If need to clean staging, it means you have modifiy the package it self, 
so you need to rebuild packages that depends on this one. (if understand 
well ;) ).
David.

Le 27/10/2012 12:34, Stephan Hoffmann a ?crit :
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
>   Makefile |   11 ++++++++++-
>   1 files changed, 10 insertions(+), 1 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 0128839..01d232b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -367,7 +367,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>   
>   world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
>   
> -.PHONY: all world dirs clean distclean source outputmakefile \
> +.PHONY: all world dirs clean distclean source outputmakefile target-clean \
>   	legal-info legal-info-prepare legal-info-clean \
>   	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
>   	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
> @@ -655,6 +655,15 @@ ifeq ($(NEED_WRAPPER),y)
>   	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
>   endif
>   
> +target-clean:
> +	rm -rf $(TARGET_DIR)
> +	rm -f $(BUILD_DIR)/.root
> +	find $(STAMP_DIR) -name ".stamp_target_installed*" -print | xargs rm -f
> +	find $(STAMP_DIR) -name ".stamp_staging_installed*" -print | xargs rm -f
> +	find $(BUILD_DIR) -name ".stamp_target_installed*" -print | xargs rm -f
> +	find $(BUILD_DIR) -name ".stamp_staging_installed*" -print | xargs rm -f
> +	rm $(STAMP_DIR)/ext-toolchain-installed
> +
>   clean:
>   	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
>   		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
