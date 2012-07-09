From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 09 Jul 2012 13:32:08 +0200
Subject: [Buildroot] [PATCH] [v2] Allow to run severals post build
 scripts instead of only one
In-Reply-To: <5239_1341822603_4FFA968B_5239_239_2_1341822615-22895-1-git-send-email-philippe.reynes@sagemcom.com>
References: <5239_1341822603_4FFA968B_5239_239_2_1341822615-22895-1-git-send-email-philippe.reynes@sagemcom.com>
Message-ID: <4FFAC138.7000805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/12 10:30, Philippe Reynes wrote:
> Using severals post build scripts is usefull to share
> script between severals boards/projects.
>
> Signed-off-by: Philippe Reynes<philippe.reynes@sagemcom.com>
> ---
>   Makefile                 |    3 ++-
>   target/generic/Config.in |   11 ++++++-----
>   2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index b80477f..56833da 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -449,7 +449,8 @@ endif
>
>   ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
>       @$(call MESSAGE,"Executing post-build script")
  This should be plural now :-)  Or "script(s)".

> -    $(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
> +    @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
> +        $(s) $(TARGET_DIR);)
>   endif
>
>   ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> diff --git a/target/generic/Config.in b/target/generic/Config.in
> index 88f0718..b987331 100644
> --- a/target/generic/Config.in
> +++ b/target/generic/Config.in
> @@ -138,15 +138,16 @@ config BR2_ROOTFS_POST_BUILD_SCRIPT
>       string "Custom script to run before creating filesystem images"
>       default ""
>       help
> -      Specify a script to be run after the build has finished and before
> -      Buildroot starts packing the files into selected filesystem images.
> +      Specify a space-separated list of scripts to be run after the build
> +      has finished and before Buildroot starts packing the files into
> +      selected filesystem images.
>
>         This gives users the oportunity to do board-specific cleanups,
>         add-ons and the like, so the generated files can be used directly
>         without further processing.
>
> -      The script is called with the target directory name as first and
> -      only argument. Make sure the exit code of that script is 0,
> -      otherwise make will stop after calling it.
> +      These scripts are called with the target directory name as first and
> +      only argument. Make sure the exit code of those scripts are 0,
> +      otherwise make will stop after calling them.

  With this patch, this is no longer true except for the last script in the list.
To fix that, it should be something like:

     @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
         $(s) $(TARGET_DIR) || exit 1;)

Or even better (untested):

     @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
         $(s) $(TARGET_DIR)$(sep))


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
