From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:41 +0200
Subject: [Buildroot] [RFC v4 07/16] toolchain-external: move some code in a
	new function
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-8-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To simplify the following commit, refactor the main() function moving
some code in a new add_gcc_args() function.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 .../toolchain-external/ext-toolchain-wrapper.c     | 72 ++++++++++++----------
 1 file changed, 40 insertions(+), 32 deletions(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index f262b3d..f8695a4 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -71,6 +71,45 @@ static char *predef_args[] = {
 #endif
 };
 
+static char **add_gcc_args(int argc, char **argv, char **cur)
+{
+	int i;
+
+#ifdef BR_FLOAT_ABI
+	/* add float abi if not overridden in args */
+	for (i = 1; i < argc; i++) {
+		if (!strncmp(argv[i], "-mfloat-abi=", strlen("-mfloat-abi=")) ||
+		    !strcmp(argv[i], "-msoft-float") ||
+		    !strcmp(argv[i], "-mhard-float"))
+			break;
+	}
+
+	if (i == argc)
+		*cur++ = "-mfloat-abi=" BR_FLOAT_ABI;
+#endif
+
+#if defined(BR_ARCH) || \
+    defined(BR_CPU)
+	/* Add our -march/cpu/abi flags, but only if none are
+	 * already specified on the commandline
+	 */
+	for (i = 1; i < argc; i++) {
+		if (!strncmp(argv[i], "-march=", strlen("-march=")) ||
+		    !strncmp(argv[i], "-mcpu=",  strlen("-mcpu=" )))
+			break;
+	}
+	if (i == argc) {
+#ifdef BR_ARCH
+		*cur++ = "-march=" BR_ARCH;
+#endif
+#ifdef BR_CPU
+		*cur++ = "-mcpu=" BR_CPU;
+#endif
+	}
+#endif /* ARCH || CPU */
+	return cur;
+}
+
 static void check_unsafe_path(const char *path, int paranoid)
 {
 	char **c;
@@ -169,38 +208,7 @@ int main(int argc, char **argv)
 	memcpy(cur, predef_args, sizeof(predef_args));
 	cur += sizeof(predef_args) / sizeof(predef_args[0]);
 
-#ifdef BR_FLOAT_ABI
-	/* add float abi if not overridden in args */
-	for (i = 1; i < argc; i++) {
-		if (!strncmp(argv[i], "-mfloat-abi=", strlen("-mfloat-abi=")) ||
-		    !strcmp(argv[i], "-msoft-float") ||
-		    !strcmp(argv[i], "-mhard-float"))
-			break;
-	}
-
-	if (i == argc)
-		*cur++ = "-mfloat-abi=" BR_FLOAT_ABI;
-#endif
-
-#if defined(BR_ARCH) || \
-    defined(BR_CPU)
-	/* Add our -march/cpu/abi flags, but only if none are
-	 * already specified on the commandline
-	 */
-	for (i = 1; i < argc; i++) {
-		if (!strncmp(argv[i], "-march=", strlen("-march=")) ||
-		    !strncmp(argv[i], "-mcpu=",  strlen("-mcpu=" )))
-			break;
-	}
-	if (i == argc) {
-#ifdef BR_ARCH
-		*cur++ = "-march=" BR_ARCH;
-#endif
-#ifdef BR_CPU
-		*cur++ = "-mcpu=" BR_CPU;
-#endif
-	}
-#endif /* ARCH || CPU */
+	cur = add_gcc_args(argc, argv, cur);
 
 	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
 	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
-- 
2.4.3
