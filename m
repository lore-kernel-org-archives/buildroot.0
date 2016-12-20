From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 20 Dec 2016 14:46:18 +0100
Subject: [Buildroot] [PATCH v5 01/19] reproducible: fix DATE/TIME macros in
	toolchain-wrapper
In-Reply-To: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1482241596-31688-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The use __DATE__ and __TIME__ are one of most common sources of
non-reproducible binaries. In order to fix that, gcc begin to support
SOURCE_DATE_EPOCH variable. This patch take advantage of toolchain-wrapper
to provide support of SOURCE_DATE_EPOCH to older gcc versions.

Function get_source_date_epoch() come directly from gcc git.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---

Notes:
    v3:
      - Handle $SOURCE_DATE_EPOCH at runtime (Thomas)
    v2:
      - Overload __TIME__ and __DATE__ instead of patching gcc (Thomas)

 toolchain/toolchain-wrapper.c | 74 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index d59629b..6150574 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -22,12 +22,17 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <errno.h>
+#include <time.h>
 
 #ifdef BR_CCACHE
 static char ccache_path[PATH_MAX];
 #endif
 static char path[PATH_MAX];
 static char sysroot[PATH_MAX];
+// strlen("-D__TIME__=\"HH:MM:SS\"") + 1 = 22
+static char source_time[22];
+// strlen("-D__DATE__=\"MMM DD YYYY\"") + 1 = 25
+static char source_date[25];
 
 /**
  * GCC errors out with certain combinations of arguments (examples are
@@ -39,8 +44,11 @@ static char sysroot[PATH_MAX];
  * 	-mfloat-abi=
  * 	-march=
  * 	-mcpu=
+ * 	-D__TIME__=
+ * 	-D__DATE__=
+ * 	-Wno-builtin-macro-redefined
  */
-#define EXCLUSIVE_ARGS	3
+#define EXCLUSIVE_ARGS	6
 
 static char *predef_args[] = {
 #ifdef BR_CCACHE
@@ -139,6 +147,47 @@ static void check_unsafe_path(const char *arg,
 	}
 }
 
+/* Read SOURCE_DATE_EPOCH from environment to have a deterministic
+ * timestamp to replace embedded current dates to get reproducible
+ * results.  Returns -1 if SOURCE_DATE_EPOCH is not defined.
+ */
+time_t get_source_date_epoch()
+{
+	char *source_date_epoch;
+	long long epoch;
+	char *endptr;
+
+	source_date_epoch = getenv("SOURCE_DATE_EPOCH");
+	if (!source_date_epoch)
+		return (time_t) -1;
+
+	errno = 0;
+	epoch = strtoll (source_date_epoch, &endptr, 10);
+	if ((errno == ERANGE && (epoch == LLONG_MAX || epoch == LLONG_MIN))
+			|| (errno != 0 && epoch == 0)) {
+		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
+				"strtoll: %s\n", strerror(errno));
+		exit(2);
+	}
+	if (endptr == source_date_epoch) {
+		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
+				"no digits were found: %s\n", endptr);
+		exit(2);
+	}
+	if (*endptr != '\0') {
+		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
+				"trailing garbage: %s\n", endptr);
+		exit(2);
+	}
+	if (epoch < 0) {
+		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
+				"value must be nonnegative: %lld \n", epoch);
+		exit(2);
+	}
+
+	return (time_t) epoch;
+}
+
 int main(int argc, char **argv)
 {
 	char **args, **cur, **exec_args;
@@ -149,6 +198,7 @@ int main(int argc, char **argv)
 	char *paranoid_wrapper;
 	int paranoid;
 	int ret, i, count = 0, debug;
+	time_t source_date_epoch;
 
 	/* Calculate the relative paths */
 	basename = strrchr(progpath, '/');
@@ -254,6 +304,28 @@ int main(int argc, char **argv)
 	}
 #endif /* ARCH || CPU */
 
+	source_date_epoch = get_source_date_epoch();
+	if (source_date_epoch != -1) {
+		struct tm *tm = localtime(&source_date_epoch);
+		if (!tm) {
+			perror("__FILE__: localtime");
+			return 3;
+		}
+		ret = strftime(source_time, sizeof(source_time), "-D__TIME__=\"%T\"", tm);
+		if (!ret) {
+			perror("__FILE__: overflow");
+			return 3;
+		}
+		*cur++ = source_time;
+		ret = strftime(source_date, sizeof(source_date), "-D__DATE__=\"%b %e %Y\"", tm);
+		if (!ret) {
+			perror("__FILE__: overflow");
+			return 3;
+		}
+		*cur++ = source_date;
+		*cur++ = "-Wno-builtin-macro-redefined";
+	}
+
 	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
 	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
 		paranoid = 1;
-- 
1.9.1
