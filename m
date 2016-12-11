From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:45:06 +0100
Subject: [Buildroot] [git commit] toolchain/wrapper: use the {str,
	len} tuples for the unsafe paths
Message-ID: <20161211144929.997E17FA04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eccf762016d2e75911a20bf319e7f15776ae159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 61cb120 (toolchain/wrapper: extend paranoid check to -isystem), we
introduced a {str,len} tuple to check the various arguments pased to
gcc, to avoid hard-coding an ever-growing, long list of those args
directly in the condition check.

Now, we're left with a long list of unsafe paths, somehow hidden within
the code, which can use the same mechanism we use for arguments.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-wrapper.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 8bc0007..100aa18 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -98,6 +98,20 @@ struct str_len_s {
  */
 #define STR_LEN(s) { #s, sizeof(#s)-1 }
 
+/* List of paths considered unsafe for cross-compilation.
+ *
+ * An unsafe path is one that points to a directory with libraries or
+ * headers for the build machine, which are not suitable for the target.
+ */
+static const struct str_len_s unsafe_paths[] = {
+	STR_LEN(/lib),
+	STR_LEN(/usr/include),
+	STR_LEN(/usr/lib),
+	STR_LEN(/usr/local/include),
+	STR_LEN(/usr/local/lib),
+	{ NULL, 0 },
+};
+
 /* Unsafe options are options that specify a potentialy unsafe path,
  * that will be checked by check_unsafe_path(), below.
  */
@@ -126,13 +140,10 @@ static void check_unsafe_path(const char *arg,
 			      int paranoid,
 			      int arg_has_path)
 {
-	char **c;
-	static char *unsafe_paths[] = {
-		"/lib", "/usr/include", "/usr/lib", "/usr/local/include", "/usr/local/lib", NULL,
-	};
+	const struct str_len_s *p;
 
-	for (c = unsafe_paths; *c != NULL; c++) {
-		if (strncmp(path, *c, strlen(*c)))
+	for (p=unsafe_paths; p->str; p++) {
+		if (strncmp(path, p->str, p->len))
 			continue;
 		fprintf(stderr,
 			"%s: %s: unsafe header/library path used in cross-compilation: '%s%s%s'\n",
