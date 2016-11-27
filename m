From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Nov 2016 21:12:24 +0100
Subject: [Buildroot] [git commit] Revert "makedevs: make device node
	creation idempotent"
Message-ID: <20161127202537.8ABF5819CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c6d5e33ae1bdfc85c9734897c357a804bfd7435
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit c85cd189dc1ded92b78c5968860ff447ec9815ad.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/makedevs/makedevs.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index bcf0e0f..7092b14 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -601,7 +601,6 @@ int main(int argc, char **argv)
 			dev_t rdev;
 			unsigned i;
 			char *full_name_inc;
-			struct stat st;
 
 			if (type == 'p') {
 				mode |= S_IFIFO;
@@ -623,23 +622,10 @@ int main(int argc, char **argv)
 			for (i = start; i <= start + count; i++) {
 				sprintf(full_name_inc, count ? "%s%u" : "%s", full_name, i);
 				rdev = makedev(major, minor + (i - start) * increment);
-				if (stat(full_name_inc, &st) == 0) {
-					if ((mode & S_IFMT) != (st.st_mode & S_IFMT)) {
-						bb_error_msg("line %d: node %s exists but is of wrong file type", linenum, full_name_inc);
-						ret = EXIT_FAILURE;
-						continue;
-					}
-					if (st.st_rdev != rdev) {
-						bb_error_msg("line %d: node %s exists but is wrong device number", linenum, full_name_inc);
-						ret = EXIT_FAILURE;
-						continue;
-					}
-				} else if (mknod(full_name_inc, mode, rdev) < 0) {
+				if (mknod(full_name_inc, mode, rdev) < 0) {
 					bb_perror_msg("line %d: can't create node %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
-					continue;
-				}
-				if (chown(full_name_inc, uid, gid) < 0) {
+				} else if (chown(full_name_inc, uid, gid) < 0) {
 					bb_perror_msg("line %d: can't chown %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
 				} else if (chmod(full_name_inc, mode) < 0) {
