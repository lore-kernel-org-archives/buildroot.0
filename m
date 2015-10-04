From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 16:25:00 +0100
Subject: [Buildroot] [PATCH v3] ccache: use mtime for external toolchain,
	CONF_OPTS for internal toolchain
In-Reply-To: <1443961738-12149-18-git-send-email-arnout@mind.be>
References: <1443961738-12149-18-git-send-email-arnout@mind.be>
Message-ID: <1443972300-18658-1-git-send-email-arnout@mind.be>
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
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>
---
v3: - Fix format string of BR2_DEBUG_WRAPPER. [Romain]
v2: - Add BR2_GLOBAL_PATCH_DIR to the patches used to generate the hash.
      [Samuel]
    - Use $(wildcard ...) for the patches, so missing patch dir (e.g. for
      OVERRIDE_SRCDIR) doesn't lead to an error. [Arnout]
    - Remove redundant newline [Romain]
---
 package/ccache/ccache.mk      |  5 -----
 package/gcc/gcc.mk            | 29 +++++++++++++++++++++++++++--
 toolchain/toolchain-wrapper.c | 12 ++++++++++++
 3 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 3bd2803..52cf309 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -26,15 +26,10 @@ HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
 #    is already used by autotargets for the ccache package.
 #    BR_CACHE_DIR is exported by Makefile based on config option
 #    BR2_CCACHE_DIR.
-#  - ccache shouldn't use the compiler binary mtime to detect a change in
-#    the compiler, because in the context of Buildroot, that completely
-#    defeats the purpose of ccache. Of course, that leaves the user
-#    responsible for purging its cache when the compiler changes.
 #  - Change hard-coded last-ditch default to match path in .config, to avoid
 #    the need to specify BR_CACHE_DIR when invoking ccache directly.
 define HOST_CCACHE_PATCH_CONFIGURATION
 	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
-	sed -i 's,conf->compiler_check = x_strdup("mtime"),conf->compiler_check = x_strdup("none"),' $(@D)/conf.c
 	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
 endef
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b9da398..103cbe1 100644
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
@@ -237,6 +238,30 @@ endif
 
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".real"'
 
+ifeq ($(BR2_CCACHE),y)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
+# Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned and
+# unversioned patches unconditionally
+HOST_GCC_COMMON_CCACHE_HASH_FILES += \
+	$(wildcard \
+		package/gcc/$(GCC_VERSION)/*.patch \
+		$(addsuffix $((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
+		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))))
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
index 0c8f1d8..d52115f 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -264,6 +264,10 @@ int main(int argc, char **argv)
 		debug = atoi(env_debug);
 		if (debug > 0) {
 			fprintf(stderr, "Toolchain wrapper executing:");
+#ifdef BR_CCACHE_HASH
+			fprintf(stderr, "%sCCACHE_COMPILERCHECK='string:" BR_CCACHE_HASH "'",
+				(debug == 2) ? "\n    " : " ");
+#endif
 			for (i = 0; exec_args[i]; i++)
 				fprintf(stderr, "%s'%s'",
 					(debug == 2) ? "\n    " : " ", exec_args[i]);
@@ -271,6 +275,14 @@ int main(int argc, char **argv)
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
