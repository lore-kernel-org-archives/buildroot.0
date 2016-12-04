From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Dec 2016 10:21:56 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain/wrapper: use the {str,
	len} tuples for the unsafe paths
In-Reply-To: <cover.1480843290.git.yann.morin.1998@free.fr>
References: <cover.1480843290.git.yann.morin.1998@free.fr>
Message-ID: <fdbfb69d6d7d7ee1b1473ac2562fbf69df49dbb8.1480843290.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 61cb120 (toolchain/wrapper: extend paranoid check to -isystem), we
introduced a {str,len} tuple to check the various arguments pased to
gcc, to avoid hard-coding an ever-growing, long list of those args
directly in the condition check.

Now, we're left with a long list of unsafe paths, somehow hidden within
the code, which can use the same mechanism we use for arguments.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
2.7.4
