From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Aug 2016 16:19:30 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/wrapper: extend paranoid check to
	-isystem
In-Reply-To: <1472048370-20408-1-git-send-email-yann.morin.1998@free.fr>
References: <1472048370-20408-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1472048370-20408-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
already had) extended with -isystem, but leaving all the others noticed
by Arnout away, until we have a reason for handling them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - don't suppose that -isystem is separated from its path  (Arnout)
  - use and iterate over a list of options rather than using a
    succession of strncmp() in the code, which makes it easier to
    check more unsafe options
---
 toolchain/toolchain-wrapper.c | 47 +++++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index edade43..caf62e7 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -80,6 +80,20 @@ static char *predef_args[] = {
 #endif
 };
 
+struct unsafe_opt_s {
+	const char *arg;
+	size_t     len;
+};
+
+/* sizeof() on a string literal includes the terminating \0. */
+#define UNSAFE_OPT(o) { #o, sizeof(#o)-1 }
+static const struct unsafe_opt_s unsafe_opts[] = {
+	UNSAFE_OPT(-I),
+	UNSAFE_OPT(-isystem),
+	UNSAFE_OPT(-L),
+	{ NULL, 0 },
+};
+
 static void check_unsafe_path(const char *arg,
 			      const char *path,
 			      int paranoid,
@@ -233,24 +247,23 @@ int main(int argc, char **argv)
 
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
 
-- 
2.7.4
