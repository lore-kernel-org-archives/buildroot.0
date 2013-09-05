From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  5 Sep 2013 20:24:25 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/wrapper: add option to print one
	argument per line
Message-ID: <1378405466-9991-1-git-send-email-yann.morin.1998@free.fr>
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

Add blurb about toolchain-wrapper to documentation at the same
time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/customize-toolchain.txt                | 11 ++++++++++
 .../toolchain-external/ext-toolchain-wrapper.c     | 25 +++++++++++++++-------
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 811a6dc..587fccc 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -17,6 +17,17 @@ generate it.
 It also requires to set the Buildroot settings according to the toolchain ones
 (see xref:external-toolchain-backend[]).
 
+When using an external toolchain, Buildroot generates a wrapper program, that
+passes the appropriate options (accordingly to the configuration) to the
+external toolchain programs. In case you need to debug this wrapper, you can
+set the environment variable BR_DEBUG_WRAPPER to either one of:
+
+* +0+, empty or not set: no debug
+
+* +1+: trace all arguments on a single line
+
+* +2+: trace one argument per line
+
 Using the internal Buildroot toolchain backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 565e36b..dfdfcff 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -74,7 +74,8 @@ int main(int argc, char **argv)
 	char *relbasedir, *absbasedir;
 	char *progpath = argv[0];
 	char *basename;
-	int ret, i, count = 0;
+	char *env_debug;
+	int ret, i, count = 0, debug;
 
 	/* Calculate the relative paths */
 	basename = strrchr(progpath, '/');
@@ -157,13 +158,21 @@ int main(int argc, char **argv)
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
