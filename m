From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2015 12:25:29 +0200
Subject: [Buildroot] [PATCHv5 1/4] pkg-generic: add step_pkg_size global
 instrumentation hook
In-Reply-To: <1441228505-23235-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1441228505-23235-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1441228505-23235-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150903102529.GA3689@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-09-02 23:15 +0200, Thomas Petazzoni spake thusly:
> This patch adds a global instrumentation hook that collects the list
> of files installed in $(TARGET_DIR) by each package, and stores this
> list into a file called $(BUILD_DIR)/packages-file-list.txt. It can
> later be used to determine the size contribution of each package to
> the target root filesystem.
> 
> Note that in order to detect if a file installed by one package is
> later overriden by another package, we calculate the md5 of installed
> files and compare them at each installation of a new package.
> 
> Collecting the list of files installed by each package is done
> unconditionally, as tests have shown that the performance impact of
> doing this is negligible.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Ryan Barnett <ryanbarnett3@gmail.com>
> Tested-by: Ryan Barnett <ryanbarnett3@gmail.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 6a7d97e..2c8fe29 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -55,6 +55,38 @@ define step_time
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  
> +# Hooks to collect statistics about installed files
> +
> +# This hook will be called before the target installation of a
> +# package. We store in a file named .br_filelist_before the list of
> +# files currently installed in the target. Note that the MD5 is also
> +# stored, in order to identify if the files are overwritten.
> +define step_pkg_size_start
> +	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
> +		$($(PKG)_DIR)/.br_filelist_before
> +endef
> +
> +# This hook will be called after the target installation of a
> +# package. We store in a file named .br_filelist_after the list of
> +# files (and their MD5) currently installed in the target. We then do
> +# a diff with the .br_filelist_before to compute the list of files
> +# installed by this package.
> +define step_pkg_size_end
> +	(cd $(TARGET_DIR); find . -type f -print0 | xargs -0 md5sum) | sort > \
> +		$($(PKG)_DIR)/.br_filelist_after
> +	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
> +		while read hash file ; do \
> +			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
> +		done
> +endef
> +
> +define step_pkg_size
> +	$(if $(filter install-target,$(2)),\
> +		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3))) \
> +		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3))))
> +endef
> +GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
> +
>  # User-supplied script
>  ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
>  define step_user
> -- 
> 2.5.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
