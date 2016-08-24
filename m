From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Aug 2016 16:19:29 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/wrapper: display options leading
	to a paranoid failure
Message-ID: <1472048370-20408-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Changes v1 -> v2;
  - don't use a variadic function; use explicit argumetns  (Arnout)
  - print it on a single line  (Arnout)
---
 toolchain/toolchain-wrapper.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 887058f..edade43 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -80,8 +80,13 @@ static char *predef_args[] = {
 #endif
 };
 
-static void check_unsafe_path(const char *path, int paranoid)
+static void check_unsafe_path(const char *arg,
+			      const char *path,
+			      int paranoid,
+			      int arg_has_path)
 {
+	va_list ap;
+	int once;
 	char **c;
 	static char *unsafe_paths[] = {
 		"/lib", "/usr/include", "/usr/lib", "/usr/local/include", "/usr/local/lib", NULL,
@@ -89,9 +94,15 @@ static void check_unsafe_path(const char *path, int paranoid)
 
 	for (c = unsafe_paths; *c != NULL; c++) {
 		if (!strncmp(path, *c, strlen(*c))) {
-			fprintf(stderr, "%s: %s: unsafe header/library path used in cross-compilation: '%s'\n",
+			fprintf(stderr,
+				"%s: %s: "
+				"unsafe header/library path used in cross-compilation:"
+				" '%s%s%s'\n",
 				program_invocation_short_name,
-				paranoid ? "ERROR" : "WARNING", path);
+				paranoid ? "ERROR" : "WARNING",
+				arg,
+				arg_has_path ? "" : "' '",
+				arg_has_path ? "" : path);
 			if (paranoid)
 				exit(1);
 			continue;
@@ -237,9 +248,9 @@ int main(int argc, char **argv)
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
 
-- 
2.7.4
