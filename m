From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Aug 2019 14:48:17 +0200
Subject: [Buildroot] [PATCH] toolchain/wrapper: also dump args it was called
 with
Message-ID: <20190817124817.8859-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 toolchain/toolchain-wrapper.c | 49 +++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 7a4b9c4007..b7705a4cbf 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -240,7 +240,24 @@ int main(int argc, char **argv)
 	char *env_debug;
 	char *paranoid_wrapper;
 	int paranoid;
-	int ret, i, count = 0, debug, found_shared = 0;
+	int ret, i, count = 0, debug = 0, found_shared = 0;
+
+	/* Debug the wrapper to see arguments it was called with.
+	 * If environment variable BR2_DEBUG_WRAPPER is:
+	 * unset, empty, or 0: do not trace
+	 * set to 1          : trace all arguments on a single line
+	 * set to 2          : trace one argument per line
+	 */
+	if ((env_debug = getenv("BR2_DEBUG_WRAPPER"))) {
+		debug = atoi(env_debug);
+	}
+	if (debug > 0) {
+		fprintf(stderr, "Toolchain wrapper was called with:");
+		for (i = 0; i < argc; i++)
+			fprintf(stderr, "%s'%s'",
+				(debug == 2) ? "\n    " : " ", argv[i]);
+		fprintf(stderr, "\n");
+	}
 
 	/* Calculate the relative paths */
 	basename = strrchr(progpath, '/');
@@ -483,29 +500,21 @@ int main(int argc, char **argv)
 		exec_args++;
 #endif
 
-	/* Debug the wrapper to see actual arguments passed to
-	 * the compiler:
-	 * unset, empty, or 0: do not trace
-	 * set to 1          : trace all arguments on a single line
-	 * set to 2          : trace one argument per line
-	 */
-	if ((env_debug = getenv("BR2_DEBUG_WRAPPER"))) {
-		debug = atoi(env_debug);
-		if (debug > 0) {
-			fprintf(stderr, "Toolchain wrapper executing:");
+	/* Debug the wrapper to see final arguments passed to the real compiler. */
+	if (debug > 0) {
+		fprintf(stderr, "Toolchain wrapper executing:");
 #ifdef BR_CCACHE_HASH
-			fprintf(stderr, "%sCCACHE_COMPILERCHECK='string:" BR_CCACHE_HASH "'",
-				(debug == 2) ? "\n    " : " ");
+		fprintf(stderr, "%sCCACHE_COMPILERCHECK='string:" BR_CCACHE_HASH "'",
+			(debug == 2) ? "\n    " : " ");
 #endif
 #ifdef BR_CCACHE_BASEDIR
-			fprintf(stderr, "%sCCACHE_BASEDIR='" BR_CCACHE_BASEDIR "'",
-				(debug == 2) ? "\n    " : " ");
+		fprintf(stderr, "%sCCACHE_BASEDIR='" BR_CCACHE_BASEDIR "'",
+			(debug == 2) ? "\n    " : " ");
 #endif
-			for (i = 0; exec_args[i]; i++)
-				fprintf(stderr, "%s'%s'",
-					(debug == 2) ? "\n    " : " ", exec_args[i]);
-			fprintf(stderr, "\n");
-		}
+		for (i = 0; exec_args[i]; i++)
+			fprintf(stderr, "%s'%s'",
+				(debug == 2) ? "\n    " : " ", exec_args[i]);
+		fprintf(stderr, "\n");
 	}
 
 #ifdef BR_CCACHE_HASH
-- 
2.20.1
