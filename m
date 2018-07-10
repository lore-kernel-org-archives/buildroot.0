From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Jul 2018 10:56:58 -0500
Subject: [Buildroot] [PATCH v3] Makefile: respect strip exclusions for
 special libraries
In-Reply-To: <20180703110614.59009bdb@donbot>
References: <20180702160027.28557-1-john@metanate.com>
 <20180702164044.GD2604@scaer>
 <20180702175711.70bf95c7@donbot> <20180702222516.5467cc60@windsurf.home>
 <20180703110614.59009bdb@donbot>
Message-ID: <CANQCQpZ-CeWw7HcCrBJHfjZ6aHccOZaOnrPjkoAeL_gXLYQxjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John,

On Tue, Jul 3, 2018 at 5:06 AM, John Keeping <john@metanate.com> wrote:
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

I did a test build with a set of folders and files set to exclude.
Plus checked the symbols on the special libs.  Looks ok when checking
stripped vs not.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>


> ---
> On Mon, 2 Jul 2018 22:25:16 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
>> I understand the problem, and I know you will find my comment a bit
>> useless, but I find this whole thing pretty complex/noisy. Can we do
>> better ?
>>
>> Here is some untested initial proposal:
>>
>> # When stripping, obey to BR2_STRIP_EXCLUDE_DIRS and
>> # BR2_STRIP_EXCLUDE_FILES
>> STRIP_FIND_COMMON_CMD = \
>>       find $(TARGET_DIR) \
>>       $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)),, \
>>               \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o ) \
>>       -not $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) \
>>       -print0
>>
>> # Regular stripping for everything, except libpthread, ld-*.so and
>> # kernel modules.
>> STRIP_FIND_CMD = \
>>       $(STRIP_FIND_COMMON_CMD) \
>>       -type f \( -perm /111 -o -name '*.so*' \) \
>>       -not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko) \)
>>
>> # Special stripping (only debugging symbols) for libpthread and
>> ld-*.so. STRIP_FIND_SPECIAL_LIBS_CMD = \
>>       $(STRIP_FIND_COMMON_CMD) \
>>       \( -name 'ld-*.so*' -o -name 'libpthread*.so*' \)
>>
>> And then:
>>
>>       $(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
>>       $(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 $(STRIPCMD) $(STRIP_STRIP_DEBUG) || true
>>
>> Thoughts ?
>
> This looks much nicer.  I've tested it and fixed a few issues, so we end
> up with this patch.
>
>
>  Makefile | 44 +++++++++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 19 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 8d25c8a239..ab081412d3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -591,20 +591,37 @@ RSYNC_VCS_EXCLUSIONS = \
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
>  #   by the executable permission check above, so the explicit exclusion is only
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
> +       -print0
>
>  ifeq ($(BR2_ECLIPSE_REGISTER),y)
>  define TOOLCHAIN_ECLIPSE_REGISTER
> @@ -716,19 +733,8 @@ endif
>         rm -rf $(TARGET_DIR)/usr/share/gtk-doc
>         rmdir $(TARGET_DIR)/usr/share 2>/dev/null || true
>         $(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
> +       $(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 -r $(STRIPCMD) $(STRIP_STRIP_DEBUG) 2>/dev/null || true
>
> -# See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
> -# besides the one in which crash occurred; or SIGTRAP kills my program when
> -# I set a breakpoint"
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -       find $(TARGET_DIR)/lib/ -type f -name 'libpthread*.so*' | \
> -               xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
> -endif
> -
> -# Valgrind needs ld.so with enough information, so only strip
> -# debugging symbols.
> -       find $(TARGET_DIR)/lib/ -type f -name 'ld-*.so*' | \
> -               xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
>         test -f $(TARGET_DIR)/etc/ld.so.conf && \
>                 { echo "ERROR: we shouldn't have a /etc/ld.so.conf file"; exit 1; } || true
>         test -d $(TARGET_DIR)/etc/ld.so.conf.d && \
> --
> 2.18.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
