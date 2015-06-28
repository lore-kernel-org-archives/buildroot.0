From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:42 +0200
Subject: [Buildroot] [RFC v4 08/16] toolchain-external: use the wrapper even
	for the linker "ld"
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-9-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to add the per-package staging feature we need to use the
wrappper even for the linker "ld".

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 .../toolchain-external/ext-toolchain-wrapper.c      | 21 +++++++++++++++------
 toolchain/toolchain-external/toolchain-external.mk  |  2 +-
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index f8695a4..c839377 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -39,9 +39,12 @@ static char sysroot[PATH_MAX];
  */
 #define EXCLUSIVE_ARGS	3
 
-static char *predef_args[] = {
+static char *predef_common_args[] = {
 	path,
-	"--sysroot", sysroot,
+	"--sysroot", sysroot
+};
+
+static char *predef_gcc_args[] = {
 #ifdef BR_ABI
 	"-mabi=" BR_ABI,
 #endif
@@ -197,7 +200,8 @@ int main(int argc, char **argv)
 		return 3;
 	}
 
-	cur = args = malloc(sizeof(predef_args) +
+	cur = args = malloc(sizeof(predef_common_args) +
+			    sizeof(predef_gcc_args) +
 			    (sizeof(char *) * (argc + EXCLUSIVE_ARGS)));
 	if (args == NULL) {
 		perror(__FILE__ ": malloc");
@@ -205,10 +209,15 @@ int main(int argc, char **argv)
 	}
 
 	/* start with predefined args */
-	memcpy(cur, predef_args, sizeof(predef_args));
-	cur += sizeof(predef_args) / sizeof(predef_args[0]);
+	memcpy(cur, predef_common_args, sizeof(predef_common_args));
+	cur += sizeof(predef_common_args) / sizeof(predef_common_args[0]);
 
-	cur = add_gcc_args(argc, argv, cur);
+	if (strcmp(path + strlen(path) - 2, "ld") !=  0) {
+		memcpy(cur, predef_gcc_args, sizeof(predef_gcc_args));
+		cur += sizeof(predef_gcc_args) / sizeof(predef_gcc_args[0]);
+
+		cur = add_gcc_args(argc, argv, cur);
+	}
 
 	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
 	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 22f8118..75d61a9 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -673,7 +673,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 		*-ar|*-ranlib|*-nm) \
 			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
 			;; \
-		*cc|*cc-*|*++|*++-*|*cpp) \
+		*cc|*cc-*|*++|*++-*|*cpp|*ld) \
 			ln -sf ext-toolchain-wrapper $$base; \
 			;; \
 		*gdb|*gdbtui) \
-- 
2.4.3
