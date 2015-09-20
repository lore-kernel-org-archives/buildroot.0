From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Sep 2015 21:28:38 +0200
Subject: [Buildroot] [PATCH 18/19] ccache: use mtime for external toolchain,
	CONF_OPTS for internal toolchain
In-Reply-To: <1442777319-24164-1-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442777319-24164-1-git-send-email-arnout@mind.be>
Message-ID: <1442777319-24164-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our current ccache disables hashing of the compiler executable itself,
because using the default 'mtime' doesn't work in buildroot: we always
rebuild the compiler, so the mtime is always different, so the cache
always misses.

However, in the current situation, if a user changes the compiler
configuration (which would result in the compiler generating different
object files than before) and does 'make clean all', ccache may in fact
reuse object files from the previous run. This rarely gives problems,
because
(1) the cache expires quite quickly (it's only 1GB by default),
(2) radically changing compiler options will cause cache misses because
    different header files are used,
(3) many compiler changes (e.g. changing -mtune) have little practical
    effect because the resulting code is usually still compatible,
(4) we currently don't use CCACHE_BASEDIR, and almost all object files
    will contain an absolute path (e.g. in debug info), so when
    building in a different directory, most of it will miss,
(5) we do mostly build test, and many of the potential problems only
    appear at runtime.
Still, when ccache _does_ use the wrong cached object files, the
effects are really weird and hard to debug. Also, we want reproducible
builds and obviously the above makes builds non-reproducible. So we
have a FAQ entry that warns against using ccache and tells the user to
clear the cache in case of problems.

Now that ccache is called from the toolchain wrapper, it is in fact
possible to at least use the 'mtime' compiler hash for the external
toolchain and for the host-gcc. Indeed, in this case, the compiler
executable comes from a tarball so the mtime will be a good reference
for it state. Therefore, the patch (sed script) that changes the
default from 'mtime' to 'none' is removed.

For the internal toolchain, we can do better by providing a hash of
the relevant toolchain options. We are only interested in things that
affect the compiler itself, because ccache also processes the header
files and it doesn't look at libraries because it doesn't cache the
link step, just compilation. Everything that affects the compiler
itself can nicely be summarised in $(HOST_GCC_FINAL_CONF_OPTS). Of
course, also the compiler source itself is relevant, so the source
tarball and all the patches are included in the hash. For this purpose,
a new HOST_GCC_XTENSA_OVERLAY_TAR is introduced.

The following procedure tests the ccache behaviour:

 Use this defconfig:
BR2_arm=y
BR2_CCACHE=y

 make
 readelf -A output/build/uclibc-1.0.6/libc/signal/signal.os
-> Tag_CPU_name: "ARM926EJ-S"

 Now make menuconfig, change variant into BR2_cortex_a9

 make clean; make
 readelf -A output/build/uclibc-1.0.6/libc/signal/signal.os
-> Tag_CPU_name: "ARM926EJ-S"
 should be "Cortex-A9"

After this commit, it is "Cortex-A9".

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Cc: K?roly Kasza <kaszak@gmail.com>
---
 package/ccache/ccache.mk      |  1 -
 package/gcc/gcc.mk            | 24 ++++++++++++++++++++++--
 toolchain/toolchain-wrapper.c | 12 ++++++++++++
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 3bd2803..28114e5 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -34,7 +34,6 @@ HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
 #    the need to specify BR_CACHE_DIR when invoking ccache directly.
 define HOST_CCACHE_PATCH_CONFIGURATION
 	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
-	sed -i 's,conf->compiler_check = x_strdup("mtime"),conf->compiler_check = x_strdup("none"),' $(@D)/conf.c
 	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
 endef
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 9044040..5fe54b7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -23,9 +23,10 @@ GCC_SOURCE ?= gcc-$(GCC_VERSION).tar.bz2
 # Xtensa special hook
 #
 
+HOST_GCC_XTENSA_OVERLAY_TAR = $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,$(BR2_XTENSA_CORE_NAME)).tar
+
 define HOST_GCC_XTENSA_OVERLAY_EXTRACT
-	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,\
-		$(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gcc
+	tar xf $(HOST_GCC_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
 endef
 
 #
@@ -235,8 +236,27 @@ HOST_GCC_COMMON_CONF_OPTS += \
 	--with-long-double-128
 endif
 
+
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".real"'
 
+ifeq ($(BR2_CCACHE),y)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(GCC_VERSION)/*.patch
+ifeq ($(BR2_xtensa),y)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_XTENSA_OVERLAY_TAR)
+endif
+ifeq ($(ARCH),powerpc)
+ifneq ($(BR2_SOFT_FLOAT),)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(GCC_VERSION)/1000-powerpc-link-with-math-lib.patch.conditional
+endif
+endif
+
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_HASH=\"`\
+	printf '%s' $($(PKG)_CONF_OPTS) $(GCC_VERSION) \
+		| sha256sum - $(HOST_GCC_COMMON_CCACHE_HASH_FILES) \
+		| cut -c -64 | tr -d '\n'`\"
+endif # BR2_CCACHE
+
 # The LTO support in gcc creates wrappers for ar, ranlib and nm which load
 # the lto plugin. These wrappers are called *-gcc-ar, *-gcc-ranlib, and
 # *-gcc-nm and should be used instead of the real programs when -flto is
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 89c8598..3819b9a 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -254,6 +254,10 @@ int main(int argc, char **argv)
 		debug = atoi(env_debug);
 		if (debug > 0) {
 			fprintf(stderr, "Toolchain wrapper executing:");
+#ifdef BR_CCACHE_HASH
+			fprintf(stderr, "CCACHE_COMPILERCHECK=string:" BR_CCACHE_HASH "%s",
+				(debug == 2) ? "\n    " : " ");
+#endif
 			for (i = 0; exec_args[i]; i++)
 				fprintf(stderr, "%s'%s'",
 					(debug == 2) ? "\n    " : " ", exec_args[i]);
@@ -261,6 +265,14 @@ int main(int argc, char **argv)
 		}
 	}
 
+#ifdef BR_CCACHE_HASH
+	/* Allow compilercheck to be overridden through the environment */
+	if (setenv("CCACHE_COMPILERCHECK", "string:" BR_CCACHE_HASH, 0)) {
+		perror(__FILE__ ": Failed to set CCACHE_COMPILERCHECK");
+		return 3;
+	}
+#endif
+
 	if (execv(exec_args[0], exec_args))
 		perror(path);
 
-- 
2.5.3
