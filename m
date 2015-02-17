From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 17 Feb 2015 10:05:59 +0100
Subject: [Buildroot] [PATCH for next 2/2] toolchain: create symlink to
 'lib' from ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <1424098379-8320-3-git-send-email-patrickdepinguin@gmail.com>
References: <1424098379-8320-1-git-send-email-patrickdepinguin@gmail.com>
 <1424098379-8320-3-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LUFb3P_kymnqRbLcBTWm9QO8tR0iMYFhtcdKE-N-uMamw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 16, 2015 at 3:52 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Currently, following symbolic links are created in both target and
> staging directories:
> - lib(32|64) --> lib
> - usr/lib(32|64) --> lib
>
> The decision for lib32 or lib64 is based on the target architecture
> configuration in buildroot (BR2_ARCH_IS_64).
>
> In at least one case this is not correct: when building for a Cavium Octeon III
> processor using the toolchain from the Cavium Networks SDK, and specifying
> -march=octeon3 in BR2_TARGET_OPTIMIZATION, libraries are expected in directory
> 'lib32-fp' rather than 'lib32' (likewise for lib64-fp).
>
> More generally, for external toolchains, the correct symbolic link is
> from (usr/)${ARCH_LIB_DIR} to lib. For internal toolchains, current
> toolchains always use either lib32 or lib64.
>
> Fix the problem as follows:
> - create symlink creation helpers in toolchain/helpers.mk
> - for external toolchains, call these helpers based on ARCH_LIB_DIR
> - for internal toolchains, call these helpers based on the existing
>   fixed lib32/lib64 logic, moved from Makefile
> - to fix build order problems, add the correct dependency on
>   $(BUILD_DIR) from $(BUILD_DIR)/.root
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> Note: the handling in the internal toolchain is a bit awkward because it
> explicitly adds a new target, but I don't see a much better way: it must
> be done _before_ the toolchain is being built. The entire logic cannot
> be done in Makefile as ARCH_LIB_DIR is not available there.
> ---
>  Makefile                                             | 14 +-------------
>  toolchain/helpers.mk                                 | 12 ++++++++++++
>  toolchain/toolchain-buildroot/toolchain-buildroot.mk | 11 +++++++++++
>  toolchain/toolchain-external/toolchain-external.mk   | 12 ++++++++++++
>  4 files changed, 36 insertions(+), 13 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 338c992..9f4cf8a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -449,20 +449,10 @@ world: target-post-image
>  $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
>         @mkdir -p $@
>
> -# We make a symlink lib32->lib or lib64->lib as appropriate
> -# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
> -ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
> -LIB_SYMLINK = lib64
> -else
> -LIB_SYMLINK = lib32
> -endif
> -
>  $(STAGING_DIR):
>         @mkdir -p $(STAGING_DIR)/bin
>         @mkdir -p $(STAGING_DIR)/lib
> -       @ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
>         @mkdir -p $(STAGING_DIR)/usr/lib
> -       @ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
>         @mkdir -p $(STAGING_DIR)/usr/include
>         @mkdir -p $(STAGING_DIR)/usr/bin
>         @ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
> @@ -475,15 +465,13 @@ RSYNC_VCS_EXCLUSIONS = \
>         --exclude .svn --exclude .git --exclude .hg --exclude .bzr \
>         --exclude CVS
>
> -$(BUILD_DIR)/.root:
> +$(BUILD_DIR)/.root: $(BUILD_DIR)
>         mkdir -p $(TARGET_DIR)
>         rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
>                 --chmod=Du+w --exclude .empty --exclude '*~' \
>                 $(TARGET_SKELETON)/ $(TARGET_DIR)/
>         $(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
> -       @ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
>         @mkdir -p $(TARGET_DIR)/usr
> -       @ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
>         touch $@
>
>  $(TARGET_DIR): $(BUILD_DIR)/.root
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 3121da4..6b5ebe7 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -1,5 +1,17 @@
>  # This Makefile fragment declares toolchain related helper functions.
>
> +# Create the necessary symlink from (usr/)lib32|lib64|lib32-fp|... to lib
> +# In general, for external toolchains, the correct link name is $ARCH_LIB_DIR.
> +create_staging_lib_symlink = \
> +       LIB_SYMLINK="$(strip $1)" ; \
> +       ln -snf lib $(STAGING_DIR)/$${LIB_SYMLINK} ; \
> +       ln -snf lib $(STAGING_DIR)/usr/$${LIB_SYMLINK}
> +
> +create_target_lib_symlink = \
> +       LIB_SYMLINK="$(strip $1)" ; \
> +       ln -snf lib $(TARGET_DIR)/$${LIB_SYMLINK} ; \
> +       ln -snf lib $(TARGET_DIR)/usr/$${LIB_SYMLINK}
> +
>  # The copy_toolchain_lib_root function copies a toolchain library and
>  # its symbolic links from the sysroot directory to the target
>  # directory. Note that this function is used both by the external
> diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> index b30cc33..e1fe1f4 100644
> --- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> +++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> @@ -12,6 +12,17 @@ BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
>
>  TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
>
> +ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
> +LIB_SYMLINK = lib64
> +else
> +LIB_SYMLINK = lib32-fp
> +endif
> +
> +host-gcc-final: create-lib-symlinks
> +create-lib-symlinks: $(STAGING_DIR) $(TARGET_DIR)
> +       $(call create_staging_lib_symlink,$(LIB_SYMLINK))
> +       $(call create_target_lib_symlink,$(LIB_SYMLINK))
> +
>  TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
>
>  $(eval $(virtual-package))
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index e05957c..927608e 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -600,6 +600,16 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
>         $(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
>  endef
>
> +define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
> +       ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +       $(call create_staging_lib_symlink,$${ARCH_LIB_DIR})
> +endef
> +
> +define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
> +       ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +       $(call create_target_lib_symlink,$${ARCH_LIB_DIR})
> +endef

These should be silenced with @.

Also, if ARCH_LIB_DIR is 'lib' itself, then a broken symlink will be
created inside the lib/ directory itself.

I will fix these issues and resubmit...

Best regards,
Thomas
