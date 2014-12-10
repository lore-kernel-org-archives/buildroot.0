From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 10 Dec 2014 23:53:46 +0100
Subject: [Buildroot] [PATCH v3 01/12] toolchain-external: instrument wrapper
	to warn about unsafe paths
In-Reply-To: <1418252037-26636-1-git-send-email-romain.naour@openwide.fr>
References: <1418252037-26636-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1418252037-26636-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

The CodeSourcery toolchains have a very interesting feature: they warn
the user when an unsafe header or library path is used, i.e a path
that will lead host headers or libraries to leak into the build.

This commit adds a similar functionality into our external toolchain
wrapper, so that it can be used with all external toolchains, and can
also be tuned as needed. By default, the external toolchain wrapper
now gives warnings such as:

  arm-linux-gcc: WARNING: unsafe header/library path used in cross-compilation: '-I /usr/foo'
  arm-linux-gcc: WARNING: unsafe header/library path used in cross-compilation: '-L /usr/bleh'

but the compilation continues successfully. One can then easily grep
in his build log to search for occurences of this message.

Optionally, if BR_COMPILER_PARANOID_UNSAFE_PATH is defined in the
environment to a non empty value, the external wrapper will instead
error out and abort the compilation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
---
v3: remove empty line in ext-toolchain-wrapper.c (Romain Naour)
---
 .../toolchain-external/ext-toolchain-wrapper.c     | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index f459a7e..faf977b 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -15,11 +15,13 @@
  * kind, whether express or implied.
  */
 
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <string.h>
 #include <limits.h>
 #include <unistd.h>
 #include <stdlib.h>
+#include <errno.h>
 
 static char path[PATH_MAX];
 static char sysroot[PATH_MAX];
@@ -69,6 +71,25 @@ static char *predef_args[] = {
 #endif
 };
 
+static void check_unsafe_path(const char *path, int paranoid)
+{
+	char **c;
+	static char *unsafe_paths[] = {
+		"/lib", "/usr/include", "/usr/lib", "/usr/local/include", "/usr/local/lib", NULL,
+	};
+
+	for (c = unsafe_paths; *c != NULL; c++) {
+		if (!strncmp(path, *c, strlen(*c))) {
+			fprintf(stderr, "%s: %s: unsafe header/library path used in cross-compilation: '%s'\n",
+				program_invocation_short_name,
+				paranoid ? "ERROR" : "WARNING", path);
+			if (paranoid)
+				exit(1);
+			continue;
+		}
+	}
+}
+
 int main(int argc, char **argv)
 {
 	char **args, **cur;
@@ -76,6 +97,8 @@ int main(int argc, char **argv)
 	char *progpath = argv[0];
 	char *basename;
 	char *env_debug;
+	char *paranoid_wrapper;
+	int paranoid;
 	int ret, i, count = 0, debug;
 
 	/* Calculate the relative paths */
@@ -172,6 +195,35 @@ int main(int argc, char **argv)
 	}
 #endif /* ARCH || CPU */
 
+	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
+	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
+		paranoid = 1;
+	else
+		paranoid = 0;
+
+	/* Check for unsafe library and header paths */
+	for (i = 1; i < argc; i++) {
+
+		/* Skip options that do not start with -I and -L */
+		if (strncmp(argv[i], "-I", 2) && strncmp(argv[i], "-L", 2))
+			continue;
+
+		/* We handle two cases: first the case where -I/-L and
+		 * the path are separated by one space and therefore
+		 * visible as two separate options, and then the case
+		 * where they are stuck together forming one single
+		 * option.
+		 */
+		if (argv[i][2] == '\0') {
+			i++;
+			if (i == argc)
+				continue;
+			check_unsafe_path(argv[i], paranoid);
+		} else {
+			check_unsafe_path(argv[i] + 2, paranoid);
+		}
+	}
+
 	/* append forward args */
 	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
 	cur += argc - 1;
-- 
1.9.3
