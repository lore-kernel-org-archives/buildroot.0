From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 23:13:39 +0100
Subject: [Buildroot] Issue with toolchain wrapper changes
In-Reply-To: <56BF941E.80008@mind.be>
References: <20160213163116.745e4507@free-electrons.com>
 <56BF941E.80008@mind.be>
Message-ID: <20160302231339.46ed819f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sat, 13 Feb 2016 21:37:50 +0100, Arnout Vandecappelle wrote:

>  5ce73dca5238d30b0cbfe64c1ecbaec777c6a8fe was supposed to fix this situation. I
> didn't find a way to avoid hardcoding the BR_CROSS_PATH_SUFFIX/usr/bin bit in
> the wrapper, so instead I reversed the logic: the _external_ toolchain wrapper
> will avoid calling the wrapper and instead call the .br_real directly. So,
> calling the wrapper outside the usr directory will indeed fail, but when it's
> used as an external toolchain in buildroot, it should work fine.
> 
>  Obviously this is not an ideal situation, but I don't have better ideas. Well,
> except to get rid of the usr part, as you point out below. The problem is that
> the wrapper needs to have absbasedir to find the sysroot, and for the external
> toolchain this needs to lead to opt/ext-toolchain. Well, maybe we coud use ../
> in BR_SYSROOT, or we could make more than a difference between the internal and
> the external toolchain, or we could add keep a bindir variable in addition to
> absbasedir and use that for ccache and the internal toolchain. Right, so I do
> have some ideas :-)

I started looking a bit at the issue. My idea is to change the wrapper
to work with absbindir instead of absbasedir. absbindir is the absolute
path to the binary tool themselves.

It generally works quite fine, except for the sysroot, where it becomes
tricky. The BR_SYSROOT variable was passed as usr/<tuple>/sysroot,
which no longer works when usr/ is removed. So I've changed that to a
BR_REL_SYSROOT definition, which must be passed when building the
toolchain wrapper as the relative path between the binary tool
directory and the staging directory.

The other tricky case is the external toolchain case with relative path
(i.e the external toolchain was extracted in host/opt/ext-toolchain/).
I have to add a hardcoded ../../ in this case, but I believe this is OK
because the usr/ directory can anyway not be removed from the host
directory when an external toolchain is used, since opt/ext-toolchain/
is outside of the usr/ directory. Alternatively, we could decide to
extract the external toolchain somewhere in usr/ rather than in opt/,
so that really everything in $(HOST_DIR) is inside this usr/ directory.

It gives the following logic (I'm interested by your
comments/suggestions) :

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 887058f..43ae648 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -22,6 +22,7 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <errno.h>
+#include <libgen.h>
 
 #ifdef BR_CCACHE
 static char ccache_path[PATH_MAX];
@@ -102,7 +103,7 @@ static void check_unsafe_path(const char *path, int paranoid)
 int main(int argc, char **argv)
 {
 	char **args, **cur, **exec_args;
-	char *relbasedir, *absbasedir;
+	char *relbasedir, *absbindir;
 	char *progpath = argv[0];
 	char *basename;
 	char *env_debug;
@@ -115,55 +116,44 @@ int main(int argc, char **argv)
 	if (basename) {
 		*basename = '\0';
 		basename++;
-		relbasedir = malloc(strlen(progpath) + 7);
-		if (relbasedir == NULL) {
-			perror(__FILE__ ": malloc");
-			return 2;
-		}
-		sprintf(relbasedir, "%s/../..", argv[0]);
-		absbasedir = realpath(relbasedir, NULL);
+		absbindir = realpath(argv[0], NULL);
 	} else {
+		char *tmp;
 		basename = progpath;
-		absbasedir = malloc(PATH_MAX + 1);
-		ret = readlink("/proc/self/exe", absbasedir, PATH_MAX);
+		absbindir = malloc(PATH_MAX + 1);
+		ret = readlink("/proc/self/exe", absbindir, PATH_MAX);
 		if (ret < 0) {
 			perror(__FILE__ ": readlink");
 			return 2;
 		}
-		absbasedir[ret] = '\0';
-		for (i = ret; i > 0; i--) {
-			if (absbasedir[i] == '/') {
-				absbasedir[i] = '\0';
-				if (++count == 3)
-					break;
-			}
-		}
+		absbindir[ret] = '\0';
+		absbindir = dirname(absbindir);
 	}
-	if (absbasedir == NULL) {
+	if (absbindir == NULL) {
 		perror(__FILE__ ": realpath");
 		return 2;
 	}
 
 	/* Fill in the relative paths */
 #ifdef BR_CROSS_PATH_REL
-	ret = snprintf(path, sizeof(path), "%s/" BR_CROSS_PATH_REL "/%s" BR_CROSS_PATH_SUFFIX, absbasedir, basename);
+	ret = snprintf(path, sizeof(path), "%s/../../" BR_CROSS_PATH_REL "/%s" BR_CROSS_PATH_SUFFIX, absbindir, basename);
 #elif defined(BR_CROSS_PATH_ABS)
 	ret = snprintf(path, sizeof(path), BR_CROSS_PATH_ABS "/%s" BR_CROSS_PATH_SUFFIX, basename);
 #else
-	ret = snprintf(path, sizeof(path), "%s/usr/bin/%s" BR_CROSS_PATH_SUFFIX, absbasedir, basename);
+	ret = snprintf(path, sizeof(path), "%s/%s" BR_CROSS_PATH_SUFFIX, absbindir, basename);
 #endif
 	if (ret >= sizeof(path)) {
 		perror(__FILE__ ": overflow");
 		return 3;
 	}
 #ifdef BR_CCACHE
-	ret = snprintf(ccache_path, sizeof(ccache_path), "%s/usr/bin/ccache", absbasedir);
+	ret = snprintf(ccache_path, sizeof(ccache_path), "%s/ccache", absbindir);
 	if (ret >= sizeof(ccache_path)) {
 		perror(__FILE__ ": overflow");
 		return 3;
 	}
 #endif
-	ret = snprintf(sysroot, sizeof(sysroot), "%s/" BR_SYSROOT, absbasedir);
+	ret = snprintf(sysroot, sizeof(sysroot), "%s/" BR_REL_SYSROOT, absbindir);
 	if (ret >= sizeof(sysroot)) {
 		perror(__FILE__ ": overflow");
 		return 3;
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index af39071..8725397 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -10,7 +10,7 @@ TOOLCHAIN_WRAPPER_HASH_STYLE = both
 endif
 
 TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
-TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
+TOOLCHAIN_WRAPPER_ARGS += -DBR_REL_SYSROOT='"../$(GNU_TARGET_NAME)/sysroot"'
 
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
 # separate argument when used in execv() by the toolchain wrapper.



Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
