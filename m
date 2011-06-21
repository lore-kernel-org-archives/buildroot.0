From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 21 Jun 2011 21:47:58 +0200
Subject: [Buildroot] [PATCH v2] ext-toolchain-wrapper.c: Handle an arbitrary
	amount of arguments
Message-ID: <1308685678-6006-1-git-send-email-daniel.nystrom@timeterminal.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though MAXARGS 1000 seems large, it wasn't enought for at least
QtWebKit package. This new version does not have any predefined limits.

Closes #3907

Many thanks to Thomas for tracing the source of the build error.

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
Reported-by: Thomas Bj?rk <thomas.bjork@home.se>
---

New in v2:
  * Check for malloc returning NULL
  * Remove unused variable 'i'
  * Add closing bug # in commit message


.../toolchain-external/ext-toolchain-wrapper.c     |   30 +++++++++++++------
 1 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index a485e74..91732b0 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -4,6 +4,7 @@
  * to ensure the external toolchain uses the correct configuration.
  *
  * (C) 2011 Peter Korsgaard <jacmet@sunsite.dk>
+ * (C) 2011 Daniel Nystr?m <daniel.nystrom@timeterminal.se>
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
@@ -14,12 +15,11 @@
 #include <string.h>
 #include <limits.h>
 #include <unistd.h>
-
-#define MAXARGS 1000
+#include <stdlib.h>
 
 static char path[PATH_MAX] = BR_CROSS_PATH;
 
-static char *args[MAXARGS] = {
+static char *predef_args[] = {
 	path,
 	"--sysroot", BR_SYSROOT,
 #ifdef BR_ARCH
@@ -55,21 +55,31 @@ static const char *get_basename(const char *name)
 int main(int argc, char **argv)
 {
 	int i;
+	char **args, **cur;
 
-	for (i=0; args[i]; i++);
-
-	if ((argc+i) >= MAXARGS) {
-		fputs("Too many arguments\n", stderr);
-		return 1;
+	cur = args = malloc(sizeof(predef_args) + (sizeof(char *) * argc));
+	if (args == NULL) {
+		perror("malloc");
+		abort();
 	}
 
-	/* forward args */
-	memcpy(&args[i], &argv[1], sizeof(argv[0]) * (argc - 1));
+	/* start with predefined args */
+	memcpy(cur, predef_args, sizeof(predef_args));
+	cur += sizeof(predef_args) / sizeof(predef_args[0]);
+
+	/* append forward args */
+	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
+	cur += argc - 1;
+
+	/* finish with NULL termination */
+	*cur = NULL;
 
 	strcat(path, get_basename(argv[0]));
 
 	if (execv(path, args))
 		perror(path);
 
+	free(args);
+
 	return 2;
 }
-- 
1.7.4.1
