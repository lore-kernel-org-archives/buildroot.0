From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 19 Jul 2013 17:19:16 -0500
Subject: [Buildroot] [PATCH 1/1] ext-toolchain-wrapper: fix uboot/linux with
	hardfp
Message-ID: <1374272356-10160-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

disable -mfloat-abi when float abi is specified by the user

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Cc: Peter Korsgaard <jacmet@sunsite.dk>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../toolchain-external/ext-toolchain-wrapper.c     | 28 ++++++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 460f255..d472b94 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -8,6 +8,7 @@
  * (C) 2011 Peter Korsgaard <jacmet@sunsite.dk>
  * (C) 2011 Daniel Nystr?m <daniel.nystrom@timeterminal.se>
  * (C) 2012 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+ * (C) 2013 Spenser Gilliland <spenser@gillilanding.com>
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
@@ -38,9 +39,6 @@ static char *predef_args[] = {
 #ifdef BR_ABI
 	"-mabi=" BR_ABI,
 #endif
-#ifdef BR_FLOAT_ABI
-	"-mfloat-abi=" BR_FLOAT_ABI,
-#endif
 #ifdef BR2_FPU
 	"-mfpu=" BR_FPU,
 #endif
@@ -61,6 +59,21 @@ static char *predef_args[] = {
 #endif
 };
 
+int use_default_float_abi = 1;
+
+int fix_predef_args(int argc, char **argv) {
+	int arg;
+	for (arg = 1; arg < argc; arg++) {
+		if (strncmp(argv[arg],"-mfloat-abi=", sizeof("-mfloat-abi=")/sizeof(char)-1) == 0 ||
+			strcmp(argv[arg],"-msoft-float") == 0 ||
+			strcmp(argv[arg],"-mhard-float") == 0 ) {
+			use_default_float_abi = 0;
+		}
+	}
+
+	return 0;
+}
+
 int main(int argc, char **argv)
 {
 	char **args, **cur;
@@ -69,6 +82,8 @@ int main(int argc, char **argv)
 	char *basename;
 	int ret, i, count = 0;
 
+	fix_predef_args(argc,argv);
+
 	/* Calculate the relative paths */
 	basename = strrchr(progpath, '/');
 	if (basename) {
@@ -119,7 +134,7 @@ int main(int argc, char **argv)
 		return 3;
 	}
 
-	cur = args = malloc(sizeof(predef_args) + (sizeof(char *) * argc));
+	cur = args = malloc(sizeof(predef_args) + (sizeof(char *) * argc + use_default_float_abi));
 	if (args == NULL) {
 		perror(__FILE__ ": malloc");
 		return 2;
@@ -128,7 +143,10 @@ int main(int argc, char **argv)
 	/* start with predefined args */
 	memcpy(cur, predef_args, sizeof(predef_args));
 	cur += sizeof(predef_args) / sizeof(predef_args[0]);
-
+	if (use_default_float_abi) {
+		*cur = "-mfloat-abi=" BR_FLOAT_ABI;
+		cur++;
+	}
 	/* append forward args */
 	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
 	cur += argc - 1;
-- 
1.8.1.2
