From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 18 Oct 2020 00:17:40 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/Makefile.in: use gcc wrappers
 for binutils tools
Message-ID: <20201017221743.160029-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will use gcc-ar, gcc-nm and gcc-ranlib instead of the
normal binutils tools. The difference is that with the
wrappers, gcc plugins will be automatically picked up.

gcc 4.7 introduced these wrappers, to detect the prefix and
keep gcc specifics out of Makefile.in, a new variable
BR2_TOOLCHAIN_BUTILS_PREFIX will be used to carry the
prefix on supported versions.

Note that binutils added some automatic loading with the
'bfd-plugins' directory (somewhere around 2.28), but
the first implementation had issues, and generally depends on
correctly setup symlinks (often broken, may point to some
other gcc's library). The wrappers always work painless.

The original motivation (now ~2 years in use) was to add
"-flto -ffat-lto-objects" to both BR2_TARGET_OPTIMIZATION and
BR2_TARGET_LDFLAGS, and have target binaries lto optimized.

Not all packages will compile with this option, further work
could white/blacklist packages (adding -fno-lto to the
options).

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2:
*   support older gcc versions missing those wrappers
---
 package/Makefile.in | 6 +++---
 toolchain/Config.in | 7 +++++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 51f5cbce4f..665edec539 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -198,15 +198,15 @@ TARGET_CROSS = $(HOST_DIR)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 endif
 
 # Define TARGET_xx variables for all common binutils/gcc
-TARGET_AR       = $(TARGET_CROSS)ar
+TARGET_AR       = $(TARGET_CROSS)$(call qstrip,$(BR2_TOOLCHAIN_BUTILS_PREFIX))ar
 TARGET_AS       = $(TARGET_CROSS)as
 TARGET_CC       = $(TARGET_CROSS)gcc
 TARGET_CPP      = $(TARGET_CROSS)cpp
 TARGET_CXX      = $(TARGET_CROSS)g++
 TARGET_FC       = $(TARGET_CROSS)gfortran
 TARGET_LD       = $(TARGET_CROSS)ld
-TARGET_NM       = $(TARGET_CROSS)nm
-TARGET_RANLIB   = $(TARGET_CROSS)ranlib
+TARGET_NM       = $(TARGET_CROSS)$(call qstrip,$(BR2_TOOLCHAIN_BUTILS_PREFIX))nm
+TARGET_RANLIB   = $(TARGET_CROSS)$(call qstrip,$(BR2_TOOLCHAIN_BUTILS_PREFIX))ranlib
 TARGET_READELF  = $(TARGET_CROSS)readelf
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
 TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
diff --git a/toolchain/Config.in b/toolchain/Config.in
index db2ab0f059..7a2becc09a 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -732,4 +732,11 @@ config BR2_TOOLCHAIN_HAS_LIBQUADMATH
 	bool
 	default y if BR2_i386 || BR2_x86_64
 
+# gcc ships with wrappers that will automatically pass arguments
+# to the binutils tools.
+# So far, those are paths to necessary linker plugins
+config BR2_TOOLCHAIN_BUTILS_PREFIX
+	string
+	default "gcc-" if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
 endmenu
-- 
2.28.0
