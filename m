From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 29 Aug 2018 22:34:42 -0500
Subject: [Buildroot] [PATCH v2 2/5] toolchain/toolchain-wrapper: add
 BR2_RELRO_FULL support
In-Reply-To: <1535600085-31526-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1535600085-31526-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1535600085-31526-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes
v1 -> v2
 - Reworked handling of pie/pic/shared to replace each time they
   occur with a dummy string and then insert the right combination
   when rebuilding the exec string.
 - Fixed mix of tabs and spaces
 - Swapped order of shared and pie.  Coded it backwards.
---
 package/Makefile.in                  |  5 +++--
 toolchain/toolchain-wrapper-linker.c | 27 +++++++++++++++++++++-
 toolchain/toolchain-wrapper.c        | 43 +++++++++++++++++++++++++++++++++++-
 toolchain/toolchain-wrapper.mk       |  4 ++++
 4 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 14b3bbd..2e885bf 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -158,8 +158,9 @@ ifeq ($(BR2_RELRO_PARTIAL),y)
 TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
 TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
 else ifeq ($(BR2_RELRO_FULL),y)
-TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
-TARGET_LDFLAGS += -pie $(TARGET_CFLAGS_RELRO_FULL)
+TARGET_HARDENED += $(TARGET_CFLAGS_RELRO_FULL)
+# -DBR_SET_PIE is used by the GCC wrapper to tell when linking
+TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO_FULL) -DBR_SET_PIE
 endif
 
 ifeq ($(BR2_FORTIFY_SOURCE_1),y)
diff --git a/toolchain/toolchain-wrapper-linker.c b/toolchain/toolchain-wrapper-linker.c
index b587fea..32e8156 100644
--- a/toolchain/toolchain-wrapper-linker.c
+++ b/toolchain/toolchain-wrapper-linker.c
@@ -33,8 +33,10 @@ static char path[PATH_MAX];
  * one to the real compiler if the inverse option isn't in the argument list.
  * This specifies the worst case number of extra arguments we might pass
  * Currently, we may have:
+ * 	-pie
+ * 	-shared
  */
-#define EXCLUSIVE_ARGS	0
+#define EXCLUSIVE_ARGS	2
 
 static char *predef_args[] = {
 	path
@@ -126,6 +128,7 @@ int main(int argc, char **argv)
 	char *paranoid_wrapper;
 	int paranoid;
 	int ret, i, count = 0, debug;
+	unsigned int found_shared = 0;
 
 	/* Calculate the relative paths */
 	basename = strrchr(progpath, '/');
@@ -185,6 +188,28 @@ int main(int argc, char **argv)
 	memcpy(cur, predef_args, sizeof(predef_args));
 	cur += sizeof(predef_args) / sizeof(predef_args[0]);
 
+#ifdef BR2_RELRO_FULL
+	for (i = 1; i < argc; i++) {
+		if (!strcmp(argv[i], "-static") ||
+		    !strcmp(argv[i], "-r"))
+			break;
+
+		if( !strcmp(argv[i], "-shared") ) {
+		    /* Setting the value to something so that the compiler
+		       doesn't error on a empty '' when -share is removed */
+		    argv[i] = "-DBR_REMOVED_-shared";
+		    found_shared = 1;
+		}
+	}
+
+	if (i == argc) {
+		*cur++ = "-pie";
+
+		if( found_shared )
+		    *cur++ = "-shared";
+	}
+#endif
+
 	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
 	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
 		paranoid = 1;
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index c5eb813..4649091 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -49,8 +49,11 @@ static char _date_[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
  * 	-D__TIME__=
  * 	-D__DATE__=
  * 	-Wno-builtin-macro-redefined
+ * 	-fPIE
+ * 	-shared (if linking)
+ * 	-pie  (if linking)
  */
-#define EXCLUSIVE_ARGS	6
+#define EXCLUSIVE_ARGS	9
 
 static char *predef_args[] = {
 #ifdef BR_CCACHE
@@ -237,6 +240,7 @@ int main(int argc, char **argv)
 	char *paranoid_wrapper;
 	int paranoid;
 	int ret, i, count = 0, debug;
+	unsigned int gcc_using_link_flags = 0, found_shared = 0;
 
 	/* Calculate the relative paths */
 	basename = strrchr(progpath, '/');
@@ -363,6 +367,43 @@ int main(int argc, char **argv)
 		*cur++ = "-Wno-builtin-macro-redefined";
 	}
 
+#ifdef BR2_RELRO_FULL
+	/* Must handle combinations of compiler/link options */
+	for (i = 1; i < argc; i++) {
+		if (!strcmp(argv[i], "-r") ||
+		    !strcmp(argv[i], "-static") ||
+		    !strcmp(argv[i], "-fno-pic"))
+			break;
+
+		/* Setting the value to something for each of these so
+		   that the compiler doesn't error on a empty '' */
+		if (!strcmp(argv[i], "-fpie"))
+		    argv[i] = "-DBR_REMOVED_-fpie";
+		if (!strcmp(argv[i], "-fPIE"))
+		    argv[i] = "-DBR_REMOVED_-fPIE";
+		if (!strcmp(argv[i], "-fPIC"))
+		    argv[i] = "-DBR_REMOVED_-fPIC";
+		if( !strcmp(argv[i], "-shared") ) {
+		    argv[i] = "-DBR_REMOVED_-shared";
+		    found_shared = 1;
+		}
+
+		/* Find the define identifing LDFLAGS were provided */
+		if( !strcmp(argv[i], "-DBR_SET_PIE") )
+		    gcc_using_link_flags = 1;
+	}
+
+	if (i == argc) {
+		*cur++ = "-fPIE";
+
+		/* Handle case where gcc is linking with LDFlags */
+		if( gcc_using_link_flags )
+		    *cur++ = "-pie";
+		if( found_shared )
+		    *cur++ = "-shared";
+	}
+#endif
+
 	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
 	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
 		paranoid = 1;
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 3a4cbcd..b0e44b3 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -45,6 +45,10 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
 
+ifeq ($(BR2_RELRO_FULL),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_FULL
+endif
+
 define TOOLCHAIN_WRAPPER_BUILD
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
-- 
1.9.1
