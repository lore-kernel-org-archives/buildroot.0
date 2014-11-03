From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Nov 2014 23:23:53 +0100
Subject: [Buildroot] [RFC/PATCH] Makefile: guarantee reproducible
	permissions
In-Reply-To: <1415018556-28336-2-git-send-email-guido@vanguardiasur.com.ar>
References: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
 <1415018556-28336-2-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <54580079.2070603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/14 13:42, Guido Mart?nez wrote:
> Currently, the permission mode on many target rootfs files depend on the
> user's umask at the time of building, and at the time of cloning the
> repo. This is caused by two things:
> 
> 1) Some packages and BR itself create files and directories on the
> target with cp/mkdir/etc which depend on the umask at the time of
> building.
> 
> 2) We use rsync -a to copy the skeleton and overlay, leaving permissions
> on the target exactly as they were on the host. These permissions are
> not tracked by Git and depend on the user's umask at the time of cloning
> (assuming no mode changes).
> 
> To fix (1), change the Makefile's $(SHELL) to always call a wrapper
> script first that sets the umask to a sane fixed value (022) and then
> calls the real shell.
> 
> To fix (2), use the --chmod option on rsync calls so we don't depend on
> the current mode of those files.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

 I build-tested with and without the patch, compared the permissions and they're
identical.

 I was also a bit concerned about the effect on build time of the additional
fork, but the difference turns out to be smaller than the noise margin.


 However, you did miss a few rsync/cp instances that could be problematic.

- The external toolchain uses a combination of rsync and cp to copy the sysroot
to the target. Normally not an issue, unless when you download and extract the
external toolchain yourself and use BR2_TOOLCHAIN_EXTERNAL_PATH.

- The OVERRIDE_SRCDIR infrastructure in general may show the same problem if
stuff is then cp'ed into the target. However, that one we probably shouldn't
bother with too much. Still, adding a chmod to the rsync in the package
infrastructure is a possibility.

 I think these two should be fixed before accepting the patch.


 Also, there are probably a couple of packages that use cp to copy stuff from
the buildroot directory to the target. A quick search only turns up
matchbox-keyboard, but there may be more. So perhaps you could do an
allpackageyes build and see if anything turns up in the target directory that is
not world-readable. But even without that, the patch is acceptable after just
fixing the external toolchain and OVERRIDE_SRCDIR support.


 Regards,
 Arnout


> ---
>  Makefile                         | 7 ++++---
>  support/scripts/shell-wrapper.sh | 5 +++++
>  2 files changed, 9 insertions(+), 3 deletions(-)
>  create mode 100755 support/scripts/shell-wrapper.sh
> 
> diff --git a/Makefile b/Makefile
> index 907a0fc..0f7db1e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -203,7 +203,8 @@ else
>  endif
>  
>  # we want bash as shell
> -SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
> +SHELL := $(TOPDIR)/support/scripts/shell-wrapper.sh \
> +	 $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
>  	 else if [ -x /bin/bash ]; then echo /bin/bash; \
>  	 else echo sh; fi; fi)
>  
> @@ -476,7 +477,7 @@ RSYNC_VCS_EXCLUSIONS = \
>  $(BUILD_DIR)/.root:
>  	mkdir -p $(TARGET_DIR)
>  	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
> -		--chmod=Du+w --exclude .empty --exclude '*~' \
> +		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  		$(TARGET_SKELETON)/ $(TARGET_DIR)/
>  	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
>  	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
> @@ -612,7 +613,7 @@ endif
>  	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>  		$(call MESSAGE,"Copying overlay $(d)"); \
>  		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
> -			--chmod=Du+w --exclude .empty --exclude '*~' \
> +			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  			$(d)/ $(TARGET_DIR)$(sep))
>  
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
> diff --git a/support/scripts/shell-wrapper.sh b/support/scripts/shell-wrapper.sh
> new file mode 100755
> index 0000000..513b927
> --- /dev/null
> +++ b/support/scripts/shell-wrapper.sh
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +umask 022
> +
> +exec "$@"
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
