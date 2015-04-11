From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 11 Apr 2015 15:40:31 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/makedevs: add recursive option
In-Reply-To: <1428759632-17060-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1428759632-17060-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1428759632-17060-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the option to change owner/permission
of a folder recursively.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changelog:

v1 -> v2:
  - Code refactoring to avoid nested functions as suggested
    by Peter Korsgaard

 package/makedevs/makedevs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index ab90b93..ee0f9fb 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -34,8 +34,12 @@
 #ifndef __APPLE__
 #include <sys/sysmacros.h>     /* major() and minor() */
 #endif
+#include <ftw.h>
 
 const char *bb_applet_name;
+uid_t recursive_uid;
+gid_t recursive_gid;
+unsigned int recursive_mode;
 
 void bb_verror_msg(const char *s, va_list p)
 {
@@ -332,6 +336,7 @@ void bb_show_usage(void)
 	fprintf(stderr, "Where name is the file name,  type can be one of:\n");
 	fprintf(stderr, "      f       A regular file\n");
 	fprintf(stderr, "      d       Directory\n");
+	fprintf(stderr, "      r       Directory recursively\n");
 	fprintf(stderr, "      c       Character special device file\n");
 	fprintf(stderr, "      b       Block special device file\n");
 	fprintf(stderr, "      p       Fifo (named pipe)\n");
@@ -364,6 +369,23 @@ void bb_show_usage(void)
 	exit(1);
 }
 
+bb_recursive(const char *fpath, const struct stat *sb,
+		int tflag, struct FTW *ftwbuf){
+
+	if (chown(fpath, recursive_uid, recursive_gid) == -1) {
+		bb_perror_msg("chown failed for %s", fpath);
+		return -1;
+	}
+	if (recursive_mode != -1) {
+		if (chmod(fpath, recursive_mode) < 0) {
+			bb_perror_msg("chmod failed for %s", fpath);
+			return -1;
+		}
+	}
+
+	return 0;
+}
+
 int main(int argc, char **argv)
 {
 	int opt;
@@ -474,6 +496,15 @@ int main(int argc, char **argv)
 				ret = EXIT_FAILURE;
 				goto loop;
 			}
+		} else if (type == 'r') {
+			recursive_uid = uid;
+			recursive_gid = gid;
+			recursive_mode = mode;
+			if (nftw(full_name, bb_recursive, 20, FTW_MOUNT | FTW_PHYS) < 0) {
+				bb_perror_msg("line %d: recursive failed for %s", linenum, full_name);
+				ret = EXIT_FAILURE;
+				goto loop;
+			}
 		} else
 		{
 			dev_t rdev;
-- 
1.9.1
