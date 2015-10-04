From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:22:20 +0200
Subject: [Buildroot] [git commit] toolchain-wrapper: support change of
	BR2_CCACHE
Message-ID: <20151004162325.49B1181DA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=792f1278e3fbc165086aebb8c07cfd18e10f374b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By moving the ccache call to the toolchain wrapper, the following
scenario no longer works:

make foo-dirclean all BR2_CCACHE=

That's a sometimes useful call to check if some failure is perhaps
caused by ccache.

We can enable this scenario again by exporting BR_NO_CCACHE when
BR2_CCACHE is not set, and by handling this in the toolchain wrapper.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                      |    2 ++
 toolchain/toolchain-wrapper.c |   15 +++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 304789f..181d446 100644
--- a/Makefile
+++ b/Makefile
@@ -375,6 +375,8 @@ BR_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
 export BR_CACHE_DIR
 HOSTCC := $(CCACHE) $(HOSTCC)
 HOSTCXX := $(CCACHE) $(HOSTCXX)
+else
+export BR_NO_CCACHE
 endif
 
 # Scripts in support/ or post-build scripts may need to reference
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index aee5df7..0c8f1d8 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -98,7 +98,7 @@ static void check_unsafe_path(const char *path, int paranoid)
 
 int main(int argc, char **argv)
 {
-	char **args, **cur;
+	char **args, **cur, **exec_args;
 	char *relbasedir, *absbasedir;
 	char *progpath = argv[0];
 	char *basename;
@@ -247,6 +247,13 @@ int main(int argc, char **argv)
 	/* finish with NULL termination */
 	*cur = NULL;
 
+	exec_args = args;
+#ifdef BR_CCACHE
+	if (getenv("BR_NO_CCACHE"))
+		/* Skip the ccache call */
+		exec_args++;
+#endif
+
 	/* Debug the wrapper to see actual arguments passed to
 	 * the compiler:
 	 * unset, empty, or 0: do not trace
@@ -257,14 +264,14 @@ int main(int argc, char **argv)
 		debug = atoi(env_debug);
 		if (debug > 0) {
 			fprintf(stderr, "Toolchain wrapper executing:");
-			for (i = 0; args[i]; i++)
+			for (i = 0; exec_args[i]; i++)
 				fprintf(stderr, "%s'%s'",
-					(debug == 2) ? "\n    " : " ", args[i]);
+					(debug == 2) ? "\n    " : " ", exec_args[i]);
 			fprintf(stderr, "\n");
 		}
 	}
 
-	if (execv(args[0], args))
+	if (execv(exec_args[0], exec_args))
 		perror(path);
 
 	free(args);
