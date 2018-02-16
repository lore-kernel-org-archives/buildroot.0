From: Daniel Serpell <daniel.serpell@gmail.com>
Date: Fri, 16 Feb 2018 19:18:45 -0300
Subject: [Buildroot] [PATCH] Sets LD_LIBRARY_PATH inside toolchain-wrapper.
Message-ID: <20180216221845.13337-1-daniel.serpell@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Setting the host library path in the toolchain wrapper allows moving the
host toolchain folder to a new path, as some of the tools depends on
buildroot provided libraries.

Signed-off-by: Daniel Serpell <daniel.serpell@gmail.com>
---
 toolchain/toolchain-wrapper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 2928ea42d0..53ea73fdf1 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -231,6 +231,7 @@ int main(int argc, char **argv)
 	char *progpath = argv[0];
 	char *basename;
 	char *env_debug;
+        char *ld_path, *new_ld_path;
 	char *paranoid_wrapper;
 	int paranoid;
 	int ret, i, count = 0, debug;
@@ -442,6 +443,19 @@ int main(int argc, char **argv)
 	}
 #endif
 
+        /* Adds library path to our host libraries */
+	if ((ld_path = getenv("LD_LIBRARY_PATH")) && ld_path[0]) {
+		new_ld_path = malloc(strlen(ld_path) + strlen(absbasedir) + 6);
+		sprintf(new_ld_path, "%s:%s/lib", ld_path, absbasedir);
+	} else {
+		new_ld_path = malloc(strlen(absbasedir) + 5);
+		sprintf(new_ld_path, "%s/lib", absbasedir);
+	}
+	if (setenv("LD_LIBRARY_PATH", new_ld_path, 1)) {
+		perror(__FILE__ ": Failed to set LD_LIBRARY_PATH");
+		return 3;
+	}
+
 	if (execv(exec_args[0], exec_args))
 		perror(path);
 
-- 
2.16.1
