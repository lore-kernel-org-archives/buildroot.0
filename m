From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Nov 2016 01:14:52 +0100
Subject: [Buildroot] [PATCH] makedevs: unlink device nodes before they are
	created
Message-ID: <20161105001452.7252-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use makedevs to create device nodes in the target rootfs. However,
this can be called several times, e.g. when building several filesystem
images or when rebuilding. When the script is called the second time,
the device node already exists so mknod() errors out.

This wasn't noticed before because fakeroot's mknod() wrapper
(incorrectly) does _not_ error out when the file exists already. Now
we switched from fakeroot to pseudo, the problem becomes apparent.

The simplest solution is to change makedevs to first remove the target
file before creating it. This is simpler than two alternative
approaches:

- Removing the target files before makedevs is called is difficult,
  because we would have to parse the device table file to find out
  which files have to be deleted.

- Silently skipping device creation if it exists already is also easy,
  but then we really should also check if the device numbers and mode
  are correct, and that is more complicated.

The other types don't have to be changed. The 'd' (directory) type is
already OK because it already only creates directories if they don't
exist yet. The 'f' (file mode) and 'r' (recursive) types only operate
on files and directories that exist already.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reported-by: Fabio Estevam <festevam@gmail.com>
---
 package/makedevs/makedevs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index cacb144..d477292 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -622,6 +622,7 @@ int main(int argc, char **argv)
 				for (i = 0; i < count; i++) {
 					sprintf(full_name_inc, "%s%d", full_name, start + i);
 					rdev = makedev(major, minor + i * increment);
+					unlink(full_name_inc);
 					if (mknod(full_name_inc, mode, rdev) == -1) {
 						bb_perror_msg("line %d: Couldnt create node %s", linenum, full_name_inc);
 						ret = EXIT_FAILURE;
@@ -638,6 +639,7 @@ int main(int argc, char **argv)
 				free(full_name_inc);
 			} else {
 				rdev = makedev(major, minor);
+				unlink(full_name);
 				if (mknod(full_name, mode, rdev) == -1) {
 					bb_perror_msg("line %d: Couldnt create node %s", linenum, full_name);
 					ret = EXIT_FAILURE;
-- 
2.9.3
