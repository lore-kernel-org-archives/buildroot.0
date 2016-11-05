From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Nov 2016 14:38:12 +0100
Subject: [Buildroot] [PATCH 2/2] makedevs: make device node creation
	idempotent
In-Reply-To: <20161105133812.18485-1-arnout@mind.be>
References: <20161105133812.18485-1-arnout@mind.be>
Message-ID: <20161105133812.18485-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use makedevs to create device nodes in the target rootfs. However,
this can be called several times, e.g. when building several filesystem
images or when rebuilding. When makedevs is called the second time, the
device node already exists so mknod() errors out.

This wasn't noticed before because fakeroot's mknod() wrapper
(incorrectly) does _not_ error out when the file exists already. Now
we switched from fakeroot to pseudo, the problem becomes apparent.

Before creating the device node, check if it already exists and if so,
if it has the correct device type and number. Change of mode and
ownership is still done.

This approach was preferred over removing the target files before
creating them, which would be simpler. However, when e.g. a file exists
as a normal file and makedevs specifies it as a device node, that
really is an error so we should detect it.

The other types don't have to be changed. The 'd' (directory) type is
already OK because it already only creates directories if they don't
exist yet. The 'f' (file mode) and 'r' (recursive) types only operate
on files and directories that exist already.

Patch also sent upstream to busybox.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reported-by: Fabio Estevam <festevam@gmail.com>
---
v2: check if pre-existing file is of correct type instead of simply
    unlinking (Yann).
---
 package/makedevs/makedevs.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 7092b14..bcf0e0f 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -601,6 +601,7 @@ int main(int argc, char **argv)
 			dev_t rdev;
 			unsigned i;
 			char *full_name_inc;
+			struct stat st;
 
 			if (type == 'p') {
 				mode |= S_IFIFO;
@@ -622,10 +623,23 @@ int main(int argc, char **argv)
 			for (i = start; i <= start + count; i++) {
 				sprintf(full_name_inc, count ? "%s%u" : "%s", full_name, i);
 				rdev = makedev(major, minor + (i - start) * increment);
-				if (mknod(full_name_inc, mode, rdev) < 0) {
+				if (stat(full_name_inc, &st) == 0) {
+					if ((mode & S_IFMT) != (st.st_mode & S_IFMT)) {
+						bb_error_msg("line %d: node %s exists but is of wrong file type", linenum, full_name_inc);
+						ret = EXIT_FAILURE;
+						continue;
+					}
+					if (st.st_rdev != rdev) {
+						bb_error_msg("line %d: node %s exists but is wrong device number", linenum, full_name_inc);
+						ret = EXIT_FAILURE;
+						continue;
+					}
+				} else if (mknod(full_name_inc, mode, rdev) < 0) {
 					bb_perror_msg("line %d: can't create node %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
-				} else if (chown(full_name_inc, uid, gid) < 0) {
+					continue;
+				}
+				if (chown(full_name_inc, uid, gid) < 0) {
 					bb_perror_msg("line %d: can't chown %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
 				} else if (chmod(full_name_inc, mode) < 0) {
-- 
2.9.3
