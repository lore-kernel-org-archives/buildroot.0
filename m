From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 11 Dec 2014 17:51:35 +0000
Subject: [Buildroot] [PATCH 1/2] kismet: rename patches to follow the new
	name convention
Message-ID: <1418320296-6007-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/kismet/0001-ncurses.patch   |   11 ++++++++
 package/kismet/0002-nobsd.patch     |   44 +++++++++++++++++++++++++++++++++++
 package/kismet/kismet-ncurses.patch |   11 --------
 package/kismet/kismet-nobsd.patch   |   44 -----------------------------------
 4 files changed, 55 insertions(+), 55 deletions(-)
 create mode 100644 package/kismet/0001-ncurses.patch
 create mode 100644 package/kismet/0002-nobsd.patch
 delete mode 100644 package/kismet/kismet-ncurses.patch
 delete mode 100644 package/kismet/kismet-nobsd.patch

diff --git a/package/kismet/0001-ncurses.patch b/package/kismet/0001-ncurses.patch
new file mode 100644
index 0000000..af8fba5
--- /dev/null
+++ b/package/kismet/0001-ncurses.patch
@@ -0,0 +1,11 @@
+--- kismet-2009-06-R1/configure	2009-06-12 04:26:32.000000000 +0100
++++ kismet-2009-06-R1.mod/configure	2009-08-05 11:27:43.000000000 +0100
+@@ -6981,7 +6981,7 @@
+ 
+ 
+ # Add additional cflags since some distros bury panel.h
+-CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"
++#CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"
+ 
+ termcontrol="none";
+ 
diff --git a/package/kismet/0002-nobsd.patch b/package/kismet/0002-nobsd.patch
new file mode 100644
index 0000000..451d9ce
--- /dev/null
+++ b/package/kismet/0002-nobsd.patch
@@ -0,0 +1,44 @@
+diff -Nura kismet-2009-06-R1/ifcontrol.cc kismet-2009-06-R1-nobsd/ifcontrol.cc
+--- kismet-2009-06-R1/ifcontrol.cc	2009-04-08 16:57:44.000000000 -0300
++++ kismet-2009-06-R1-nobsd/ifcontrol.cc	2009-09-01 12:54:44.000000000 -0300
+@@ -148,7 +148,7 @@
+ 	devlinklen = readlink(devlink.c_str(), devlinktarget, 511);
+ 	if (devlinklen > 0) {
+ 		devlinktarget[devlinklen] = '\0';
+-		rind = rindex(devlinktarget, '/');
++		rind = strrchr(devlinktarget, '/');
+ 		// If we found it and not at the end of the line
+ 		if (rind != NULL && (rind - devlinktarget) + 1 < devlinklen)
+ 			return string(rind + 1);
+diff -Nura kismet-2009-06-R1/iwcontrol.cc kismet-2009-06-R1-nobsd/iwcontrol.cc
+--- kismet-2009-06-R1/iwcontrol.cc	2009-04-20 00:22:55.000000000 -0300
++++ kismet-2009-06-R1-nobsd/iwcontrol.cc	2009-09-01 12:54:44.000000000 -0300
+@@ -697,7 +697,7 @@
+ 		return -1;
+ 	}
+ 
+-	bzero(buffer, sizeof(buffer));
++	memset(buffer, 0, sizeof(buffer));
+ 
+ 	memset(&wrq, 0, sizeof(struct iwreq));
+ 
+@@ -732,7 +732,7 @@
+ 		memcpy((char *) &range, buffer, sizeof(iw_range));
+ 	} else {
+ 		/* Zero unknown fields */
+-		bzero((char *) &range, sizeof(struct iw_range));
++		memset((char *) &range, 0, sizeof(struct iw_range));
+ 
+ 		/* Initial part unmoved */
+ 		memcpy((char *) &range, buffer, iwr15_off(num_channels));
+diff -Nura kismet-2009-06-R1/madwifing_control.cc kismet-2009-06-R1-nobsd/madwifing_control.cc
+--- kismet-2009-06-R1/madwifing_control.cc	2009-03-22 23:19:19.000000000 -0300
++++ kismet-2009-06-R1-nobsd/madwifing_control.cc	2009-09-01 12:54:42.000000000 -0300
+@@ -34,7 +34,6 @@
+ #include <stdint.h>
+ #include <ctype.h>
+ #include <getopt.h>
+-#include <err.h>
+ #include <dirent.h>
+ #include <fcntl.h>
+ #include <errno.h>
diff --git a/package/kismet/kismet-ncurses.patch b/package/kismet/kismet-ncurses.patch
deleted file mode 100644
index af8fba5..0000000
--- a/package/kismet/kismet-ncurses.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- kismet-2009-06-R1/configure	2009-06-12 04:26:32.000000000 +0100
-+++ kismet-2009-06-R1.mod/configure	2009-08-05 11:27:43.000000000 +0100
-@@ -6981,7 +6981,7 @@
- 
- 
- # Add additional cflags since some distros bury panel.h
--CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"
-+#CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"
- 
- termcontrol="none";
- 
diff --git a/package/kismet/kismet-nobsd.patch b/package/kismet/kismet-nobsd.patch
deleted file mode 100644
index 451d9ce..0000000
--- a/package/kismet/kismet-nobsd.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-diff -Nura kismet-2009-06-R1/ifcontrol.cc kismet-2009-06-R1-nobsd/ifcontrol.cc
---- kismet-2009-06-R1/ifcontrol.cc	2009-04-08 16:57:44.000000000 -0300
-+++ kismet-2009-06-R1-nobsd/ifcontrol.cc	2009-09-01 12:54:44.000000000 -0300
-@@ -148,7 +148,7 @@
- 	devlinklen = readlink(devlink.c_str(), devlinktarget, 511);
- 	if (devlinklen > 0) {
- 		devlinktarget[devlinklen] = '\0';
--		rind = rindex(devlinktarget, '/');
-+		rind = strrchr(devlinktarget, '/');
- 		// If we found it and not at the end of the line
- 		if (rind != NULL && (rind - devlinktarget) + 1 < devlinklen)
- 			return string(rind + 1);
-diff -Nura kismet-2009-06-R1/iwcontrol.cc kismet-2009-06-R1-nobsd/iwcontrol.cc
---- kismet-2009-06-R1/iwcontrol.cc	2009-04-20 00:22:55.000000000 -0300
-+++ kismet-2009-06-R1-nobsd/iwcontrol.cc	2009-09-01 12:54:44.000000000 -0300
-@@ -697,7 +697,7 @@
- 		return -1;
- 	}
- 
--	bzero(buffer, sizeof(buffer));
-+	memset(buffer, 0, sizeof(buffer));
- 
- 	memset(&wrq, 0, sizeof(struct iwreq));
- 
-@@ -732,7 +732,7 @@
- 		memcpy((char *) &range, buffer, sizeof(iw_range));
- 	} else {
- 		/* Zero unknown fields */
--		bzero((char *) &range, sizeof(struct iw_range));
-+		memset((char *) &range, 0, sizeof(struct iw_range));
- 
- 		/* Initial part unmoved */
- 		memcpy((char *) &range, buffer, iwr15_off(num_channels));
-diff -Nura kismet-2009-06-R1/madwifing_control.cc kismet-2009-06-R1-nobsd/madwifing_control.cc
---- kismet-2009-06-R1/madwifing_control.cc	2009-03-22 23:19:19.000000000 -0300
-+++ kismet-2009-06-R1-nobsd/madwifing_control.cc	2009-09-01 12:54:42.000000000 -0300
-@@ -34,7 +34,6 @@
- #include <stdint.h>
- #include <ctype.h>
- #include <getopt.h>
--#include <err.h>
- #include <dirent.h>
- #include <fcntl.h>
- #include <errno.h>
-- 
1.7.1
