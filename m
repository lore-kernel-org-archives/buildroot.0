From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 22:25:16 +0200
Subject: [Buildroot] [PATCH v2] Makefile: respect strip exclusions for
 special libraries
In-Reply-To: <20180702175711.70bf95c7@donbot>
References: <20180702160027.28557-1-john@metanate.com>
 <20180702164044.GD2604@scaer> <20180702175711.70bf95c7@donbot>
Message-ID: <20180702222516.5467cc60@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 2 Jul 2018 17:57:11 +0100, John Keeping wrote:

> diff --git a/Makefile b/Makefile
> index 8d25c8a239..a2d21be243 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -606,6 +606,26 @@ STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
>  #   done for kernel modules with incorrect permissions.
>  STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print0
>  
> +# This is the command used to handle the special cases above.
> +STRIP_SPECIAL_LIBS_CMD = find $(TARGET_DIR)/lib/
> +ifneq (,$(filter lib/%,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))))
> +STRIP_SPECIAL_LIBS_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(BR2_STRIP_EXCLUDE_DIRS)) \) -prune -o
> +endif
> +# Valgrind needs ld.so with enough information, so only strip
> +# debugging symbols.
> +STRIP_SPECIAL_LIBS_CMD += \( -name 'ld-*.so*'
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +# See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
> +# besides the one in which crash occurred; or SIGTRAP kills my program when
> +# I set a breakpoint"
> +STRIP_SPECIAL_LIBS_CMD += -o -name 'libpthread*.so*'
> +endif
> +STRIP_SPECIAL_LIBS_CMD += \)
> +ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)))
> +STRIP_SPECIAL_LIBS_CMD += -not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \)
> +endif
> +STRIP_SPECIAL_LIBS_CMD += | xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)

I understand the problem, and I know you will find my comment a bit
useless, but I find this whole thing pretty complex/noisy. Can we do
better ?

Here is some untested initial proposal:

# When stripping, obey to BR2_STRIP_EXCLUDE_DIRS and
# BR2_STRIP_EXCLUDE_FILES
STRIP_FIND_COMMON_CMD = \
	find $(TARGET_DIR) \
	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)),, \
		\( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
	) \
	-not $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) \
	-print0

# Regular stripping for everything, except libpthread, ld-*.so and
# kernel modules.
STRIP_FIND_CMD = \
	$(STRIP_FIND_COMMON_CMD) \
	-type f \( -perm /111 -o -name '*.so*' \) \
	-not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko) \)

# Special stripping (only debugging symbols) for libpthread and ld-*.so.
STRIP_FIND_SPECIAL_LIBS_CMD = \
	$(STRIP_FIND_COMMON_CMD) \
	\( -name 'ld-*.so*' -o -name 'libpthread*.so*' \)

And then:

	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
	$(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 $(STRIPCMD) $(STRIP_STRIP_DEBUG) || true

Thoughts ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
