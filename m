From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2013 00:29:22 +0200
Subject: [Buildroot] [PATCH v8 RESEND 4/8] Makefile: add support for
 top-level parallel make
In-Reply-To: <1382088860-30524-5-git-send-email-fabio.porcedda@gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-5-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <52684DC2.2030802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/13 11:34, Fabio Porcedda wrote:
> To be able to use top-level parallel make we must not depend in a rule
> on the order of evaluation of the prerequisites, so instead of relyng on
> the left to right ordering of evaluation of the prerequisites add an
> explicit rule to describe the dependencies.
>
> Add explicit rules to describe the following dependency chain:
> $(TARGETS) -> target-finalize -> rootfs-* -> target-post-image
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  I think this one is ready to go in, so perhaps you can reorder it as 
one of the first ones of the series. Although it serves no function 
except for the top-level parallel make, so perhaps Peter will object to 
committing it on its own.

  Regards,
  Arnout

> ---
>   Makefile     | 15 ++++++---------
>   fs/common.mk |  4 ++--
>   2 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index ebecec4..299d34b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -329,8 +329,6 @@ include boot/common.mk
>   include linux/linux.mk
>   include system/system.mk
>
> -TARGETS+=target-finalize
> -
>   ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
>   TARGETS+=target-purgelocales
>   endif
> @@ -347,8 +345,6 @@ endif
>
>   include fs/common.mk
>
> -TARGETS+=target-post-image
> -
>   TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
>   TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
>   TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
> @@ -382,11 +378,12 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
>
>   prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>
> -world: $(TARGETS)
> +world: target-post-image
>
>   .PHONY: all world toolchain dirs clean distclean source outputmakefile \
>   	legal-info legal-info-prepare legal-info-clean printvars \
> -	$(BASE_TARGETS) $(TARGETS) \
> +	target-finalize target-post-image \
> +	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ROOTFS) \
>   	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
>   	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>   	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
> @@ -443,7 +440,7 @@ endif
>   STRIP_FIND_CMD += -type f -perm /111
>   STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
>
> -target-finalize:
> +target-finalize: $(TARGETS)
>   	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
>   		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
>   		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
> @@ -550,7 +547,7 @@ target-generatelocales: host-localedef
>   	done
>   endif
>
> -target-post-image:
> +target-post-image: target-finalize $(TARGETS_ROOTFS)
>   	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
>   		$(call MESSAGE,"Executing post-image script $(s)"); \
>   		$(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> @@ -586,7 +583,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
>   	@rm -f $(LEGAL_WARNINGS)
>
>   show-targets:
> -	@echo $(TARGETS)
> +	@echo $(TARGETS) $(TARGETS_ROOTFS)
>
>   else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>
> diff --git a/fs/common.mk b/fs/common.mk
> index 4dab7ea..7698c53 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -42,7 +42,7 @@ define ROOTFS_TARGET_INTERNAL
>   # extra deps
>   ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma) $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZO),host-lzop) $$(if $$(BR2_TARGET_ROOTFS_$(2)_XZ),host-xz)
>
> -$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
> +$$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
>   	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
>   	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
>   	rm -f $$(FAKEROOT_SCRIPT)
> @@ -86,7 +86,7 @@ rootfs-$(1)-show-depends:
>   rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
>
>   ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
> -TARGETS += rootfs-$(1)
> +TARGETS_ROOTFS += rootfs-$(1)
>   endif
>   endef
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
