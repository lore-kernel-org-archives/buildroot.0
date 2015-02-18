From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Feb 2015 11:32:13 +0100
Subject: [Buildroot] [PATCHv2 for next 2/2] toolchain: create symlink to
 'lib' from ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <1424186973-7838-3-git-send-email-patrickdepinguin@gmail.com>
References: <1424186973-7838-1-git-send-email-patrickdepinguin@gmail.com>
 <1424186973-7838-3-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LW+ow0hB1a0LOrYpEAE_yWROdGnt1WNdbc9anGFy-K=FQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 17, 2015 at 4:29 PM, Thomas De Schampheleire
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
> v2:
> - fix 'lib32-fp' leftover in toolchain-buildroot
> - silence commands creating symlink with $(Q)
> - fix case where ARCH_LIB_DIR is 'lib'
>
> Note: the handling in the internal toolchain is a bit awkward because it
> explicitly adds a new target, but I don't see a much better way: it must
> be done _before_ the toolchain is being built. The entire logic cannot
> be done in Makefile as ARCH_LIB_DIR is not available there.
> ---
>  Makefile                                             | 14 +-------------
>  toolchain/helpers.mk                                 | 16 ++++++++++++++++
>  toolchain/toolchain-buildroot/toolchain-buildroot.mk | 11 +++++++++++
>  toolchain/toolchain-external/toolchain-external.mk   | 12 ++++++++++++
>  4 files changed, 40 insertions(+), 13 deletions(-)
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

And this should be an order-only dependency, because the addition of a
new file in $(BUILD_DIR) (which is definitely happening after the
creation of .root) causes a subsequent 'make' to re-execute this .root
step.

Hadn't seen that because I had only run 'make' once for each of my tests...
