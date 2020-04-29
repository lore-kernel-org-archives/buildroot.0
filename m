From: Charlie Turner <cturner@igalia.com>
Date: Wed, 29 Apr 2020 15:07:29 +0100
Subject: [Buildroot] [PATCH 1/1] [RFC] add support for icecc
In-Reply-To: <20200429140729.3325-1-cturner@igalia.com>
References: <20200429140729.3325-1-cturner@igalia.com>
Message-ID: <20200429140729.3325-2-cturner@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Charlie Turner <cturner@igalia.com>
---
 Config.in                      |  9 +++++++++
 Makefile                       |  2 ++
 toolchain/toolchain-wrapper.c  | 26 ++++++++++++++++++++++++++
 toolchain/toolchain-wrapper.mk |  4 ++++
 4 files changed, 41 insertions(+)

diff --git a/Config.in b/Config.in
index 48fd36ff98..bda65e8daf 100644
--- a/Config.in
+++ b/Config.in
@@ -367,6 +367,15 @@ config BR2_CCACHE_USE_BASEDIR
 
 endif
 
+config BR2_ICECC
+	bool "Enable distributed compilation"
+	help
+          Write a nice explanation.
+
+if BR2_ICECC
+
+endif
+
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
 	help
diff --git a/Makefile b/Makefile
index ae29b042ec..30000b2390 100644
--- a/Makefile
+++ b/Makefile
@@ -472,6 +472,8 @@ BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 # should not be used as the root filesystem.
 TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 
+# FIXME: Add the appropriate stuff for BR2_ICECC for accelerated host
+# builds?
 ifeq ($(BR2_CCACHE),y)
 CCACHE = $(HOST_DIR)/bin/ccache
 BR_CACHE_DIR ?= $(call qstrip,$(BR2_CCACHE_DIR))
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 8cfc963ccd..3e6c9c2603 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -28,6 +28,9 @@
 #ifdef BR_CCACHE
 static char ccache_path[PATH_MAX];
 #endif
+#ifdef BR_ICECC
+static char icecc_path[PATH_MAX];
+#endif
 static char path[PATH_MAX];
 static char sysroot[PATH_MAX];
 /* As would be defined by gcc:
@@ -59,6 +62,13 @@ static char _date_[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
 static char *predef_args[] = {
 #ifdef BR_CCACHE
 	ccache_path,
+#endif
+#if defined(BR_ICECC) && !defined(BR_CCACHE)
+/* When icecc and ccache are used together, ccache is used as the
+ * wrapper, which then rewraps with icecc via the CCACHE_PREFIX
+ * environment variable, see below.
+ */
+        icecc_path,
 #endif
 	path,
 	"--sysroot", sysroot,
@@ -312,6 +322,15 @@ int main(int argc, char **argv)
 		return 3;
 	}
 #endif
+
+#ifdef BR_ICECC
+        /* FIXME: hardcoding. Copy how ccache is installed in the abspath in output/host? */
+	ret = snprintf(icecc_path, sizeof(icecc_path), "/home/cht/local/bin/icecc");
+	if (ret >= sizeof(icecc_path)) {
+		perror(__FILE__ ": overflow");
+		return 3;
+	}
+#endif
 	ret = snprintf(sysroot, sizeof(sysroot), "%s/" BR_SYSROOT, absbasedir);
 	if (ret >= sizeof(sysroot)) {
 		perror(__FILE__ ": overflow");
@@ -532,6 +551,13 @@ int main(int argc, char **argv)
 	}
 #endif
 
+#if defined(BR_CCACHE) && defined(BR_ICECC)
+        if (setenv("CCACHE_PREFIX", icecc_path, 0)) {
+		perror(__FILE__ ": Failed to set CCACHE_PREFIX");
+		return 3;
+	}
+#endif
+
 	if (execv(exec_args[0], exec_args))
 		perror(path);
 
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 09dda17890..1a8532208c 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -39,6 +39,10 @@ ifeq ($(BR2_CCACHE),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE
 endif
 
+ifeq ($(BR2_ICECC),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_ICECC
+endif
+
 ifeq ($(BR2_x86_x1000),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_OMIT_LOCK_PREFIX
 endif
-- 
2.20.1
