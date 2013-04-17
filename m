From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Apr 2013 18:13:33 +0200
Subject: [Buildroot] [PATCH v2 1/3] post-build: show each script
 filename before execution
In-Reply-To: <1365439816-6935-2-git-send-email-luca@lucaceresoli.net>
References: <1365439816-6935-1-git-send-email-luca@lucaceresoli.net>
 <1365439816-6935-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <516ECA2D.6070303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/13 18:50, Luca Ceresoli wrote:
> This also simplifies code by removing the ifneq/endif clauses.
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>   Makefile |    4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index c95bb1e..75f0f0c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -509,11 +509,9 @@ endif
>   			$${dir}/ $(TARGET_DIR); \
>   	done
>
> -ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
> -	@$(call MESSAGE,"Executing post-build script\(s\)")
>   	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
> +		$(call MESSAGE,"Executing  post-build script $(s)"); \
>   		$(s) $(TARGET_DIR)$(sep))
> -endif

  I wonder, if there are multiple scripts, won't the second MESSAGE be 
echoed by make? I had expected that the @ would only apply to the first 
line when they are separated with $(sep), and that each invocation would 
run in a separate shell.

  By the way, a very simple alternative would be to remove the @ in front 
of the foreach, then each script invocation will be echoed by make.


  Regards,
  Arnout

>
>   ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
>   LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
