From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Aug 2014 15:06:34 +0200
Subject: [Buildroot] [PATCH 01/12] toolchain-external: instrument wrapper to
	warn about unsafe paths
In-Reply-To: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1408540005-26934-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CodeSourcery toolchains have a very interesting feature: they warn
the user when an unsafe header or library path is used, i.e a path
that will lead host headers or libraries to leak into the build.

This commit adds a similar functionality into our external toolchain
wrapper, so that it can be used with all external toolchains, and can
also be tuned as needed. By default, the external toolchain wrapper
now gives warnings such as:

  WARNING: unsafe header/library path used in cross-compilation: '-I /usr/foo'
  WARNING: unsafe header/library path used in cross-compilation: '-L /usr/bleh'

but the compilation continues successfully. One can then easily grep
in his build log to search for occurences of this message.

Optionally, if BR_PARANOID_WRAPPER is defined in the environment to a
non empty value, the external wrapper will instead error out and abort
the compilation. We could then one day imagine setting this
BR_PARANOID_WRAPPER in the autobuilders.

A similar change could be made to the internal toolchain backend
either by making it use a wrapper like the external toolchain one, or
by adding some patches to gcc, by borrowing the changes made by the
CodeSourcery people.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v1:

 * Instead of testing if paths starts with /usr, test for
   /usr/include, /usr/lib, /usr/local/include and /usr/local/lib. This
   allows to support Buildroot builds in /usr (but of course not in
   any of those "unsafe" paths). Requested by Thomas DS.

 * Only error out if BR_PARANOID_WRAPPER has a non-empty
   value. Requested by Yann.

Remaining questions:

 * Shouldn't this be a Config.in option instead? The reasoning is that
   if we leave it as an environment variable, which gets set by the
   autobuilder script, it will not be visible in the .config file
   reported by the autobuilders. Therefore, if one simply takes the
   failed autobuilder configuration, and tries to build it while
   forgetting to pass BR_PARANOID_WRAPPER, one will get a different
   behavior. This is potentially annoying for failures inside
   configure scripts, for which the build output is hidden inside
   config.log.

 * I'm not sure about the name of the variable, maybe it should be:
   BR_COMPILER_WARN_UNSAFE_PATHS. This way, we could use the same
   variable name for the gcc patches to be used for the internal
   toolchain backend. It is also a bit more coherent in the sense that
   the user doesn't really need to know there's a wrapper.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-external/ext-toolchain-wrapper.c     | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 8db4ac4..16faa5c 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -70,6 +70,24 @@ static char *predef_args[] = {
 #endif
 };
 
+static void check_unsafe_path(const char *path, int paranoid)
+{
+	char **c;
+	char *unsafe_paths[] = {
+		"/usr/include", "/usr/lib", "/usr/local/include", "/usr/local/lib", NULL,
+	};
+
+	for (c = unsafe_paths; *c != NULL; c++) {
+		if (!strncmp(path, *c, strlen(*c))) {
+			fprintf(stderr, "%s: unsafe header/library path used in cross-compilation: '%s'\n",
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
@@ -77,6 +95,8 @@ int main(int argc, char **argv)
 	char *progpath = argv[0];
 	char *basename;
 	char *env_debug;
+	char *paranoid_wrapper;
+	int paranoid;
 	int ret, i, count = 0, debug;
 
 	/* Calculate the relative paths */
@@ -178,6 +198,35 @@ int main(int argc, char **argv)
 	}
 #endif /* ARCH || TUNE || CPU */
 
+	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
+	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
+		paranoid = 1;
+	else
+		paranoid = 0;
+
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
+		if (strlen(argv[i]) == 2) {
+			if (i == argc)
+				continue;
+			check_unsafe_path(argv[i+1], paranoid);
+		} else {
+			check_unsafe_path(argv[i] + 2, paranoid);
+		}
+	}
+
 	/* append forward args */
 	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
 	cur += argc - 1;
-- 
2.0.0
