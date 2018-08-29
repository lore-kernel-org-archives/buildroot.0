From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 29 Aug 2018 16:20:51 -0500
Subject: [Buildroot] [PATCH 1/5] toolchain/toolchain-wrapper: add link
 wrapper
In-Reply-To: <1535577655-9583-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1535577655-9583-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1535577655-9583-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Updates symlink creation int/ext toolchain
 - Adds new source file for link wrapper with build/install

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/gcc/gcc.mk                                 |  12 +-
 .../toolchain-external/pkg-toolchain-external.mk   |  12 +-
 toolchain/toolchain-wrapper-linker.c               | 248 +++++++++++++++++++++
 toolchain/toolchain-wrapper.mk                     |   6 +
 4 files changed, 276 insertions(+), 2 deletions(-)
 create mode 100644 toolchain/toolchain-wrapper-linker.c

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 1ae9b7e..2b4ce33 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -262,7 +262,9 @@ HOST_GCC_COMMON_CONF_OPTS += \
 	--with-long-double-128
 endif
 
-HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += \
+	-DBR_CROSS_PATH_SUFFIX='".br_real"' \
+	-DBR_CROSS_PATH_LD_SUFFIX='".br_real"'
 
 # For gcc-initial, we need to tell gcc that the C library will be
 # providing the ssp support, as it can't guess it since the C library
@@ -334,6 +336,14 @@ define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 			ln -sf toolchain-wrapper $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
 			ln -snf $$i.br_real $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}.br_real; \
 			;; \
+		*ld) \
+			if [ ! -e $$i.br_real ] ; then \
+				mv $$i $$i.br_real; \
+				ln -sf toolchain-wrapper-linker $$i; \
+				ln -sf toolchain-wrapper-linker $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
+				ln -snf $$i.br_real $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}.br_real; \
+			fi; \
+			;; \
 		*) \
 			ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
 			;; \
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 8b2c283..99eea68 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -90,10 +90,16 @@ endif
 TOOLCHAIN_EXTERNAL_SUFFIX = \
 	$(if $(wildcard $(TOOLCHAIN_EXTERNAL_BIN)/*.br_real),.br_real)
 
+# Handle the case where there are bootlin toolchain's without ld wrappers which
+# would not have a .br_real defined.
+TOOLCHAIN_EXTERNAL_LD_SUFFIX = \
+	$(if $(wildcard $(TOOLCHAIN_EXTERNAL_BIN)/*ld.br_real),.br_real)
+
 TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_FC = $(TOOLCHAIN_EXTERNAL_CROSS)gfortran$(TOOLCHAIN_EXTERNAL_SUFFIX)
+TOOLCHAIN_EXTERNAL_LD = $(TOOLCHAIN_EXTERNAL_CROSS)ld$(TOOLCHAIN_EXTERNAL_LD_SUFFIX)
 TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf
 
 # Normal handling of downloaded toolchain tarball extraction.
@@ -229,7 +235,8 @@ TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
 endif
 
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
-	-DBR_CROSS_PATH_SUFFIX='"$(TOOLCHAIN_EXTERNAL_SUFFIX)"'
+	-DBR_CROSS_PATH_SUFFIX='"$(TOOLCHAIN_EXTERNAL_SUFFIX)"' \
+	-DBR_CROSS_PATH_LD_SUFFIX='"$(TOOLCHAIN_EXTERNAL_LD_SUFFIX)"' \
 
 ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
 # TOOLCHAIN_EXTERNAL_BIN points outside HOST_DIR => absolute path
@@ -274,6 +281,9 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
 			fi \
 			;; \
+		*ld) \
+			ln -sf toolchain-wrapper-linker $$base; \
+			;; \
 		*) \
 			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
 			;; \
diff --git a/toolchain/toolchain-wrapper-linker.c b/toolchain/toolchain-wrapper-linker.c
new file mode 100644
index 0000000..b587fea
--- /dev/null
+++ b/toolchain/toolchain-wrapper-linker.c
@@ -0,0 +1,248 @@
+/**
+ * Buildroot wrapper for toolchains. This simply executes the real toolchain
+ * with a number of arguments hardcoded, to ensure the toolchain uses the
+ * correct configuration.
+
+ * This file is based on the original wrapper code but updated for the linker.
+ *
+ * (C) 2011 Peter Korsgaard <jacmet@sunsite.dk>
+ * (C) 2011 Daniel Nystr?m <daniel.nystrom@timeterminal.se>
+ * (C) 2012 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+ * (C) 2013 Spenser Gilliland <spenser@gillilanding.com>
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <string.h>
+#include <limits.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <time.h>
+#include <stdbool.h>
+
+static char path[PATH_MAX];
+
+/**
+ * GCC linker errors out with certain combinations of arguments (examples are
+ * static/shared/r/pie, so we have to ensure that we only pass the predefined
+ * one to the real compiler if the inverse option isn't in the argument list.
+ * This specifies the worst case number of extra arguments we might pass
+ * Currently, we may have:
+ */
+#define EXCLUSIVE_ARGS	0
+
+static char *predef_args[] = {
+	path
+};
+
+
+
+/* A {string,length} tuple, to avoid computing strlen() on constants.
+ *  - str must be a \0-terminated string
+ *  - len does not account for the terminating '\0'
+ */
+struct str_len_s {
+	const char *str;
+	size_t     len;
+};
+
+/* Define a {string,length} tuple. Takes an unquoted constant string as
+ * parameter. sizeof() on a string literal includes the terminating \0,
+ * but we don't want to count it.
+ */
+#define STR_LEN(s) { #s, sizeof(#s)-1 }
+
+/* List of paths considered unsafe for cross-compilation.
+ *
+ * An unsafe path is one that points to a directory with libraries or
+ * headers for the build machine, which are not suitable for the target.
+ */
+static const struct str_len_s unsafe_paths[] = {
+	STR_LEN(/lib),
+	STR_LEN(/usr/include),
+	STR_LEN(/usr/lib),
+	STR_LEN(/usr/local/include),
+	STR_LEN(/usr/local/lib),
+	{ NULL, 0 },
+};
+
+/* Unsafe options are options that specify a potentialy unsafe path,
+ * that will be checked by check_unsafe_path(), below.
+ */
+static const struct str_len_s unsafe_opts[] = {
+	STR_LEN(-I),
+	STR_LEN(-idirafter),
+	STR_LEN(-iquote),
+	STR_LEN(-isystem),
+	STR_LEN(-L),
+	{ NULL, 0 },
+};
+
+/* Check if path is unsafe for cross-compilation. Unsafe paths are those
+ * pointing to the standard native include or library paths.
+ *
+ * We print the arguments leading to the failure. For some options, gcc
+ * accepts the path to be concatenated to the argument (e.g. -I/foo/bar)
+ * or separated (e.g. -I /foo/bar). In the first case, we need only print
+ * the argument as it already contains the path (arg_has_path), while in
+ * the second case we need to print both (!arg_has_path).
+ *
+ * If paranoid, exit in error instead of just printing a warning.
+ */
+static void check_unsafe_path(const char *arg,
+			      const char *path,
+			      int paranoid,
+			      int arg_has_path)
+{
+	const struct str_len_s *p;
+
+	for (p=unsafe_paths; p->str; p++) {
+		if (strncmp(path, p->str, p->len))
+			continue;
+		fprintf(stderr,
+			"%s: %s: unsafe header/library path used in cross-compilation: '%s%s%s'\n",
+			program_invocation_short_name,
+			paranoid ? "ERROR" : "WARNING",
+			arg,
+			arg_has_path ? "" : "' '", /* close single-quote, space, open single-quote */
+			arg_has_path ? "" : path); /* so that arg and path are properly quoted. */
+		if (paranoid)
+			exit(1);
+	}
+}
+
+int main(int argc, char **argv)
+{
+	char **args, **cur, **exec_args;
+	char *relbasedir, *absbasedir;
+	char *progpath = argv[0];
+	char *basename;
+	char *env_debug;
+	char *paranoid_wrapper;
+	int paranoid;
+	int ret, i, count = 0, debug;
+
+	/* Calculate the relative paths */
+	basename = strrchr(progpath, '/');
+	if (basename) {
+		*basename = '\0';
+		basename++;
+		relbasedir = malloc(strlen(progpath) + 7);
+		if (relbasedir == NULL) {
+			perror(__FILE__ ": malloc");
+			return 2;
+		}
+		sprintf(relbasedir, "%s/..", argv[0]);
+		absbasedir = realpath(relbasedir, NULL);
+	} else {
+		basename = progpath;
+		absbasedir = malloc(PATH_MAX + 1);
+		ret = readlink("/proc/self/exe", absbasedir, PATH_MAX);
+		if (ret < 0) {
+			perror(__FILE__ ": readlink");
+			return 2;
+		}
+		absbasedir[ret] = '\0';
+		for (i = ret; i > 0; i--) {
+			if (absbasedir[i] == '/') {
+				absbasedir[i] = '\0';
+				if (++count == 2)
+					break;
+			}
+		}
+	}
+	if (absbasedir == NULL) {
+		perror(__FILE__ ": realpath");
+		return 2;
+	}
+
+	/* Fill in the relative paths */
+#ifdef BR_CROSS_PATH_REL
+	ret = snprintf(path, sizeof(path), "%s/" BR_CROSS_PATH_REL "/%s" BR_CROSS_PATH_LD_SUFFIX, absbasedir, basename);
+#elif defined(BR_CROSS_PATH_ABS)
+	ret = snprintf(path, sizeof(path), BR_CROSS_PATH_ABS "/%s" BR_CROSS_PATH_LD_SUFFIX, basename);
+#else
+	ret = snprintf(path, sizeof(path), "%s/bin/%s" BR_CROSS_PATH_LD_SUFFIX, absbasedir, basename);
+#endif
+	if (ret >= sizeof(path)) {
+		perror(__FILE__ ": overflow");
+		return 3;
+	}
+
+	cur = args = malloc(sizeof(predef_args) +
+			    (sizeof(char *) * (argc + EXCLUSIVE_ARGS)));
+	if (args == NULL) {
+		perror(__FILE__ ": malloc");
+		return 2;
+	}
+
+	/* start with predefined args */
+	memcpy(cur, predef_args, sizeof(predef_args));
+	cur += sizeof(predef_args) / sizeof(predef_args[0]);
+
+	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
+	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
+		paranoid = 1;
+	else
+		paranoid = 0;
+
+	/* Check for unsafe library and header paths */
+	for (i = 1; i < argc; i++) {
+		const struct str_len_s *opt;
+		for (opt=unsafe_opts; opt->str; opt++ ) {
+			/* Skip any non-unsafe option. */
+			if (strncmp(argv[i], opt->str, opt->len))
+				continue;
+
+			/* Handle both cases:
+			 *  - path is a separate argument,
+			 *  - path is concatenated with option.
+			 */
+			if (argv[i][opt->len] == '\0') {
+				i++;
+				if (i == argc)
+					break;
+				check_unsafe_path(argv[i-1], argv[i], paranoid, 0);
+			} else
+				check_unsafe_path(argv[i], argv[i] + opt->len, paranoid, 1);
+		}
+	}
+
+	/* append forward args */
+	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
+	cur += argc - 1;
+
+	/* finish with NULL termination */
+	*cur = NULL;
+
+	exec_args = args;
+
+	/* Debug the wrapper to see actual arguments passed to
+	 * the compiler:
+	 * unset, empty, or 0: do not trace
+	 * set to 1          : trace all arguments on a single line
+	 * set to 2          : trace one argument per line
+	 */
+	if ((env_debug = getenv("BR2_DEBUG_WRAPPER"))) {
+		debug = atoi(env_debug);
+		if (debug > 0) {
+			fprintf(stderr, "Toolchain wrapper executing:");
+			for (i = 0; exec_args[i]; i++)
+				fprintf(stderr, "%s'%s'",
+					(debug == 2) ? "\n    " : " ", exec_args[i]);
+			fprintf(stderr, "\n");
+		}
+	}
+
+	if (execv(exec_args[0], exec_args))
+		perror(path);
+
+	free(args);
+
+	return 2;
+}
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index b8074ef..3a4cbcd 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -50,9 +50,15 @@ define TOOLCHAIN_WRAPPER_BUILD
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
 		toolchain/toolchain-wrapper.c \
 		-o $(@D)/toolchain-wrapper
+	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
+		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
+		toolchain/toolchain-wrapper-linker.c \
+		-o $(@D)/toolchain-wrapper-linker
 endef
 
 define TOOLCHAIN_WRAPPER_INSTALL
 	$(INSTALL) -D -m 0755 $(@D)/toolchain-wrapper \
 		$(HOST_DIR)/bin/toolchain-wrapper
+	$(INSTALL) -D -m 0755 $(@D)/toolchain-wrapper-linker \
+		$(HOST_DIR)/bin/toolchain-wrapper-linker
 endef
-- 
1.9.1
