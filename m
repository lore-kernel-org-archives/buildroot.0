From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Aug 2016 16:42:41 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/wrapper: display options leading
	to a paranoid failure
Message-ID: <1471444962-32200-1-git-send-email-yann.morin.1998@free.fr>
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

Make the check_unsafe_path() function accept a variable number of
arguments as a NULL-terminated list, to contain the offending options.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 toolchain/toolchain-wrapper.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 887058f..b8b3cbe 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -22,6 +22,7 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <errno.h>
+#include <stdarg.h>
 
 #ifdef BR_CCACHE
 static char ccache_path[PATH_MAX];
@@ -80,8 +81,10 @@ static char *predef_args[] = {
 #endif
 };
 
-static void check_unsafe_path(const char *path, int paranoid)
+static void check_unsafe_path(const char *path, int paranoid, ...)
 {
+	va_list ap;
+	int once;
 	char **c;
 	static char *unsafe_paths[] = {
 		"/lib", "/usr/include", "/usr/lib", "/usr/local/include", "/usr/local/lib", NULL,
@@ -92,6 +95,21 @@ static void check_unsafe_path(const char *path, int paranoid)
 			fprintf(stderr, "%s: %s: unsafe header/library path used in cross-compilation: '%s'\n",
 				program_invocation_short_name,
 				paranoid ? "ERROR" : "WARNING", path);
+			va_start(ap, paranoid);
+			once=1;
+			while(1) {
+				char *s = va_arg(ap, char*);
+				if(!s)
+					break;
+				if(once)
+					fprintf(stderr, "%s: options causing the issue:",
+						program_invocation_short_name);
+				once = 0;
+				fprintf(stderr, " '%s'", s);
+			}
+			if(!once)
+				fprintf(stderr, "\n");
+			va_end(ap);
 			if (paranoid)
 				exit(1);
 			continue;
@@ -237,9 +255,9 @@ int main(int argc, char **argv)
 			i++;
 			if (i == argc)
 				continue;
-			check_unsafe_path(argv[i], paranoid);
+			check_unsafe_path(argv[i], paranoid, argv[i-1], argv[i], NULL);
 		} else {
-			check_unsafe_path(argv[i] + 2, paranoid);
+			check_unsafe_path(argv[i] + 2, paranoid, argv[i], NULL);
 		}
 	}
 
-- 
2.7.4
