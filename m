From: Jan Heylen <heyleke@gmail.com>
Date: Tue,  5 Apr 2016 21:45:18 +0200
Subject: [Buildroot] [PATCH v2 1/4] toolchain: wrap 'ld' with
	toolchain-wrapper
Message-ID: <1459885521-25434-1-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

extend the toolchain wrapper to also wrap the ld linker.

Tested with gnu ld and gnu 'gold'
BR2_BINUTILS_EXTRA_CONFIG_OPTIONS="--enable-gold=default --enable-plugins"

make host-binutils result in: (ld and ld.gold are equal)
<ARCH>-buildroot-linux-uclibc-ld -> toolchain-wrapper
<ARCH>-buildroot-linux-uclibc-ld.bfd
<ARCH>-buildroot-linux-uclibc-ld.br_real
<ARCH>-buildroot-linux-uclibc-ld.gold -> toolchain-wrapper
<ARCH>-buildroot-linux-uclibc-ld.gold.br_real
<ARCH>-linux-ld -> toolchain-wrapper
<ARCH>-linux-ld.br_real -> <ARCH>-buildroot-linux-uclibc-ld.br_real
<ARCH>-linux-ld.gold -> toolchain-wrapper
<ARCH>-linux-ld.gold.br_real -> <ARCH>-buildroot-linux-uclibc-ld.gold.br_real
toolchain-wrapper

after host-gcc-initial, toolchain-wrapper will be rebuild, but the ld
symlinks remain

Based upon patch from Thomas Petazzoni:
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/60942
---
 package/binutils/binutils.mk                       | 23 ++++++
 package/gcc/gcc-initial/gcc-initial.mk             |  1 +
 toolchain/toolchain-external/toolchain-external.mk |  2 +-
 toolchain/toolchain-wrapper.c                      | 94 ++++++++++++++--------
 4 files changed, 85 insertions(+), 35 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ca39f0b..2743175 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -82,6 +82,29 @@ HOST_BINUTILS_CONF_OPTS = \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
+#TODO generalise this, this is in 3 places now...
+HOST_BINUTILS_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
+HOST_BINUTILS_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
+HOST_BINUTILS_POST_INSTALL_HOOKS += HOST_BINUTILS_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+
+# Avoid that a .br_real is symlinked a second time.
+define HOST_BINUTILS_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+	$(Q)cd $(HOST_DIR)/usr/bin; \
+	for i in $(GNU_TARGET_NAME)-*; do \
+		case "$$i" in \
+		*.br_real) \
+			;; \
+		*ld) \
+			rm -f $$i.br_real; \
+			mv $$i $$i.br_real; \
+			ln -sf toolchain-wrapper $$i; \
+			ln -sf toolchain-wrapper $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
+			ln -snf $$i.br_real $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}.br_real; \
+			;; \
+		esac; \
+	done
+endef
+
 # binutils run configure script of subdirs at make time, so ensure
 # our TARGET_CONFIGURE_ARGS are taken into consideration for those
 define BINUTILS_BUILD_CMDS
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1e58d8b..62a2ef6 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -60,6 +60,7 @@ HOST_GCC_INITIAL_MAKE_OPTS += all-target-libgcc
 HOST_GCC_INITIAL_INSTALL_OPTS += install-target-libgcc
 endif
 
+#rebuild the toolchain-wrapper (e.g. for ccache) already build once in binutils
 HOST_GCC_INITIAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
 HOST_GCC_INITIAL_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
 HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index ff4ae5e..7994808 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -741,7 +741,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 		*-ar|*-ranlib|*-nm) \
 			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
 			;; \
-		*cc|*cc-*|*++|*++-*|*cpp) \
+		*cc|*cc-*|*++|*++-*|*cpp|*ld) \
 			ln -sf toolchain-wrapper $$base; \
 			;; \
 		*gdb|*gdbtui) \
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 887058f..ec069da 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -42,7 +42,7 @@ static char sysroot[PATH_MAX];
  */
 #define EXCLUSIVE_ARGS	3
 
-static char *predef_args[] = {
+static char *gcc_predef_args[] = {
 #ifdef BR_CCACHE
 	ccache_path,
 #endif
@@ -80,6 +80,19 @@ static char *predef_args[] = {
 #endif
 };
 
+static char *ld_predef_args[] = {
+	path,
+#ifdef BR_BINFMT_FLAT
+	"-elf2flt",
+#endif
+#ifdef BR_MIPS_TARGET_LITTLE_ENDIAN
+	"-EL",
+#endif
+#if defined(BR_MIPS_TARGET_BIG_ENDIAN) || defined(BR_ARC_TARGET_BIG_ENDIAN)
+	"-EB",
+#endif
+};
+
 static void check_unsafe_path(const char *path, int paranoid)
 {
 	char **c;
@@ -109,6 +122,8 @@ int main(int argc, char **argv)
 	char *paranoid_wrapper;
 	int paranoid;
 	int ret, i, count = 0, debug;
+	int predef_args_sz;
+	int ld_wrapper;
 
 	/* Calculate the relative paths */
 	basename = strrchr(progpath, '/');
@@ -169,7 +184,13 @@ int main(int argc, char **argv)
 		return 3;
 	}
 
-	cur = args = malloc(sizeof(predef_args) +
+	ld_wrapper = (strncmp("ld", basename + strlen(basename) - 2, 2) == 0) ? 1 : 0;
+	if (ld_wrapper)
+		predef_args_sz = sizeof(ld_predef_args);
+	else
+		predef_args_sz = sizeof(gcc_predef_args);
+
+	cur = args = malloc(predef_args_sz +
 			    (sizeof(char *) * (argc + EXCLUSIVE_ARGS)));
 	if (args == NULL) {
 		perror(__FILE__ ": malloc");
@@ -177,42 +198,45 @@ int main(int argc, char **argv)
 	}
 
 	/* start with predefined args */
-	memcpy(cur, predef_args, sizeof(predef_args));
-	cur += sizeof(predef_args) / sizeof(predef_args[0]);
+	memcpy(cur, ld_wrapper ? ld_predef_args : gcc_predef_args, predef_args_sz);
+	cur += predef_args_sz / sizeof(char *);
 
+	/* following extras should only happen for non-ld wrappers */
+	if (!ld_wrapper) {
 #ifdef BR_FLOAT_ABI
-	/* add float abi if not overridden in args */
-	for (i = 1; i < argc; i++) {
-		if (!strncmp(argv[i], "-mfloat-abi=", strlen("-mfloat-abi=")) ||
-		    !strcmp(argv[i], "-msoft-float") ||
-		    !strcmp(argv[i], "-mhard-float"))
-			break;
-	}
+		/* add float abi if not overridden in args */
+		for (i = 1; i < argc; i++) {
+			if (!strncmp(argv[i], "-mfloat-abi=", strlen("-mfloat-abi=")) ||
+					!strcmp(argv[i], "-msoft-float") ||
+					!strcmp(argv[i], "-mhard-float"))
+				break;
+		}
 
-	if (i == argc)
-		*cur++ = "-mfloat-abi=" BR_FLOAT_ABI;
+		if (i == argc)
+			*cur++ = "-mfloat-abi=" BR_FLOAT_ABI;
 #endif
 
 #if defined(BR_ARCH) || \
-    defined(BR_CPU)
-	/* Add our -march/cpu flags, but only if none of
-	 * -march/mtune/mcpu are already specified on the commandline
-	 */
-	for (i = 1; i < argc; i++) {
-		if (!strncmp(argv[i], "-march=", strlen("-march=")) ||
-		    !strncmp(argv[i], "-mtune=", strlen("-mtune=")) ||
-		    !strncmp(argv[i], "-mcpu=",  strlen("-mcpu=" )))
-			break;
-	}
-	if (i == argc) {
+		defined(BR_CPU)
+		/* Add our -march/cpu flags, but only if none of
+		 * -march/mtune/mcpu are already specified on the commandline
+		 */
+		for (i = 1; i < argc; i++) {
+			if (!strncmp(argv[i], "-march=", strlen("-march=")) ||
+					!strncmp(argv[i], "-mtune=", strlen("-mtune=")) ||
+					!strncmp(argv[i], "-mcpu=",  strlen("-mcpu=" )))
+				break;
+		}
+		if (i == argc) {
 #ifdef BR_ARCH
-		*cur++ = "-march=" BR_ARCH;
+			*cur++ = "-march=" BR_ARCH;
 #endif
 #ifdef BR_CPU
-		*cur++ = "-mcpu=" BR_CPU;
+			*cur++ = "-mcpu=" BR_CPU;
 #endif
-	}
+		}
 #endif /* ARCH || CPU */
+	}
 
 	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
 	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
@@ -252,7 +276,7 @@ int main(int argc, char **argv)
 
 	exec_args = args;
 #ifdef BR_CCACHE
-	if (getenv("BR_NO_CCACHE"))
+	if (!ld_wrapper && getenv("BR_NO_CCACHE"))
 		/* Skip the ccache call */
 		exec_args++;
 #endif
@@ -268,12 +292,14 @@ int main(int argc, char **argv)
 		if (debug > 0) {
 			fprintf(stderr, "Toolchain wrapper executing:");
 #ifdef BR_CCACHE_HASH
-			fprintf(stderr, "%sCCACHE_COMPILERCHECK='string:" BR_CCACHE_HASH "'",
-				(debug == 2) ? "\n    " : " ");
+			if(!ld_wrapper)
+				fprintf(stderr, "%sCCACHE_COMPILERCHECK='string:" BR_CCACHE_HASH "'",
+						(debug == 2) ? "\n    " : " ");
 #endif
 #ifdef BR_CCACHE_BASEDIR
-			fprintf(stderr, "%sCCACHE_BASEDIR='" BR_CCACHE_BASEDIR "'",
-				(debug == 2) ? "\n    " : " ");
+			if(!ld_wrapper)
+				fprintf(stderr, "%sCCACHE_BASEDIR='" BR_CCACHE_BASEDIR "'",
+						(debug == 2) ? "\n    " : " ");
 #endif
 			for (i = 0; exec_args[i]; i++)
 				fprintf(stderr, "%s'%s'",
@@ -284,14 +310,14 @@ int main(int argc, char **argv)
 
 #ifdef BR_CCACHE_HASH
 	/* Allow compilercheck to be overridden through the environment */
-	if (setenv("CCACHE_COMPILERCHECK", "string:" BR_CCACHE_HASH, 0)) {
+	if (!ld_wrapper && setenv("CCACHE_COMPILERCHECK", "string:" BR_CCACHE_HASH, 0)) {
 		perror(__FILE__ ": Failed to set CCACHE_COMPILERCHECK");
 		return 3;
 	}
 #endif
 #ifdef BR_CCACHE_BASEDIR
 	/* Allow compilercheck to be overridden through the environment */
-	if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
+	if (!ld_wrapper && setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
 		perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
 		return 3;
 	}
-- 
2.5.0
