From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:44:44 +0100
Subject: [Buildroot] [git commit] toolchain/wrapper: make the {str,
	len} tuple more generic, add comments
Message-ID: <20161211144929.8415781992@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31c093e6d094194ca61ed476016ed1649c972382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 61cb120 (toolchain/wrapper: extend paranoid check to -isystem), we
introduced a {str,len} tuple to check the various arguments passed to
gcc, to avoid hard-coding an ever-growing, long list of those args
directly in the condition check.

It was made specific to the arguments (the structure member is named
'arg'), but can also be used to store the unsafe paths as well.

Also, that piece is almost un-documented.

Rename the structure member so that it is more generic, and add a bit of
comments to explain the whole of it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-wrapper.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index d59629b..8bc0007 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -83,23 +83,30 @@ static char *predef_args[] = {
 #endif
 };
 
-struct unsafe_opt_s {
-	const char *arg;
+/* A {string,length} tuple, to avoid computing strlen() on constants.
+ *  - str must be a \0-terminated string
+ *  - len does not account for the terminating '\0'
+ */
+struct str_len_s {
+	const char *str;
 	size_t     len;
 };
 
+/* Define a {string,length} tuple. Takes an unquoted constant string as
+ * parameter. sizeof() on a string literal includes the terminating \0,
+ * but we don't want to count it.
+ */
+#define STR_LEN(s) { #s, sizeof(#s)-1 }
+
 /* Unsafe options are options that specify a potentialy unsafe path,
  * that will be checked by check_unsafe_path(), below.
- *
- * sizeof() on a string literal includes the terminating \0.
  */
-#define UNSAFE_OPT(o) { #o, sizeof(#o)-1 }
-static const struct unsafe_opt_s unsafe_opts[] = {
-	UNSAFE_OPT(-I),
-	UNSAFE_OPT(-idirafter),
-	UNSAFE_OPT(-iquote),
-	UNSAFE_OPT(-isystem),
-	UNSAFE_OPT(-L),
+static const struct str_len_s unsafe_opts[] = {
+	STR_LEN(-I),
+	STR_LEN(-idirafter),
+	STR_LEN(-iquote),
+	STR_LEN(-isystem),
+	STR_LEN(-L),
 	{ NULL, 0 },
 };
 
@@ -262,10 +269,10 @@ int main(int argc, char **argv)
 
 	/* Check for unsafe library and header paths */
 	for (i = 1; i < argc; i++) {
-		const struct unsafe_opt_s *opt;
-		for (opt=unsafe_opts; opt->arg; opt++ ) {
+		const struct str_len_s *opt;
+		for (opt=unsafe_opts; opt->str; opt++ ) {
 			/* Skip any non-unsafe option. */
-			if (strncmp(argv[i], opt->arg, opt->len))
+			if (strncmp(argv[i], opt->str, opt->len))
 				continue;
 
 			/* Handle both cases:
