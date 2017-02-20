From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Feb 2017 18:16:31 +0100
Subject: [Buildroot] [PATCH] Revert "reproducible: fix DATE/TIME macros in
	toolchain-wrapper"
Message-ID: <1487610991-12814-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 76838f63412a30a358210e457dda4b79f7730624.

The commit referenced above explicitly states that the function was
copied as-is from the gcc source code at the time. And indeed that is
exactly how the function appeared in gcc in commit
e3e8c48c4a494d9da741c1c8ea6c4c0b7c4ff934.

However, our toolchain wrapper is "GPLv2 only", while the file this
function was copied from is "GPLv3 or later". As such we can't get that
function.

Furthermore, the code is far from optimum.

Since this feature is not release-critical, revert it until we do
re-implement it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 toolchain/toolchain-wrapper.c | 72 +------------------------------------------
 1 file changed, 1 insertion(+), 71 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index eb4ee8d..100aa18 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -22,15 +22,12 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <errno.h>
-#include <time.h>
 
 #ifdef BR_CCACHE
 static char ccache_path[PATH_MAX];
 #endif
 static char path[PATH_MAX];
 static char sysroot[PATH_MAX];
-static char source_time[sizeof("-D__TIME__=\"HH:MM:SS\"")];
-static char source_date[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
 
 /**
  * GCC errors out with certain combinations of arguments (examples are
@@ -42,11 +39,8 @@ static char source_date[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
  * 	-mfloat-abi=
  * 	-march=
  * 	-mcpu=
- * 	-D__TIME__=
- * 	-D__DATE__=
- * 	-Wno-builtin-macro-redefined
  */
-#define EXCLUSIVE_ARGS	6
+#define EXCLUSIVE_ARGS	3
 
 static char *predef_args[] = {
 #ifdef BR_CCACHE
@@ -163,47 +157,6 @@ static void check_unsafe_path(const char *arg,
 	}
 }
 
-/* Read SOURCE_DATE_EPOCH from environment to have a deterministic
- * timestamp to replace embedded current dates to get reproducible
- * results.  Returns -1 if SOURCE_DATE_EPOCH is not defined.
- */
-static time_t get_source_date_epoch()
-{
-	char *source_date_epoch;
-	long long epoch;
-	char *endptr;
-
-	source_date_epoch = getenv("SOURCE_DATE_EPOCH");
-	if (!source_date_epoch)
-		return (time_t) -1;
-
-	errno = 0;
-	epoch = strtoll(source_date_epoch, &endptr, 10);
-	if ((errno == ERANGE && (epoch == LLONG_MAX || epoch == LLONG_MIN))
-			|| (errno != 0 && epoch == 0)) {
-		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
-				"strtoll: %s\n", strerror(errno));
-		exit(2);
-	}
-	if (endptr == source_date_epoch) {
-		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
-				"no digits were found: %s\n", endptr);
-		exit(2);
-	}
-	if (*endptr != '\0') {
-		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
-				"trailing garbage: %s\n", endptr);
-		exit(2);
-	}
-	if (epoch < 0) {
-		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
-				"value must be nonnegative: %lld \n", epoch);
-		exit(2);
-	}
-
-	return (time_t) epoch;
-}
-
 int main(int argc, char **argv)
 {
 	char **args, **cur, **exec_args;
@@ -214,7 +167,6 @@ int main(int argc, char **argv)
 	char *paranoid_wrapper;
 	int paranoid;
 	int ret, i, count = 0, debug;
-	time_t source_date_epoch;
 
 	/* Calculate the relative paths */
 	basename = strrchr(progpath, '/');
@@ -320,28 +272,6 @@ int main(int argc, char **argv)
 	}
 #endif /* ARCH || CPU */
 
-	source_date_epoch = get_source_date_epoch();
-	if (source_date_epoch != -1) {
-		struct tm *tm = localtime(&source_date_epoch);
-		if (!tm) {
-			perror("__FILE__: localtime");
-			return 3;
-		}
-		ret = strftime(source_time, sizeof(source_time), "-D__TIME__=\"%T\"", tm);
-		if (!ret) {
-			perror("__FILE__: overflow");
-			return 3;
-		}
-		*cur++ = source_time;
-		ret = strftime(source_date, sizeof(source_date), "-D__DATE__=\"%b %e %Y\"", tm);
-		if (!ret) {
-			perror("__FILE__: overflow");
-			return 3;
-		}
-		*cur++ = source_date;
-		*cur++ = "-Wno-builtin-macro-redefined";
-	}
-
 	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
 	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
 		paranoid = 1;
-- 
2.7.4
