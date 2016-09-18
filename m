From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 16:09:23 +0200
Subject: [Buildroot] [git commit] toolchain/wrapper: extend paranoid check
	to -isystem
Message-ID: <20160918141235.5FB4F7FE24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61cb120ee5795dd4fc9c5a42400fb879c9329ad9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages, like libbsd, use -isystem flags to provide so-called
overrides to the system include files. In this particular case, this
is used in a .pc file, then used by antoher package; pkgconf does not
mangle this path; and eventually that other package ends up using
/usr/include/bsd to search for headers.

Our current toolchain wrapper is limited to looking for -I and -L, so
the paranoid check does not kick in.

Furthermore, as noticed by Arnout, there might be a bunch of other
so-unsafe options: -isysroot, -imultilib, -iquote, -idirafter, -iprefix,
-iwithprefix, -iwithprefixbefore; even -B and --sysroot are unsafe.

Extend the paranoid check to be able to check any arbitrary number of
potentially unsafe options:

  - add a list of options to check for, each with their length,
  - iterate over this list until we find a matching unsafe option.

Compared to previously, the list of options include -I and -L (which we
already had) extended with -idirafter, -iquote and -isystem, but leaving
all the others noticed by Arnout away, until we have a reason for
handling them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-wrapper.c | 53 +++++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 6259dac..925d013 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -80,6 +80,26 @@ static char *predef_args[] = {
 #endif
 };
 
+struct unsafe_opt_s {
+	const char *arg;
+	size_t     len;
+};
+
+/* Unsafe options are options that specify a potentialy unsafe path,
+ * that will be checked by check_unsafe_path(), below.
+ *
+ * sizeof() on a string literal includes the terminating \0.
+ */
+#define UNSAFE_OPT(o) { #o, sizeof(#o)-1 }
+static const struct unsafe_opt_s unsafe_opts[] = {
+	UNSAFE_OPT(-I),
+	UNSAFE_OPT(-idirafter),
+	UNSAFE_OPT(-iquote),
+	UNSAFE_OPT(-isystem),
+	UNSAFE_OPT(-L),
+	{ NULL, 0 },
+};
+
 /* Check if path is unsafe for cross-compilation. Unsafe paths are those
  * pointing to the standard native include or library paths.
  *
@@ -239,24 +259,23 @@ int main(int argc, char **argv)
 
 	/* Check for unsafe library and header paths */
 	for (i = 1; i < argc; i++) {
-
-		/* Skip options that do not start with -I and -L */
-		if (strncmp(argv[i], "-I", 2) && strncmp(argv[i], "-L", 2))
-			continue;
-
-		/* We handle two cases: first the case where -I/-L and
-		 * the path are separated by one space and therefore
-		 * visible as two separate options, and then the case
-		 * where they are stuck together forming one single
-		 * option.
-		 */
-		if (argv[i][2] == '\0') {
-			i++;
-			if (i == argc)
+		const struct unsafe_opt_s *opt;
+		for (opt=unsafe_opts; opt->arg; opt++ ) {
+			/* Skip any non-unsafe option. */
+			if (strncmp(argv[i], opt->arg, opt->len))
 				continue;
-			check_unsafe_path(argv[i-1], argv[i], paranoid, 0);
-		} else {
-			check_unsafe_path(argv[i], argv[i] + 2, paranoid, 1);
+
+			/* Handle both cases:
+			 *  - path is a separate argument,
+			 *  - path is concatenated with option.
+			 */
+			if (argv[i][opt->len] == '\0') {
+				i++;
+				if (i == argc)
+					break;
+				check_unsafe_path(argv[i-1], argv[i], paranoid, 0);
+			} else
+				check_unsafe_path(argv[i], argv[i] + opt->len, paranoid, 1);
 		}
 	}
 
