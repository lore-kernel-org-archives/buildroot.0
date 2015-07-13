From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jul 2015 01:40:17 +0200
Subject: [Buildroot] [RFC,
 PATCH] Separate target-building make targets from image-building
 make targets
In-Reply-To: <1404359814.133100.832244865806.1.gpush@pablo>
References: <1404359814.133100.832244865806.1.gpush@pablo>
Message-ID: <55A44C61.3040903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jeremy,

 We have a buildroot hackaton at the moment and finally took the time to discuss
this proposal. It was a long discussion, mainly because it doesn't really solve
the problem (which BTW is mainly in the approach we take for
linux-with-initramfs - that's just a huge hack).

 That said, we basically agree with the approach. So if you're stilling willing
to do it, please post a full series including the change to
boot-wrapper-aarch64, taking into account the comments below. We've marked this
patch as Changes Requested in patchwork.


On 07/03/14 05:56, Jeremy Kerr wrote:
> Currently, it's not possible to have dependencies from an image-building
> target to a rootfs-building target.
> 
> For example, the boot-wrapper-aarch64 package uses the kernel build as
> an input file. It supplies a dependency on 'linux', but this will break
> if we're using BR2_TARGET_ROOTFS_INITRAMFS - the wrapper will include
> the first kernel build, not the rebuild (which contains the embedded
> initramfs).
> 
> This means we'd need to express a dependency from the target build to
> the image build. However, if we do something like:
> 
> -BOOT_WRAPPER_AARCH64_DEPENDENCIES   = linux
> +BOOT_WRAPPER_AARCH64_DEPENDENCIES   = linux26-rebuild-with-initramfs
> 
> - then we get a circular dependency, because boot-wrapper-aarch64 is in
> the TARGETS list, which linux26-rebuild-with-initramfs depends on.
> 
> This change splits the possible targets into two separate lists,
> TARGET_TARGETS (dependencies for building the target dir) and
> IMAGE_TARGETS (dependencies for building images). We keep TARGETS as a
> list of everything, and use TARGET_TARGETS for the rootfs-finalize
> target.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> 
> ---
>  Makefile               |    6 ++++--
>  package/pkg-generic.mk |    8 ++++++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 0bf709f..708ab19 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -294,6 +294,8 @@ unexport TERMINFO
>  GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>  
>  TARGETS :=
> +TARGET_TARGETS :=
> +IMAGE_TARGETS :=

 In the meantime, this has changed into PACKAGES.

 While you're doing this, we'd like to have three lists: PACKAGES_TARGET,
PACKAGES_IMAGE and PACKAGES_HOST.

 Also, PACKAGES could be defined as:

PACKAGES = $(PACKAGES_TARGET) $(PACKAGES_IMAGE) $(PACKAGES_HOST)

>  
>  # silent mode requested?
>  QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
> @@ -531,7 +533,7 @@ endif
>  
>  $(TARGETS_ROOTFS): target-finalize
>  
> -target-finalize: $(TARGETS)
> +target-finalize: $(TARGET_TARGETS)

 In general target-finalize may also depend on PACKAGES_HOST (due to the
post-build scripts).

>  	@$(call MESSAGE,"Finalizing target directory")
>  	$(TARGET_PURGE_LOCALES)
>  	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
> @@ -624,7 +626,7 @@ target-generatelocales: host-localedef toolchain
>  	done
>  endif
>  
> -target-post-image: $(TARGETS_ROOTFS) target-finalize
> +target-post-image: $(TARGETS_ROOTFS) $(IMAGE_TARGETS) target-finalize
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
>  		$(call MESSAGE,"Executing post-image script $(s)"); \
>  		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 32a9457..ede1656 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -681,6 +681,14 @@ endif
>  
>  TARGETS += $(1)

 This can be removed, i.e. we only assign to the specific PACKAGES variables and
the global one is implied by concatenating the three.


 Regards,
 Arnout

>  
> +ifneq ($$($(2)_INSTALL_STAGING)$$($(2)_INSTALL_TARGET),NONO)
> +TARGET_TARGETS += $(1)
> +endif
> +
> +ifeq ($$($(2)_INSTALL_IMAGES),YES)
> +IMAGE_TARGETS  += $(1)
> +endif
> +
>  ifneq ($$($(2)_PERMISSIONS),)
>  PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
>  endif
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
