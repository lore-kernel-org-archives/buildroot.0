From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Jan 2014 18:00:41 +0100
Subject: [Buildroot] [PATCH] Run post scripts referenced by relative
	paths
In-Reply-To: <1390904090-27934-1-git-send-email-waldemar.rymarkiewicz@gmail.com>
References: <1390904090-27934-1-git-send-email-waldemar.rymarkiewicz@gmail.com>
Message-ID: <52E7E239.2000805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/01/14 11:14, Waldemar Rymarkiewicz wrote:
> This fix will let to run post scripts seamlessly while are referenced by
> relative paths. Scripts referenced by full path still works.

  The commit message is wrong: relative paths work fine already, it is 
only a post-script in the current directory (= the buildroot directory) 
that doesn't work.

  Patch itself looks OK to me.

  Regards,
  Arnout

>
> Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@gmail.com>
> ---
>   Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 067458b..ef7f4c2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -554,7 +554,7 @@ endif
>
>   	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
>   		$(call MESSAGE,"Executing post-build script $(s)"); \
> -		$(USER_HOOKS_EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> +		$(USER_HOOKS_EXTRA_ENV) $(abspath $(s)) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>
>   ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
>   LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
> @@ -600,7 +600,7 @@ endif
>   target-post-image:
>   	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
>   		$(call MESSAGE,"Executing post-image script $(s)"); \
> -		$(USER_HOOKS_EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> +		$(USER_HOOKS_EXTRA_ENV) $(abspath $(s)) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>
>   toolchain-eclipse-register:
>   	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
