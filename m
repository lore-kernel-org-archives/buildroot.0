From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Jul 2013 22:27:43 +0200
Subject: [Buildroot] [PATCH] toolchain/wrapper: add option to print one
	argument per line
Message-ID: <1374265663-30074-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

In case there are many arguments passed to the tools, the command line
can get very long, and difficult to parse visually.

For example, the Linux kernel passes a lot of arguments to gcc (at least
45, which gives 53 with our hard-coded args). Looking at such a command
line is daunting.

So, add the possibility to print each argument on its own line.

Also, enclose all args between single quotes, so the command line
can be safely copy-pasted without special chars (spaces, $) being
inrerpreted by the shell.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../toolchain-external/ext-toolchain-wrapper.c     | 25 +++++++++++++++-------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index befd735..9094117 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -67,7 +67,8 @@ int main(int argc, char **argv)
 	char *relbasedir, *absbasedir;
 	char *progpath = argv[0];
 	char *basename;
-	int ret, i, count = 0;
+	char *env_debug;
+	int ret, i, count = 0, debug;
 
 	/* Calculate the relative paths */
 	basename = strrchr(progpath, '/');
@@ -136,13 +137,21 @@ int main(int argc, char **argv)
 	/* finish with NULL termination */
 	*cur = NULL;
 
-	if (getenv("BR_DEBUG_WRAPPER")) {
-		fprintf(stderr, "Executing");
-
-		for (i = 0; args[i]; i++)
-			fprintf(stderr, " %s", args[i]);
-
-		fprintf(stderr, "\n");
+	/* Debug the wrapper to see actual arguments passed to
+	 * the compiler:
+	 * unset, empty, or 0: do not trace
+	 * set to 1          : trace all arguments on a single line
+	 * set to 2          : trace one argument per line
+	 */
+	if ((env_debug = getenv("BR_DEBUG_WRAPPER"))) {
+		debug = atoi(env_debug);
+		if (debug > 0) {
+			fprintf(stderr, "Toolchain wrapper executing:");
+			for (i = 0; args[i]; i++)
+				fprintf(stderr, "%s'%s'",
+					(debug == 2)?"\n    ":" ", args[i]);
+			fprintf(stderr, "\n");
+		}
 	}
 
 	if (execv(path, args))
-- 
1.8.1.2
