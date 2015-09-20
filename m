From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Sep 2015 21:28:37 +0200
Subject: [Buildroot] [PATCH 17/19] [RFC] toolchain-wrapper: support change
	of BR2_CCACHE
In-Reply-To: <1442777319-24164-1-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442777319-24164-1-git-send-email-arnout@mind.be>
Message-ID: <1442777319-24164-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By moving the ccache call to the toolchain wrapper, the following
scenario no longer works:

make foo-dirclean all BR2_CCACHE=

That's a sometimes useful call to check if some failure is perhaps
caused by ccache.

We can enable this scenario again by exporting BR_NO_CCACHE when
BR2_CCACHE is not set, and by handling this in the toolchain wrapper.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This one is marked as RFC because it is a little bit invasive, and it
is only needed for a use-case that we don't officially support: doing
non-clean rebuilds. Also, the usefulness of the scenario mentioned in
the commit message is pretty limited, especially considering that
ccache should be fixed by the upcoming toolchain configuration hash.
---
 Makefile                      |  2 ++
 toolchain/toolchain-wrapper.c | 15 +++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index fdbca02..e8e2f02 100644
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
index 4774692..89c8598 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -95,7 +95,7 @@ static void check_unsafe_path(const char *path, int paranoid)
 
 int main(int argc, char **argv)
 {
-	char **args, **cur;
+	char **args, **cur, **exec_args;
 	char *relbasedir, *absbasedir;
 	char *progpath = argv[0];
 	char *basename;
@@ -237,6 +237,13 @@ int main(int argc, char **argv)
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
@@ -247,14 +254,14 @@ int main(int argc, char **argv)
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
-- 
2.5.3
