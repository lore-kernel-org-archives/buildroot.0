From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 May 2009 09:19:27 +0200
Subject: [Buildroot] [git commit] busybox: additional 1.14.0 patches
Message-ID: <20090513072049.54109777F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b8d3ff6c1fb3d175d2b76a145cec15965cefb15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


The original mdev patch was buggy.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.14.0-mdev.patch   |   14 +-------------
 package/busybox/busybox-1.14.0-sysctl.patch |   18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 13 deletions(-)
 create mode 100644 package/busybox/busybox-1.14.0-sysctl.patch

diff --git a/package/busybox/busybox-1.14.0-mdev.patch b/package/busybox/busybox-1.14.0-mdev.patch
index 4cefd0d..21535b0 100644
--- a/package/busybox/busybox-1.14.0-mdev.patch
+++ b/package/busybox/busybox-1.14.0-mdev.patch
@@ -1,5 +1,5 @@
 --- busybox-1.14.0/util-linux/mdev.c	Tue Apr 14 23:23:04 2009
-+++ busybox-1.14.0-mdev/util-linux/mdev.c	Sat May  2 16:31:34 2009
++++ busybox-1.14.0-mdev/util-linux/mdev.c	Mon May  4 19:58:47 2009
 @@ -181,7 +181,8 @@
  		 * the rest of fields unless keep_matching == 1 */
  
@@ -10,15 +10,3 @@
  
  		/* 3rd field: mode - device permissions */
  		mode = strtoul(tokens[2], NULL, 8);
-@@ -524,7 +525,10 @@
- 				make_device(temp, 1);
- 		}
- 		else if (strcmp(action, "add") == 0) {
--			make_device(temp, 0);
-+			/* N.B. make_device() mangles the device path, so save it */
-+			char *s = xstrdup(temp);
-+			make_device(s, 0);
-+			free(s);
- 			if (ENABLE_FEATURE_MDEV_LOAD_FIRMWARE) {
- 				if (fw)
- 					load_firmware(fw, temp);
diff --git a/package/busybox/busybox-1.14.0-sysctl.patch b/package/busybox/busybox-1.14.0-sysctl.patch
new file mode 100644
index 0000000..6738386
--- /dev/null
+++ b/package/busybox/busybox-1.14.0-sysctl.patch
@@ -0,0 +1,18 @@
+--- busybox-1.14.0/procps/sysctl.c	Tue Apr 14 01:43:09 2009
++++ busybox-1.14.0-sysctl/procps/sysctl.c	Sun May 10 23:40:52 2009
+@@ -214,11 +214,11 @@
+ // (but _whitespace_ from ends should be trimmed first (and we do it right))
+ //TODO: "var==1" is mishandled (must use "=1" as a value, but uses "1")
+ 	while (config_read(parser, token, 2, 2, "# \t=", PARSE_NORMAL)) {
++		char *tp;
+ 		sysctl_dots_to_slashes(token[0]);
+-		/* Save ~4 bytes by using parser internals */
+-		/* parser->line is big enough for sprintf */
+-		sprintf(parser->line, "%s=%s", token[0], token[1]);
+-		sysctl_act_recursive(parser->line);
++		tp = xasprintf("%s=%s", token[0], token[1]);
++		sysctl_act_recursive(tp);
++		free(tp);
+ 	}
+ 	if (ENABLE_FEATURE_CLEAN_UP)
+ 		config_close(parser);
-- 
1.6.0.6
