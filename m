From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Nov 2016 14:38:11 +0100
Subject: [Buildroot] [PATCH 1/2] makedevs: resync device creation with
	upstream busybox
Message-ID: <20161105133812.18485-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In upstream busbyox, the code to create devices has been simplified:
the code for a single and for multiple devices is no longer duplicated.

Since we are going to change the device creation code next, it's
convenient to have only one copy to modify.

There are two behavioural changes with this, but they were introduced
silently together with other commits in upstream busybox.

- When mknod() fails, the chmod was still done. This is pointless so it
  is no longer done now.

- There was a check for mode != -1; however, a mode of -1 would not
  have worked anyway because all bits would be set for mknod(), which
  would fail. So this check is redundant.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/makedevs/makedevs.c | 47 +++++++++++++++------------------------------
 1 file changed, 15 insertions(+), 32 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index cacb144..7092b14 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -599,6 +599,8 @@ int main(int argc, char **argv)
 		} else
 		{
 			dev_t rdev;
+			unsigned i;
+			char *full_name_inc;
 
 			if (type == 'p') {
 				mode |= S_IFIFO;
@@ -614,43 +616,24 @@ int main(int argc, char **argv)
 				goto loop;
 			}
 
-			if (count > 0) {
-				int i;
-				char *full_name_inc;
-
-				full_name_inc = xmalloc(strlen(full_name) + 8);
-				for (i = 0; i < count; i++) {
-					sprintf(full_name_inc, "%s%d", full_name, start + i);
-					rdev = makedev(major, minor + i * increment);
-					if (mknod(full_name_inc, mode, rdev) == -1) {
-						bb_perror_msg("line %d: Couldnt create node %s", linenum, full_name_inc);
-						ret = EXIT_FAILURE;
-					}
-					else if (chown(full_name_inc, uid, gid) == -1) {
-						bb_perror_msg("line %d: chown failed for %s", linenum, full_name_inc);
-						ret = EXIT_FAILURE;
-					}
-					if ((mode != -1) && (chmod(full_name_inc, mode) < 0)){
-						bb_perror_msg("line %d: chmod failed for %s", linenum, full_name_inc);
-						ret = EXIT_FAILURE;
-					}
-				}
-				free(full_name_inc);
-			} else {
-				rdev = makedev(major, minor);
-				if (mknod(full_name, mode, rdev) == -1) {
-					bb_perror_msg("line %d: Couldnt create node %s", linenum, full_name);
+			full_name_inc = xmalloc(strlen(full_name) + sizeof(int)*3 + 2);
+			if (count)
+				count--;
+			for (i = start; i <= start + count; i++) {
+				sprintf(full_name_inc, count ? "%s%u" : "%s", full_name, i);
+				rdev = makedev(major, minor + (i - start) * increment);
+				if (mknod(full_name_inc, mode, rdev) < 0) {
+					bb_perror_msg("line %d: can't create node %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
-				}
-				else if (chown(full_name, uid, gid) == -1) {
-					bb_perror_msg("line %d: chown failed for %s", linenum, full_name);
+				} else if (chown(full_name_inc, uid, gid) < 0) {
+					bb_perror_msg("line %d: can't chown %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
-				}
-				if ((mode != -1) && (chmod(full_name, mode) < 0)){
-					bb_perror_msg("line %d: chmod failed for %s", linenum, full_name);
+				} else if (chmod(full_name_inc, mode) < 0) {
+					bb_perror_msg("line %d: can't chmod %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
 				}
 			}
+			free(full_name_inc);
 		}
 loop:
 		free(line);
-- 
2.9.3
