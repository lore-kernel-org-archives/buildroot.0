From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Feb 2017 11:18:33 +0100
Subject: [Buildroot] [PATCH] core/pkg-generic: store file->package list
 for staging too
In-Reply-To: <1487931261-15311-1-git-send-email-yann.morin.1998@free.fr>
References: <1487931261-15311-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170224101833.GA3908@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-24 11:14 +0100, Yann E. MORIN spake thusly:
> Currently, we store the list of files installed in target and associate
> each of them to the package that installed it.
> 
> However, we sometime may need to know what package installed which file
> in staging too, for example to debug header collision.
> 
> Enhance the step instrumentation to also generate the list for staging.
> 
> Only redirect once, not for each added file.
> 
> Also remove the intermediate files.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index e8a8021..f90e2a2 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -62,7 +62,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  # files currently installed in the target. Note that the MD5 is also
>  # stored, in order to identify if the files are overwritten.
>  define step_pkg_size_start
> -	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
> +	(cd $(2) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
>  		$($(PKG)_DIR)/.br_filelist_before
>  endef
>  
> @@ -72,18 +72,22 @@ endef
>  # a diff with the .br_filelist_before to compute the list of files
>  # installed by this package.
>  define step_pkg_size_end
> -	(cd $(TARGET_DIR); find . -type f -print0 | xargs -0 md5sum) | sort > \
> +	(cd $(2); find . -type f -print0 | xargs -0 md5sum) | sort > \
>  		$($(PKG)_DIR)/.br_filelist_after
>  	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
>  		while read hash file ; do \
> -			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
> -		done
> +			echo "$(1),$${file}"
> +		done >> $(BUILD_DIR)/packages-file-list$(3).txt ; \

Arg, forgot to run "git commit --amend" before sending...

Regards,
Yann E. MORIN.

> +	rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
>  endef
>  
>  define step_pkg_size
>  	$(if $(filter install-target,$(2)),\
> -		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3))) \
> -		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3))))
> +		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3),$(TARGET_DIR))) \
> +		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3),$(TARGET_DIR))))
> +	$(if $(filter install-staging,$(2)),\
> +		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3),$(STAGING_DIR),-staging)) \
> +		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3),$(STAGING_DIR),-staging)))
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
>  
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
