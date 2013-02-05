From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 14:33:45 +0100
Subject: [Buildroot] [git commit] busybox: add mdev patch for 1.21.0
Message-ID: <20130205133442.D31C19A973@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=323eec4c3ca50060ec4e07bc68462410235c218b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.21.0/busybox-1.21.0-mdev.patch       |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox-1.21.0/busybox-1.21.0-mdev.patch b/package/busybox/busybox-1.21.0/busybox-1.21.0-mdev.patch
new file mode 100644
index 0000000..cb873fa
--- /dev/null
+++ b/package/busybox/busybox-1.21.0/busybox-1.21.0-mdev.patch
@@ -0,0 +1,35 @@
+--- busybox-1.21.0/util-linux/mdev.c
++++ busybox-1.21.0-mdev/util-linux/mdev.c
+@@ -661,6 +661,8 @@ static void make_device(char *device_nam
+ 			if (mknod(node_name, rule->mode | type, makedev(major, minor)) && errno != EEXIST)
+ 				bb_perror_msg("can't create '%s'", node_name);
+ 			if (ENABLE_FEATURE_MDEV_CONF) {
++				if (G.verbose)
++					bb_error_msg("chmod: %o chown: %u:%u", rule->mode, rule->ugid.uid, rule->ugid.gid);
+ 				chmod(node_name, rule->mode);
+ 				chown(node_name, rule->ugid.uid, rule->ugid.gid);
+ 			}
+@@ -813,6 +815,7 @@ static void load_firmware(const char *fi
+ 		full_write(loading_fd, "-1", 2);
+ 
+  out:
++	xchdir("/dev");
+ 	if (ENABLE_FEATURE_CLEAN_UP) {
+ 		close(firmware_fd);
+ 		close(loading_fd);
+@@ -919,11 +922,13 @@ int mdev_main(int argc UNUSED_PARAM, cha
+ 		}
+ 
+ 		{
+-			int logfd = open("/dev/mdev.log", O_WRONLY | O_APPEND);
++			int logfd = open("mdev.log", O_WRONLY | O_APPEND);
+ 			if (logfd >= 0) {
+ 				xmove_fd(logfd, STDERR_FILENO);
+ 				G.verbose = 1;
+-				bb_error_msg("seq: %s action: %s", seq, action);
++				if (seq)
++					applet_name = xasprintf("%s[%s]", applet_name, seq);
++				bb_error_msg("action: %s", action);
+ 			}
+ 		}
+ 
