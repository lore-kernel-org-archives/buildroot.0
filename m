From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 16:57:05 +0100
Subject: [Buildroot] [PATCH v3] Makefile: respect strip exclusions for
 special libraries
In-Reply-To: <20180703110614.59009bdb@donbot>
References: <20180702160027.28557-1-john@metanate.com>
 <20180702164044.GD2604@scaer> <20180702175711.70bf95c7@donbot>
 <20180702222516.5467cc60@windsurf.home>
 <20180703110614.59009bdb@donbot>
Message-ID: <20190204165705.12e5f49a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 3 Jul 2018 11:06:14 +0100
John Keeping <john@metanate.com> wrote:

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

I've applied to master, with a very minor change (see below).

> -STRIP_FIND_CMD = find $(TARGET_DIR)
> -ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
> -STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
> -endif
> -STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)

So the permission check used to be here.

> -# file exclusions:
> +# When stripping, obey to BR2_STRIP_EXCLUDE_DIRS and
> +# BR2_STRIP_EXCLUDE_FILES
> +STRIP_FIND_COMMON_CMD = \
> +	find $(TARGET_DIR) \
> +	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)), \
> +		\( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) \
> +		-prune -o \
> +	) \
> +	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> +		-not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) )
> +
> +# Regular stripping for everything, except libpthread, ld-*.so and
> +# kernel modules:
>  # - libpthread.so: a non-stripped libpthread shared library is needed for
>  #   proper debugging of pthread programs using gdb.
>  # - ld.so: a non-stripped dynamic linker library is needed for valgrind
>  # - kernel modules (*.ko): do not function properly when stripped like normal
>  #   applications and libraries. Normally kernel modules are already excluded
>  #   by the executable permission check above, so the explicit exclusion is only

... but it's not below that comment so the "executable permission check
above" is no longer true. I just deleted the "above" :)

>  #   done for kernel modules with incorrect permissions.
> -STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print0
> +STRIP_FIND_CMD = \
> +	$(STRIP_FIND_COMMON_CMD) \
> +	-type f \( -perm /111 -o -name '*.so*' \) \

The executable permission check is now here.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
