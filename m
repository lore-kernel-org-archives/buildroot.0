From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jun 2014 01:19:50 +0200
Subject: [Buildroot] [PATCH v2 1/3] Makefile: target-finalize: add
	TARGET_FINALIZE_HOOKS
In-Reply-To: <1403252778-19761-2-git-send-email-fabio.porcedda@gmail.com>
References: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
 <1403252778-19761-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <53A4C196.3060800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/06/14 10:26, Fabio Porcedda wrote:
> Add TARGET_FINALIZE_HOOKS to the "target-finalize" rule to be able to
> add to it commands as needed.
> This is useful for having a nicer output because commands are executed
> after the "target-finalize" initial message, also it is useful to ensure
> an executing order even when top-level parallel makefile is being used.

 This commit message suggests that the patch would just add the call to the
hooks, not actually changing the purge-locales implementation (which would be a
separate patch).

 For me, it doesn't have to a be a separate patch, but at least that additional
change should be mentioned in the commit message.

 Regards,
 Arnout

> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index b576267..9de4806 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -513,7 +513,7 @@ ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
>  LOCALE_WHITELIST = $(BUILD_DIR)/locales.nopurge
>  LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
>  
> -define TARGET_PURGE_LOCALES
> +define PURGE_LOCALES
>  	rm -f $(LOCALE_WHITELIST)
>  	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
>  
> @@ -525,13 +525,14 @@ define TARGET_PURGE_LOCALES
>  		done; \
>  	done
>  endef
> +TARGET_FINALIZE_HOOKS += PURGE_LOCALES
>  endif
>  
>  $(TARGETS_ROOTFS): target-finalize
>  
>  target-finalize: $(TARGETS)
>  	@$(call MESSAGE,"Finalizing target directory")
> -	$(TARGET_PURGE_LOCALES)
> +	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
>  	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
>  		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
>  		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
