From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 16:07:35 +0200
Subject: [Buildroot] [git commit] toolchain/wrapper: display options leading
	to a paranoid failure
Message-ID: <20160918141235.4FD0281E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=105a8c156c4818f121169996f5fbe6ebd46e0068
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current, we only display the path that causes the paranoid failure. This
is sufficient, as we can fail only for -I and -L options, and it is thus
easy to infer from the path, which option is the culprit.

However, we're soon to add a new test for the -isystem option, and then
when a failure occurs, we would not know whether it was because of -I or
-isystem. Being able to differentiate both can be hugely useful to
track down the root cause for the unsafe path.

Add two new arguments to the check_unsafe_path() function: one with the
current-or-previous argument, one to specify whether it has the path in
it or not. Print that in the error message, instead of just the path.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-wrapper.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 887058f..6259dac 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -80,7 +80,21 @@ static char *predef_args[] = {
 #endif
 };
 
-static void check_unsafe_path(const char *path, int paranoid)
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
 {
 	char **c;
 	static char *unsafe_paths[] = {
@@ -88,14 +102,17 @@ static void check_unsafe_path(const char *path, int paranoid)
 	};
 
 	for (c = unsafe_paths; *c != NULL; c++) {
-		if (!strncmp(path, *c, strlen(*c))) {
-			fprintf(stderr, "%s: %s: unsafe header/library path used in cross-compilation: '%s'\n",
-				program_invocation_short_name,
-				paranoid ? "ERROR" : "WARNING", path);
-			if (paranoid)
-				exit(1);
+		if (strncmp(path, *c, strlen(*c)))
 			continue;
-		}
+		fprintf(stderr,
+			"%s: %s: unsafe header/library path used in cross-compilation: '%s%s%s'\n",
+			program_invocation_short_name,
+			paranoid ? "ERROR" : "WARNING",
+			arg,
+			arg_has_path ? "" : "' '", /* close single-quote, space, open single-quote */
+			arg_has_path ? "" : path); /* so that arg and path are properly quoted. */
+		if (paranoid)
+			exit(1);
 	}
 }
 
@@ -237,9 +254,9 @@ int main(int argc, char **argv)
 			i++;
 			if (i == argc)
 				continue;
-			check_unsafe_path(argv[i], paranoid);
+			check_unsafe_path(argv[i-1], argv[i], paranoid, 0);
 		} else {
-			check_unsafe_path(argv[i] + 2, paranoid);
+			check_unsafe_path(argv[i], argv[i] + 2, paranoid, 1);
 		}
 	}
 
