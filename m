From: angelo70 at gmail.com <angelo70@gmail.com>
Date: Sat, 12 Oct 2013 22:46:17 +0200
Subject: [Buildroot] [PATCH] package/makedevs: add "l" type for symlinks
	ownership change
Message-ID: <1381610777-10239-1-git-send-email-angelo70@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Dureghello <angelo@barix.com>

 Add to makedevs the 'l' type, to allow symlinks ownership change. 
 Add related change on the makedevs doc.

Singed-off-by: Angelo Dureghello <angelo@barix.com>
---
 docs/manual/makedev-syntax.txt |  1 +
 package/makedevs/makedevs.c    | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index 2c98531..2392dc1 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -27,6 +27,7 @@ There are a few non-trivial blocks here:
   * c: a character device file
   * b: a block device file
   * p: a named pipe
+  * l: a symbolic link, for ownership changes only
 - +mode+, +uid+ and +gid+ are the usual permissions settings
 - +major+ and +minor+ are here for device files - set to - for other
   files
diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index ab90b93..026533e 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -474,6 +474,18 @@ int main(int argc, char **argv)
 				ret = EXIT_FAILURE;
 				goto loop;
 			}
+		} else if (type == 'l') {
+			struct stat st;
+			if ((lstat(full_name, &st) < 0 || !S_ISLNK(st.st_mode))) {
+				bb_perror_msg("line %d: invalid link for %s", linenum, full_name);
+				ret = EXIT_FAILURE;
+				goto loop;
+			}
+			if (lchown(full_name, uid, gid) == -1) {
+				bb_perror_msg("line %d: chown failed for %s", linenum, full_name);
+				ret = EXIT_FAILURE;
+				goto loop;
+			}
 		} else
 		{
 			dev_t rdev;
-- 
1.8.4.rc3
