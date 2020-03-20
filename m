From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 22:29:29 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: don't hang the build if there
 are no file lists
In-Reply-To: <20200318155814.567-1-patrickdepinguin@gmail.com>
References: <20200318155814.567-1-patrickdepinguin@gmail.com>
Message-ID: <20200320212929.GU10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas ?2, All,

On 2020-03-18 16:58 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> In very limited configurations, it is possible to have a case where no
> .files-list-staging.txt files are created. In this case:
> 
> 	cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.txt)) > \
> 		$(BUILD_DIR)/packages-file-list-staging.txt
> 
> becomes:
> 
> 	cat > \
> 		$(BUILD_DIR)/packages-file-list-staging.txt
> 
> which of course makes the build hang.. forever.
> 
> So we fix this by checking the list is not empty. To keep the code
> readable, we introduce an intermediate variable to store the list of
> these files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Series applied to master, after fixing this patch as previously
discussed in the thread. Thanks.

Regards,
Yann E. MORIN.

> ---
>  Makefile | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5455e6662e..29d30a4f70 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -728,6 +728,10 @@ $(TARGETS_ROOTFS): target-finalize
>  # Avoid the rootfs name leaking down the dependency chain
>  target-finalize: ROOTFS=
>  
> +TARGET_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list.txt))
> +HOST_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-host.txt))
> +STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.txt))
> +
>  .PHONY: host-finalize
>  host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
>  	@$(call MESSAGE,"Finalizing host directory")
> @@ -808,12 +812,12 @@ endif # merged /usr
>  
>  	touch $(TARGET_DIR)/usr
>  
> -	cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list.txt)) > \
> -		$(BUILD_DIR)/packages-file-list.txt
> -	cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list-host.txt)) > \
> -		$(BUILD_DIR)/packages-file-list-host.txt
> -	cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.txt)) > \
> -		$(BUILD_DIR)/packages-file-list-staging.txt
> +	$(if $(TARGET_DIR_FILES_LISTS), \
> +		cat $(TARGET_DIR_FILES_LISTS) > $(BUILD_DIR)/packages-file-list.txt)
> +	$(if $(HOST_DIR_FILES_LISTS), \
> +		cat $(HOST_DIR_FILES_LISTS) > $(BUILD_DIR)/packages-file-list-host.txt)
> +	$(if $(STAGING_DIR_FILES_LISTS), \
> +		cat $(STAGING_DIR_FILES_LISTS) > $(BUILD_DIR)/packages-file-list-staging.txt)
>  
>  .PHONY: target-post-image
>  target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
