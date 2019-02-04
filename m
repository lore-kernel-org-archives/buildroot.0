From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Feb 2019 12:58:08 -0600
Subject: [Buildroot] [git commit] Makefile: respect strip exclusions for
 special libraries
In-Reply-To: <20190204155559.02D428385C@busybox.osuosl.org>
References: <20190204155559.02D428385C@busybox.osuosl.org>
Message-ID: <CANQCQpYFv3Gt_dkg_T_7ppb1Fiy8JmXsHX6pDrGvJzZrZOvRhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Feb 4, 2019 at 9:57 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> commit: https://git.buildroot.net/buildroot/commit/?id=e5e0f637aba9e926c0420ce6e343b734b968d883
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> ld-*.so and libpthread*.so* are not stripped in the same way as other
> binaries because some applications need symbols in these libraries in
> order to operate correctly.
>
> However, the special handling for these binaries ignores the usual
> BR2_STRIP_EXCLUDE_* rules so it is not possible to build an image which
> has debugging symbols in these binaries.
>
> Pull out the common find functionality so that we can build two find
> commands that re-use the common exclusion rules.
>
> Fix-suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: John Keeping <john@metanate.com>
> Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Makefile | 46 ++++++++++++++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 20 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 74240ab895..355a404e04 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -613,20 +613,37 @@ RSYNC_VCS_EXCLUSIONS = \
>         --exclude .svn --exclude .git --exclude .hg --exclude .bzr \
>         --exclude CVS
>
> -STRIP_FIND_CMD = find $(TARGET_DIR)
> -ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
> -STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
> -endif
> -STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
> -# file exclusions:
> +# When stripping, obey to BR2_STRIP_EXCLUDE_DIRS and
> +# BR2_STRIP_EXCLUDE_FILES
> +STRIP_FIND_COMMON_CMD = \
> +       find $(TARGET_DIR) \
> +       $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)), \
> +               \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) \
> +               -prune -o \
> +       ) \
> +       $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> +               -not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) )
> +
> +# Regular stripping for everything, except libpthread, ld-*.so and
> +# kernel modules:
>  # - libpthread.so: a non-stripped libpthread shared library is needed for
>  #   proper debugging of pthread programs using gdb.
>  # - ld.so: a non-stripped dynamic linker library is needed for valgrind
>  # - kernel modules (*.ko): do not function properly when stripped like normal
>  #   applications and libraries. Normally kernel modules are already excluded
> -#   by the executable permission check above, so the explicit exclusion is only
> +#   by the executable permission check, so the explicit exclusion is only
>  #   done for kernel modules with incorrect permissions.
> -STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print0
> +STRIP_FIND_CMD = \
> +       $(STRIP_FIND_COMMON_CMD) \
> +       -type f \( -perm /111 -o -name '*.so*' \) \
> +       -not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko) \) \
> +       -print0
> +
> +# Special stripping (only debugging symbols) for libpthread and ld-*.so.
> +STRIP_FIND_SPECIAL_LIBS_CMD = \
> +       $(STRIP_FIND_COMMON_CMD) \
> +       \( -name 'ld-*.so*' -o -name 'libpthread*.so*' \) \

The answer to you question about needing to strip libpthread for only
glibc is true.  I did poke around a bit and checked if libthread_db
needed symbols and verified it can be stripped.  Do you think a noted
should be added to state the libpthread stripping detail?

Matt
