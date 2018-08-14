From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 23:26:43 -0500
Subject: [Buildroot] [RFC 3/3] toolchain/toolchain-wrapper: add
 BR2_RELRO_FULL support
In-Reply-To: <1534220803-26737-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1534220803-26737-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1534220803-26737-4-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 toolchain/toolchain-wrapper.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index c5eb813..d36771c 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -49,8 +49,9 @@ static char _date_[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
  * 	-D__TIME__=
  * 	-D__DATE__=
  * 	-Wno-builtin-macro-redefined
+ *      -fPIE
  */
-#define EXCLUSIVE_ARGS	6
+#define EXCLUSIVE_ARGS	7
 
 static char *predef_args[] = {
 #ifdef BR_CCACHE
@@ -363,6 +364,22 @@ int main(int argc, char **argv)
 		*cur++ = "-Wno-builtin-macro-redefined";
 	}
 
+#ifdef BR2_RELRO_FULL
+	/* Combinations of PIE and pic */
+	for (i = 1; i < argc; i++) {
+		if (!strcmp(argv[i], "-r") ||
+		    !strcmp(argv[i], "-fpie") ||
+		    !strcmp(argv[i], "-fPIE") ||
+		    !strcmp(argv[i], "-fpic") ||
+		    !strcmp(argv[i], "-fPIC") ||
+		    !strcmp(argv[i], "-fno-pic"))
+			break;
+	}
+
+	if (i == argc)
+		*cur++ = "-fPIE";
+#endif
+
 	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
 	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
 		paranoid = 1;
-- 
1.9.1
