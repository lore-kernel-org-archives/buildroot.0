From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  3 May 2012 14:20:28 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_Make_external_toolchain_relocat?=
	=?utf-8?q?able?=
Message-ID: <1336047628-416-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The external toolchain wrapper sets sysroot etc. to an absolute path.
By changing this to a relative path, it is possible to move the host
directory to a different location and still have a working build
system.

This only works for a downloaded external toolchain.  For a pre-installed
external toolchain, it is possible to move the host directory to a
different location, but not the external toolchain directory (it does work
if the external toolchain directory lies within the host directory).  For
an internal or crosstool-ng toolchain, there is no wrapper so updating the
sysroot path should be done in a different way.

See http://lists.busybox.net/pipermail/buildroot/2012-February/050371.html
for information about others things to do to make the host directory
relocatable.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/Makefile.in                                |    3 +-
 toolchain/toolchain-external/ext-tool.mk           |   14 ++++-
 .../toolchain-external/ext-toolchain-wrapper.c     |   64 ++++++++++++++------
 3 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index df7042c..0e392b6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -48,7 +48,8 @@ endif
 
 REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
 
-STAGING_DIR=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sysroot
+STAGING_SUBDIR = usr/$(REAL_GNU_TARGET_NAME)/sysroot
+STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 
 TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 0a997a5..59e538a 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -122,9 +122,17 @@ endif
 TOOLCHAIN_EXTERNAL_CROSS=$(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 TOOLCHAIN_EXTERNAL_CC=$(TOOLCHAIN_EXTERNAL_CROSS)gcc
 TOOLCHAIN_EXTERNAL_CXX=$(TOOLCHAIN_EXTERNAL_CROSS)g++
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS = \
-	-DBR_CROSS_PATH='"$(TOOLCHAIN_EXTERNAL_BIN)/"' \
-	-DBR_SYSROOT='"$(STAGING_DIR)"'
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS = -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
+
+ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
+# TOOLCHAIN_EXTERNAL_BIN points outside HOST_DIR => absolute path
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += \
+	-DBR_CROSS_PATH_ABS='"$(TOOLCHAIN_EXTERNAL_BIN)"'
+else
+# TOOLCHAIN_EXTERNAL_BIN points inside HOST_DIR => relative path
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += \
+	-DBR_CROSS_PATH_REL='"$(TOOLCHAIN_EXTERNAL_BIN:$(HOST_DIR)/%=%)"'
+endif
 
 CC_TARGET_TUNE_:=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
 CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU))
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 82595ea..a92bada 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -2,9 +2,12 @@
  * Buildroot wrapper for external toolchains. This simply executes the real
  * toolchain with a number of arguments (sysroot/arch/..) hardcoded,
  * to ensure the external toolchain uses the correct configuration.
+ * The hardcoded path arguments are defined relative to the actual location
+ * of the binary.
  *
  * (C) 2011 Peter Korsgaard <jacmet@sunsite.dk>
  * (C) 2011 Daniel Nystr?m <daniel.nystrom@timeterminal.se>
+ * (C) 2012 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
@@ -17,11 +20,12 @@
 #include <unistd.h>
 #include <stdlib.h>
 
-static char path[PATH_MAX] = BR_CROSS_PATH;
+static char path[PATH_MAX];
+static char sysroot[PATH_MAX];
 
 static char *predef_args[] = {
 	path,
-	"--sysroot", BR_SYSROOT,
+	"--sysroot", sysroot,
 #ifdef BR_ARCH
 	"-march=" BR_ARCH,
 #endif /* BR_ARCH */
@@ -48,22 +52,50 @@ static char *predef_args[] = {
 #endif
 };
 
-static const char *get_basename(const char *name)
-{
-	const char *base;
-
-	base = strrchr(name, '/');
-	if (base)
-		base++;
-	else
-		base = name;
-
-	return base;
-}
-
 int main(int argc, char **argv)
 {
 	char **args, **cur;
+	char *relbasedir, *absbasedir;
+	char *progpath = argv[0];
+	char *basename;
+	int ret;
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
+		sprintf(relbasedir, "%s/../..", argv[0]);
+		absbasedir = realpath(relbasedir, NULL);
+	} else {
+		basename = progpath;
+		absbasedir = realpath("../..", NULL);
+	}
+	if (absbasedir == NULL) {
+		perror(__FILE__ ": realpath");
+		return 2;
+	}
+
+	/* Fill in the relative paths */
+#ifdef BR_CROSS_PATH_REL
+	ret = snprintf(path, sizeof(path), "%s/" BR_CROSS_PATH_REL "/%s", absbasedir, basename);
+#else /* BR_CROSS_PATH_ABS */
+	ret = snprintf(path, sizeof(path), BR_CROSS_PATH_ABS "/%s", basename);
+#endif
+	if (ret >= sizeof(path)) {
+		perror(__FILE__ ": overflow");
+		return 3;
+	}
+	ret = snprintf(sysroot, sizeof(sysroot), "%s/" BR_SYSROOT, absbasedir);
+	if (ret >= sizeof(sysroot)) {
+		perror(__FILE__ ": overflow");
+		return 3;
+	}
 
 	cur = args = malloc(sizeof(predef_args) + (sizeof(char *) * argc));
 	if (args == NULL) {
@@ -82,8 +114,6 @@ int main(int argc, char **argv)
 	/* finish with NULL termination */
 	*cur = NULL;
 
-	strcat(path, get_basename(argv[0]));
-
 	if (execv(path, args))
 		perror(path);
 
-- 
tg: (524a8ab..) t/relocate-ext-toolchain (depends on: master)
