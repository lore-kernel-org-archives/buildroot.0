From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Feb 2017 21:32:36 +0100
Subject: [Buildroot] [PATCH 2/2 next] toolchain/wrapper: fake __DATE_ and
	__TIME__ for older gcc
In-Reply-To: <cover.1487709136.git.yann.morin.1998@free.fr>
References: <cover.1487709136.git.yann.morin.1998@free.fr>
Message-ID: <3c4084fc0c3cf518c6fe170bebd83124730eba00.1487709136.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with verison 7, gcc will automatically recognise and enforce
the environment variable SOURCE_DATE_EPOCH, and will fake __DATE__ and
__TIME__ accordingly, to produce reproducible builds (at least in
regards to date and time).

However, older gcc versions (i.e. all so far) do not offer this feature.

So, we use our toolchain wrapper to force-feed __DATE__ and __TIME_ as
macros, that will take precedence over those that gcc may compute
itself. We compute them according to the specs:
    https://reproducible-builds.org/specs/source-date-epoch/
    https://gcc.gnu.org/onlinedocs/cpp/Standard-Predefined-Macros.html

Since we define macros otherwise internal to gcc, we have to tell it not
to warn about that. The -Wno-builtin-macro-redefined flag was introduced
in gcc-4.4.0, which is old enough now that we can consider that all
toolchains we care about will support that flag.

Note however: the behaviour of gcc-7 when __DATE__ and __TIME__ are
user-defined and SOURCE_DATE_EPOCH is also set is as yet unknown.
Whether the user-defined macros take precedence over the internal
computations in gcc, or whether gcc ignores the user-defined macros and
enforce them from the value of SOURCE_DATE_EPOCH is of no consequence:
that would yield the exact same end result, to use the date and time set
in SOURCE_DATE_EPOCH.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-wrapper.c | 75 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 100aa18..a7f01e7 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -22,12 +22,19 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <errno.h>
+#include <time.h>
+#include <stdbool.h>
 
 #ifdef BR_CCACHE
 static char ccache_path[PATH_MAX];
 #endif
 static char path[PATH_MAX];
 static char sysroot[PATH_MAX];
+/* As would be defined by gcc:
+ *   https://gcc.gnu.org/onlinedocs/cpp/Standard-Predefined-Macros.html
+ * sizeof() on string literals includes the terminating \0. */
+static char _time_[sizeof("-D__TIME__=\"HH:MM:SS\"")];
+static char _date_[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
 
 /**
  * GCC errors out with certain combinations of arguments (examples are
@@ -35,12 +42,15 @@ static char sysroot[PATH_MAX];
  * that we only pass the predefined one to the real compiler if the inverse
  * option isn't in the argument list.
  * This specifies the worst case number of extra arguments we might pass
- * Currently, we have:
+ * Currently, we may have:
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
@@ -157,6 +167,60 @@ static void check_unsafe_path(const char *arg,
 	}
 }
 
+/* Returns false if SOURCE_DATE_EPOCH was not defined in the environment.
+ *
+ * Returns true if SOURCE_DATE_EPOCH is in the environment and represent
+ * a valid timestamp, in which case the timestamp is formatted into the
+ * global variables _source_ and _date_.
+ *
+ * Aborts if SOURCE_DATE_EPOCH was set in the environment but did not
+ * contain a valid timestamp.
+ *
+ * Valid values are defined in the spec:
+ *     https://reproducible-builds.org/specs/source-date-epoch/
+ * but we further restrict them to be positive or null.
+ */
+bool parse_source_date_epoch_from_env(void)
+{
+	char *epoch_env, *endptr;
+	time_t epoch;
+	struct tm epoch_tm;
+
+	if ((epoch_env = getenv("SOURCE_DATE_EPOCH")) == NULL)
+		return false;
+	errno = 0;
+	epoch = (time_t) strtoll(epoch_env, &endptr, 10);
+	/* We just need to test if it is incorrect, but we do not
+	 * care why it is incorrect.
+	 */
+	if ((errno != 0) || !*epoch_env || *endptr || (epoch < 0)) {
+		fprintf(stderr, "%s: invalid SOURCE_DATE_EPOCH='%s'\n",
+			program_invocation_short_name,
+			epoch_env);
+		exit(1);
+	}
+	tzset(); /* For localtime_r(), below. */
+	if (localtime_r(&epoch, &epoch_tm) == NULL) {
+		fprintf(stderr, "%s: cannot parse SOURCE_DATE_EPOCH=%s\n",
+				program_invocation_short_name,
+				getenv("SOURCE_DATE_EPOCH"));
+		exit(1);
+	}
+	if (!strftime(_time_, sizeof(_time_), "-D__TIME__=\"%T\"", &epoch_tm)) {
+		fprintf(stderr, "%s: cannot set time from SOURCE_DATE_EPOCH=%s\n",
+				program_invocation_short_name,
+				getenv("SOURCE_DATE_EPOCH"));
+		exit(1);
+	}
+	if (!strftime(_date_, sizeof(_date_), "-D__DATE__=\"%b %e %Y\"", &epoch_tm)) {
+		fprintf(stderr, "%s: cannot set date from SOURCE_DATE_EPOCH=%s\n",
+				program_invocation_short_name,
+				getenv("SOURCE_DATE_EPOCH"));
+		exit(1);
+	}
+	return true;
+}
+
 int main(int argc, char **argv)
 {
 	char **args, **cur, **exec_args;
@@ -272,6 +336,13 @@ int main(int argc, char **argv)
 	}
 #endif /* ARCH || CPU */
 
+	if (parse_source_date_epoch_from_env()) {
+		*cur++ = _time_;
+		*cur++ = _date_;
+		/* This has existed since gcc-4.4.0 */
+		*cur++ = "-Wno-builtin-macro-redefined";
+	}
+
 	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
 	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
 		paranoid = 1;
-- 
2.7.4
